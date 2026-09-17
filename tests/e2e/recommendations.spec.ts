import { expect, test } from '@playwright/test';
import { mockAccount } from './auth-fixture';

test.use({ serviceWorkers: 'block' });

const registeredDraft = {
  version: 1 as const,
  requestId: '00000000-0000-4000-8000-000000000007',
  profile: { handle: 'recommend-player', displayName: 'Recommend Player', bio: '' },
  lineups: [],
  updatedAt: '2026-01-01T00:00:00Z',
};

function runPayload(overrides: Record<string, unknown>) {
  return {
    runId: '60000000-0000-4000-8000-000000000001',
    targetGameVersionId: '00000000-0000-4000-8000-000000000006',
    policyVersion: 'association-v1',
    createdAt: '2026-09-17T00:00:00.000Z',
    ...overrides,
  };
}

test('zero support shows the not-enough-data state with no ranked fallback', async ({ page }) => {
  await mockAccount(page, {
    savedDraft: registeredDraft,
    recommendationRun: runPayload({ state: 'not_enough_data', candidates: [] }),
  });
  await page.goto('/recommend');
  await page.getByRole('button', { name: 'Find matches' }).click();

  await expect(page.getByRole('heading', { name: 'Not enough public data yet' })).toBeVisible();
  await expect(page.getByRole('link', { name: 'Complete your Mainline' })).toBeVisible();
  await expect(page.locator('.recommend-results')).toHaveCount(0);
});

test('weak but supported results disclose their support and contributing characters', async ({ page }) => {
  const account = await mockAccount(page, {
    savedDraft: registeredDraft,
    recommendationRun: runPayload({
      state: 'ok',
      candidates: [{
        characterId: '31000000-0000-4000-8000-000000000011',
        characterSlug: 'ekko',
        characterName: 'Ekko',
        rank: 1,
        score: 1.606061,
        supportCount: 1,
        contributions: [{
          characterId: '31000000-0000-4000-8000-000000000001',
          characterSlug: 'ken',
          characterName: 'Ken',
          gameSlug: 'sf6',
          contribution: 1.606061,
          supportCount: 1,
        }],
        policyVersion: 'association-v1',
      }],
    }),
  });
  await page.goto('/recommend');
  await page.getByRole('button', { name: 'Find matches' }).click();

  const result = page.locator('.recommend-results > li').first();
  await expect(result.getByRole('link', { name: 'Ekko' })).toBeVisible();
  // A single supporting player must be labelled as such, never inflated to a confident claim.
  await expect(result.getByText('1 player', { exact: true })).toBeVisible();
  const because = result.getByRole('list', { name: 'Your characters behind Ekko' });
  await expect(because.getByRole('link', { name: 'Ken' })).toBeVisible();
  await expect(because.getByText('shared by 1 player')).toBeVisible();

  // Feedback is analytics-only: submitting it must not re-rank or re-run scoring.
  await result.getByRole('button', { name: 'Would try' }).click();
  await expect(result.getByRole('button', { name: 'Would try' })).toHaveAttribute('aria-pressed', 'true');
  await expect(result.getByText('1 player', { exact: true })).toBeVisible();
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/record_recommendation_feedback')).toHaveLength(1);
  expect(account.requests.filter((request) => request.path === '/rest/v1/rpc/run_my_recommendations')).toHaveLength(1);
});
