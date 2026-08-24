import { useEffect, useState, type FormEvent } from 'react';
import type { Session } from '@supabase/supabase-js';
import { Link } from 'react-router-dom';
import { useDraft } from '../features/draft/DraftProvider';
import { sendEmailLink, signInWithDiscord, signOut } from '../features/auth/auth';
import { getMyRegisteredHandle, writeProfileDraft } from '../features/profile/profile';
import { useInstall } from '../features/pwa/useInstall';
import { validateLineup } from '../lib/lineupValidation';
import { supabase, supabaseConfigured } from '../lib/supabase';

function downloadJson(filename: string, value: unknown) {
  const url = URL.createObjectURL(new Blob([JSON.stringify(value, null, 2)], { type: 'application/json' }));
  const anchor = document.createElement('a');
  anchor.href = url;
  anchor.download = filename;
  anchor.click();
  URL.revokeObjectURL(url);
}

export function SettingsPage() {
  const { draft, clearDraft, preserveRecovery } = useDraft();
  const install = useInstall();
  const [email, setEmail] = useState('');
  const [authMessage, setAuthMessage] = useState<string | null>(null);
  const [authError, setAuthError] = useState<string | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [registeredHandle, setRegisteredHandle] = useState<string | null>(null);
  const [registeredOwnerId, setRegisteredOwnerId] = useState<string | null>(null);
  const [syncing, setSyncing] = useState(false);
  const [online, setOnline] = useState(() => navigator.onLine);

  useEffect(() => {
    if (!supabase) return;
    void supabase.auth.getSession().then(({ data, error }) => {
      if (error) setAuthError(error.message);
      else setSession(data.session);
    });
    const { data } = supabase.auth.onAuthStateChange((_event, nextSession) => {
      setSession(nextSession);
      if (!nextSession) {
        setRegisteredHandle(null);
        setRegisteredOwnerId(null);
      }
    });
    return () => data.subscription.unsubscribe();
  }, []);

  useEffect(() => {
    let active = true;
    if (!session) return;
    void getMyRegisteredHandle(session.user.id)
      .then((handle) => {
        if (active) {
          setRegisteredHandle(handle);
          setRegisteredOwnerId(session.user.id);
        }
      })
      .catch((error: unknown) => {
        if (active) setAuthError(error instanceof Error ? error.message : 'The registered profile could not be checked.');
      });
    return () => {
      active = false;
    };
  }, [session]);

  useEffect(() => {
    const updateConnection = () => setOnline(navigator.onLine);
    window.addEventListener('online', updateConnection);
    window.addEventListener('offline', updateConnection);
    return () => {
      window.removeEventListener('online', updateConnection);
      window.removeEventListener('offline', updateConnection);
    };
  }, []);

  const draftCanSync = draft.profile.displayName.trim().length > 0
    && /^[a-z0-9][a-z0-9-]{1,30}[a-z0-9]$/.test(draft.profile.handle)
    && draft.lineups.every((lineup) => validateLineup(lineup).valid);
  const profileLoading = Boolean(session && registeredOwnerId !== session.user.id);
  const hasRegisteredProfile = Boolean(session && registeredOwnerId === session.user.id && registeredHandle);

  async function requestEmailLink(event: FormEvent) {
    event.preventDefault();
    setAuthMessage(null);
    setAuthError(null);
    try {
      await sendEmailLink(email);
      setAuthMessage('Check your inbox for the secure MainStation sign-in link.');
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'The email sign-in request failed.');
    }
  }

  async function requestDiscord() {
    setAuthMessage(null);
    setAuthError(null);
    try {
      await signInWithDiscord();
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Discord sign-in could not start.');
    }
  }

  async function requestSignOut() {
    setAuthError(null);
    try {
      await signOut();
      setAuthMessage('Signed out. Your local guest draft remains on this device.');
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Sign-out failed.');
    }
  }

  async function requestProfileWrite() {
    if (!session) return;
    setAuthMessage(null);
    setAuthError(null);
    if (!online) {
      setAuthError('Registered saves require a network connection. The local draft remains unchanged.');
      return;
    }
    if (!draftCanSync) {
      setAuthError('Complete the local identity and every saved Character or Team before syncing.');
      return;
    }
    setSyncing(true);
    try {
      const replacing = hasRegisteredProfile;
      if (!replacing) await preserveRecovery();
      const receipt = await writeProfileDraft(draft, replacing);
      setRegisteredHandle(receipt.handle);
      setRegisteredOwnerId(session.user.id);
      setAuthMessage(replacing
        ? `Registered profile saved with ${receipt.lineupCount} ${receipt.lineupCount === 1 ? 'stop' : 'stops'}.`
        : `Draft claimed as @${receipt.handle}. A local recovery copy is retained on this device.`);
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'The registered profile could not be saved. The local draft remains unchanged.');
    } finally {
      setSyncing(false);
    }
  }

  async function deleteAccount() {
    if (!supabase || !session) return;
    const confirmed = window.confirm('Delete this public profile, every Character and Team, recommendation contribution, and feedback? This cannot be undone.');
    if (!confirmed) return;
    setAuthError(null);
    const { error } = await supabase.rpc('delete_my_account');
    if (error) {
      setAuthError(`Account deletion failed: ${error.message}. Your account remains active.`);
      return;
    }
    await supabase.auth.signOut({ scope: 'local' });
    setRegisteredHandle(null);
    setRegisteredOwnerId(null);
    setAuthMessage('Account deleted. Derived state must exclude the removed source immediately and finish cleanup within 24 hours.');
  }

  async function requestClearDraft() {
    if (!window.confirm('Clear the guest draft stored on this device? Export it first if you may need it.')) return;
    try {
      await clearDraft();
    } catch {
      // DraftProvider exposes the persistent storage error adjacent to the destructive controls.
    }
  }

  return (
    <div className="settings-page page-frame">
      <header className="page-title">
        <div><p className="eyebrow">ACCOUNT / INSTALL / DATA</p><h1>Station controls.</h1></div>
        <p>Account data is server-authoritative. Builder changes stay local to this browser until you explicitly claim or sync them here.</p>
      </header>

      <div className="settings-ledger">
        <section aria-labelledby="account-heading">
          <span className="settings-ledger__index">01</span>
          <div className="settings-ledger__body">
            <p className="eyebrow">SUPABASE AUTH</p>
            <h2 id="account-heading">Account</h2>
            {!supabaseConfigured ? (
              <div className="notice notice--warning">
                <strong>Account connection pending</strong>
                <p>This preview intentionally ships without a publishable key. Local profile building works; sign-in, claim, and registered saves stay unavailable rather than pretending to succeed.</p>
              </div>
            ) : session ? (
              <div className="account-session">
                <p>Signed in as <strong>{session.user.email ?? session.user.id}</strong></p>
                {profileLoading ? (
                  <p className="fine-print" role="status">Checking registered profile…</p>
                ) : hasRegisteredProfile ? (
                  <p>Registered as <Link className="text-link" to={`/p/${registeredHandle}`}>@{registeredHandle}</Link>.</p>
                ) : (
                  <p>No registered MainStation profile yet. Claiming creates a public profile; private Characters and Teams remain absent from it.</p>
                )}
                <p className="fine-print">Registered writes are online-only. A failed request leaves this local draft intact; no background outbox is implied.</p>
                <div className="command-row">
                  <button
                    type="button"
                    className="button-primary"
                    disabled={profileLoading || syncing || !online || !draftCanSync}
                    onClick={() => void requestProfileWrite()}
                  >
                    {syncing ? 'Saving...' : hasRegisteredProfile ? 'Save registered copy' : 'Claim guest draft'}
                  </button>
                  <button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button>
                </div>
              </div>
            ) : (
              <div className="auth-controls">
                <button type="button" className="button-primary" onClick={() => void requestDiscord()}>Continue with Discord</button>
                <span>or</span>
                <form onSubmit={(event) => void requestEmailLink(event)}>
                  <label>Email address<input type="email" required autoComplete="email" value={email} onChange={(event) => setEmail(event.target.value)} /></label>
                  <button type="submit" className="button-secondary">Send sign-in link</button>
                </form>
              </div>
            )}
            {authMessage && <p className="inline-status" role="status">{authMessage}</p>}
            {authError && <p className="inline-error" role="alert">{authError}</p>}
          </div>
        </section>

        <section aria-labelledby="install-heading">
          <span className="settings-ledger__index">02</span>
          <div className="settings-ledger__body">
            <p className="eyebrow">PWA SURFACE</p>
            <h2 id="install-heading">Install MainStation</h2>
            {install.installed ? <p className="inline-status">This window is running in an installed display mode.</p> : (
              <>
                <p>{install.guidance}</p>
                {install.canPrompt && <button type="button" className="button-primary" onClick={() => void install.prompt()}>Install MainStation</button>}
              </>
            )}
            <p className="fine-print">The provisional MS icon is a technical placeholder. Final launcher identity remains an open acceptance gate until MainStation artwork is supplied and device-tested.</p>
          </div>
        </section>

        <section aria-labelledby="local-data-heading">
          <span className="settings-ledger__index">03</span>
          <div className="settings-ledger__body">
            <p className="eyebrow">LOCAL DATA</p>
            <h2 id="local-data-heading">Guest draft</h2>
            <dl className="route-evidence"><div><dt>Stops</dt><dd>{draft.lineups.length}</dd></div><div><dt>Updated</dt><dd>{new Date(draft.updatedAt).toLocaleString()}</dd></div></dl>
            <div className="command-row">
              <button type="button" className="button-secondary" onClick={() => downloadJson('mainstation-guest-draft.json', draft)}>Export JSON</button>
              <button type="button" className="button-danger" onClick={() => void requestClearDraft()}>Clear local draft</button>
            </div>
          </div>
        </section>

        <section aria-labelledby="delete-heading">
          <span className="settings-ledger__index">04</span>
          <div className="settings-ledger__body">
            <p className="eyebrow">DESTRUCTIVE</p>
            <h2 id="delete-heading">Delete account</h2>
            <p>Deletes the public profile, Characters and Teams, recommendation audit records, and feedback. Served current results exclude the source immediately; physical derived cleanup completes within 24 hours.</p>
            <button type="button" className="button-danger" disabled={!session} onClick={() => void deleteAccount()}>Delete registered account</button>
          </div>
        </section>
      </div>
    </div>
  );
}
