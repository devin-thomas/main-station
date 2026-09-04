import type { ReactNode } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../features/auth/AuthProvider';

export function BuildLink({ children, className }: { children: ReactNode; className: string }) {
  const { session, sessionLoading } = useAuth();
  const signedOut = !sessionLoading && !session;
  return <Link className={className} to={signedOut ? '/settings?next=%2Fbuild' : '/build'}>{signedOut ? 'Sign in to build' : children}</Link>;
}
