import { describe, expect, it } from 'vitest';
import { buildSignature } from '../src/lib/signature';
import type { Lineup } from '../src/types/domain';

function lineup(id: string, characterSlugs: string[], overrides: Partial<Lineup> = {}): Lineup {
  return {
    id,
    gameSlug: 'sf6',
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks: characterSlugs.map((characterSlug, index) => ({ slotId: `slot-${index}`, characterSlug })),
    createdAt: '2026-08-24T00:00:00.000Z',
    ...overrides,
  };
}

describe('signature-v1', () => {
  it('normalizes a solo Ken signature to exactly one unit', () => {
    expect(buildSignature([lineup('ken', ['ken'])], 'sf6')).toEqual([{ characterSlug: 'ken', rawWeight: 1, normalizedWeight: 1 }]);
  });

  it('weights an Active Main above an Active Secondary', () => {
    const signature = buildSignature([
      lineup('ken', ['ken']),
      lineup('sagat', ['sagat'], { category: 'secondary' }),
    ], 'sf6');
    expect(signature[0].characterSlug).toBe('ken');
    expect(signature[0].normalizedWeight).toBeGreaterThan(signature[1].normalizedWeight);
    expect(signature.reduce((sum, entry) => sum + entry.normalizedWeight, 0)).toBeCloseTo(1, 12);
  });

  it('lets repeated Team appearances increase share without increasing the one-unit budget', () => {
    const signature = buildSignature([
      lineup('team-a', ['ekko', 'ahri'], { gameSlug: '2xko' }),
      lineup('team-b', ['ekko', 'darius'], { gameSlug: '2xko' }),
    ], '2xko');
    expect(signature[0].characterSlug).toBe('ekko');
    expect(signature[0].normalizedWeight).toBeCloseTo(0.5, 12);
    expect(signature.reduce((sum, entry) => sum + entry.normalizedWeight, 0)).toBeCloseTo(1, 12);
  });

  it('excludes private history completely', () => {
    expect(buildSignature([lineup('private', ['ken'], { visibility: 'private' })], 'sf6')).toEqual([]);
  });
});
