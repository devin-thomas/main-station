import { describe, expect, it } from 'vitest';
import { catalog } from '../src/data/catalog';
import { validateLineup } from '../src/lib/lineupValidation';
import type { Lineup } from '../src/types/domain';

function validFixture(gameIndex: number): Lineup {
  const game = catalog[gameIndex];
  return {
    id: `fixture-${game.slug}`,
    gameSlug: game.slug,
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks: game.schema.slots.map((slot) => {
      const character = game.characters.find((candidate) => slot.allowedRoles.includes(candidate.role));
      if (!character) throw new Error(`No ${slot.allowedRoles.join('/')} fixture for ${game.slug}.`);
      return { slotId: slot.id, characterSlug: character.slug, option: slot.optionValues?.[0] };
    }),
    teamOption: game.schema.teamOptionValues?.[0],
    createdAt: '2026-08-24T00:00:00.000Z',
  };
}

describe('founding catalog', () => {
  it('contains exactly 13 unique version-scoped games', () => {
    expect(catalog).toHaveLength(13);
    expect(new Set(catalog.map((game) => game.slug)).size).toBe(13);
  });

  it('records the complete verified UNI2 roster with unchanged fan-kit art provenance', () => {
    const uni2 = catalog.find((game) => game.slug === 'uni2');
    const artCharacters = uni2?.characters.filter((character) => character.art) ?? [];
    expect(uni2?.catalogStatus).toBe('verified');
    expect(uni2?.sourceCheckedAt).toBe('2026-08-25');
    expect(uni2?.characters).toHaveLength(28);
    expect(artCharacters).toHaveLength(28);
    expect(new Set(artCharacters.map((character) => character.slug)).size).toBe(28);
    for (const character of artCharacters) {
      expect(character.art?.usageBasis).toBe('express-fan-kit');
      expect(character.art?.reviewUrl).toBe('https://www.arcsystemworks.jp/uni2celes/en/fankit/');
      expect(character.art?.assetHash).toMatch(/^sha256:[a-f0-9]{64}$/);
    }
  });

  it('provides reviewed artwork and provenance for every current Character row', () => {
    const entries = catalog.flatMap((game) => game.characters.map((character) => ({ game, character })));
    const artEntries = entries.filter((entry) => entry.character.art);
    const basisCounts = new Map<string, number>();
    for (const { character } of artEntries) {
      const basis = character.art?.usageBasis;
      if (basis) basisCounts.set(basis, (basisCounts.get(basis) ?? 0) + 1);
    }

    expect(entries).toHaveLength(90);
    expect(artEntries).toHaveLength(90);
    expect(new Set(artEntries.map(({ game, character }) => `${game.slug}/${character.slug}`)).size).toBe(90);
    expect(new Set(artEntries.map(({ game }) => game.slug)).size).toBe(13);
    expect(basisCounts.get('express-fan-kit')).toBe(28);
    expect(basisCounts.get('conditional-fan-kit')).toBe(4);
    expect(basisCounts.get('conditional-community-policy')).toBe(15);
    expect(basisCounts.get('publisher-promotional')).toBe(43);

    for (const { character } of artEntries) {
      expect(character.art?.assetHash).toMatch(/^sha256:[a-f0-9]{64}$/);
      expect(character.art?.sourceUrl).toMatch(/^https:\/\//);
      expect(character.art?.reviewUrl).toMatch(/^https:\/\//);
      expect(character.art?.creditText.length).toBeGreaterThan(8);
      expect(character.art?.permissionEvidence.length).toBeGreaterThan(40);
    }

    const avatar = catalog.find((game) => game.slug === 'avatar-legends');
    const sharedAvatarArt = avatar?.characters.filter((character) => ['aang', 'korra', 'zuko'].includes(character.slug)) ?? [];
    expect(new Set(sharedAvatarArt.map((character) => character.art?.assetHash)).size).toBe(1);
    expect(new Set(sharedAvatarArt.map((character) => character.art?.objectPosition)).size).toBe(3);

    const melee = catalog.find((game) => game.slug === 'melee');
    expect(melee?.characters.every((character) => character.art?.creditText.includes('cross-version'))).toBe(true);
    const doom = catalog.find((game) => game.slug === 'umvc3')?.characters.find((character) => character.slug === 'doom');
    expect(doom?.art?.creditText).toContain('cross-version');
  });

  it('records the verified current 2XKO roster and Fuse choices', () => {
    const twoXko = catalog.find((game) => game.slug === '2xko');
    expect(twoXko?.catalogStatus).toBe('verified');
    expect(twoXko?.sourceCheckedAt).toBe('2026-08-25');
    expect(twoXko?.characters).toHaveLength(15);
    expect(twoXko?.schema.verified).toBe(true);
    expect(twoXko?.schema.slots.map((slot) => slot.id)).toEqual(['point', 'assist']);
    expect(twoXko?.schema.uniqueCharacters).toBe(true);
    expect(twoXko?.schema.constraintNote).toContain('conservatively requires distinct');
    expect(twoXko?.schema.teamOptionValues).toEqual([
      'Double Down',
      'Juggernaut',
      'Sidekick',
      '2X Assist',
      'Freestyle',
      'Teamfight',
    ]);
  });

  it('accepts every verified preview Selection Schema fixture', () => {
    for (const [index, game] of catalog.entries()) {
      if (!game.schema.verified) continue;
      const fixture = validFixture(index);
      if (game.schema.uniqueCharacters && fixture.picks.length > 1) {
        fixture.picks = fixture.picks.map((pick, pickIndex) => {
          const slot = game.schema.slots[pickIndex];
          const character = game.characters.filter((candidate) => slot.allowedRoles.includes(candidate.role))[pickIndex] ?? game.characters.find((candidate) => slot.allowedRoles.includes(candidate.role));
          if (!character) throw new Error(`Missing distinct fixture for ${game.slug}.`);
          return { ...pick, characterSlug: character.slug };
        });
      }
      expect(validateLineup(fixture).errors, game.slug).toEqual([]);
    }
  });

  it('blocks unverified game options rather than accepting invented values', () => {
    for (const [index, game] of catalog.entries()) {
      if (game.schema.verified) continue;
      expect(validateLineup(validFixture(index)).valid, game.slug).toBe(false);
    }
  });

  it('rejects duplicate Characters in a fixed Team', () => {
    const tokonIndex = catalog.findIndex((game) => game.slug === 'marvel-tokon');
    const fixture = validFixture(tokonIndex);
    fixture.picks = fixture.picks.map((pick) => ({ ...pick, characterSlug: 'magik' }));
    expect(validateLineup(fixture).errors).toContain('A Character can appear only once in this Team.');
  });
});
