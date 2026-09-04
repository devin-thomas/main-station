import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { completeSignIn, friendlyAuthError } from '../features/auth/auth';
import { supabase } from '../lib/supabase';
import { Wordmark } from '../components/Wordmark';

const safeDestinations = new Set(['/settings', '/build', '/recommend']);

function readAuthParams(search: string, hash: string): URLSearchParams {
  const params = new URLSearchParams(search);
  new URLSearchParams(hash.replace(/^#/, '')).forEach((value, key) => {
    if (!params.has(key)) params.set(key, value);
  });
  return params;
}

export function AuthCallbackPage() {
  const location = useLocation();
  const navigate = useNavigate();
  const params = useMemo(() => readAuthParams(location.search, location.hash), [location.hash, location.search]);
  const providerError = params.get('error');
  const initialError = providerError
    ? providerError === 'access_denied' ? 'Sign-in was cancelled.' : 'That sign-in link could not be used.'
    : supabase ? null : 'Sign-in is unavailable. Please try again later.';
  const [error, setError] = useState<string | null>(initialError);

  useEffect(() => {
    let active = true;
    if (initialError) return;
    const requested = params.get('next') ?? '/settings';
    const destination = safeDestinations.has(requested) ? requested : '/settings';
    void completeSignIn(params.get('code'))
      .then((result) => {
        if (!active) return;
        if (result.error) setError(friendlyAuthError(result.error, 'callback'));
        else if (!result.data.session) setError('We could not confirm your sign-in. Please try again.');
        else navigate(destination, { replace: true });
      })
      .catch((cause: unknown) => {
        if (active) setError(friendlyAuthError(cause, 'callback'));
      });
    return () => { active = false; };
  }, [initialError, navigate, params]);

  return (
    <main className="auth-callback" aria-labelledby="auth-callback-heading">
      <Wordmark />
      <section className="auth-callback__panel">
        {error ? <><h1 id="auth-callback-heading">Sign-in incomplete</h1><p role="alert">{error}</p><div className="command-row"><Link className="button-primary" to="/settings">Try again</Link><Link className="button-secondary" to="/">Back to home</Link></div></> : <h1 id="auth-callback-heading" aria-live="polite">Signing you in...</h1>}
      </section>
    </main>
  );
}
