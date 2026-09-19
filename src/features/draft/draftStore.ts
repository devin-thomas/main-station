import { openDB, type DBSchema, type IDBPDatabase } from 'idb';
import type { ProfileDraft } from '../../types/domain';

interface AccountDatabase extends DBSchema {
  drafts: { key: string; value: ProfileDraft };
}

let databasePromise: Promise<IDBPDatabase<AccountDatabase>> | undefined;

function database() {
  // A separate database prevents legacy anonymous data from becoming account data.
  databasePromise ??= openDB<AccountDatabase>('mainstation-accounts', 1, {
    upgrade(db) { db.createObjectStore('drafts'); },
  });
  return databasePromise;
}

function requireOwner(userId: string) {
  if (!userId) throw new Error('Sign in before editing your Mainline.');
}

/**
 * Device storage refused the write. Quota denial, eviction, private mode, and a blocked
 * or aborted transaction are ordinary product states, not bugs, and they need different
 * copy from a generic failure because retrying alone will not clear them.
 */
export class DraftStorageFullError extends Error {
  constructor() {
    super('This device has no room left to save your changes.');
    this.name = 'DraftStorageFullError';
  }
}

function isQuotaFailure(error: unknown): boolean {
  if (!(error instanceof DOMException)) return false;
  return error.name === 'QuotaExceededError' || error.code === 22;
}

export async function loadAccountDraft(userId: string): Promise<ProfileDraft | null> {
  requireOwner(userId);
  const stored = await (await database()).get('drafts', userId);
  if (!stored) return null;
  if (stored.version !== 1) throw new Error('This version of MainStation cannot open your saved changes.');
  return stored;
}

export async function saveAccountDraft(userId: string, draft: ProfileDraft): Promise<void> {
  requireOwner(userId);
  try {
    const transaction = (await database()).transaction('drafts', 'readwrite', { durability: 'strict' });
    await transaction.store.put(draft, userId);
    await transaction.done;
  } catch (error) {
    // The stored draft is left untouched by a failed transaction, so the previous save
    // survives and the caller can offer a retry without losing earlier work.
    if (isQuotaFailure(error)) throw new DraftStorageFullError();
    throw error;
  }
}

export async function clearAccountDraft(userId: string): Promise<void> {
  requireOwner(userId);
  await (await database()).delete('drafts', userId);
}
