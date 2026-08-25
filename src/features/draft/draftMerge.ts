import type { GuestDraft, Lineup } from '../../types/domain';

export interface DraftMergeReport {
  addedLineups: number;
  duplicateLineups: number;
  conflictingLineups: number;
}

export interface DraftMergeResult {
  draft: GuestDraft;
  report: DraftMergeReport;
}

export interface DraftMergeOptions {
  createId?: () => string;
  now?: () => string;
}

/**
 * A draft has material that a visitor should explicitly decide what to do with
 * before authentication changes which profile is loaded into this browser.
 */
export function hasGuestDraftContent(draft: GuestDraft): boolean {
  return draft.lineups.length > 0
    || Boolean(draft.profile.displayName.trim())
    || Boolean(draft.profile.handle.trim())
    || Boolean(draft.profile.bio.trim());
}

function lineupFingerprint(lineup: Lineup): string {
  return JSON.stringify({
    gameSlug: lineup.gameSlug,
    category: lineup.category,
    lifecycle: lineup.lifecycle,
    visibility: lineup.visibility,
    ...(lineup.teamOption === undefined ? {} : { teamOption: lineup.teamOption }),
    picks: lineup.picks.map((pick) => ({
      slotId: pick.slotId,
      characterSlug: pick.characterSlug,
      ...(pick.option === undefined ? {} : { option: pick.option }),
    })),
  });
}

function cloneLineup(lineup: Lineup): Lineup {
  return {
    ...lineup,
    picks: lineup.picks.map((pick) => ({ ...pick })),
  };
}

/**
 * Combines an authenticated profile with an unsynced browser draft without
 * silently replacing either source. The account owns profile identity; stored
 * lineups keep their order and guest-only lineups follow them. A semantic
 * duplicate is omitted. An id collision with different content is retained as
 * a new lineup so no edit disappears before the player reviews it.
 */
export function mergeGuestDraftIntoRegisteredDraft(
  registeredDraft: GuestDraft,
  guestDraft: GuestDraft,
  options: DraftMergeOptions = {},
): DraftMergeResult {
  const createId = options.createId ?? (() => crypto.randomUUID());
  const now = options.now ?? (() => new Date().toISOString());
  const lineups = registeredDraft.lineups.map(cloneLineup);
  const fingerprints = new Set(lineups.map(lineupFingerprint));
  const ids = new Set(lineups.map((lineup) => lineup.id));
  const report: DraftMergeReport = { addedLineups: 0, duplicateLineups: 0, conflictingLineups: 0 };

  for (const guestLineup of guestDraft.lineups) {
    const fingerprint = lineupFingerprint(guestLineup);
    if (fingerprints.has(fingerprint)) {
      report.duplicateLineups += 1;
      continue;
    }

    const nextLineup = cloneLineup(guestLineup);
    if (ids.has(nextLineup.id)) {
      let replacementId = createId();
      while (ids.has(replacementId)) replacementId = createId();
      nextLineup.id = replacementId;
      report.conflictingLineups += 1;
    }
    ids.add(nextLineup.id);
    fingerprints.add(fingerprint);
    lineups.push(nextLineup);
    report.addedLineups += 1;
  }

  return {
    draft: {
      version: 1,
      requestId: createId(),
      profile: { ...registeredDraft.profile },
      lineups,
      updatedAt: now(),
    },
    report,
  };
}
