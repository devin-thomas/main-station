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
      return {
        slotId: slot.id,
        characterSlug: character.slug,
        option: slot.optionValuesByCharacter?.[character.slug]?.[0] ?? slot.optionValues?.[0],
      };
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

  it('contains the complete version-scoped roster counts', () => {
    expect(Object.fromEntries(catalog.map((game) => [game.slug, game.characters.length]))).toEqual({
      '2xko': 15,
      'marvel-tokon': 20,
      mvc2: 56,
      umvc3: 50,
      uni2: 28,
      'avatar-legends': 12,
      melee: 26,
      ggxxacpr: 25,
      'vampire-savior': 15,
      sf6: 31,
      mk1: 56,
      'tekken-8': 42,
      ggst: 34,
    });
    expect(catalog.reduce((total, game) => total + game.characters.length, 0)).toBe(410);
    expect(catalog.every((game) => game.catalogStatus === 'verified' && game.schema.verified)).toBe(true);
    expect(new Set(catalog.flatMap((game) => game.characters.map((character) => `${game.slug}/${character.slug}`))).size).toBe(410);
  });

  it('provides a gameplay summary for every version-scoped Character', () => {
    const entries = catalog.flatMap((game) => game.characters.map((character) => ({ game, character })));
    expect(entries).toHaveLength(410);
    for (const { game, character } of entries) {
      expect(character.summary.trim(), `${game.slug}/${character.slug}`).not.toBe('');
      expect(character.summary.trim(), `${game.slug}/${character.slug}`).toMatch(/[.!?]$/);
    }
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

  it('retains reviewed artwork and provenance for the art-reviewed Character rows', () => {
    const entries = catalog.flatMap((game) => game.characters.map((character) => ({ game, character })));
    const artEntries = entries.filter((entry) => entry.character.art);
    const basisCounts = new Map<string, number>();
    for (const { character } of artEntries) {
      const basis = character.art?.usageBasis;
      if (basis) basisCounts.set(basis, (basisCounts.get(basis) ?? 0) + 1);
    }

    expect(entries).toHaveLength(410);
    expect(artEntries).toHaveLength(410);
    expect(new Set(artEntries.map(({ game, character }) => `${game.slug}/${character.slug}`)).size).toBe(410);
    expect(new Set(artEntries.map(({ game }) => game.slug)).size).toBe(13);
    expect(basisCounts.get('express-fan-kit')).toBe(28);
    expect(basisCounts.get('conditional-fan-kit')).toBe(34);
    expect(basisCounts.get('conditional-community-policy')).toBe(15);
    expect(basisCounts.get('community-mirrored')).toBe(25);
    expect(basisCounts.get('publisher-promotional')).toBe(308);

    for (const { character } of artEntries) {
      expect(character.art?.assetHash).toMatch(/^sha256:[a-f0-9]{64}$/);
      expect(character.art?.thumbHash).toMatch(/^sha256:[a-f0-9]{64}$/);
      expect(character.art?.localPath).toMatch(/^\/art\/[a-z0-9-]+\.webp$/);
      expect(character.art?.sourceUrl).toMatch(/^https:\/\//);
      expect(character.art?.reviewUrl).toMatch(/^https:\/\//);
      expect(character.art?.creditText.length).toBeGreaterThan(8);
      expect(character.art?.permissionEvidence.length).toBeGreaterThan(40);
    }

    // Every Character carries its own file, and no two share bytes.
    expect(new Set(artEntries.map(({ character }) => character.art?.localPath)).size).toBe(410);
    expect(new Set(artEntries.map(({ character }) => character.art?.assetHash)).size).toBe(410);

    // Melee is the only Game still served by another version's official renders.
    const crossVersion = artEntries.filter(({ character }) => character.art?.creditText.includes('cross-version'));
    expect(crossVersion.map(({ game }) => game.slug)).toEqual(Array(26).fill('melee'));
    const melee = catalog.find((game) => game.slug === 'melee');
    expect(melee?.characters.every((character) => character.art?.creditText.includes('cross-version'))).toBe(true);
  });

  it('covers every roster row in every Game', () => {
    const uncovered = catalog.flatMap((game) => game.characters
      .filter((character) => !character.art)
      .map((character) => `${game.slug}/${character.slug}`));

    expect(uncovered).toEqual([]);
    for (const game of catalog) {
      expect(game.characters.every((character) => Boolean(character.art))).toBe(true);
    }
  });

  it('records the community mirror behind the UMVC3 Marvel half, and only there', () => {
    const mirrored = catalog.flatMap((game) => game.characters
      .filter((character) => character.art?.usageBasis === 'community-mirrored')
      .map((character) => ({ game, character })));

    expect(mirrored).toHaveLength(25);
    expect(new Set(mirrored.map(({ game }) => game.slug))).toEqual(new Set(['umvc3']));
    for (const { character } of mirrored) {
      // The wiki is the finder, not the rights holder: the credit still names Capcom and Marvel.
      expect(character.art?.sourceUrl).toMatch(/^https:\/\/wiki\.supercombo\.gg\/images\//);
      expect(character.art?.reviewUrl).toMatch(/^https:\/\/wiki\.supercombo\.gg\/w\//);
      expect(character.art?.creditText).toContain('© Capcom / Marvel');
      expect(character.art?.permissionEvidence).toContain('grants no reuse licence of its own');
    }
  });

  it('records the verified current 2XKO roster and Fuse choices', () => {
    const twoXko = catalog.find((game) => game.slug === '2xko');
    expect(twoXko?.catalogStatus).toBe('verified');
    expect(twoXko?.sourceCheckedAt).toBe('2026-08-25');
    expect(twoXko?.characters).toHaveLength(15);
    expect(twoXko?.schema.verified).toBe(true);
    expect(twoXko?.schema.slots.map((slot) => slot.id)).toEqual(['point', 'assist']);
    expect(twoXko?.schema.uniqueCharacters).toBe(true);
    expect(twoXko?.schema.constraintNote).toBe('Choose different champions for Point and Assist.');
    expect(twoXko?.schema.teamOptionValues).toEqual([
      'Double Down',
      'Juggernaut',
      'Sidekick',
      '2X Assist',
      'Freestyle',
      'Teamfight',
    ]);
  });

  it('accepts a valid Selection Schema fixture for every game', () => {
    for (const [index, game] of catalog.entries()) {
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

  it('requires the selected Avatar support to match the selected fighter', () => {
    const avatar = catalog.find((game) => game.slug === 'avatar-legends');
    if (!avatar) throw new Error('Avatar catalog is missing.');
    const supportSlot = avatar.schema.slots[0];
    const valid = validFixture(catalog.findIndex((game) => game.slug === 'avatar-legends'));
    valid.picks[0].option = supportSlot.optionValuesByCharacter?.['aang']?.[0];
    valid.picks[0].characterSlug = 'zuko';
    expect(validateLineup(valid).errors).toContain('Character needs a valid Support.');
  });

  it('rejects duplicate Characters in a fixed Team', () => {
    const tokonIndex = catalog.findIndex((game) => game.slug === 'marvel-tokon');
    const fixture = validFixture(tokonIndex);
    fixture.picks = fixture.picks.map((pick) => ({ ...pick, characterSlug: 'magik' }));
    expect(validateLineup(fixture).errors).toContain('A Character can appear only once in this Team.');
  });
});
