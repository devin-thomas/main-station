import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { friendlyAuthError } from '../features/auth/auth';
import { discardGuestAccountTransition, loadGuestAccountTransition } from '../features/auth/guestAccountTransition';
import { clearGuestDraft, preserveRecoveryDraft, saveGuestDraft } from '../features/draft/draftStore';
import { getMyRegisteredHandle, loadMyProfileDraft, mergeGuestDraft } from '../features/profile/profile';
import { supabase } from '../lib/supabase';
import { Wordmark } from '../components/Wordmark';

const safeDestinations = new Set(['/settings', '/build', '/recommend']);

function readAuthParams(search: string, hash: string): URLSearchParams {
  const params = new URLSearchParams(search);
  const hashParams = new URLSearchParams(hash.replace(/^#/, ''));
  hashParams.forEach((value, key) => {
    if (!params.has(key)) params.set(key, value);
  });
  return params;
}

function providerErrorMessage(params: URLSearchParams): string | null {
  const error = params.get('error');
  if (!error) return null;
  if (error === 'access_denied') return 'Sign-in was cancelled. Your local draft is unchanged.';
  return 'That sign-in link could not be used. Start again to get a fresh link; your local draft is unchanged.';
}

export function AuthCallbackPage() {
  const location = useLocation();
  const navigate = useNavigate();
  const params = useMemo(() => readAuthParams(location.search, location.hash), [location.hash, location.search]);
  const providerError = providerErrorMessage(params);
  const [error, setError] = useState<string | null>(() => providerError ?? (supabase ? null : 'Account features are not available in this release. Your local draft is unchanged.'));
  const [retry, setRetry] = useState(0);
  const [canRetryTransition, setCanRetryTransition] = useState(false);

  useEffect(() => {
    let active = true;
    const requested = params.get('next') ?? '/settings';
    const destination = safeDestinations.has(requested) ? requested : '/settings';
    const code = params.get('code');
    const client = supabase;
    if (!client) return;
    if (providerError) {
      void discardGuestAccountTransition();
      return;
    }

    const complete = async () => {
      try {
        const result = code ? await client.auth.exchangeCodeForSession(code) : await client.auth.getSession();
        if (!active) return;
        if (result.error) {
          setError(friendlyAuthError(result.error, 'callback'));
          return;
        }
        if (!result.data.session) {
          setError('We could not confirm your sign-in. Start again; your local draft is unchanged.');
          return;
        }
        const transition = await loadGuestAccountTransition();
        if (!active) return;
        if (!transition) {
          navigate(destination, { replace: true });
          return;
        }

        const handle = await getMyRegisteredHandle(result.data.session.user.id);
        if (!active) return;
        if (transition.decision === 'discard') {
          const registeredDraft = handle ? await loadMyProfileDraft() : null;
          if (!active) return;
          if (registeredDraft) await saveGuestDraft(registeredDraft);
          else await clearGuestDraft();
          await discardGuestAccountTransition();
          navigate('/settings?discarded=1', { replace: true });
          return;
        }

        if (!handle) {
          await discardGuestAccountTransition();
          navigate('/settings?merge=profile-setup', { replace: true });
          return;
        }

        // Recovery is written before the server mutation so a failed or interrupted
        // handoff leaves the guest work available on this device.
        await preserveRecoveryDraft(transition.draft);
        const receipt = await mergeGuestDraft(transition.draft);
        const mergedDraft = await loadMyProfileDraft();
        if (!mergedDraft) throw new Error('The merged profile could not be loaded.');
        if (!active) return;
        await saveGuestDraft(mergedDraft);
        await discardGuestAccountTransition();
        const mergeQuery = new URLSearchParams({
          merged: String(receipt.addedLineupCount),
          duplicates: String(receipt.duplicateLineupCount),
          conflicts: String(receipt.conflictingLineupCount),
        });
        navigate(`/settings?${mergeQuery.toString()}`, { replace: true });
      } catch (callbackError) {
        if (active) {
          setCanRetryTransition(true);
          setError(callbackError instanceof Error && callbackError.message === 'The merged profile could not be loaded.'
            ? 'Your account was updated, but this browser could not load the merged profile. Retry to finish safely.'
            : 'You are signed in, but we could not finish the draft handoff. Your local draft is unchanged; retry to continue.');
        }
      }
    };
    void complete();
    return () => {
      active = false;
    };
  }, [navigate, params, providerError, retry]);

  return (
    <main className="auth-callback" aria-labelledby="auth-callback-heading">
      <Wordmark />
      <section className="auth-callback__panel">
        {error ? <><p className="eyebrow">SIGN-IN NEEDS ANOTHER TRY</p><h1 id="auth-callback-heading">Your draft is safe.</h1><p role="alert">{error}</p><div className="command-row">{canRetryTransition ? <button type="button" className="button-primary" onClick={() => { setCanRetryTransition(false); setError(null); setRetry((value) => value + 1); }}>Retry draft handoff</button> : <Link className="button-primary" to="/settings">Try again</Link>}<Link className="button-secondary" to="/build">Back to your draft</Link></div></> : <><p className="eyebrow">SIGNING YOU IN</p><h1 id="auth-callback-heading">One moment.</h1><p role="status">Confirming your secure session and applying your saved draft decision.</p></>}
      </section>
    </main>
  );
}
