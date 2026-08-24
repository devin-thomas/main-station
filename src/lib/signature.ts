import type { Lineup } from '../types/domain';

export interface SignatureWeight {
  characterSlug: string;
  rawWeight: number;
  normalizedWeight: number;
}

export function buildSignature(lineups: Lineup[], gameSlug: string): SignatureWeight[] {
  const raw = new Map<string, number>();
  for (const lineup of lineups) {
    if (lineup.gameSlug !== gameSlug || lineup.visibility !== 'public') continue;
    const categoryWeight = lineup.category === 'main' ? 1 : 0.65;
    const lifecycleWeight = lineup.lifecycle === 'active' ? 1 : 0.5;
    const appearanceWeight = categoryWeight * lifecycleWeight;
    for (const pick of lineup.picks) {
      raw.set(pick.characterSlug, (raw.get(pick.characterSlug) ?? 0) + appearanceWeight);
    }
  }
  const total = [...raw.values()].reduce((sum, value) => sum + value, 0);
  if (total === 0) return [];
  return [...raw.entries()]
    .map(([characterSlug, rawWeight]) => ({ characterSlug, rawWeight, normalizedWeight: rawWeight / total }))
    .sort((left, right) => right.normalizedWeight - left.normalizedWeight || left.characterSlug.localeCompare(right.characterSlug));
}
