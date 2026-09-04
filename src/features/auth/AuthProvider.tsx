import { createContext, useCallback, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';
import type { Session } from '@supabase/supabase-js';
import { getMyRegisteredHandle } from '../profile/profile';
import { supabase } from '../../lib/supabase';

interface AuthContextValue {
  session: Session | null;
  sessionLoading: boolean;
  registeredHandle: string | null;
  profileLoading: boolean;
  profileLookupFailed: boolean;
  error: string | null;
  refreshProfile(): Promise<void>;
  clearError(): void;
}

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [sessionLoading, setSessionLoading] = useState(Boolean(supabase));
  const [sessionError, setSessionError] = useState<string | null>(null);

  useEffect(() => {
    if (!supabase) return;
    let active = true;
    let receivedEvent = false;
    void supabase.auth.getSession().then(({ data, error }) => {
      if (!active || receivedEvent) return;
      setSession(error ? null : data.session);
      setSessionError(error ? 'Your sign-in could not be checked. Please try again.' : null);
      setSessionLoading(false);
    }).catch(() => {
      if (!active || receivedEvent) return;
      setSessionError('Your sign-in could not be checked. Please try again.');
      setSessionLoading(false);
    });
    const { data } = supabase.auth.onAuthStateChange((_event, nextSession) => {
      if (!active) return;
      receivedEvent = true;
      setSession(nextSession);
      setSessionError(null);
      setSessionLoading(false);
    });
    return () => { active = false; data.subscription.unsubscribe(); };
  }, []);

  useEffect(() => {
    if (!session?.expires_at) return;
    const token = session.access_token;
    const timer = window.setTimeout(() => {
      setSession((current) => current?.access_token === token ? null : current);
    }, Math.max(0, session.expires_at * 1000 - Date.now()));
    return () => window.clearTimeout(timer);
  }, [session]);

  // Late profile requests and unfinished forms cannot carry over to another user.
  return <AccountAuthProvider key={session?.user.id ?? 'signed-out'} session={session} sessionLoading={sessionLoading} sessionError={sessionError}>{children}</AccountAuthProvider>;
}

function AccountAuthProvider({ children, session, sessionLoading, sessionError }: {
  children: ReactNode; session: Session | null; sessionLoading: boolean; sessionError: string | null;
}) {
  const userId = session?.user.id;
  const [registeredHandle, setRegisteredHandle] = useState<string | null>(null);
  const [profileLoading, setProfileLoading] = useState(Boolean(userId));
  const [profileLookupFailed, setProfileLookupFailed] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const refreshProfile = useCallback(async () => {
    if (!userId) return;
    setProfileLoading(true);
    setProfileLookupFailed(false);
    try {
      setRegisteredHandle(await getMyRegisteredHandle(userId));
      setError(null);
    } catch {
      setRegisteredHandle(null);
      setProfileLookupFailed(true);
      setError('Your profile could not be checked. Please try again.');
    } finally { setProfileLoading(false); }
  }, [userId]);

  useEffect(() => {
    if (!userId) return;
    let active = true;
    void getMyRegisteredHandle(userId).then((handle) => {
      if (active) setRegisteredHandle(handle);
    }).catch(() => {
      if (active) {
        setProfileLookupFailed(true);
        setError('Your profile could not be checked. Please try again.');
      }
    }).finally(() => { if (active) setProfileLoading(false); });
    return () => { active = false; };
  }, [userId]);

  const value = useMemo<AuthContextValue>(() => ({
    session, sessionLoading, registeredHandle, profileLoading, profileLookupFailed,
    error: error ?? sessionError, refreshProfile, clearError: () => setError(null),
  }), [error, profileLoading, profileLookupFailed, refreshProfile, registeredHandle, session, sessionError, sessionLoading]);
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthContextValue {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuth must be used within AuthProvider.');
  return context;
}
