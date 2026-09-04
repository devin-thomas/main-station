import { act, cleanup, render, screen } from '@testing-library/react';
import { afterEach, beforeEach, expect, it, vi } from 'vitest';
import { AuthProvider, useAuth } from '../src/features/auth/AuthProvider';
import type { Session } from '@supabase/supabase-js';

const mocks = vi.hoisted(() => ({ getSession: vi.fn(), subscribe: vi.fn(), handle: vi.fn() }));
vi.mock('../src/lib/supabase', () => ({ supabase: { auth: { getSession: mocks.getSession, onAuthStateChange: mocks.subscribe } } }));
vi.mock('../src/features/profile/profile', () => ({ getMyRegisteredHandle: mocks.handle }));

const session: Session = {
  access_token: 'first-token', refresh_token: 'test-refresh', token_type: 'bearer', expires_in: 1,
  user: { id: 'owner', aud: 'authenticated', app_metadata: {}, user_metadata: {}, created_at: '2026-01-01T00:00:00Z' },
};
let broadcast: (event: string, next: Session | null) => void;
function Probe() {
  const auth = useAuth();
  return <p>{auth.session ? 'Signed in' : 'Signed out'}</p>;
}

beforeEach(() => {
  vi.useFakeTimers();
  mocks.handle.mockResolvedValue(null);
  mocks.getSession.mockResolvedValue({ data: { session: { ...session, expires_at: Date.now() / 1000 + 1 } }, error: null });
  mocks.subscribe.mockImplementation((callback) => {
    broadcast = callback;
    return { data: { subscription: { unsubscribe: vi.fn() } } };
  });
});
afterEach(() => { cleanup(); vi.useRealTimers(); });

it('closes the account scope when its token expires without a refresh', async () => {
  await act(async () => { render(<AuthProvider><Probe /></AuthProvider>); });
  expect(screen.getByText('Signed in')).toBeInTheDocument();
  await act(async () => { vi.advanceTimersByTime(1001); });
  expect(screen.getByText('Signed out')).toBeInTheDocument();
});

it('keeps the account open after a successful token refresh', async () => {
  await act(async () => { render(<AuthProvider><Probe /></AuthProvider>); });
  await act(async () => broadcast('TOKEN_REFRESHED', { ...session, access_token: 'refreshed-token', expires_at: Date.now() / 1000 + 60 }));
  await act(async () => { vi.advanceTimersByTime(1001); });
  expect(screen.getByText('Signed in')).toBeInTheDocument();
});
