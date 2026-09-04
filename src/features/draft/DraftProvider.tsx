import { createContext, useCallback, useContext, useEffect, useMemo, useRef, useState, type ReactNode } from 'react';
import type { ProfileDraft, Lineup } from '../../types/domain';
import { emptyDraft } from '../../data/demo';
import { useAuth } from '../auth/AuthProvider';
import { loadMyProfileDraft } from '../profile/profile';
import { loadAccountDraft, saveAccountDraft } from './draftStore';

interface DraftContextValue {
  draft: ProfileDraft;
  ready: boolean;
  storageError: string | null;
  reload(): void;
  addLineup(lineup: Lineup): Promise<void>;
  updateLineup(lineup: Lineup): Promise<void>;
  moveLineup(lineupId: string, direction: -1 | 1): Promise<void>;
  removeLineup(lineupId: string): Promise<void>;
  replaceDraft(draft: ProfileDraft): Promise<void>;
}

const DraftContext = createContext<DraftContextValue | null>(null);

export function DraftProvider({ children }: { children: ReactNode }) {
  const { session } = useAuth();
  // Remount every consumer on an identity change, including unfinished form fields.
  return <AccountDraftProvider key={session?.user.id ?? 'signed-out'} userId={session?.user.id ?? null}>{children}</AccountDraftProvider>;
}

function AccountDraftProvider({ userId, children }: { userId: string | null; children: ReactNode }) {
  const [draft, setDraft] = useState<ProfileDraft>(() => structuredClone(emptyDraft));
  const currentDraft = useRef(draft);
  const [ready, setReady] = useState(false);
  const [storageError, setStorageError] = useState<string | null>(null);
  const [attempt, setAttempt] = useState(0);
  const active = useRef(false);
  const pendingWrite = useRef<Promise<void>>(Promise.resolve());

  useEffect(() => {
    active.current = true;
    let cancelled = false;
    if (userId) {
      void (async () => {
        try {
          const stored = await loadAccountDraft(userId) ?? await loadMyProfileDraft(userId) ?? {
            ...structuredClone(emptyDraft), requestId: crypto.randomUUID(),
          };
          if (cancelled) return;
          currentDraft.current = stored;
          setDraft(stored);
          setStorageError(null);
          setReady(true);
        } catch {
          if (!cancelled) setStorageError('Your account changes could not be loaded. Reconnect and try again.');
        }
      })();
    }
    return () => { cancelled = true; active.current = false; };
  }, [attempt, userId]);

  const commit = useCallback((change: (current: ProfileDraft) => ProfileDraft): Promise<void> => {
    const write = pendingWrite.current.then(async () => {
      if (!userId || !ready || !active.current) throw new Error('Sign in and load your account before editing.');
      const nextDraft = { ...change(currentDraft.current), requestId: crypto.randomUUID(), updatedAt: new Date().toISOString() };
      await saveAccountDraft(userId, nextDraft);
      if (!active.current) return;
      currentDraft.current = nextDraft;
      setDraft(nextDraft);
      setStorageError(null);
    });
    // Keep writes ordered without poisoning the queue after a reported failure.
    pendingWrite.current = write.catch(() => {
      if (active.current) setStorageError('Your changes could not be saved on this device. Try again.');
    });
    return write;
  }, [ready, userId]);

  const value = useMemo<DraftContextValue>(() => ({
    draft, ready: Boolean(userId && ready), storageError,
    reload() { setStorageError(null); setReady(false); setAttempt((value) => value + 1); },
    addLineup: (lineup) => commit((current) => ({ ...current, lineups: [...current.lineups, lineup] })),
    updateLineup: (lineup) => commit((current) => {
      if (!current.lineups.some((candidate) => candidate.id === lineup.id)) throw new Error('This entry no longer exists.');
      return { ...current, lineups: current.lineups.map((candidate) => candidate.id === lineup.id ? lineup : candidate) };
    }),
    moveLineup: (lineupId, direction) => commit((current) => {
      const index = current.lineups.findIndex((lineup) => lineup.id === lineupId);
      const target = index + direction;
      if (index < 0 || target < 0 || target >= current.lineups.length) throw new Error('This entry cannot move in that direction.');
      const lineups = [...current.lineups];
      [lineups[index], lineups[target]] = [lineups[target], lineups[index]];
      return { ...current, lineups };
    }),
    removeLineup: (lineupId) => commit((current) => ({ ...current, lineups: current.lineups.filter((lineup) => lineup.id !== lineupId) })),
    replaceDraft: (nextDraft) => commit(() => nextDraft),
  }), [commit, draft, ready, storageError, userId]);

  return <DraftContext.Provider value={value}>{children}</DraftContext.Provider>;
}

export function useDraft(): DraftContextValue {
  const context = useContext(DraftContext);
  if (!context) throw new Error('useDraft must be used within DraftProvider.');
  return context;
}
