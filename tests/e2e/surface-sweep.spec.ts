import { AxeBuilder } from '@axe-core/playwright';
import { expect, test, type Page } from '@playwright/test';
import { mockAccount } from './auth-fixture';
import { inspectGeometry, undersizedTargets, waitForAssets } from './surface-probes';

// MS-030 surface acceptance. Case IDs are stable and referenced by
// docs/releases/2026-09-19-surface-acceptance.md; screenshot names are not identity.

/** SPEC 16 accepts 360/390/768/1024/1440; 320 is the narrow supported edge. */
const VIEWPORTS = [
  { id: 'w320', width: 320, height: 720 },
  { id: 'w360', width: 360, height: 800 },
  { id: 'w390', width: 390, height: 844 },
  { id: 'w768', width: 768, height: 900 },
  { id: 'w1024', width: 1024, height: 800 },
  { id: 'w1440', width: 1440, height: 900 },
  { id: 'landscape', width: 844, height: 390 },
];

const PUBLIC_SURFACES = [
  { id: 'home', path: '/', ready: 'Your mains' },
  { id: 'game', path: '/games/uni2', ready: 'Official roster' },
  { id: 'character', path: '/games/uni2/characters/hyde', ready: 'Hyde' },
  { id: 'profile', path: '/p/station-zero', ready: '' },
  { id: 'recommend', path: '/recommend', ready: 'Recommendations' },
  { id: 'settings', path: '/settings', ready: 'Sign in' },
  { id: 'notfound', path: '/this-route-does-not-exist', ready: '' },
];

async function ready(page: Page) {
  await page.waitForLoadState('domcontentloaded');
  await expect(page.locator('main, .page-frame').first()).toBeVisible();
  await page.evaluate(waitForAssets, { timeoutMs: 15000 });
}

test.describe('geometry and overflow across supported widths', () => {
  for (const surface of PUBLIC_SURFACES) {
    for (const viewport of VIEWPORTS) {
      test(`geo-${surface.id}-${viewport.id}`, async ({ page }) => {
        await mockAccount(page, { signedIn: false });
        await page.setViewportSize({ width: viewport.width, height: viewport.height });
        await page.goto(surface.path);
        await ready(page);

        const geometry = await page.evaluate(inspectGeometry, {
          tolerance: 1,
          // The header must keep its wordmark and actions from colliding at every width.
          separate: [{ a: '.wordmark', b: '.header-actions' }],
        });
        expect(geometry.issues, JSON.stringify(geometry.issues)).toEqual([]);
        // No two-dimensional scrolling for ordinary reading (SPEC 16).
        expect(geometry.documentOverflow).toBeLessThanOrEqual(1);
      });
    }
  }
});

test.describe('WCAG 2.2 AA automated scan', () => {
  for (const surface of PUBLIC_SURFACES) {
    for (const width of [390, 1440]) {
      test(`a11y-${surface.id}-w${width}`, async ({ page }) => {
        await mockAccount(page, { signedIn: false });
        await page.setViewportSize({ width, height: width === 390 ? 844 : 900 });
        await page.goto(surface.path);
        await ready(page);

        const results = await new AxeBuilder({ page })
          .withTags(['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
          .analyze();
        const summary = results.violations.map((violation) => ({
          id: violation.id,
          impact: violation.impact,
          nodes: violation.nodes.map((node) => node.target.join(' ')).slice(0, 4),
        }));
        expect(summary, JSON.stringify(summary, null, 2)).toEqual([]);
      });
    }
  }
});

test('touch targets meet the 44 by 44 minimum on the phone width', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.setViewportSize({ width: 390, height: 844 });
  const offenders: Record<string, unknown>[] = [];
  for (const surface of PUBLIC_SURFACES) {
    await page.goto(surface.path);
    await ready(page);
    const small = await page.evaluate(undersizedTargets, 44);
    for (const entry of small) offenders.push({ surface: surface.id, ...entry });
  }
  expect(offenders, JSON.stringify(offenders, null, 2)).toEqual([]);
});

test('every workflow entry is keyboard reachable with a visible focus indicator', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/');
  await ready(page);

  const reached: string[] = [];
  for (let step = 0; step < 12; step += 1) {
    await page.keyboard.press('Tab');
    const focused = await page.evaluate(() => {
      const element = document.activeElement;
      if (!element || element === document.body) return null;
      const style = getComputedStyle(element);
      const visibleRing = style.outlineStyle !== 'none' && parseFloat(style.outlineWidth) > 0;
      const boxRing = style.boxShadow !== 'none';
      return {
        label: (element.getAttribute('aria-label') ?? element.textContent ?? '').trim().slice(0, 40),
        indicator: visibleRing || boxRing,
      };
    });
    if (!focused) continue;
    expect(focused.indicator, `no visible focus indicator on "${focused.label}"`).toBe(true);
    reached.push(focused.label);
  }
  // Primary navigation must be reachable by keyboard alone.
  expect(reached.join(' | ')).toMatch(/Build/);
});

test('reduced motion removes route and layout transitions without removing state changes', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/');
  await ready(page);

  const animated = await page.evaluate(() => [...document.querySelectorAll('*')]
    .filter((element) => {
      const style = getComputedStyle(element);
      const duration = [style.transitionDuration, style.animationDuration]
        .flatMap((value) => value.split(',').map((part) => parseFloat(part) || 0));
      return duration.some((value) => value > 0.05);
    })
    .map((element) => `${element.tagName.toLowerCase()}.${typeof element.className === 'string' ? element.className : ''}`.slice(0, 60))
    .slice(0, 10));
  expect(animated, JSON.stringify(animated)).toEqual([]);

  // State still changes: navigation works with motion disabled.
  await page.getByRole('link', { name: 'Build', exact: true }).click();
  await expect(page).toHaveURL(/\/settings\?next=%2Fbuild$/);
});

test('forced colors keeps content, controls, and focus visible', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.emulateMedia({ forcedColors: 'active' });
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/');
  await ready(page);

  await expect(page.getByRole('heading', { level: 1 })).toBeVisible();
  await expect(page.getByRole('navigation', { name: 'Games' })).toBeVisible();
  await expect(page.getByRole('link', { name: 'Build', exact: true })).toBeVisible();

  const geometry = await page.evaluate(inspectGeometry, { tolerance: 1 });
  expect(geometry.documentOverflow).toBeLessThanOrEqual(1);
});

test('text stays usable at 200 percent zoom without two-dimensional scrolling', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  // 200% zoom of a 1280 CSS pixel window is a 640 CSS pixel layout viewport.
  await page.setViewportSize({ width: 640, height: 512 });
  for (const surface of PUBLIC_SURFACES) {
    await page.goto(surface.path);
    await ready(page);
    const geometry = await page.evaluate(inspectGeometry, { tolerance: 1 });
    expect(geometry.documentOverflow, `${surface.id} overflows at 200% zoom`).toBeLessThanOrEqual(1);
  }
});

test('the supplied Uppercut Labs mark is never cropped, masked, or rounded', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.setViewportSize({ width: 1440, height: 900 });
  await page.goto('/');
  await ready(page);

  const logo = page.locator('img[src="/uppercut-labs-logo.png"]');
  await expect(logo).toBeVisible();
  const style = await logo.evaluate((element) => {
    const computed = getComputedStyle(element);
    return {
      borderRadius: computed.borderRadius,
      clipPath: computed.clipPath,
      mask: computed.maskImage,
      objectFit: computed.objectFit,
      overflowOfParent: element.parentElement ? getComputedStyle(element.parentElement).borderRadius : '0px',
    };
  });
  expect(style.borderRadius).toBe('0px');
  expect(style.clipPath).toBe('none');
  expect(style.mask).toBe('none');
  expect(style.objectFit === 'fill' || style.objectFit === 'contain').toBe(true);
  expect(style.overflowOfParent).toBe('0px');
});

test('signed-in builder holds its layout and validation state on a phone', async ({ page }) => {
  await mockAccount(page, {
    savedDraft: {
      version: 1,
      requestId: '00000000-0000-4000-8000-00000000000a',
      profile: { handle: 'sweep-player', displayName: 'Sweep Player', bio: '' },
      lineups: [],
      updatedAt: '2026-01-01T00:00:00Z',
    },
  });
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto('/build');
  await ready(page);

  const geometry = await page.evaluate(inspectGeometry, { tolerance: 1 });
  expect(geometry.issues, JSON.stringify(geometry.issues)).toEqual([]);
  expect(geometry.documentOverflow).toBeLessThanOrEqual(1);

  const small = await page.evaluate(undersizedTargets, 44);
  expect(small, JSON.stringify(small, null, 2)).toEqual([]);

  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
    .analyze();
  expect(results.violations.map((violation) => violation.id)).toEqual([]);
});

/**
 * The guided onboarding is signed-in only, so it sits outside PUBLIC_SURFACES. Its two dense
 * stages — the Game grid and a full roster of portraits — are the widest art surfaces in the app.
 */
const ONBOARDING_STAGES = [
  { id: 'welcome-game', heading: 'Which game do you main?', open: null },
  { id: 'welcome-roster', heading: 'Choose your TEKKEN 8 main', open: /^TEKKEN 8 Tekken 8$/ },
] as const;

for (const stage of ONBOARDING_STAGES) {
  for (const viewport of VIEWPORTS) {
    test(`geo-${stage.id}-${viewport.id}`, async ({ page }) => {
      await mockAccount(page);
      await page.setViewportSize({ width: viewport.width, height: viewport.height });
      await page.goto('/welcome');
      if (stage.open) await page.getByRole('button', { name: stage.open }).click();
      await expect(page.getByRole('heading', { name: stage.heading })).toBeVisible();
      await ready(page);

      const geometry = await page.evaluate(inspectGeometry, {
        tolerance: 1,
        separate: [{ a: '.wordmark', b: '.header-actions' }],
      });
      expect(geometry.issues, JSON.stringify(geometry.issues)).toEqual([]);
      expect(geometry.documentOverflow).toBeLessThanOrEqual(1);
    });
  }

  for (const width of [390, 1440]) {
    test(`a11y-${stage.id}-w${width}`, async ({ page }) => {
      await mockAccount(page);
      await page.setViewportSize({ width, height: width === 390 ? 844 : 900 });
      await page.goto('/welcome');
      if (stage.open) await page.getByRole('button', { name: stage.open }).click();
      await expect(page.getByRole('heading', { name: stage.heading })).toBeVisible();
      await ready(page);

      const results = await new AxeBuilder({ page })
        .withTags(['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
        .analyze();
      const summary = results.violations.map((violation) => ({
        id: violation.id,
        impact: violation.impact,
        nodes: violation.nodes.map((node) => node.target.join(' ')).slice(0, 4),
      }));
      expect(summary, JSON.stringify(summary, null, 2)).toEqual([]);
    });
  }

  test(`targets-${stage.id}`, async ({ page }) => {
    await mockAccount(page);
    await page.setViewportSize({ width: 390, height: 844 });
    await page.goto('/welcome');
    if (stage.open) await page.getByRole('button', { name: stage.open }).click();
    await expect(page.getByRole('heading', { name: stage.heading })).toBeVisible();
    await ready(page);

    const small = await page.evaluate(undersizedTargets, 44);
    expect(small, JSON.stringify(small, null, 2)).toEqual([]);
  });
}
