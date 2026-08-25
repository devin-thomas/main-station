import { useEffect, useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { supabase } from '../lib/supabase';

const safeDestinations = new Set(['/settings', '/build', '/recommend']);

function oauthErrorMessage(params: URLSearchParams): string | null {
  const error = params.get('error');
  if (!error) return null;
  if (error === 'access_denied') return 'Discord sign-in was cancelled. Your local draft is unchanged.';
  return `Discord sign-in could not be completed (${error}). Your local draft is unchanged.`;
}

export function AuthCallbackPage() {
  const [params] = useSearchParams();
  const navigate = useNavigate();
  const providerError = oauthErrorMessage(params);
  const [error, setError] = useState<string | null>(() => providerError ?? (supabase ? null : 'Account features are not configured on this release. Your local draft is unchanged.'));

  useEffect(() => {
    let active = true;
    const requested = params.get('next') ?? '/settings';
    const destination = safeDestinations.has(requested) ? requested : '/settings';
    const code = params.get('code');
    const client = supabase;
    if (!client || providerError) return;
    const complete = async () => {
      const result = code ? await client.auth.exchangeCodeForSession(code) : await client.auth.getSession();
      if (!active) return;
      if (result.error) {
        setError(result.error.message);
        return;
      }
      if (!result.data.session) {
        setError('Discord sign-in returned without a session. Try again; your local draft is unchanged.');
        return;
      }
      navigate(destination, { replace: true });
    };
    void complete();
    return () => {
      active = false;
    };
  }, [navigate, params, providerError]);

  return (
    <div className="state-page page-frame">
      <p className="eyebrow">AUTH / CALLBACK</p>
      {error ? <><h1>Sign-in stopped safely.</h1><p role="alert">{error}</p><Link className="button-primary" to="/settings">Return to settings</Link></> : <><h1>Connecting your station…</h1><p>Your local draft remains intact while the secure session is confirmed.</p></>}
    </div>
  );
}
