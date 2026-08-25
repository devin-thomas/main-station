import { expect, test } from '@playwright/test';
import { catalog } from '../../src/data/catalog';

test('home, catalog, and cleared imagery render', async ({ page }) => {
  await page.goto('/');
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  await expect(page.locator('.wordmark__logo')).toBeVisible();
  await expect(page.getByRole('navigation', { name: 'Founding Game catalog' })).toBeVisible();
  await expect(page.getByAltText(/Hyde reviewed character artwork/)).toBeVisible();
  await expect(page.getByText('Developed by Uppercut Labs')).toBeVisible();

  await page.goto('/games/uni2');
  await expect(page.getByRole('heading', { name: 'Official roster' })).toBeVisible();
  await expect(page.locator('.roster-ledger li')).toHaveCount(28);
  await page.getByRole('link', { name: 'Zohar', exact: true }).click();
  await expect(page.getByAltText(/Zohar reviewed character artwork/)).toBeVisible();
  await expect(page.getByRole('link', { name: '© FRENCH-BREAD / ARC SYSTEM WORKS' })).toBeVisible();
});

test('every current Character art file is served as an image', async ({ request }) => {
  const artRecords = catalog.flatMap((game) => game.characters.map((character) => character.art)).filter((art) => art);
  expect(artRecords).toHaveLength(90);

  for (const art of artRecords) {
    expect(art).toBeDefined();
    const response = await request.get(art!.localPath);
    expect(response.ok(), art!.localPath).toBeTruthy();
    expect(response.headers()['content-type'], art!.localPath).toMatch(/^image\//);
  }
});

test('every founding game renders reviewed art and provenance on a Character page', async ({ page }) => {
  for (const game of catalog) {
    const character = game.characters[0];
    await page.goto(`/games/${game.slug}/characters/${character.slug}`);
    if (character.art) {
      await expect(page.getByAltText(`${character.name} reviewed character artwork for ${game.name}`)).toBeVisible();
      await expect(page.locator('.provenance-block')).toContainText(character.art.usageBasis.replaceAll('-', ' '));
    } else {
      await expect(page.getByRole('img', { name: `${character.name}; approved character art is not available yet` })).toBeVisible();
      await expect(page.locator('.character-stage__fallback')).toContainText('ART RIGHTS REVIEW');
    }
  }
});

test('guest can select and save a valid roster entry for every founding game', async ({ page }) => {
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

test('guest can save a valid solo Character and reload it from IndexedDB', async ({ page }) => {
  await page.goto('/build');
  await expect(page.getByRole('button', { name: 'Save identity' })).toHaveCount(0);
  await expect(page.getByText('Choose a Game Version, build a Character or Team, and decide how it belongs in your history.')).toBeVisible();
  await expect(page.getByRole('link', { name: 'Sign in / Sign up' })).toBeVisible();
  await expect(page.getByRole('link', { name: 'Sign in to save & share' })).toBeVisible();
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
  await page.reload();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
});

test('guest can save a source-checked 2XKO team and Fuse', async ({ page }) => {
  await page.goto('/build');
  await page.getByRole('listitem').filter({ hasText: '2XKO' }).click();
  const point = page.locator('fieldset').filter({ hasText: 'Point' }).getByRole('combobox');
  const assist = page.locator('fieldset').filter({ hasText: 'Assist' }).getByRole('combobox');
  await point.selectOption('ahri');
  await assist.selectOption('ahri');
  await page.getByLabel('Fuse').selectOption('Double Down');
  await page.getByRole('button', { name: 'Save Team' }).click();
  await expect(page.getByRole('alert')).toContainText('A Character can appear only once in this Team.');
  await assist.selectOption('akali');
  await page.getByRole('button', { name: 'Save Team' }).click();
  await expect(page.getByRole('link', { name: 'Ahri / Akali' })).toBeVisible();
  await expect(page.getByText('Fuse: Double Down')).toBeVisible();
});

test('guest can edit, hide, restore, and retire a saved local stop', async ({ page }) => {
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await page.getByRole('button', { name: 'Hide' }).click();
  await expect(page.getByText('main · active · private')).toBeVisible();

  await page.getByRole('button', { name: 'Edit' }).click();
  await page.getByLabel('Role').selectOption('secondary');
  await page.getByRole('button', { name: 'Update Character' }).click();
  await expect(page.getByText('secondary · active · private')).toBeVisible();

  await page.getByRole('button', { name: 'Publish' }).click();
  await page.getByRole('button', { name: 'Retire' }).click();
  await expect(page.getByText('secondary · retired · public')).toBeVisible();
});

test('unknown public route shows a real product 404', async ({ page }) => {
  await page.goto('/not-a-station');
  await expect(page.getByRole('heading', { name: 'This stop is not on the line.' })).toBeVisible();
});

test('cancelled sign-in stops on a focused recovery screen without touching the guest draft', async ({ page }) => {
  await page.goto('/auth/callback?error=access_denied&next=%2Fsettings');
  await expect(page.getByRole('heading', { name: 'Your draft is safe.' })).toBeVisible();
  await expect(page.getByRole('alert')).toContainText('Sign-in was cancelled. Your local draft is unchanged.');
  await expect(page.getByRole('link', { name: 'Try again' })).toBeVisible();
  await expect(page.getByRole('link', { name: 'Back to your draft' })).toBeVisible();
  await expect(page.getByRole('navigation', { name: 'Primary' })).toHaveCount(0);
  await expect(page).toHaveURL(/\/auth\/callback/);
});

test('Builder offers a prominent account path before and after drafting', async ({ page }) => {
  await page.goto('/build');
  await page.getByRole('link', { name: 'Sign in to save & share' }).click();
  await expect(page).toHaveURL(/\/settings$/);
  await page.goto('/build');
  await expect(page.getByRole('link', { name: 'Sign in to save this draft' })).toBeVisible();
});

test('a non-empty guest draft requires an explicit merge, account, or editing choice before sign-in', async ({ page }) => {
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await page.getByRole('link', { name: 'Sign in to save this draft' }).click();

  await expect(page.getByRole('heading', { name: 'What should happen after sign-in?' })).toBeVisible();
  await expect(page.getByRole('button', { name: 'Merge this draft and sign in' })).toBeVisible();
  await expect(page.getByRole('button', { name: 'Discard this draft and sign in' })).toBeVisible();
  await page.getByRole('link', { name: 'Keep editing' }).click();
  await expect(page).toHaveURL(/\/build$/);
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
});

test('fragment sign-in errors use the same provider-neutral recovery', async ({ page }) => {
  await page.goto('/auth/callback#error=access_denied');
  await expect(page.getByRole('heading', { name: 'Your draft is safe.' })).toBeVisible();
  await expect(page.getByRole('alert')).toContainText('Sign-in was cancelled. Your local draft is unchanged.');
});

test('account route leads with the focused account state', async ({ page }) => {
  await page.goto('/settings');
  await expect(page.getByRole('heading', { name: 'Save your line.' })).toBeVisible();
  await expect(page.getByRole('heading', { name: 'Keep your progress.' })).toBeVisible();
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

test('primary routes stay inside the viewport', async ({ page }, testInfo) => {
  for (const route of ['/', '/build', '/settings', '/games/uni2', '/games/uni2/characters/hyde']) {
    await page.goto(route);
    const geometry = await page.evaluate(() => ({
      clientWidth: document.documentElement.clientWidth,
      scrollWidth: document.documentElement.scrollWidth,
    }));
    expect(geometry.scrollWidth, route).toBeLessThanOrEqual(geometry.clientWidth + 1);
  }

  if (testInfo.project.name === 'mobile-chromium') {
    await page.goto('/settings');
    await expect(page.getByRole('link', { name: 'Add a main' })).toBeHidden();
    await expect(page.getByRole('link', { name: 'Build', exact: true })).toBeVisible();
  }
});

test('offline shell reloads and the guest draft still saves locally', async ({ page, context }) => {
  await page.goto('/build');
  await page.evaluate(async () => {
    if (!('serviceWorker' in navigator)) throw new Error('Service workers are unavailable.');
    await navigator.serviceWorker.ready;
  });
  await page.getByLabel('Character').selectOption('hyde');
  await context.setOffline(true);
  try {
    await page.getByRole('button', { name: 'Save Character' }).click();
    await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
    await page.reload();
    await expect(page.getByRole('heading', { name: 'Build your line.' })).toBeVisible();
    await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
  } finally {
    await context.setOffline(false);
  }
});
