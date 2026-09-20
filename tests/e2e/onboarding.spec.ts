import { expect, test, type Page } from '@playwright/test';
import { mockAccount } from './auth-fixture';

// Service workers can bypass Playwright network mocks, particularly in WebKit.
test.use({ serviceWorkers: 'block' });

async function claimSf6Juri(page: Page) {
  await page.getByRole('button', { name: /^SF6 Street Fighter 6$/ }).click();
  await expect(page.getByRole('heading', { name: 'Choose your SF6 main' })).toBeVisible();
  await page.getByRole('button', { name: 'Juri', exact: true }).click();
  await page.getByRole('button', { name: 'Claim this character' }).click();
}

test('a new account is sent to the guided flow instead of a bare profile form', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/settings');

  await expect(page.getByRole('heading', { name: 'Create your public profile' })).toBeVisible();
  await expect(page.getByRole('textbox', { name: /display name/i })).toHaveCount(0);
  await page.getByRole('link', { name: 'Claim your mains' }).click();

  await expect(page).toHaveURL(/\/welcome$/);
  await expect(page.getByRole('heading', { level: 1 })).toContainText('Claim your mains');
});

test('the roster is presented as real character art, not a list of names', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');

  // The Game step already shows the cast rather than initials.
  await expect(page.getByRole('heading', { name: 'Which game do you main?' })).toBeVisible();
  const gameFaces = page.locator('.game-card__faces img');
  await expect(gameFaces).toHaveCount(39);

  await page.getByRole('button', { name: /^SF6 Street Fighter 6$/ }).click();
  const portraits = page.locator('.roster-card__frame img');
  await expect(portraits).toHaveCount(31);
  await expect(portraits.first()).toBeVisible();

  await expect.poll(async () => portraits.first().evaluate((node) => {
    const image = node as HTMLImageElement;
    return { decoded: image.complete && image.naturalWidth > 0, source: image.currentSrc };
  }), { timeout: 15_000 }).toMatchObject({ decoded: true, source: expect.stringContaining('/art/thumb/') });
});

test('a profile cannot be created until at least one main is claimed', async ({ page }) => {
  const account = await mockAccount(page);
  await page.goto('/welcome');

  // With no mains there is no route to the identity step at all.
  await expect(page.getByRole('button', { name: 'Done adding mains' })).toHaveCount(0);
  await expect(page.getByRole('button', { name: 'Create profile' })).toHaveCount(0);

  await claimSf6Juri(page);
  await expect(page.getByRole('heading', { name: 'Add another main' })).toBeVisible();
  await expect(page.locator('.claimed-entry')).toHaveCount(1);
  await expect(page.locator('.claimed-entry').first()).toContainText('Juri');
  await expect(page.locator('.claimed-entry__faces img')).toHaveCount(1);

  await page.getByRole('button', { name: 'Done adding mains' }).click();
  await expect(page.getByRole('heading', { name: 'Name your profile' })).toBeVisible();

  const create = page.getByRole('button', { name: 'Create profile' });
  await expect(create).toBeDisabled();
  await page.getByLabel('Display name').fill('Station Zero');
  await expect(page.getByLabel('Handle')).toHaveValue('station-zero');
  await expect(create).toBeEnabled();

  await create.click();
  await expect(page).toHaveURL(/\/p\/station-zero$/);

  const claim = account.requests.find((entry) => entry.path === '/rest/v1/rpc/claim_profile_draft');
  expect(claim).toBeDefined();
  const payload = (claim!.body as { p_payload: { profile: { handle: string }; lineups: { category: string; gameSlug: string }[] } }).p_payload;
  expect(payload.profile.handle).toBe('station-zero');
  expect(payload.lineups).toHaveLength(1);
  expect(payload.lineups[0]).toMatchObject({ category: 'main', gameSlug: 'sf6' });
});

test('removing the only claimed main closes the door on creation again', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');
  await claimSf6Juri(page);

  await page.getByRole('button', { name: 'Done adding mains' }).click();
  await page.getByLabel('Display name').fill('Station Zero');
  await expect(page.getByRole('button', { name: 'Create profile' })).toBeEnabled();

  await page.getByRole('button', { name: 'Remove SF6 main' }).click();
  await expect(page.locator('.claimed-entry')).toHaveCount(0);
  await expect(page.getByRole('button', { name: 'Create profile' })).toBeDisabled();
  await expect(page.locator('.claim-readiness')).toContainText('Add at least one main');
});

test('a team game holds the claim until every slot and the team option are set', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');

  await page.getByRole('button', { name: /^2XKO 2XKO$/ }).click();
  await expect(page.getByRole('heading', { name: 'Build your 2XKO team' })).toBeVisible();

  const claim = page.getByRole('button', { name: 'Claim this team' });
  await expect(claim).toBeDisabled();

  await page.getByRole('button', { name: 'Ekko', exact: true }).click();
  await expect(claim).toBeDisabled();

  // The same champion cannot fill both slots.
  await expect(page.getByRole('button', { name: 'Ekko', exact: true })).toBeDisabled();

  await page.getByRole('button', { name: 'Jinx', exact: true }).click();
  await expect(page.locator('.slot-chip--filled')).toHaveCount(2);
  await expect(claim).toBeDisabled();

  await page.getByLabel('Fuse').selectOption({ index: 1 });
  await expect(claim).toBeEnabled();
  await claim.click();

  await expect(page.locator('.claimed-entry')).toHaveCount(1);
  await expect(page.locator('.claimed-entry__faces img')).toHaveCount(2);
  await expect(page.locator('.claimed-entry').first()).toContainText('Ekko / Jinx');
});

test('a Kameo slot only ever offers Kameos', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');

  await page.getByRole('button', { name: /^MK1 Mortal Kombat 1$/ }).click();
  await expect(page.getByRole('heading', { name: 'Build your MK1 team' })).toBeVisible();

  // Slot 1 takes fighters: the fighter Sub-Zero is offered, the Kameo of the same name is not.
  const fighterRoster = page.getByRole('list', { name: 'Mortal Kombat 1 roster for Fighter' });
  await expect(fighterRoster.getByRole('button', { name: 'Sub-Zero', exact: true })).toBeVisible();
  await expect(fighterRoster.getByRole('button')).toHaveCount(35);

  await page.getByRole('button', { name: 'Scorpion', exact: true }).click();

  // Slot 2 takes Kameos only, so no fighter can land in it.
  const kameoRoster = page.getByRole('list', { name: 'Mortal Kombat 1 roster for Kameo' });
  await expect(kameoRoster.getByRole('button')).toHaveCount(21);
  await kameoRoster.getByRole('button', { name: 'Sub-Zero Kameo', exact: true }).click();
  await expect(page.locator('.slot-chip').nth(1)).toContainText('Sub-Zero');
  await expect(page.getByRole('button', { name: 'Claim this team' })).toBeEnabled();
});

test('a full team parks the roster until a slot is reopened', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');

  await page.getByRole('button', { name: /^2XKO 2XKO$/ }).click();
  await page.getByRole('button', { name: 'Ekko', exact: true }).click();
  await page.getByRole('button', { name: 'Jinx', exact: true }).click();

  await expect(page.getByText('Every slot is filled. Tap a slot above to change it.')).toBeVisible();
  await expect(page.getByRole('button', { name: 'Ahri', exact: true })).toBeDisabled();

  await page.getByRole('button', { name: /^Assist: Jinx\./ }).click();
  await expect(page.getByRole('button', { name: 'Ahri', exact: true })).toBeEnabled();
});

test('a claimed slot can be reopened and replaced', async ({ page }) => {
  await mockAccount(page);
  await page.goto('/welcome');

  await page.getByRole('button', { name: /^2XKO 2XKO$/ }).click();
  await page.getByRole('button', { name: 'Ekko', exact: true }).click();
  await page.getByRole('button', { name: 'Jinx', exact: true }).click();

  await page.getByRole('button', { name: /^Point: Ekko\./ }).click();
  await expect(page.locator('.slot-chip--filled')).toHaveCount(1);

  await page.getByRole('button', { name: 'Ahri', exact: true }).click();
  await expect(page.locator('.slot-chip').first()).toContainText('Ahri');
  await expect(page.locator('.slot-chip').nth(1)).toContainText('Jinx');
});

test('more than one main can be claimed before the profile is created', async ({ page }) => {
  const account = await mockAccount(page);
  await page.goto('/welcome');

  await claimSf6Juri(page);
  await page.getByRole('button', { name: /^UNI2 Under Night In-Birth II Sys:Celes$/ }).click();
  await page.getByRole('button', { name: 'Hyde', exact: true }).click();
  await page.getByRole('button', { name: 'Claim this character' }).click();
  await expect(page.locator('.claimed-entry')).toHaveCount(2);

  await page.getByRole('button', { name: 'Done adding mains' }).click();
  await page.getByLabel('Display name').fill('Two Mains');
  await page.getByLabel('Handle').fill('two-mains');
  await page.getByRole('button', { name: 'Create profile' }).click();
  await expect(page).toHaveURL(/\/p\/two-mains$/);

  const claim = account.requests.find((entry) => entry.path === '/rest/v1/rpc/claim_profile_draft');
  const payload = (claim!.body as { p_payload: { lineups: { gameSlug: string }[] } }).p_payload;
  expect(payload.lineups.map((lineup) => lineup.gameSlug)).toEqual(['sf6', 'uni2']);
});

test('a member who already has a profile is not shown the guided flow', async ({ page }) => {
  await mockAccount(page, {
    savedDraft: {
      version: 1,
      requestId: '00000000-0000-4000-8000-0000000000aa',
      profile: { displayName: 'Station Zero', handle: 'station-zero', bio: '' },
      lineups: [],
      updatedAt: '2026-09-20T00:00:00.000Z',
    },
  });
  await page.goto('/welcome');
  await expect(page).toHaveURL(/\/settings$/);
  await expect(page.getByRole('heading', { name: '@station-zero' })).toBeVisible();
});

test('signed-out visitors must sign in before the guided flow opens', async ({ page }) => {
  await mockAccount(page, { signedIn: false });
  await page.goto('/welcome');
  await expect(page).toHaveURL(/\/settings\?next=%2Fwelcome$/);
  await expect(page.getByRole('heading', { name: 'Sign in or create an account' })).toBeVisible();
});
