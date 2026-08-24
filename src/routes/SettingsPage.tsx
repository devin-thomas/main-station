import { useEffect, useState, type FormEvent } from 'react';
import type { Session } from '@supabase/supabase-js';
import { useDraft } from '../features/draft/DraftProvider';
import { sendEmailLink, signInWithDiscord, signOut } from '../features/auth/auth';
import { useInstall } from '../features/pwa/useInstall';
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
  const { draft, clearDraft } = useDraft();
  const install = useInstall();
  const [email, setEmail] = useState('');
  const [authMessage, setAuthMessage] = useState<string | null>(null);
  const [authError, setAuthError] = useState<string | null>(null);
  const [session, setSession] = useState<Session | null>(null);

  useEffect(() => {
    if (!supabase) return;
    void supabase.auth.getSession().then(({ data, error }) => {
      if (error) setAuthError(error.message);
      else setSession(data.session);
    });
    const { data } = supabase.auth.onAuthStateChange((_event, nextSession) => setSession(nextSession));
    return () => data.subscription.unsubscribe();
  }, []);

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
        <p>Account data is server-authoritative. The guest draft below is local to this browser profile until you explicitly claim it.</p>
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
                <button type="button" className="button-secondary" onClick={() => void requestSignOut()}>Sign out</button>
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
