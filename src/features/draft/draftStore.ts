import { openDB, type DBSchema, type IDBPDatabase } from 'idb';
import { emptyDraft } from '../../data/demo';
import type { GuestDraft } from '../../types/domain';

interface MainStationDatabase extends DBSchema {
  drafts: {
    key: 'active' | 'recovery';
    value: GuestDraft;
  };
}

let databasePromise: Promise<IDBPDatabase<MainStationDatabase>> | undefined;

function database(): Promise<IDBPDatabase<MainStationDatabase>> {
  databasePromise ??= openDB<MainStationDatabase>('mainstation', 1, {
    upgrade(db) {
      if (!db.objectStoreNames.contains('drafts')) db.createObjectStore('drafts');
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

export async function clearGuestDraft(): Promise<GuestDraft> {
  const next = cloneEmptyDraft();
  const db = await database();
  const transaction = db.transaction('drafts', 'readwrite', { durability: 'strict' });
  await transaction.store.delete('active');
  await transaction.done;
  return next;
}
