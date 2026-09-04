import { Buffer } from 'node:buffer';
import type { Page } from '@playwright/test';
import { loadEnv } from 'vite';
import type { ProfileDraft } from '../../src/types/domain';

const projectUrl = process.env.VITE_SUPABASE_URL ?? loadEnv('production', process.cwd(), 'VITE_').VITE_SUPABASE_URL;
if (!projectUrl) throw new Error('E2E auth fixtures require the same VITE_SUPABASE_URL as the production build.');
const storageKey = `sb-${new URL(projectUrl).hostname.split('.')[0]}-auth-token`;

export const firstUserId = '00000000-0000-4000-8000-000000000001';
export const secondUserId = '00000000-0000-4000-8000-000000000002';

function sessionFor(userId: string) {
  const expiresAt = Math.floor(Date.now() / 1000) + 86_400;
  const encode = (value: unknown) => Buffer.from(JSON.stringify(value)).toString('base64url');
  return {
    access_token: `${encode({ alg: 'HS256', typ: 'JWT' })}.${encode({ sub: userId, aud: 'authenticated', role: 'authenticated', exp: expiresAt })}.e2e-only`,
    refresh_token: `e2e-refresh-${userId}`,
    token_type: 'bearer',
    expires_in: 86_400,
    expires_at: expiresAt,
    user: { id: userId, aud: 'authenticated', role: 'authenticated', email: 'e2e@example.test', app_metadata: {}, user_metadata: {}, created_at: '2026-01-01T00:00:00Z' },
  };
}

/** Mock the configured Supabase origin; no real authentication or profile writes occur. */
export async function mockAccount(page: Page, { signedIn = true, userId = firstUserId, savedDraft = null }: { signedIn?: boolean; userId?: string; savedDraft?: ProfileDraft | null } = {}) {
  const session = sessionFor(userId);
  const requests: { path: string; method: string; body: unknown; url: string }[] = [];
  let handle: string | null = savedDraft?.profile.handle ?? null;
  await page.route(`${new URL(projectUrl).origin}/**`, async (route) => {
    const request = route.request();
    const url = new URL(request.url());
    const body: unknown = request.postData() ? request.postDataJSON() : null;
    requests.push({ path: url.pathname, method: request.method(), body, url: url.href });
    if (url.pathname === '/auth/v1/logout') {
      await route.fulfill({ status: 204 });
    } else if (url.pathname === '/auth/v1/token') {
      await route.fulfill({ json: session });
    } else if (url.pathname === '/auth/v1/user') {
      await route.fulfill({ json: session.user });
    } else if (url.pathname === '/auth/v1/otp') {
      await route.fulfill({ json: {} });
    } else if (url.pathname === '/rest/v1/profiles') {
      await route.fulfill({ json: handle ? { handle } : null });
    } else if (url.pathname === '/rest/v1/public_profile_mainline') {
      await route.fulfill({ json: [] });
    } else if (url.pathname === '/rest/v1/game_versions' || url.pathname === '/rest/v1/characters') {
      await route.fulfill({ json: { id: '00000000-0000-4000-8000-000000000006' } });
    } else if (url.pathname === '/rest/v1/registered_player_counts' || url.pathname === '/rest/v1/character_usage_stats') {
      await route.fulfill({ json: null });
    } else if (url.pathname === '/rest/v1/character_picks') {
      await route.fulfill({ json: [] });
    } else if (url.pathname === '/rest/v1/rpc/get_my_profile_draft') {
      await route.fulfill({ json: savedDraft });
    } else if (url.pathname === '/rest/v1/rpc/claim_profile_draft' || url.pathname === '/rest/v1/rpc/save_my_profile_draft') {
      const payload = request.postDataJSON().p_payload;
      handle = payload.profile.handle;
      savedDraft = payload;
      await route.fulfill({ json: { profileId: userId, handle, profilePath: `/p/${handle}`, lineupCount: payload.lineups.length } });
    } else {
      throw new Error(`Unexpected mocked Supabase request: ${request.method()} ${url.pathname}`);
    }
  });
  await page.addInitScript(({ key, value, signedIn }) => {
    if (sessionStorage.getItem('e2e-auth-initialized')) return;
    sessionStorage.setItem('e2e-auth-initialized', 'true');
    if (signedIn) localStorage.setItem(key, JSON.stringify(value));
    localStorage.setItem(`${key}-code-verifier`, JSON.stringify('e2e-code-verifier'));
  }, { key: storageKey, value: session, signedIn });
  return { requests };
}

export async function switchAccount(page: Page, userId: string) {
  await page.evaluate(({ key, value }) => localStorage.setItem(key, JSON.stringify(value)), { key: storageKey, value: sessionFor(userId) });
  await page.reload();
}
