import { afterAll, beforeAll, describe, expect, it, vi } from 'vitest';

const getSession = vi.hoisted(() => vi.fn());
vi.mock('@supabase/supabase-js', () => ({ createClient: () => ({ auth: { getSession } }) }));
let authorize: typeof import('../src/lib/supabase').accountAuthorization;

beforeAll(async () => {
  vi.stubEnv('VITE_SUPABASE_URL', 'https://example.supabase.co');
  vi.stubEnv('VITE_SUPABASE_PUBLISHABLE_KEY', 'test-only');
  authorize = (await import('../src/lib/supabase')).accountAuthorization;
});
afterAll(() => vi.unstubAllEnvs());

describe('private request identity', () => {
  it('rejects stale work when the active account has changed', async () => {
    getSession.mockResolvedValue({ data: { session: { user: { id: 'second' }, access_token: 'second-token' } }, error: null });
    await expect(authorize('first')).rejects.toThrow('account changed');
  });

  it('rejects requests after session loss', async () => {
    getSession.mockResolvedValue({ data: { session: null }, error: null });
    await expect(authorize('first')).rejects.toThrow('account changed');
  });

  it('captures only the matching owner token for the request', async () => {
    getSession.mockResolvedValue({ data: { session: { user: { id: 'first' }, access_token: 'first-token' } }, error: null });
    const header = await authorize('first');
    getSession.mockResolvedValue({ data: { session: { user: { id: 'second' }, access_token: 'second-token' } }, error: null });
    expect(header).toBe('Bearer first-token');
    await expect(authorize('first')).rejects.toThrow('account changed');
  });
});
