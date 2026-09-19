import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { expect, test, type Page } from '@playwright/test';
import { mockAccount } from './auth-fixture';
// @ts-expect-error -- plain ESM helper, no types needed for a test fixture server.
import { startPwaServer } from './pwa-server.mjs';

const here = path.dirname(fileURLToPath(import.meta.url));
const dist = path.resolve(here, '../../dist');
const recoveryWorker = path.resolve(here, '../../recovery/sw.js');

// The worker bytes change during these tests, so they share one origin and run in order.
test.describe.configure({ mode: 'serial' });
test.use({ serviceWorkers: 'allow' });

let server: { origin: string; close(): Promise<void> };

test.beforeAll(async () => {
  server = await startPwaServer({ dist, recoveryWorker });
});

test.afterAll(async () => {
  await server?.close();
});

/** Counts document loads per tab so "exactly one reload" is measurable rather than assumed. */
async function countLoads(page: Page) {
  await page.addInitScript(() => {
    const key = 'pwa-load-count';
    sessionStorage.setItem(key, String(Number(sessionStorage.getItem(key) ?? '0') + 1));
  });
}

const loads = (page: Page) => page.evaluate(() => Number(sessionStorage.getItem('pwa-load-count') ?? '0'));

async function waitForController(page: Page) {
  await page.evaluate(async () => {
    await navigator.serviceWorker.ready;
  });
  await page.waitForFunction(() => navigator.serviceWorker.controller !== null, null, { timeout: 20000 });
}

const cachedUrls = (page: Page) => page.evaluate(async () => {
  const names = await caches.keys();
  const urls: string[] = [];
  for (const name of names) {
    const keys = await (await caches.open(name)).keys();
    for (const request of keys) urls.push(request.url);
  }
  return urls;
});

const cacheNames = (page: Page) => page.evaluate(() => caches.keys());

const waitingWorker = (page: Page) => page.evaluate(async () => {
  const registration = await navigator.serviceWorker.getRegistration();
  return Boolean(registration?.waiting);
});

/** Ask the browser to re-check /sw.js now instead of waiting for its own schedule. */
async function checkForUpdate(page: Page) {
  await page.evaluate(async () => {
    const registration = await navigator.serviceWorker.getRegistration();
    await registration?.update();
  });
}

test('fresh first load registers a worker and precaches only the same-origin shell', async ({ page }) => {
  await countLoads(page);
  await page.goto(server.origin);
  await waitForController(page);

  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  expect(await loads(page)).toBe(1);

  const urls = await cachedUrls(page);
  expect(urls.length).toBeGreaterThan(0);
  // Workbox keys precache entries with a revision query, so compare paths, not whole URLs.
  const paths = urls.map((url) => new URL(url).pathname);
  expect(paths).toContain('/index.html');
  for (const url of urls) expect(new URL(url).origin).toBe(server.origin);
});

test('a returning visit is controlled immediately without a second registration round', async ({ page }) => {
  await countLoads(page);
  await page.goto(server.origin);
  await waitForController(page);

  await page.reload();
  expect(await page.evaluate(() => navigator.serviceWorker.controller !== null)).toBe(true);
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  expect(await loads(page)).toBe(2);
});

test('offline navigation serves the cached shell and keeps account actions unavailable', async ({ page, context }) => {
  await page.goto(server.origin);
  await waitForController(page);

  await context.setOffline(true);
  try {
    await page.reload();
    await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
    await expect(page.getByRole('status').filter({ hasText: 'OFFLINE' })).toBeVisible();

    await page.goto(`${server.origin}/recommend`);
    await expect(page.getByText('Recommendations require an internet connection.').first()).toBeVisible();
  } finally {
    await context.setOffline(false);
  }
});

test('a new worker waits, Later defers it, and Reload now adopts it in exactly one reload', async ({ page }) => {
  await countLoads(page);
  await page.goto(server.origin);
  await waitForController(page);
  expect(await loads(page)).toBe(1);

  await page.request.get(`${server.origin}/__control/release`);
  await checkForUpdate(page);

  const banner = page.getByRole('status').filter({ hasText: 'UPDATE READY' });
  await expect(banner).toBeVisible();
  expect(await waitingWorker(page)).toBe(true);

  // Later dismisses the announcement without adopting the update.
  await banner.getByRole('button', { name: 'Later' }).click();
  await expect(banner).toBeHidden();
  expect(await waitingWorker(page)).toBe(true);
  expect(await loads(page)).toBe(1);

  // The deferred update is announced again on the next visit rather than being lost.
  await page.reload();
  expect(await loads(page)).toBe(2);
  const returning = page.getByRole('status').filter({ hasText: 'UPDATE READY' });
  await expect(returning).toBeVisible();

  await returning.getByRole('button', { name: 'Reload now' }).click();
  await page.waitForFunction(() => Number(sessionStorage.getItem('pwa-load-count') ?? '0') >= 3, null, { timeout: 20000 });
  await waitForController(page);

  expect(await waitingWorker(page)).toBe(false);
  // Exactly one reload: 2 before adoption, 3 after. A reload loop would keep climbing.
  await page.waitForTimeout(1500);
  expect(await loads(page)).toBe(3);
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
});

test('two tabs cross the update boundary together and neither is left on the old build', async ({ context }) => {
  const first = await context.newPage();
  const second = await context.newPage();
  for (const page of [first, second]) await countLoads(page);

  await first.goto(server.origin);
  await waitForController(first);
  await second.goto(server.origin);
  await waitForController(second);
  expect(await loads(first)).toBe(1);
  expect(await loads(second)).toBe(1);

  await first.request.get(`${server.origin}/__control/release`);
  await checkForUpdate(first);

  const banner = first.getByRole('status').filter({ hasText: 'UPDATE READY' });
  await expect(banner).toBeVisible();
  await banner.getByRole('button', { name: 'Reload now' }).click();

  for (const page of [first, second]) {
    await page.waitForFunction(() => Number(sessionStorage.getItem('pwa-load-count') ?? '0') >= 2, null, { timeout: 20000 });
    await waitForController(page);
    await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  }

  expect(await waitingWorker(first)).toBe(false);
  expect(await waitingWorker(second)).toBe(false);
  // Each tab reloads once. Neither keeps running an old document against the new worker.
  await first.waitForTimeout(1500);
  expect(await loads(first)).toBe(2);
  expect(await loads(second)).toBe(2);

  await first.close();
  await second.close();
});

test('a storage write refused for quota reports a distinct error and keeps earlier work', async ({ page }) => {
  await mockAccount(page, {
    savedDraft: {
      version: 1,
      requestId: '00000000-0000-4000-8000-000000000009',
      profile: { handle: 'quota-player', displayName: 'Quota Player', bio: '' },
      lineups: [],
      updatedAt: '2026-01-01T00:00:00Z',
    },
  });
  // Refuse every object-store write the way a device with no room left does.
  await page.addInitScript(() => {
    const original = IDBObjectStore.prototype.put;
    IDBObjectStore.prototype.put = function put(this: IDBObjectStore, ...args: unknown[]) {
      if (this.name === 'drafts') throw new DOMException('The quota has been exceeded.', 'QuotaExceededError');
      return (original as (...a: unknown[]) => IDBRequest).apply(this, args);
    } as typeof original;
  });

  await page.goto(`${server.origin}/build`);
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();

  const error = page.getByRole('alert').filter({ hasText: 'no room left' });
  await expect(error).toBeVisible();
  await expect(error).toContainText('Your last saved entries are unchanged.');
  // The failed write is reported rather than shown as a saved entry.
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(0);
});

test('no Supabase response, mutation, or cross-origin request is ever stored in Cache Storage', async ({ page }) => {
  await page.goto(server.origin);
  await waitForController(page);

  // Exercise the surfaces that talk to Supabase before inspecting what was cached.
  for (const route of ['/', '/games/uni2', '/recommend', '/settings', '/p/station-zero']) {
    await page.goto(`${server.origin}${route}`);
    await page.waitForLoadState('networkidle');
  }

  const urls = await cachedUrls(page);
  expect(urls.length).toBeGreaterThan(0);
  for (const url of urls) {
    expect(url).not.toMatch(/supabase/i);
    expect(url).not.toContain('/auth/v1/');
    expect(url).not.toContain('/rest/v1/');
    expect(new URL(url).origin).toBe(server.origin);
  }
});

test('the recovery worker takes over at the same URL, clears only MainStation caches, and stops serving from cache', async ({ page, context }) => {
  await page.goto(server.origin);
  await waitForController(page);
  expect((await cacheNames(page)).length).toBeGreaterThan(0);

  // A cache this app does not own must survive recovery.
  await page.evaluate(async () => {
    await caches.open('unrelated-origin-neighbour');
  });

  await page.request.get(`${server.origin}/__control/recovery`);
  // The recovery worker navigates its clients once as it activates, so the update check
  // can lose its execution context mid-call. That navigation is the intended behaviour.
  const navigated = page.waitForNavigation({ timeout: 20000 }).catch(() => null);
  await checkForUpdate(page).catch(() => null);
  await navigated;
  await page.waitForLoadState('load');

  await expect.poll(async () => {
    // Reading caches can race the recovery navigation; retry rather than fail on it.
    const names = await cacheNames(page).catch(() => null);
    if (!names) return 'pending';
    return names.some((name) => /^(workbox-precache|mainstation)/.test(name)) ? 'owned-caches-present' : 'cleared';
  }, { timeout: 20000 }).toBe('cleared');

  const remaining = await cacheNames(page);
  expect(remaining).toContain('unrelated-origin-neighbour');
  expect(remaining.some((name) => name.startsWith('workbox-precache') || name.startsWith('mainstation'))).toBe(false);

  // Still usable online, because the recovery worker passes everything to the network.
  await page.goto(server.origin);
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');

  // No fetch handler means no offline fallback: the absence of caching is observable.
  await context.setOffline(true);
  try {
    await expect(page.goto(server.origin)).rejects.toThrow();
  } finally {
    await context.setOffline(false);
  }
});
