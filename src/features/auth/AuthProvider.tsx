import { createContext, useCallback, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';
import type { Session } from '@supabase/supabase-js';
import { getMyRegisteredHandle } from '../profile/profile';
import { supabase } from '../../lib/supabase';

interface AuthContextValue {
  session: Session | null;
  sessionLoading: boolean;
  registeredHandle: string | null;
  profileLoading: boolean;
  error: string | null;
  refreshProfile(): Promise<void>;
  clearError(): void;
}

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [sessionLoading, setSessionLoading] = useState(Boolean(supabase));
  const [registeredHandle, setRegisteredHandle] = useState<string | null>(null);
  const [profileLoading, setProfileLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const refreshProfile = useCallback(async () => {
    if (!session) {
      setRegisteredHandle(null);
      setProfileLoading(false);
      return;
    }
    setProfileLoading(true);
    try {
      setRegisteredHandle(await getMyRegisteredHandle(session.user.id));
      setError(null);
    } catch (profileError) {
      setError(profileError instanceof Error ? profileError.message : 'The registered profile could not be checked.');
    } finally {
      setProfileLoading(false);
    }
  }, [session]);

  useEffect(() => {
    if (!supabase) return;
    let active = true;
    void supabase.auth.getSession().then(({ data, error: sessionError }) => {
      if (!active) return;
      if (sessionError) setError(sessionError.message);
      else {
        setSession(data.session);
        setProfileLoading(Boolean(data.session));
      }
      setSessionLoading(false);
    });
    const { data } = supabase.auth.onAuthStateChange((_event, nextSession) => {
      if (!active) return;
      setSession(nextSession);
      setProfileLoading(Boolean(nextSession));
      setSessionLoading(false);
      if (!nextSession) setRegisteredHandle(null);
    });
    return () => {
      active = false;
      data.subscription.unsubscribe();
    };
  }, []);

  useEffect(() => {
    let active = true;
    if (!session) return;
    void getMyRegisteredHandle(session.user.id)
      .then((handle) => {
        if (active) {
          setRegisteredHandle(handle);
          setError(null);
        }
      })
      .catch((profileError: unknown) => {
        if (active) setError(profileError instanceof Error ? profileError.message : 'The registered profile could not be checked.');
      })
      .finally(() => {
        if (active) setProfileLoading(false);
      });
    return () => {
      active = false;
    };
  }, [session]);

  const value = useMemo<AuthContextValue>(() => ({
    session,
    sessionLoading,
    registeredHandle,
    profileLoading,
    error,
    refreshProfile,
    clearError: () => setError(null),
  }), [error, profileLoading, refreshProfile, registeredHandle, session, sessionLoading]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthContextValue {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuth must be used within AuthProvider.');
  return context;
}
