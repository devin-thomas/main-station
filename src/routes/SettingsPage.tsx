import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { useAuth } from '../features/auth/AuthProvider';
import { friendlyAuthError, sendEmailLink, signInWithDiscord, signOut } from '../features/auth/auth';
import { rememberGuestAccountDecision, type GuestAccountDecision } from '../features/auth/guestAccountTransition';
import { useDraft } from '../features/draft/DraftProvider';
import { hasGuestDraftContent } from '../features/draft/draftMerge';
import { exportMyProfileData, loadMyProfileDraft, writeProfileDraft } from '../features/profile/profile';
import { useInstall } from '../features/pwa/useInstall';
import { validateLineup } from '../lib/lineupValidation';
import { supabase, supabaseConfigured } from '../lib/supabase';
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
  const { draft, clearDraft, discardRecovery, hasRecovery, preserveRecovery, replaceDraft, restoreRecovery } = useDraft();
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
  const [signInDecision, setSignInDecision] = useState<GuestAccountDecision | null>(null);

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
  const profileCheckReady = !profileLoading && !profileLookupFailed;
  const authNext = searchParams.get('next') === '/recommend' ? '/recommend' : '/settings';
  const guestHasWork = hasGuestDraftContent(draft);
  const transitionMessage = useMemo(() => {
    const merged = searchParams.get('merged');
    if (merged !== null) {
      const duplicates = Number(searchParams.get('duplicates') ?? '0');
      const conflicts = Number(searchParams.get('conflicts') ?? '0');
      const added = Number(merged);
      if (Number.isInteger(added) && added >= 0 && Number.isInteger(duplicates) && duplicates >= 0 && Number.isInteger(conflicts) && conflicts >= 0) {
        const parts = [`Added ${added} local ${added === 1 ? 'entry' : 'entries'} to your profile.`];
        if (duplicates > 0) parts.push(`${duplicates} duplicate ${duplicates === 1 ? 'entry was' : 'entries were'} kept once.`);
        if (conflicts > 0) parts.push(`${conflicts} changed ${conflicts === 1 ? 'entry was' : 'entries were'} kept as separate entries.`);
        return parts.join(' ');
      }
    }
    if (searchParams.get('discarded') === '1') return 'Your local draft was removed and your saved account is now loaded on this device.';
    if (searchParams.get('merge') === 'profile-setup') return 'You are signed in. Finish your profile to save this local draft online.';
    return null;
  }, [searchParams]);

  async function prepareSignIn(): Promise<boolean> {
    if (!guestHasWork) return true;
    if (!signInDecision) {
      setAuthError('Choose what should happen to this device’s draft before you sign in.');
      return false;
    }
    await rememberGuestAccountDecision(signInDecision, draft);
    return true;
  }

  async function requestEmailLink(event: FormEvent) {
    event.preventDefault();
    if (authPending) return;
    setAuthError(null);
    setMessage(null);
    setAuthPending('email');
    try {
      if (!await prepareSignIn()) return;
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
      if (!await prepareSignIn()) return;
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
      setMessage('Signed out. Your local draft stays on this device.');
    } catch {
      setAuthError('You could not be signed out.');
    }
  }

  async function requestProfileWrite() {
    if (!session || !profileCheckReady || !draftCanSync) return;
    setMessage(null);
    setAuthError(null);
    if (!online) {
      setAuthError('You need a connection to save your profile online. Your local draft is unchanged.');
      return;
    }
    setSyncing(true);
    try {
      const replacing = hasRegisteredProfile;
      if (!replacing) await preserveRecovery();
      const draftToSave = replacing ? draft : { ...draft, profile: onboardingProfile, updatedAt: new Date().toISOString() };
      const receipt = await writeProfileDraft(draftToSave, replacing);
      if (!replacing) await replaceDraft(draftToSave);
      await refreshProfile();
      if (replacing) setMessage(`Saved ${receipt.lineupCount} ${receipt.lineupCount === 1 ? 'entry' : 'entries'} to @${receipt.handle}.`);
      else setClaimedHandle(receipt.handle);
    } catch {
      setAuthError('Your profile could not be saved online. Your local draft is unchanged.');
    } finally {
      setSyncing(false);
    }
  }

  async function loadRegisteredCopy() {
    if (!session || !hasRegisteredProfile) return;
    const hasLocalWork = draft.lineups.length > 0 || draft.profile.displayName.trim().length > 0 || draft.profile.handle.trim().length > 0;
    if (hasLocalWork && !window.confirm('Replace this device’s draft with your saved profile? Your current draft will be kept as a recovery copy.')) return;
    setMessage(null);
    setAuthError(null);
    if (!online) {
      setAuthError('You need a connection to load your saved profile. Your local draft is unchanged.');
      return;
    }
    setSyncing(true);
    try {
      if (hasLocalWork) await preserveRecovery();
      const registeredDraft = await loadMyProfileDraft();
      if (!registeredDraft) throw new Error('No registered profile was found for this account.');
      await replaceDraft(registeredDraft);
      setMessage(`Loaded @${registeredDraft.profile.handle} into this device’s editor.`);
    } catch {
      setAuthError('Your saved profile could not be loaded. Your local draft is unchanged.');
    } finally {
      setSyncing(false);
    }
  }

  async function restoreRecoveryCopy() {
    if (!window.confirm('Replace this device’s current draft with the recovery copy?')) return;
    try {
      if (await restoreRecovery()) setMessage('Recovery copy restored to this device.');
      else setAuthError('That recovery copy is no longer available.');
    } catch {
      setAuthError('We could not restore the recovery copy. Your current draft is unchanged.');
    }
  }

  async function exportRegisteredData() {
    if (!session || !hasRegisteredProfile || !online) return;
    try {
      downloadJson('mainstation-registered-account.json', await exportMyProfileData());
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
    const { error } = await supabase.rpc('delete_my_account');
    if (error) {
      setAuthError('We could not delete your account. It remains active.');
      return;
    }
    await supabase.auth.signOut({ scope: 'local' });
    setMessage('Your account was deleted.');
  }

  async function requestClearDraft() {
    if (!window.confirm('Clear the draft saved on this device? Export it first if you may need it.')) return;
    try {
      await clearDraft();
      setMessage('This device’s local draft was cleared.');
    } catch {
      setAuthError('We could not clear the local draft.');
    }
  }

  return (
    <div className="settings-page page-frame">
      <header className="page-title page-title--account">
        <h1>Account</h1>
      </header>

      <section className="account-card" aria-labelledby="account-heading">
        {!supabaseConfigured ? (
          <><h2 id="account-heading">Sign-in unavailable</h2><p>You can still save a draft on this device.</p></>
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
            <div><h2 id="account-heading">Sign in or create an account</h2><p>{guestHasWork ? `${draft.lineups.length} ${draft.lineups.length === 1 ? 'entry' : 'entries'} saved only on this device.` : 'Save and share your profile across devices.'}</p></div>
            {guestHasWork && !signInDecision ? (
              <section className="draft-sign-in-decision" aria-labelledby="draft-sign-in-decision-heading">
                <h3 id="draft-sign-in-decision-heading">What should happen after sign-in?</h3>
                <p>Your saved account will never be replaced by this device’s draft.</p>
                <div className="draft-sign-in-decision__actions">
                  <button type="button" className="button-primary" onClick={() => { setAuthError(null); setSignInDecision('merge'); }}>Merge this draft and sign in</button>
                  <button type="button" className="button-secondary" onClick={() => { setAuthError(null); setSignInDecision('discard'); }}>Discard this draft and sign in</button>
                  <Link className="button-quiet" to="/build">Keep editing</Link>
                </div>
              </section>
            ) : (
              <div className="auth-controls">
                {signInDecision && <div className="draft-sign-in-decision__selected"><strong>{signInDecision === 'merge' ? 'Merge after sign-in' : 'Discard local draft after sign-in'}</strong><p>{signInDecision === 'merge' ? 'We will add these local entries to your saved profile. Your account name, handle, and bio stay as they are.' : 'We will load your saved profile on this device. This local draft is removed only after sign-in succeeds.'}</p><button type="button" className="text-link" disabled={Boolean(authPending)} onClick={() => setSignInDecision(null)}>Change choice</button></div>}
                <button type="button" className="button-primary" disabled={Boolean(authPending)} onClick={() => void requestDiscord()}>{authPending === 'discord' ? 'Opening Discord…' : 'Continue with Discord'}</button>
                <span>or</span>
                <form onSubmit={(event) => void requestEmailLink(event)}>
                  <label>Email address<input type="email" required autoComplete="email" disabled={Boolean(authPending)} value={email} onChange={(event) => setEmail(event.target.value)} /></label>
                  <button type="submit" className="button-secondary" disabled={Boolean(authPending)}>{authPending === 'email' ? 'Sending…' : 'Continue with email'}</button>
                </form>
              </div>
            )}
          </div>
        ) : profileLoading ? (
          <h2 id="account-heading" aria-live="polite">Checking your profile...</h2>
        ) : profileLookupFailed ? (
          <div className="account-recovery"><h2 id="account-heading">We could not check your account</h2><p>Your local draft is unchanged.</p><div className="command-row"><button type="button" className="button-primary" onClick={() => void refreshProfile()}>Retry account check</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        ) : claimedHandle ? (
          <div className="claim-success"><h2 id="account-heading">Profile saved</h2><p>Your public profile is live as <strong>@{claimedHandle}</strong>. A recovery copy remains on this device until you remove it.</p><div className="command-row"><Link className="button-primary" to={`/p/${claimedHandle}`}>View your profile</Link><Link className="button-secondary" to="/build">Keep editing</Link></div></div>
        ) : hasRegisteredProfile ? (
          <div className="account-session"><div><h2 id="account-heading">@{registeredHandle}</h2><p>Your profile is saved online. Changes made in the builder stay on this device until you save them here.</p></div><div className="command-row"><Link className="button-secondary" to={`/p/${registeredHandle}`}>View profile</Link><button type="button" className="button-primary" disabled={syncing || !online || !draftCanSync} onClick={() => void requestProfileWrite()}>{syncing ? 'Saving…' : 'Save changes'}</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        ) : (
          <div className="account-claim"><h2 id="account-heading">Create your public profile</h2><p>Private entries stay private.</p><div className="account-onboarding__form"><label>Display name<input required autoComplete="nickname" value={onboardingProfile.displayName} maxLength={48} onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, displayName: event.target.value }); }} /></label><label>Handle<input required autoCapitalize="none" autoComplete="username" spellCheck={false} value={onboardingProfile.handle} maxLength={32} pattern="[a-z0-9-]+" placeholder="your-handle" onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, handle: event.target.value.toLowerCase().replace(/[^a-z0-9-]/g, '') }); }} /></label><label className="account-onboarding__bio">Bio (optional)<input value={onboardingProfile.bio} maxLength={160} onChange={(event) => { onboardingProfileTouched.current = true; setOnboardingProfile({ ...onboardingProfile, bio: event.target.value }); }} /></label></div>{!draftCanSync && <div className="claim-readiness" role="status"><ul>{readinessIssues.map((issue) => <li key={issue}>{issue}</li>)}</ul>{readinessIssues.some((issue) => issue.includes('incomplete')) && <Link className="button-secondary" to="/build">Continue building</Link>}</div>}<div className="command-row"><button type="button" className="button-primary" disabled={syncing || !online || !draftCanSync} onClick={() => void requestProfileWrite()}>{syncing ? 'Creating…' : 'Create profile'}</button><button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button></div></div>
        )}
        {(message ?? transitionMessage) && <p className="inline-status" role="status">{message ?? transitionMessage}</p>}
        {authError && <p className="inline-error" role="alert">{authError}</p>}
      </section>

      {session && profileCheckReady && (
        <div className="account-management">
          {hasRecovery && <section aria-labelledby="recovery-heading"><h2 id="recovery-heading">Recovery copy</h2><p>A saved copy from before an online change is available on this device.</p><div className="command-row"><button type="button" className="button-secondary" onClick={() => void restoreRecoveryCopy()}>Restore recovery copy</button><button type="button" className="button-quiet" onClick={() => void discardRecovery()}>Remove recovery copy</button></div></section>}
          {hasRegisteredProfile && <section aria-labelledby="saved-profile-heading"><h2 id="saved-profile-heading">Saved profile</h2><p>Loading replaces this device’s draft with your saved profile. A recovery copy is kept.</p><div className="command-row"><button type="button" className="button-secondary" disabled={syncing || !online} onClick={() => void loadRegisteredCopy()}>Load saved profile</button><button type="button" className="button-secondary" disabled={!online} onClick={() => void exportRegisteredData()}>Download account data</button></div></section>}
          <section aria-labelledby="install-heading"><h2 id="install-heading">Install MainStation</h2>{install.installed ? <p className="inline-status">Installed</p> : <><p>{install.guidance}</p>{install.canPrompt && <button type="button" className="button-secondary" onClick={() => void install.prompt()}>Install MainStation</button>}</>}</section>
          <section aria-labelledby="local-data-heading"><h2 id="local-data-heading">This device’s draft</h2><p>{draft.lineups.length} {draft.lineups.length === 1 ? 'entry' : 'entries'} saved locally.</p><div className="command-row"><button type="button" className="button-secondary" onClick={() => downloadJson('mainstation-guest-draft.json', draft)}>Download local draft</button><button type="button" className="button-danger" onClick={() => void requestClearDraft()}>Clear local draft</button></div></section>
          {hasRegisteredProfile && <section className="account-management__danger" aria-labelledby="delete-heading"><h2 id="delete-heading">Delete account</h2><p>Deletes your public profile, entries, recommendation contribution, and feedback. This cannot be undone.</p><button type="button" className="button-danger" onClick={() => void deleteAccount()}>Delete account</button></section>}
        </div>
      )}
    </div>
  );
}
