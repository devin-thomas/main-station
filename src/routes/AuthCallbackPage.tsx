import { useEffect, useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { supabase } from '../lib/supabase';

const safeDestinations = new Set(['/settings', '/build', '/recommend']);

export function AuthCallbackPage() {
  const [params] = useSearchParams();
  const navigate = useNavigate();
  const [error, setError] = useState<string | null>(() => supabase ? null : 'Account features are not configured on this release. Your local draft is unchanged.');

  useEffect(() => {
    let active = true;
    const requested = params.get('next') ?? '/settings';
    const destination = safeDestinations.has(requested) ? requested : '/settings';
    const code = params.get('code');
    const client = supabase;
    if (!client) return;
    const complete = async () => {
      const result = code ? await client.auth.exchangeCodeForSession(code) : await client.auth.getSession();
      if (!active) return;
      if (result.error) {
        setError(result.error.message);
        return;
      }
      navigate(destination, { replace: true });
    };
    void complete();
    return () => {
      active = false;
    };
  }, [navigate, params]);

  return (
    <div className="state-page page-frame">
      <p className="eyebrow">AUTH / CALLBACK</p>
      {error ? <><h1>Sign-in stopped safely.</h1><p role="alert">{error}</p><Link className="button-primary" to="/settings">Return to settings</Link></> : <><h1>Connecting your station…</h1><p>Your local draft remains intact while the secure session is confirmed.</p></>}
    </div>
  );
}
