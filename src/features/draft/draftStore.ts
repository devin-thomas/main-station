import { openDB, type DBSchema, type IDBPDatabase } from 'idb';
import { emptyDraft } from '../../data/demo';
import type { GuestDraft } from '../../types/domain';

interface MainStationDatabase extends DBSchema {
  drafts: {
    key: 'active' | 'recovery';
    value: GuestDraft;
  };
  accountTransitions: {
    key: 'pending';
    value: GuestAccountTransition;
  };
}

export type GuestAccountDecision = 'merge' | 'discard';

export interface GuestAccountTransition {
  version: 1;
  decision: GuestAccountDecision;
  draft: GuestDraft;
  startedAt: string;
}

let databasePromise: Promise<IDBPDatabase<MainStationDatabase>> | undefined;

function database(): Promise<IDBPDatabase<MainStationDatabase>> {
  databasePromise ??= openDB<MainStationDatabase>('mainstation', 2, {
    upgrade(db) {
      if (!db.objectStoreNames.contains('drafts')) db.createObjectStore('drafts');
      if (!db.objectStoreNames.contains('accountTransitions')) db.createObjectStore('accountTransitions');
    },
  });
  return databasePromise;
}

function cloneEmptyDraft(): GuestDraft {
  return { ...structuredClone(emptyDraft), requestId: crypto.randomUUID() };
}

export async function loadGuestDraft(): Promise<GuestDraft> {
  const stored = await (await database()).get('drafts', 'active');
  if (!stored) return cloneEmptyDraft();
  if (stored.version !== 1) throw new Error('This guest draft uses an unsupported data version. Export or clear it before continuing.');
  return { ...stored, requestId: stored.requestId || crypto.randomUUID() };
}

export async function saveGuestDraft(draft: GuestDraft): Promise<void> {
  const db = await database();
  const transaction = db.transaction('drafts', 'readwrite', { durability: 'strict' });
  await transaction.store.put(draft, 'active');
  await transaction.done;
}

export async function preserveRecoveryDraft(draft: GuestDraft): Promise<void> {
  const db = await database();
  const transaction = db.transaction('drafts', 'readwrite', { durability: 'strict' });
  await transaction.store.put(draft, 'recovery');
  await transaction.done;
}

export async function loadRecoveryDraft(): Promise<GuestDraft | null> {
  return (await (await database()).get('drafts', 'recovery')) ?? null;
}

export async function discardRecoveryDraft(): Promise<void> {
  const db = await database();
  const transaction = db.transaction('drafts', 'readwrite', { durability: 'strict' });
  await transaction.store.delete('recovery');
  await transaction.done;
}

export async function clearGuestDraft(): Promise<GuestDraft> {
  const next = cloneEmptyDraft();
  const db = await database();
  const transaction = db.transaction('drafts', 'readwrite', { durability: 'strict' });
  await transaction.store.delete('active');
  await transaction.done;
  return next;
}

export async function beginGuestAccountTransition(transition: GuestAccountTransition): Promise<void> {
  const db = await database();
  const transaction = db.transaction('accountTransitions', 'readwrite', { durability: 'strict' });
  await transaction.store.put(transition, 'pending');
  await transaction.done;
}

export async function loadGuestAccountTransition(): Promise<GuestAccountTransition | null> {
  const transition = await (await database()).get('accountTransitions', 'pending');
  if (!transition) return null;
  if (transition.version !== 1 || (transition.decision !== 'merge' && transition.decision !== 'discard')) {
    throw new Error('This saved sign-in decision is unsupported. Your local draft is unchanged.');
  }
  return transition;
}

export async function discardGuestAccountTransition(): Promise<void> {
  const db = await database();
  const transaction = db.transaction('accountTransitions', 'readwrite', { durability: 'strict' });
  await transaction.store.delete('pending');
  await transaction.done;
}
