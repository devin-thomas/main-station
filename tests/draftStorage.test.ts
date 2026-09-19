import { afterEach, describe, expect, it, vi } from 'vitest';
import { DraftStorageFullError, saveAccountDraft } from '../src/features/draft/draftStore';
import type { ProfileDraft } from '../src/types/domain';

const owner = '11111111-1111-4111-8111-111111111111';

const draft = (): ProfileDraft => ({
  version: 1,
  requestId: '22222222-2222-4222-8222-222222222222',
  profile: { handle: 'storage-owner', displayName: 'Storage Owner', bio: '' },
  lineups: [],
  updatedAt: '2026-01-01T00:00:00.000Z',
});

function failWith(error: unknown) {
  return vi.spyOn(IDBObjectStore.prototype, 'put').mockImplementation(() => {
    throw error;
  });
}

afterEach(() => {
  vi.restoreAllMocks();
});

describe('account draft storage failures', () => {
  it('rejects an unowned write before touching the database', async () => {
    await expect(saveAccountDraft('', draft())).rejects.toThrow(/Sign in/);
  });

  it('reports a quota refusal as a distinct, actionable failure', async () => {
    failWith(new DOMException('The quota has been exceeded.', 'QuotaExceededError'));
    await expect(saveAccountDraft(owner, draft())).rejects.toBeInstanceOf(DraftStorageFullError);
  });

  it('reports a legacy numeric quota code as the same failure', async () => {
    const legacy = new DOMException('Quota exceeded.', 'SomeOtherName');
    Object.defineProperty(legacy, 'code', { value: 22 });
    failWith(legacy);
    await expect(saveAccountDraft(owner, draft())).rejects.toBeInstanceOf(DraftStorageFullError);
  });

  it('passes a non-quota storage failure through unchanged', async () => {
    failWith(new DOMException('The transaction was aborted.', 'AbortError'));
    const failure = await saveAccountDraft(owner, draft()).catch((error: unknown) => error);
    expect(failure).toBeInstanceOf(DOMException);
    expect(failure).not.toBeInstanceOf(DraftStorageFullError);
  });
});
