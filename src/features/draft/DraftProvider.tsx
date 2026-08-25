import { createContext, useCallback, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';
import type { DraftProfile, GuestDraft, Lineup } from '../../types/domain';
import { clearGuestDraft, loadGuestDraft, preserveRecoveryDraft, saveGuestDraft } from './draftStore';

interface DraftContextValue {
  draft: GuestDraft;
  ready: boolean;
  storageError: string | null;
  updateProfile(profile: DraftProfile): Promise<void>;
  addLineup(lineup: Lineup): Promise<void>;
  updateLineup(lineup: Lineup): Promise<void>;
  moveLineup(lineupId: string, direction: -1 | 1): Promise<void>;
  removeLineup(lineupId: string): Promise<void>;
  replaceDraft(draft: GuestDraft): Promise<void>;
  preserveRecovery(): Promise<void>;
  clearDraft(): Promise<void>;
}

const initialDraft: GuestDraft = {
  version: 1,
  requestId: '00000000-0000-4000-8000-000000000000',
  profile: { displayName: '', handle: '', bio: '' },
  lineups: [],
  updatedAt: new Date(0).toISOString(),
};

const DraftContext = createContext<DraftContextValue | null>(null);

export function DraftProvider({ children }: { children: ReactNode }) {
  const [draft, setDraft] = useState<GuestDraft>(initialDraft);
  const [ready, setReady] = useState(false);
  const [storageError, setStorageError] = useState<string | null>(null);

  useEffect(() => {
    let active = true;
    loadGuestDraft()
      .then((stored) => {
        if (active) setDraft(stored);
      })
      .catch((error: unknown) => {
        if (active) setStorageError(error instanceof Error ? error.message : 'The guest draft could not be opened.');
      })
      .finally(() => {
        if (active) setReady(true);
      });
    return () => {
      active = false;
    };
  }, []);

  const commit = useCallback(async (nextDraft: GuestDraft) => {
    const versionedDraft = { ...nextDraft, requestId: crypto.randomUUID() };
    try {
      await saveGuestDraft(versionedDraft);
      setDraft(versionedDraft);
      setStorageError(null);
    } catch (error) {
      const message = error instanceof Error ? error.message : 'The guest draft could not be saved.';
      setStorageError(message);
      throw error;
    }
  }, []);

  const value = useMemo<DraftContextValue>(() => ({
    draft,
    ready,
    storageError,
    async updateProfile(profile) {
      await commit({ ...draft, profile, updatedAt: new Date().toISOString() });
    },
    async addLineup(lineup) {
      await commit({ ...draft, lineups: [...draft.lineups, lineup], updatedAt: new Date().toISOString() });
    },
    async updateLineup(lineup) {
      if (!draft.lineups.some((candidate) => candidate.id === lineup.id)) {
        throw new Error('The Character or Team no longer exists in this local draft.');
      }
      await commit({
        ...draft,
        lineups: draft.lineups.map((candidate) => candidate.id === lineup.id ? lineup : candidate),
        updatedAt: new Date().toISOString(),
      });
    },
    async moveLineup(lineupId, direction) {
      const currentIndex = draft.lineups.findIndex((lineup) => lineup.id === lineupId);
      const targetIndex = currentIndex + direction;
      if (currentIndex < 0 || targetIndex < 0 || targetIndex >= draft.lineups.length) return;
      const lineups = [...draft.lineups];
      [lineups[currentIndex], lineups[targetIndex]] = [lineups[targetIndex], lineups[currentIndex]];
      await commit({ ...draft, lineups, updatedAt: new Date().toISOString() });
    },
    async removeLineup(lineupId) {
      await commit({ ...draft, lineups: draft.lineups.filter((lineup) => lineup.id !== lineupId), updatedAt: new Date().toISOString() });
    },
    async replaceDraft(nextDraft) {
      await commit({ ...nextDraft, updatedAt: new Date().toISOString() });
    },
    async preserveRecovery() {
      await preserveRecoveryDraft(draft);
    },
    async clearDraft() {
      try {
        const cleared = await clearGuestDraft();
        setDraft(cleared);
        setStorageError(null);
      } catch (error) {
        const message = error instanceof Error ? error.message : 'The guest draft could not be cleared.';
        setStorageError(message);
        throw error;
      }
    },
  }), [commit, draft, ready, storageError]);

  return <DraftContext.Provider value={value}>{children}</DraftContext.Provider>;
}

export function useDraft(): DraftContextValue {
  const context = useContext(DraftContext);
  if (!context) throw new Error('useDraft must be used within DraftProvider.');
  return context;
}
