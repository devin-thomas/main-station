import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { friendlyAuthError } from '../features/auth/auth';
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

  useEffect(() => {
    let active = true;
    const requested = params.get('next') ?? '/settings';
    const destination = safeDestinations.has(requested) ? requested : '/settings';
    const code = params.get('code');
    const client = supabase;
    if (!client || providerError) return;

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
        navigate(destination, { replace: true });
      } catch (callbackError) {
        if (active) setError(friendlyAuthError(callbackError, 'callback'));
      }
    };
    void complete();
    return () => {
      active = false;
    };
  }, [navigate, params, providerError]);

  return (
    <main className="auth-callback" aria-labelledby="auth-callback-heading">
      <Wordmark />
      <section className="auth-callback__panel">
        {error ? <><p className="eyebrow">SIGN-IN NEEDS ANOTHER TRY</p><h1 id="auth-callback-heading">Your draft is safe.</h1><p role="alert">{error}</p><div className="command-row"><Link className="button-primary" to="/settings">Try again</Link><Link className="button-secondary" to="/build">Back to your draft</Link></div></> : <><p className="eyebrow">SIGNING YOU IN</p><h1 id="auth-callback-heading">One moment.</h1><p role="status">Confirming your secure session. Your local draft remains untouched.</p></>}
      </section>
    </main>
  );
}
