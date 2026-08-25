import { describe, expect, it } from 'vitest';
import { hasGuestDraftContent, mergeGuestDraftIntoRegisteredDraft } from '../src/features/draft/draftMerge';
import type { GuestDraft, Lineup } from '../src/types/domain';

function lineup(id: string, characterSlug: string, overrides: Partial<Lineup> = {}): Lineup {
  return {
    id,
    gameSlug: 'sf6',
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks: [{ slotId: 'fighter', characterSlug }],
    createdAt: '2026-08-25T00:00:00.000Z',
    ...overrides,
  };
}

function draft(lineups: Lineup[], profile: GuestDraft['profile'] = { displayName: '', handle: '', bio: '' }): GuestDraft {
  return {
    version: 1,
    requestId: 'request-id',
    profile,
    lineups,
    updatedAt: '2026-08-25T00:00:00.000Z',
  };
}

describe('guest-to-account draft merge', () => {
  it('only prompts when the guest has meaningful profile data or at least one Lineup', () => {
    expect(hasGuestDraftContent(draft([]))).toBe(false);
    expect(hasGuestDraftContent(draft([], { displayName: '  ', handle: '', bio: 'A player' }))).toBe(true);
    expect(hasGuestDraftContent(draft([lineup('guest-ken', 'ken')]))).toBe(true);
  });

  it('keeps registered identity, ordered account Lineups, and appends guest-only Lineups', () => {
    const registered = draft([lineup('account-ryu', 'ryu')], {
      displayName: 'Existing player', handle: 'existing-player', bio: 'Account bio',
    });
    const guest = draft([lineup('guest-ken', 'ken')], {
      displayName: 'Guest name', handle: 'guest-name', bio: 'Guest bio',
    });

    const result = mergeGuestDraftIntoRegisteredDraft(registered, guest, {
      createId: () => 'merged-request-id',
      now: () => '2026-08-25T01:00:00.000Z',
    });

    expect(result.draft.profile).toEqual(registered.profile);
    expect(result.draft.lineups.map((entry) => entry.id)).toEqual(['account-ryu', 'guest-ken']);
    expect(result.draft.requestId).toBe('merged-request-id');
    expect(result.report).toEqual({ addedLineups: 1, duplicateLineups: 0, conflictingLineups: 0 });
  });

  it('drops semantic duplicates even when they were created independently', () => {
    const result = mergeGuestDraftIntoRegisteredDraft(
      draft([lineup('account-ken', 'ken')]),
      draft([lineup('guest-ken', 'ken', { createdAt: '2026-08-25T02:00:00.000Z' })]),
      { createId: () => 'merged-request-id' },
    );

    expect(result.draft.lineups.map((entry) => entry.id)).toEqual(['account-ken']);
    expect(result.report).toEqual({ addedLineups: 0, duplicateLineups: 1, conflictingLineups: 0 });
  });

  it('keeps both variants when an id collides but the Lineup contents differ', () => {
    const ids = ['guest-copy-id', 'merged-request-id'];
    const result = mergeGuestDraftIntoRegisteredDraft(
      draft([lineup('shared-id', 'ryu')]),
      draft([lineup('shared-id', 'ken')]),
      { createId: () => ids.shift() ?? 'unexpected-id' },
    );

    expect(result.draft.lineups.map((entry) => [entry.id, entry.picks[0].characterSlug]))
      .toEqual([['shared-id', 'ryu'], ['guest-copy-id', 'ken']]);
    expect(result.report).toEqual({ addedLineups: 1, duplicateLineups: 0, conflictingLineups: 1 });
  });
});
