import type { GuestDraft } from '../../types/domain';
import {
  beginGuestAccountTransition,
  discardGuestAccountTransition,
  loadGuestAccountTransition,
  type GuestAccountDecision,
  type GuestAccountTransition,
} from '../draft/draftStore';

export type { GuestAccountDecision, GuestAccountTransition };

export async function rememberGuestAccountDecision(decision: GuestAccountDecision, draft: GuestDraft): Promise<void> {
  await beginGuestAccountTransition({
    version: 1,
    decision,
    draft: structuredClone(draft),
    startedAt: new Date().toISOString(),
  });
}

export { discardGuestAccountTransition, loadGuestAccountTransition };
