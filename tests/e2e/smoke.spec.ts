import { expect, test } from '@playwright/test';

test('home, catalog, and cleared imagery render', async ({ page }) => {
  await page.goto('/');
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Your mains');
  await expect(page.locator('.wordmark__logo')).toBeVisible();
  await expect(page.getByRole('navigation', { name: 'Founding Game catalog' })).toBeVisible();
  await expect(page.getByAltText(/Hyde official character art/)).toBeVisible();
  await expect(page.getByText('Developed by Uppercut Labs')).toBeVisible();
});

test('guest can save a valid solo Character and reload it from IndexedDB', async ({ page }) => {
  await page.goto('/build');
  await page.getByLabel('Character').selectOption('hyde');
  await page.getByRole('button', { name: 'Save Character' }).click();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
  await page.reload();
  await expect(page.getByText('Hyde', { exact: true }).last()).toBeVisible();
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

test('cancelled Discord sign-in stops visibly without touching the guest draft', async ({ page }) => {
  await page.goto('/auth/callback?error=access_denied&next=%2Fsettings');
  await expect(page.getByRole('heading', { name: 'Sign-in stopped safely.' })).toBeVisible();
  await expect(page.getByRole('alert')).toContainText('Discord sign-in was cancelled. Your local draft is unchanged.');
  await expect(page).toHaveURL(/\/auth\/callback/);
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
