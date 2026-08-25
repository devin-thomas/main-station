import { afterEach, describe, expect, it } from 'vitest';
import {
  discardGuestAccountTransition,
  loadGuestAccountTransition,
  rememberGuestAccountDecision,
} from '../src/features/auth/guestAccountTransition';
import type { GuestDraft } from '../src/types/domain';

const draft: GuestDraft = {
  version: 1,
  requestId: '10000000-0000-4000-8000-000000000001',
  profile: { displayName: 'Guest player', handle: 'guest-player', bio: '' },
  lineups: [],
  updatedAt: '2026-08-25T00:00:00.000Z',
};

afterEach(async () => {
  await discardGuestAccountTransition();
});

describe('guest account transition persistence', () => {
  it('keeps a merge decision and frozen draft through an auth redirect', async () => {
    await rememberGuestAccountDecision('merge', draft);
    draft.profile.displayName = 'Changed after decision';

    await expect(loadGuestAccountTransition()).resolves.toMatchObject({
      version: 1,
      decision: 'merge',
      draft: { profile: { displayName: 'Guest player' } },
    });
  });

  it('removes a cancelled or completed transition without touching the active draft store', async () => {
    await rememberGuestAccountDecision('discard', draft);
    await discardGuestAccountTransition();

    await expect(loadGuestAccountTransition()).resolves.toBeNull();
  });
});
