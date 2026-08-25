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

  it('records four unchanged UNI2 fan-kit assets with per-file provenance', () => {
    const artCharacters = catalog.flatMap((game) => game.characters.filter((character) => character.art));
    expect(artCharacters.map((character) => character.slug).sort()).toEqual(['hyde', 'linne', 'waldstein', 'yuzuriha']);
    for (const character of artCharacters) {
      expect(character.art?.usageBasis).toBe('official-fankit');
      expect(character.art?.licenseUrl).toBe('https://www.arcsystemworks.jp/uni2celes/en/fankit/');
      expect(character.art?.assetHash).toMatch(/^sha256:[a-f0-9]{64}$/);
    }
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
