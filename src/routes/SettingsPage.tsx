import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../features/auth/AuthProvider';
import { friendlyAuthError, sendEmailLink, signInWithDiscord, signOut } from '../features/auth/auth';
import { useDraft } from '../features/draft/DraftProvider';
import { exportMyProfileData, loadMyProfileDraft, writeProfileDraft } from '../features/profile/profile';
import { useInstall } from '../features/pwa/useInstall';
import { validateLineup } from '../lib/lineupValidation';
import { accountAuthorization, supabase, supabaseConfigured } from '../lib/supabase';
import { clearAccountDraft } from '../features/draft/draftStore';
import type { DraftProfile } from '../types/domain';

function downloadJson(filename: string, value: unknown) {
  const url = URL.createObjectURL(new Blob([JSON.stringify(value, null, 2)], { type: 'application/json' }));
  const anchor = document.createElement('a');
  anchor.href = url;
  anchor.download = filename;
  anchor.click();
  URL.revokeObjectURL(url);
}

export function SettingsPage() {
  const { draft, ready, storageError, reload, replaceDraft } = useDraft();
  const [searchParams] = useSearchParams();
  const { session, sessionLoading, registeredHandle, profileLoading, profileLookupFailed, refreshProfile } = useAuth();
  const install = useInstall();
  const [email, setEmail] = useState('');
  const [emailSent, setEmailSent] = useState(false);
  const [authPending, setAuthPending] = useState<'discord' | 'email' | null>(null);
  const [authError, setAuthError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);
  const [claimedHandle, setClaimedHandle] = useState<string | null>(null);
  const [syncing, setSyncing] = useState(false);
  const [online, setOnline] = useState(() => navigator.onLine);
  const [onboardingProfile, setOnboardingProfile] = useState<DraftProfile>(draft.profile);
  const onboardingProfileTouched = useRef(false);
  const active = useRef(false);

  useEffect(() => {
    active.current = true;
    return () => { active.current = false; };
  }, []);

  useEffect(() => {
    const updateConnection = () => setOnline(navigator.onLine);
    window.addEventListener('online', updateConnection);
    window.addEventListener('offline', updateConnection);
    return () => {
      window.removeEventListener('online', updateConnection);
      window.removeEventListener('offline', updateConnection);
    };
  }, []);

  useEffect(() => {
    if (!onboardingProfileTouched.current) setOnboardingProfile(draft.profile);
  }, [draft.profile]);

  const hasRegisteredProfile = Boolean(session && registeredHandle);
  const profileForWrite = hasRegisteredProfile ? draft.profile : onboardingProfile;

  const readinessIssues = useMemo(() => {
    const issues: string[] = [];
    if (!profileForWrite.displayName.trim()) issues.push('Add a display name');
    if (!/^[a-z0-9][a-z0-9-]{1,30}[a-z0-9]$/.test(profileForWrite.handle)) issues.push('Choose a valid handle');
    const invalidEntries = draft.lineups.filter((lineup) => !validateLineup(lineup).valid).length;
    if (invalidEntries > 0) issues.push(`Finish ${invalidEntries} incomplete ${invalidEntries === 1 ? 'entry' : 'entries'}`);
    return issues;
  }, [draft.lineups, profileForWrite]);
  const draftCanSync = readinessIssues.length === 0;
  const profileCheckReady = !sessionLoading && !profileLoading && !profileLookupFailed && ready;
  const requestedNext = searchParams.get('next');
  const authNext = requestedNext === '/build' || requestedNext === '/recommend' ? requestedNext : '/settings';

  async function requestEmailLink(event: FormEvent) {
    event.preventDefault();
    if (authPending) return;
    setAuthError(null);
    setMessage(null);
    setAuthPending('email');
    try {
      await sendEmailLink(email, authNext);
      setEmailSent(true);
    } catch (error) {
      setAuthError(friendlyAuthError(error, 'email'));
    } finally {
      setAuthPending(null);
    }
  }

  async function requestDiscord() {
    if (authPending) return;
    setAuthError(null);
    setMessage(null);
    setAuthPending('discord');
    try {
      await signInWithDiscord(authNext);
    } catch (error) {
      setAuthError(friendlyAuthError(error, 'discord'));
      setAuthPending(null);
    }
  }

  async function requestSignOut() {
    setAuthError(null);
    try {
      await signOut();
      setClaimedHandle(null);
      setMessage('Signed out.');
    } catch {
      setAuthError('You could not be signed out.');
    }
  }

  async function requestProfileWrite() {
    if (!session || !profileCheckReady || !draftCanSync || syncing) return;
    setMessage(null);
    setAuthError(null);
    if (!online) {
      setAuthError('You need a connection to save your profile online. Your changes have not been published.');
      return;
    }
    setSyncing(true);
    let savedOnline = false;
    try {
      const replacing = hasRegisteredProfile;
      const draftToSave = replacing ? draft : { ...draft, profile: onboardingProfile, updatedAt: new Date().toISOString() };
      const receipt = await writeProfileDraft(draftToSave, replacing, session.user.id);
      savedOnline = true;
      const savedDraft = await loadMyProfileDraft(session.user.id);
      if (!savedDraft) throw new Error('Your saved profile could not be reloaded.');
      await replaceDraft(savedDraft);
      await refreshProfile();
      if (replacing) setMessage(`Saved ${receipt.lineupCount} ${receipt.lineupCount === 1 ? 'entry' : 'entries'} to @${receipt.handle}.`);
      else setClaimedHandle(receipt.handle);
    } catch {
      setAuthError(savedOnline
        ? 'Your profile was saved online, but this device could not reload it. Reload your saved profile to continue.'
        : 'Saving could not be confirmed. Your changes are still on this device; try again.');
    } finally {
      setSyncing(false);
    }
  }

  async function loadRegisteredCopy() {
    if (!session || !hasRegisteredProfile) return;
    if (!window.confirm('Discard unsaved changes and reload your saved profile?')) return;
    setMessage(null);
    setAuthError(null);
    if (!online) {
      setAuthError('You need a connection to load your saved profile. Your changes have not been published.');
      return;
    }
    setSyncing(true);
    try {
      const registeredDraft = await loadMyProfileDraft(session.user.id);
      if (!registeredDraft) throw new Error('No registered profile was found for this account.');
      await replaceDraft(registeredDraft);
      setMessage(`Loaded @${registeredDraft.profile.handle} into this device’s editor.`);
    } catch {
      setAuthError('Your saved profile could not be loaded. Your changes have not been published.');
    } finally {
      setSyncing(false);
    }
  }

  async function exportRegisteredData() {
    if (!session || !hasRegisteredProfile || !online) return;
    try {
      const data = await exportMyProfileData(session.user.id);
      await accountAuthorization(session.user.id);
      if (!active.current) return;
      downloadJson('mainstation-registered-account.json', data);
      setMessage('Your account export is ready to download.');
    } catch {
      setAuthError('Your account export could not be prepared.');
    }
  }

  async function deleteAccount() {
    if (!supabase || !session) return;
    const confirmed = window.confirm('Delete your public profile, entries, recommendation contribution, and feedback? This cannot be undone.');
    if (!confirmed) return;
    setAuthError(null);
    let deleted = false;
    try {
      const authorization = await accountAuthorization(session.user.id);
      const { error } = await supabase.rpc('delete_my_account').setHeader('Authorization', authorization);
      if (error) throw error;
      deleted = true;
      let cleanupFailed = false;
      try { await clearAccountDraft(session.user.id); } catch { cleanupFailed = true; }
      await accountAuthorization(session.user.id);
      if (!active.current) return;
      const { error: signOutError } = await supabase.auth.signOut({ scope: 'local' });
      if (signOutError) throw signOutError;
      if (cleanupFailed) window.alert('Account deleted and signed out. Local data could not be removed; clear this site\'s storage on this device.');
      else setMessage('Your account was deleted.');
    } catch {
      setAuthError(deleted
        ? 'Account deleted. Please sign out to finish on this device.'
        : 'Account deletion could not be confirmed. Reconnect and try again.');
    }
  }

  return (
    <div className="settings-page page-frame">
      <header className="page-title page-title--account">
        <h1>Account</h1>
      </header>

      <section className="account-card" aria-labelledby="account-heading">
        {!supabaseConfigured ? (
          <><h2 id="account-heading">Sign-in unavailable</h2><p>You can browse games and public profiles. Please try signing in again later.</p></>
        ) : sessionLoading ? (
          <h2 id="account-heading" aria-live="polite">Checking your account...</h2>
        ) : !session ? emailSent ? (
          <div className="auth-sent" aria-live="polite">
            <h2 id="account-heading">Check your email</h2>
            <p>Sign-in link sent to <strong>{email}</strong>.</p>
            <button type="button" className="text-link" onClick={() => { setEmailSent(false); setEmail(''); }}>Use another email</button>
          </div>
        ) : (
          <div className="account-start">
            <div><h2 id="account-heading">Sign in or create an account</h2><p>Sign in to build your Mainline.</p></div>
            <div className="auth-controls">
                <button type="button" className="button-primary" disabled={Boolean(authPending)} onClick={() => void requestDiscord()}>{authPending === 'discord' ? 'Opening Discord…' : 'Continue with Discord'}</button>
                <span>or</span>
                <form onSubmit={(event) => void requestEmailLink(event)}>
                  <label>Email address<input type="email" required autoComplete="email" disabled={Boolean(authPending)} value={email} onChange={(event) => setEmail(event.target.value)} /></label>
                  <button type="submit" className="button-secondary" disabled={Boolean(authPending)}>{authPending === 'email' ? 'Sending…' : 'Continue with email'}</button>
                </form>
            </div>
          </div>
        ) : profileLoading ? (
          <h2 id="account-heading" aria-live="polite">Checking your profile...</h2>
        ) : profileLookupFailed ? (
          <div className="account-recovery"><h2 id="account-heading">We could not check your account</h2><p>Try again to continue.</p><div className="command-row"><button type="button" className="button-primary" onClick={() => void refreshProfile()}>Retry account check</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        ) : !ready ? (
          <div><h2 id="account-heading">Loading your Mainline...</h2>{storageError && <><p role="alert">{storageError}</p><button className="button-primary" onClick={reload}>Try again</button></>}</div>
        ) : claimedHandle ? (
          <div className="claim-success"><h2 id="account-heading">Profile saved</h2><p>Your public profile is live as <strong>@{claimedHandle}</strong>.</p><div className="command-row"><Link className="button-primary" to={`/p/${claimedHandle}`}>View your profile</Link><Link className="button-secondary" to="/build">Keep editing</Link></div></div>
        ) : hasRegisteredProfile ? (
          <div className="account-session"><div><h2 id="account-heading">@{registeredHandle}</h2><p>Your profile is saved online. Changes made in the builder stay on this device until you save them here.</p></div><div className="command-row"><Link className="button-secondary" to={`/p/${registeredHandle}`}>View profile</Link><button type="button" className="button-primary" disabled={syncing || !online || !draftCanSync} onClick={() => void requestProfileWrite()}>{syncing ? 'Saving…' : 'Save changes'}</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        ) : (
          <div className="account-claim"><h2 id="account-heading">Create your public profile</h2><p>Private entries stay private.</p><div className="account-onboarding__form"><label>Display name<input required autoComplete="nickname" value={onboardingProfile.displayName} maxLength={48} onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, displayName: event.target.value }); }} /></label><label>Handle<input required autoCapitalize="none" autoComplete="username" spellCheck={false} value={onboardingProfile.handle} maxLength={32} pattern="[a-z0-9-]+" placeholder="your-handle" onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, handle: event.target.value.toLowerCase().replace(/[^a-z0-9-]/g, '') }); }} /></label><label className="account-onboarding__bio">Bio (optional)<input value={onboardingProfile.bio} maxLength={160} onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, bio: event.target.value }); }} /></label></div>{!draftCanSync && <div className="claim-readiness" role="status"><ul>{readinessIssues.map((issue) => <li key={issue}>{issue}</li>)}</ul>{readinessIssues.some((issue) => issue.includes('incomplete')) && <Link className="button-secondary" to="/build">Continue building</Link>}</div>}<div className="command-row"><button type="button" className="button-primary" disabled={syncing || !online || !draftCanSync} onClick={() => void requestProfileWrite()}>{syncing ? 'Creating…' : 'Create profile'}</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        )}
        {message && <p className="inline-status" role="status">{message}</p>}
        {authError && <p className="inline-error" role="alert">{authError}</p>}
      </section>

      {session && profileCheckReady && (
        <div className="account-management">
          {hasRegisteredProfile && <section aria-labelledby="saved-profile-heading"><h2 id="saved-profile-heading">Saved profile</h2><p>Reloading discards unsaved changes on this device.</p><div className="command-row"><button type="button" className="button-secondary" disabled={syncing || !online} onClick={() => void loadRegisteredCopy()}>Discard changes and reload</button><button type="button" className="button-secondary" disabled={!online} onClick={() => void exportRegisteredData()}>Download account data</button></div></section>}
          <section aria-labelledby="install-heading"><h2 id="install-heading">Install MainStation</h2>{install.installed ? <p className="inline-status">Installed</p> : <><p>{install.guidance}</p>{install.canPrompt && <button type="button" className="button-secondary" onClick={() => void install.prompt()}>Install MainStation</button>}</>}</section>
          {hasRegisteredProfile && <section className="account-management__danger" aria-labelledby="delete-heading"><h2 id="delete-heading">Delete account</h2><p>Deletes your public profile, entries, recommendation contribution, and feedback. This cannot be undone.</p><button type="button" className="button-danger" onClick={() => void deleteAccount()}>Delete account</button></section>}
        </div>
      )}
    </div>
  );
}
