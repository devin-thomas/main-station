import { expect, test } from '@playwright/test';
import { catalog } from '../../src/data/catalog';
import { firstUserId, mockAccount, secondUserId, switchAccount } from './auth-fixture';

// Service workers can bypass Playwright network mocks, particularly in WebKit.
test.use({ serviceWorkers: 'block' });

test('home, catalog, and cleared imagery render', async ({ page }) => {
  await page.goto('/');
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  await expect(page.locator('.wordmark__logo')).toBeVisible();
  await expect(page.getByRole('navigation', { name: 'Games' })).toBeVisible();
  await expect(page.getByAltText('Ekko and Magik clash in battle')).toBeVisible();
  await expect(page.locator('.character-stage__credit')).toHaveCount(0);
  await expect(page.getByText('Developed by Uppercut Labs')).toBeVisible();
  const studioLogo = page.locator('img[src="/uppercut-labs-logo.png"]');
  await expect(studioLogo).toBeVisible();
  await expect(studioLogo).toHaveCSS('border-radius', '0px');

  await page.goto('/games/uni2');
  await expect(page.getByRole('heading', { name: 'Official roster' })).toBeVisible();
  await expect(page.locator('.roster-ledger li')).toHaveCount(28);
  await page.getByRole('link', { name: 'Zohar', exact: true }).click();
  await expect(page.getByAltText(/Zohar from/)).toBeVisible();
  await expect(page.locator('.provenance-block')).toContainText('© FRENCH-BREAD / ARC SYSTEM WORKS');
});

test('every current Character art file and UI icon is served as an image', async ({ request }) => {
  const artRecords = catalog.flatMap((game) => game.characters.map((character) => character.art)).filter((art) => art);
  expect(artRecords).toHaveLength(90);

  for (const art of artRecords) {
    expect(art).toBeDefined();
    const response = await request.get(art!.localPath);
    expect(response.ok(), art!.localPath).toBeTruthy();
    expect(response.headers()['content-type'], art!.localPath).toMatch(/^image\//);
  }

  for (const name of ['arrow-down', 'arrow-up', 'check', 'chevron-right', 'compass', 'pencil', 'plus', 'settings', 'trash-2', 'user-round', 'x']) {
    const path = `/ui-icons/${name}.svg`;
    const response = await request.get(path);
    expect(response.ok(), path).toBeTruthy();
    expect(response.headers()['content-type'], path).toContain('image/svg+xml');
    expect(await response.text(), path).toContain('<svg');
  }
});

test('every founding game renders reviewed art and provenance on a Character page', async ({ page }) => {
  for (const game of catalog) {
    const character = game.characters[0];
    await page.goto(`/games/${game.slug}/characters/${character.slug}`);
    if (character.art) {
      await expect(page.getByAltText(`${character.name} from ${game.name}`)).toBeVisible();
      await expect(page.locator('.character-stage__credit')).toHaveCount(0);
      await expect(page.locator('.provenance-block')).toContainText(character.art.creditText);
    } else {
      await expect(page.getByRole('img', { name: `${character.name}; artwork unavailable` })).toBeVisible();
      await expect(page.locator('.character-stage__fallback')).not.toContainText('ART RIGHTS REVIEW');
    }
  }
});

test('signed-in member can select and save a valid roster entry for every founding game', async ({ page }) => {
  test.setTimeout(60_000);
  await mockAccount(page);
  await page.goto('/build');

  for (const game of catalog) {
    await page.locator('.game-selector__item').filter({ hasText: game.shortName }).click();

    for (const [index, slot] of game.schema.slots.entries()) {
      const row = page.locator('fieldset.slot-row').nth(index);
      const candidates = game.characters.filter((character) => slot.allowedRoles.includes(character.role));
      const character = candidates[index % candidates.length];
      await row.getByRole('combobox').nth(0).selectOption(character.slug);

      const optionValues = slot.optionValuesByCharacter?.[character.slug] ?? slot.optionValues;
      if (optionValues?.length) {
        await row.getByRole('combobox').nth(1).selectOption(optionValues[0]);
      }
    }

    if (game.schema.teamOptionValues?.length) {
      await page.getByLabel(game.schema.teamOptionLabel!).selectOption(game.schema.teamOptionValues[0]);
    }

    await page.getByRole('button', { name: `Save ${game.schema.noun}` }).click();
    await expect(page.getByRole('status').filter({ hasText: /saved on this device/ })).toBeVisible();
  }
});

test('signed-in member can save a valid solo Character and reload it from IndexedDB', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/build');
  await expect(page.getByRole('button', { name: 'Save identity' })).toHaveCount(0);
  await expect(page.getByRole('link', { name: 'Sign in to save & share' })).toHaveCount(0);
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
  await page.reload();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
});

test('signed-in member can save a source-checked 2XKO team and Fuse', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/build');
  await page.getByRole('button', { name: '2XKO', exact: true }).click();
  const point = page.locator('fieldset').filter({ hasText: 'Point' }).getByRole('combobox');
  const assist = page.locator('fieldset').filter({ hasText: 'Assist' }).getByRole('combobox');
  await point.selectOption('ahri');
  await assist.selectOption('ahri');
  await page.getByLabel('Fuse').selectOption('Double Down');
  await page.getByRole('button', { name: 'Save Team' }).click();
  await expect(page.locator('.validation-block')).toContainText('A Character can appear only once in this Team.');
  await assist.selectOption('akali');
  await page.getByRole('button', { name: 'Save Team' }).click();
  await expect(page.getByRole('link', { name: 'Ahri / Akali' })).toBeVisible();
  await expect(page.getByText('Fuse: Double Down')).toBeVisible();
});

test('signed-in member can edit, hide, restore, retire, reorder, and remove saved entries', async ({ page }, testInfo) => {
  await mockAccount(page);
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await page.getByRole('button', { name: 'Hide' }).click();
  await expect(page.getByText('Main · Active · Private')).toBeVisible();

  await page.getByRole('button', { name: 'Edit' }).click();
  await page.getByLabel('Role').selectOption('secondary');
  await page.getByRole('button', { name: 'Update Character' }).click();
  await expect(page.getByText('Secondary · Active · Private')).toBeVisible();

  await page.getByRole('button', { name: 'Make public' }).click();
  await page.getByRole('button', { name: 'Retire' }).click();
  await expect(page.getByText('Secondary · Retired · Public')).toBeVisible();

  await page.getByLabel('Character').selectOption('linne');
  await page.getByRole('button', { name: 'Save Character' }).click();
  const rows = page.locator('.draft-action-ledger__row');
  await expect(rows).toHaveCount(2);
  for (const control of await page.locator('.draft-action-ledger .icon-button').all()) {
    await expect(control).toHaveAccessibleName(/^(Edit|Move up|Move down|Remove)$/);
    if (testInfo.project.use.isMobile) {
      const bounds = await control.boundingBox();
      expect(bounds?.width).toBeGreaterThanOrEqual(44);
      expect(bounds?.height).toBeGreaterThanOrEqual(44);
    }
  }
  await expect(rows.first().getByRole('button', { name: 'Move up' })).toBeDisabled();
  await expect(rows.last().getByRole('button', { name: 'Move down' })).toBeDisabled();
  await rows.first().getByRole('button', { name: 'Move down' }).click();
  await expect(rows.first()).toContainText('Linne');
  await rows.last().getByRole('button', { name: 'Move up' }).click();
  await expect(rows.first()).toContainText('Hyde');
  if (testInfo.project.use.isMobile) {
    await page.evaluate(() => {
      if (document.activeElement instanceof HTMLElement) document.activeElement.blur();
      window.scrollTo({ top: 0, behavior: 'instant' });
    });
    await expect.poll(() => page.evaluate(() => window.scrollY)).toBe(0);
    await page.screenshot({ path: `output/playwright/${testInfo.project.name}/build-draft.png`, fullPage: true, animations: 'disabled' });
  }
  await rows.last().getByRole('button', { name: 'Remove' }).click();
  await expect(rows).toHaveCount(1);
  await page.reload();
  await expect(rows).toHaveCount(1);
  await expect(rows.first()).toContainText('Hyde');
});

test('unknown public route shows a real product 404', async ({ page }) => {
  await page.goto('/not-a-station');
  await expect(page.getByRole('heading', { name: 'Page not found' })).toBeVisible();
});

test('signed-out visitors must sign in before opening the editor', async ({ page }) => {
  await page.goto('/build');
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
  await expect(page.getByRole('heading', { name: 'Sign in or create an account' })).toBeVisible();
  await expect(page.locator('.game-selector, fieldset.slot-row, .draft-action-ledger')).toHaveCount(0);
  await expect(page.getByRole('button', { name: /Save Character|Create profile|Clear local draft/ })).toHaveCount(0);
  await page.goto('/');
  await page.getByRole('link', { name: 'Sign in to build', exact: true }).first().click();
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
});

for (const errorLocation of ['?error=access_denied&next=%2Fbuild', '#error=access_denied']) {
  test(`cancelled sign-in stays on a focused error screen (${errorLocation})`, async ({ page }) => {
    await page.goto(`/auth/callback${errorLocation}`);
    await expect(page.getByRole('heading', { name: 'Sign-in incomplete' })).toBeVisible();
    await expect(page.getByRole('alert')).toContainText('Sign-in was cancelled.');
    await expect(page.getByRole('link', { name: 'Try again' })).toBeVisible();
    await expect(page.getByText(/local draft|draft transfer/i)).toHaveCount(0);
    await expect(page.getByRole('navigation', { name: 'Primary' })).toHaveCount(0);
    await expect(page).toHaveURL(/\/auth\/callback/);
  });
}

for (const destination of ['/build', 'https://example.test/steal', '//example.test/steal']) {
  test(`successful PKCE callback uses a safe destination (${destination})`, async ({ page }) => {
    const account = await mockAccount(page, { signedIn: false });
    await page.goto(`/auth/callback?code=e2e-code&next=${encodeURIComponent(destination)}`);
    await expect(page).toHaveURL(destination === '/build' ? /\/build$/ : /\/settings$/);
    await expect(page.getByRole('button', { name: destination === '/build' ? 'Save Character' : 'Create profile', exact: true })).toBeVisible();
    expect(account.requests.filter((request) => request.path === '/auth/v1/token')).toHaveLength(1);
    expect(account.requests.filter((request) => /merge|claim|save/.test(request.path))).toHaveLength(0);
  });
}

test('email sign-in preserves the builder destination without a draft decision', async ({ page }) => {
  const account = await mockAccount(page, { signedIn: false });
  await page.goto('/build');
  await page.getByLabel('Email address').fill('e2e@example.test');
  await page.getByRole('button', { name: 'Continue with email' }).click();
  await expect(page.getByRole('heading', { name: 'Check your email' })).toBeVisible();
  const emailRequest = account.requests.find((request) => request.path === '/auth/v1/otp');
  expect(emailRequest).toBeDefined();
  const callback = new URL(new URL(emailRequest!.url).searchParams.get('redirect_to')!);
  expect(callback.pathname).toBe('/auth/callback');
  expect(callback.searchParams.get('next')).toBe('/build');
});

test('a rejected sign-in code never opens the editor', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.route('**/auth/v1/token?**', (route) => route.fulfill({ status: 400, json: { error_code: 'otp_expired', msg: 'The sign-in code is expired.' } }));
  await page.goto('/auth/callback?code=expired-code&next=%2Fbuild');
  await expect(page.getByRole('heading', { name: 'Sign-in incomplete' })).toBeVisible();
  await expect(page.getByRole('alert')).toContainText('That sign-in link is no longer valid.');
  await expect(page.locator('fieldset.slot-row')).toHaveCount(0);
  await page.goto('/build');
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
});

test('account load failure keeps the creation controls unavailable', async ({ page }) => {
  await mockAccount(page);
  await page.route('**/rest/v1/rpc/get_my_profile_draft', (route) => route.fulfill({ status: 500, json: { message: 'Account temporarily unavailable.' } }));
  await page.goto('/build');
  await expect(page.getByRole('alert').filter({ hasText: 'Your account changes could not be loaded.' })).toBeVisible();
  await expect(page.locator('.game-selector, fieldset.slot-row, .draft-action-ledger')).toHaveCount(0);
  await expect(page.getByRole('button', { name: 'Save Character' })).toHaveCount(0);
});

test('legacy guest drafts and pending merges are never imported after sign-in', async ({ page }) => {
  const account = await mockAccount(page, { signedIn: false });
  await page.goto('/');
  await page.evaluate(async () => {
    const draft = {
      version: 1, requestId: '00000000-0000-4000-8000-000000000003',
      profile: { handle: 'legacy-guest', displayName: 'Legacy Guest', bio: '' },
      lineups: [{ id: '00000000-0000-4000-8000-000000000004', gameSlug: 'uni2', category: 'main', lifecycle: 'active', visibility: 'public', picks: [{ slotId: 'character', characterSlug: 'hyde' }], createdAt: '2026-01-01T00:00:00Z' }],
      updatedAt: '2026-01-01T00:00:00Z',
    };
    await new Promise<void>((resolve, reject) => {
      const open = indexedDB.open('mainstation', 2);
      open.onupgradeneeded = () => {
        open.result.createObjectStore('drafts');
        open.result.createObjectStore('accountTransitions');
      };
      open.onerror = () => reject(open.error);
      open.onsuccess = () => {
        const db = open.result;
        const transaction = db.transaction(['drafts', 'accountTransitions'], 'readwrite');
        transaction.objectStore('drafts').put(draft, 'active');
        transaction.objectStore('drafts').put(draft, 'recovery');
        transaction.objectStore('accountTransitions').put({ version: 1, decision: 'merge', draft, startedAt: draft.updatedAt }, 'pending');
        transaction.oncomplete = () => { db.close(); resolve(); };
        transaction.onerror = () => reject(transaction.error);
      };
    });
  });
  await switchAccount(page, firstUserId);
  await page.goto('/auth/callback?next=%2Fbuild');
  await expect(page).toHaveURL(/\/build$/);
  await expect(page.getByRole('button', { name: 'Save Character' })).toBeVisible();
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(0);
  await page.goto('/settings');
  await expect(page.getByLabel('Display name')).toHaveValue('');
  await expect(page.getByLabel('Handle', { exact: true })).toHaveValue('');
  await expect(page.getByText(/Recovery copy|What should happen after sign-in/)).toHaveCount(0);
  expect(account.requests.filter((request) => /merge|claim|save/.test(request.path))).toHaveLength(0);
});

test('sign-out locks creation and a different account cannot see the previous account draft', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(1);
  await page.goto('/settings');
  await page.getByRole('button', { name: 'Sign out', exact: true }).click();
  await expect(page.getByRole('heading', { name: 'Sign in or create an account' })).toBeVisible();
  await expect(page.getByLabel('Display name')).toHaveCount(0);
  await page.goto('/build');
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
  await switchAccount(page, secondUserId);
  await page.goto('/build');
  await expect(page.getByRole('button', { name: 'Save Character' })).toBeVisible();
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(0);
  await page.getByLabel('Character').selectOption('linne');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.locator('.draft-action-ledger__row')).toContainText('Linne');
  await switchAccount(page, firstUserId);
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(1);
  await expect(page.locator('.draft-action-ledger__row')).toContainText('Hyde');
});

test('signed-in creation is local until the member explicitly creates a public profile', async ({ page }) => {
  const account = await mockAccount(page);
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(1);
  expect(account.requests.filter((request) => /claim|save/.test(request.path))).toHaveLength(0);
  await page.goto('/settings');
  await page.getByLabel('Display name').fill('E2E Player');
  await page.getByLabel('Handle', { exact: true }).fill('e2e-player');
  await page.getByRole('button', { name: 'Create profile', exact: true }).click();
  await expect(page.getByRole('heading', { name: 'Profile saved' })).toBeVisible();
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/claim_profile_draft')).toHaveLength(1);
});

test('an existing member loads their saved profile and explicitly saves edits online', async ({ page }) => {
  const account = await mockAccount(page, { savedDraft: {
    version: 1,
    requestId: '00000000-0000-4000-8000-000000000005',
    profile: { handle: 'returning-player', displayName: 'Returning Player', bio: '' },
    lineups: [],
    updatedAt: '2026-01-01T00:00:00Z',
  } });
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.locator('.draft-action-ledger__row')).toHaveCount(1);
  await page.goto('/settings');
  await expect(page.getByRole('heading', { name: '@returning-player' })).toBeVisible();
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/get_my_profile_draft')).toHaveLength(1);
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/save_my_profile_draft')).toHaveLength(0);
  await page.getByRole('button', { name: 'Save changes', exact: true }).click();
  await expect(page.getByRole('status').filter({ hasText: 'Saved 1 entry to @returning-player.' })).toBeVisible();
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/save_my_profile_draft')).toHaveLength(1);
});

test('signing out in another tab immediately closes the open editor', async ({ page, context }) => {
  await mockAccount(page);
  await page.goto('/build');
  await expect(page.getByRole('button', { name: 'Save Character' })).toBeVisible();
  const accountPage = await context.newPage();
  await mockAccount(accountPage);
  await accountPage.goto('/settings');
  await accountPage.getByRole('button', { name: 'Sign out', exact: true }).click();
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
  await expect(page.getByRole('button', { name: 'Save Character' })).toHaveCount(0);
  await expect(page.locator('fieldset.slot-row')).toHaveCount(0);
});

test('account route leads with the focused account state', async ({ page }) => {
  await page.goto('/settings');
  await expect(page.getByRole('heading', { level: 1, name: 'Account' })).toBeVisible();
  await expect(page.getByRole('heading', { name: 'Sign in or create an account' })).toBeVisible();
  await expect(page.getByRole('button', { name: 'Continue with Discord' })).toBeVisible();
  await expect(page.getByRole('heading', { name: 'Install MainStation' })).toHaveCount(0);
});

test('manifest and service worker are emitted in production', async ({ request }) => {
  const manifest = await request.get('/manifest.webmanifest');
  expect(manifest.ok()).toBeTruthy();
  expect((await manifest.json()).id).toBe('/');
  const worker = await request.get('/sw.js');
  expect(worker.ok()).toBeTruthy();
  expect(worker.headers()['content-type']).toContain('javascript');
});

test('primary routes keep accessible icon controls and fit mobile viewports', async ({ page }, testInfo) => {
  test.setTimeout(60_000);
  await mockAccount(page);
  const mobile = testInfo.project.use.isMobile;
  for (const route of ['/', '/build', '/settings', '/p/station-zero', '/recommend', '/games/uni2', '/games/uni2/characters/hyde']) {
    await page.goto(route);
    await expect(page.getByRole('heading', { level: 1 })).toBeVisible();
    await page.evaluate(async () => { await document.fonts.ready; });
    const geometry = await page.evaluate(() => ({
      clientWidth: document.documentElement.clientWidth,
      scrollWidth: document.documentElement.scrollWidth,
    }));
    expect(geometry.scrollWidth, route).toBeLessThanOrEqual(geometry.clientWidth + 1);

    const iconControls = page.locator('a, button').filter({ has: page.locator('.ui-icon') });
    for (const control of await iconControls.all()) {
      if (!await control.isVisible()) continue;
      await expect(control).toHaveAccessibleName(/\S/);
      await expect(control.locator('.ui-icon')).toHaveAttribute('aria-hidden', 'true');
      if (mobile) {
        const bounds = await control.boundingBox();
        const name = await control.getAttribute('aria-label') ?? await control.innerText();
        expect(bounds?.width, `${route}: ${name} touch width`).toBeGreaterThanOrEqual(44);
        expect(bounds?.height, `${route}: ${name} touch height`).toBeGreaterThanOrEqual(44);
      }
    }
    if (mobile) {
      const routeName = route === '/' ? 'home' : route.slice(1).replaceAll('/', '-');
      await page.screenshot({ path: `output/playwright/${testInfo.project.name}/${routeName}.png`, fullPage: true, animations: 'disabled' });
    }
  }

  if (mobile) {
    await page.goto('/settings');
    await expect(page.getByRole('link', { name: 'Add a main' })).toBeHidden();
    await expect(page.getByRole('link', { name: 'Build', exact: true })).toBeVisible();
  }
});

test('signed-in local changes save offline and persist after reconnecting', async ({ page, context }) => {
  await mockAccount(page);
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await context.setOffline(true);
  try {
    await page.getByRole('button', { name: 'Save Character' }).click();
    await expect(page.locator('.draft-action-ledger__row')).toContainText('Hyde');
  } finally {
    await context.setOffline(false);
  }
  await page.reload();
  await expect(page.locator('.draft-action-ledger__row')).toContainText('Hyde');
});

test.describe('real service worker without mocked authentication', () => {
  test.use({ serviceWorkers: 'allow' });

  test('cached public shell stays browsable offline and creation stays locked', async ({ page, context, browserName }, testInfo) => {
    await page.goto('/');
    await page.evaluate(async () => {
      if (!('serviceWorker' in navigator)) throw new Error('Service workers are unavailable.');
      await navigator.serviceWorker.ready;
    });
    await page.waitForFunction(() => navigator.serviceWorker.controller !== null);
    await context.setOffline(true);
    try {
      if (browserName === 'webkit' && testInfo.config.metadata.hostPlatform === 'win32') {
        testInfo.annotations.push({ type: 'limitation', description: 'Windows WebKit cannot reload even a cache-only service-worker fixture offline. Offline navigation and the guest creation gate are verified here; physical Safari offline reload remains unverified.' });
      } else {
        await page.reload();
      }
      await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
      await page.getByRole('link', { name: 'Build', exact: true }).click();
      await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
      await expect(page.getByRole('heading', { name: 'Sign in or create an account' })).toBeVisible();
      await expect(page.locator('fieldset.slot-row, .draft-action-ledger')).toHaveCount(0);
    } finally {
      await context.setOffline(false);
    }
  });
});
