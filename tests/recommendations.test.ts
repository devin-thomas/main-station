import { beforeEach, describe, expect, it, vi } from 'vitest';
import { runRecommendations } from '../src/features/recommendations/recommendations';

const mocks = vi.hoisted(() => ({ runPayload: null as unknown }));

vi.mock('../src/lib/supabase', () => ({
  requireSupabase: () => ({
    from: () => ({
      select: () => ({
        eq: () => ({ maybeSingle: async () => ({ data: { id: '21000000-0000-4000-8000-000000000006' }, error: null }) }),
      }),
    }),
    rpc: async () => ({ data: mocks.runPayload, error: null }),
  }),
}));

function candidate(overrides: Record<string, unknown> = {}) {
  return {
    characterId: '31000000-0000-4000-8000-000000000011',
    characterSlug: 'target-ace',
    characterName: 'Target Ace',
    rank: 1,
    score: 1.606061,
    supportCount: 2,
    contributions: [{
      characterId: '31000000-0000-4000-8000-000000000001',
      characterSlug: 'ken',
      characterName: 'Ken',
      gameSlug: 'sig-solo',
      contribution: 1.606061,
      supportCount: 2,
    }],
    policyVersion: 'association-v1',
    ...overrides,
  };
}

function run(overrides: Record<string, unknown> = {}) {
  return {
    runId: '60000000-0000-4000-8000-000000000001',
    targetGameVersionId: '21000000-0000-4000-8000-000000000006',
    policyVersion: 'association-v1',
    state: 'ok',
    candidates: [candidate()],
    createdAt: '2026-09-17T00:00:00.000Z',
    ...overrides,
  };
}

describe('association-v1 run contract', () => {
  beforeEach(() => {
    mocks.runPayload = run();
  });

  it('parses a supported run with its contributing source Characters', async () => {
    const parsed = await runRecommendations('sig-target');
    expect(parsed.state).toBe('ok');
    expect(parsed.candidates[0].supportCount).toBe(2);
    expect(parsed.candidates[0].contributions).toEqual([{
      characterId: '31000000-0000-4000-8000-000000000001',
      characterSlug: 'ken',
      characterName: 'Ken',
      gameSlug: 'sig-solo',
      contribution: 1.606061,
      supportCount: 2,
    }]);
  });

  it('surfaces zero support as an explicit not_enough_data state', async () => {
    mocks.runPayload = run({ state: 'not_enough_data', candidates: [] });
    const parsed = await runRecommendations('sig-target');
    expect(parsed.state).toBe('not_enough_data');
    expect(parsed.candidates).toEqual([]);
  });

  it('rejects a run whose state contradicts its candidates', async () => {
    mocks.runPayload = run({ state: 'ok', candidates: [] });
    await expect(runRecommendations('sig-target')).rejects.toThrow(/contradicts/);
  });

  it('rejects an unknown state rather than guessing a fallback', async () => {
    mocks.runPayload = run({ state: 'popular' });
    await expect(runRecommendations('sig-target')).rejects.toThrow(/unknown recommendation state/);
  });

  it('rejects a candidate that cannot explain its own support', async () => {
    mocks.runPayload = run({ candidates: [candidate({ contributions: undefined })] });
    await expect(runRecommendations('sig-target')).rejects.toThrow(/contributing associations/);
  });
});
