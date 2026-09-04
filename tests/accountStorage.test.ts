import { describe, expect, it } from 'vitest';
import { clearAccountDraft, loadAccountDraft, saveAccountDraft } from '../src/features/draft/draftStore';
import { emptyDraft } from '../src/data/demo';

describe('account storage ownership', () => {
  it('keeps edits isolated and clears only the requested account', async () => {
    const first = { ...emptyDraft, profile: { ...emptyDraft.profile, handle: 'first-owner' } };
    const second = { ...emptyDraft, profile: { ...emptyDraft.profile, handle: 'second-owner' } };
    await saveAccountDraft('first-owner', first);
    await saveAccountDraft('second-owner', second);
    expect(await loadAccountDraft('first-owner')).toEqual(first);
    expect(await loadAccountDraft('second-owner')).toEqual(second);
    await clearAccountDraft('first-owner');
    expect(await loadAccountDraft('first-owner')).toBeNull();
    expect(await loadAccountDraft('second-owner')).toEqual(second);
  });

  it('rejects ownerless reads, writes, and deletion', async () => {
    await expect(loadAccountDraft('')).rejects.toThrow('Sign in');
    await expect(saveAccountDraft('', emptyDraft)).rejects.toThrow('Sign in');
    await expect(clearAccountDraft('')).rejects.toThrow('Sign in');
  });
});
