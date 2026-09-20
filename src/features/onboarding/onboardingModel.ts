import type { CharacterPick, GameVersion, Lineup, ProfileDraft } from '../../types/domain';
import { validateLineup } from '../../lib/lineupValidation';

export type OnboardingStage = 'game' | 'roster' | 'identity';

export function emptyPicks(game: GameVersion): CharacterPick[] {
  return game.schema.slots.map((slot) => ({ slotId: slot.id, characterSlug: '' }));
}

/** The slot a roster tap fills: the focused one when it is still open, else the first gap. */
export function targetSlotId(picks: CharacterPick[], focusedSlotId: string | null): string | null {
  if (focusedSlotId && picks.some((pick) => pick.slotId === focusedSlotId)) return focusedSlotId;
  return picks.find((pick) => !pick.characterSlug)?.slotId ?? null;
}

export function applyCharacterChoice(
  game: GameVersion,
  picks: CharacterPick[],
  characterSlug: string,
  focusedSlotId: string | null,
): CharacterPick[] {
  const slotId = targetSlotId(picks, focusedSlotId);
  if (!slotId) return picks;
  const alreadyElsewhere = game.schema.uniqueCharacters
    && picks.some((pick) => pick.slotId !== slotId && pick.characterSlug === characterSlug);
  if (alreadyElsewhere) return picks;
  return picks.map((pick) => pick.slotId === slotId
    ? { slotId: pick.slotId, characterSlug, option: undefined }
    : pick);
}

export function clearSlot(picks: CharacterPick[], slotId: string): CharacterPick[] {
  return picks.map((pick) => pick.slotId === slotId ? { slotId: pick.slotId, characterSlug: '' } : pick);
}

/** The next slot to steer the player to after a tap, so a Team keeps moving without extra taps. */
export function nextOpenSlotId(picks: CharacterPick[]): string | null {
  return picks.find((pick) => !pick.characterSlug)?.slotId ?? null;
}

export function candidateLineup(game: GameVersion, picks: CharacterPick[], teamOption: string): Lineup {
  return {
    id: 'onboarding-candidate',
    gameSlug: game.slug,
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks,
    teamOption: teamOption || undefined,
    createdAt: new Date().toISOString(),
  };
}

export const HANDLE_PATTERN = /^[a-z0-9][a-z0-9-]{1,30}[a-z0-9]$/;

export function suggestHandle(displayName: string): string {
  return displayName
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 32)
    .replace(/-+$/, '');
}

export interface OnboardingReadiness {
  mainCount: number;
  issues: string[];
  ready: boolean;
}

/**
 * A profile cannot be created without at least one main. The rest of the checks mirror the
 * account-claim gate so the guided flow never offers a Create button the write would reject.
 */
export function onboardingReadiness(draft: ProfileDraft, profile: ProfileDraft['profile']): OnboardingReadiness {
  const issues: string[] = [];
  // A half-filled team is not a claimed main, so only complete entries count toward the gate.
  const mains = draft.lineups.filter((lineup) => lineup.category === 'main' && validateLineup(lineup).valid);
  if (mains.length === 0) issues.push('Add at least one main');
  const incomplete = draft.lineups.filter((lineup) => !validateLineup(lineup).valid).length;
  if (incomplete > 0) issues.push(`Finish ${incomplete} incomplete ${incomplete === 1 ? 'entry' : 'entries'}`);
  if (!profile.displayName.trim()) issues.push('Add a display name');
  if (!HANDLE_PATTERN.test(profile.handle)) issues.push('Choose a handle of 3–32 lowercase letters, numbers, or hyphens');
  return { mainCount: mains.length, issues, ready: issues.length === 0 };
}

export function stageOrder(stage: OnboardingStage): number {
  return { game: 0, roster: 1, identity: 2 }[stage];
}
