import type { ReactNode } from 'react';
import { Link, Navigate } from 'react-router-dom';
import { useDraft } from '../draft/DraftProvider';
import { useAuth } from './AuthProvider';

export function RequireAccount({ children }: { children: ReactNode }) {
  const { session, sessionLoading, profileLoading, profileLookupFailed } = useAuth();
  const { ready, storageError, reload } = useDraft();
  if (sessionLoading) return <div className="state-page page-frame"><h1>Checking your account...</h1></div>;
  if (!session) return <Navigate to="/settings?next=%2Fbuild" replace />;
  if (profileLookupFailed) return <div className="state-page page-frame"><h1>Could not load your account</h1><Link className="button-primary" to="/settings">Retry account check</Link></div>;
  if (!ready && storageError) return <div className="state-page page-frame"><h1>Could not load your Mainline</h1><p role="alert">{storageError}</p><button className="button-primary" onClick={reload}>Try again</button></div>;
  if (profileLoading || !ready) return <div className="state-page page-frame"><h1>Loading your Mainline...</h1></div>;
  return children;
}
