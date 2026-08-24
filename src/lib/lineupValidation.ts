import { catalogBySlug } from '../data/catalog';
import type { Lineup, LineupValidation } from '../types/domain';

export function validateLineup(lineup: Lineup): LineupValidation {
  const game = catalogBySlug.get(lineup.gameSlug);
  if (!game) return { valid: false, errors: ['Choose a supported Game Version.'] };

  const errors: string[] = [];
  const { schema } = game;

  if (!schema.verified) {
    errors.push(schema.verificationNote ?? 'This Selection Schema is still under review.');
  }

  if (lineup.picks.length !== schema.slots.length) {
    errors.push(`Complete all ${schema.slots.length} required ${schema.slots.length === 1 ? 'slot' : 'slots'}.`);
  }

  for (const slot of schema.slots) {
    const pick = lineup.picks.find((candidate) => candidate.slotId === slot.id);
    if (!pick?.characterSlug) {
      errors.push(`${slot.label} needs a Character.`);
      continue;
    }
    const character = game.characters.find((candidate) => candidate.slug === pick.characterSlug);
    if (!character) {
      errors.push(`${slot.label} must use a Character from ${game.shortName}.`);
      continue;
    }
    if (!slot.allowedRoles.includes(character.role)) {
      errors.push(`${character.name} cannot fill the ${slot.label} slot.`);
    }
    if (slot.optionValues?.length && !slot.optionValues.includes(pick.option ?? '')) {
      errors.push(`${slot.label} needs a valid ${slot.optionLabel ?? 'option'}.`);
    }
  }

  if (schema.uniqueCharacters) {
    const characterSlugs = lineup.picks.map((pick) => pick.characterSlug).filter(Boolean);
    if (new Set(characterSlugs).size !== characterSlugs.length) {
      errors.push('A Character can appear only once in this Team.');
    }
  }

  if (schema.teamOptionValues?.length && !schema.teamOptionValues.includes(lineup.teamOption ?? '')) {
    errors.push(`Choose a valid ${schema.teamOptionLabel ?? 'Team option'}.`);
  }

  return { valid: errors.length === 0, errors: [...new Set(errors)] };
}
