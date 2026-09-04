import { act, cleanup, render, screen, waitFor } from '@testing-library/react';
import { useEffect } from 'react';
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest';
import { DraftProvider, useDraft } from '../src/features/draft/DraftProvider';
import { emptyDraft } from '../src/data/demo';
import type { Lineup, ProfileDraft } from '../src/types/domain';

const mocks = vi.hoisted(() => ({
  userId: null as string | null,
  load: vi.fn<(id: string) => Promise<ProfileDraft | null>>(),
  remote: vi.fn<(id: string) => Promise<ProfileDraft | null>>(),
  save: vi.fn<(id: string, draft: ProfileDraft) => Promise<void>>(),
}));
vi.mock('../src/features/auth/AuthProvider', () => ({ useAuth: () => ({ session: mocks.userId ? { user: { id: mocks.userId } } : null }) }));
vi.mock('../src/features/draft/draftStore', () => ({ loadAccountDraft: mocks.load, saveAccountDraft: mocks.save }));
vi.mock('../src/features/profile/profile', () => ({ loadMyProfileDraft: mocks.remote }));

let editor: ReturnType<typeof useDraft>;
function Probe() {
  const value = useDraft();
  useEffect(() => { editor = value; }, [value]);
  return <><p>{value.ready ? 'Ready' : 'Blocked'}</p><p>{value.draft.profile.handle}</p><p role="alert">{value.storageError}</p></>;
}
const tree = () => <DraftProvider><Probe /></DraftProvider>;
const lineup: Lineup = { id: 'first', gameSlug: 'uni2', category: 'main', lifecycle: 'active', visibility: 'private', picks: [{ slotId: 'character', characterSlug: 'hyde' }], createdAt: '2026-09-04T00:00:00.000Z' };

beforeEach(() => {
  mocks.userId = null;
  mocks.load.mockReset().mockResolvedValue(null);
  mocks.remote.mockReset().mockResolvedValue(null);
  mocks.save.mockReset().mockResolvedValue(undefined);
});
afterEach(cleanup);

describe('account editing boundary', () => {
  it('never reads or writes editing data while signed out', async () => {
    render(tree());
    await expect(editor.addLineup(lineup)).rejects.toThrow('Sign in');
    expect(mocks.load).not.toHaveBeenCalled();
    expect(mocks.remote).not.toHaveBeenCalled();
    expect(mocks.save).not.toHaveBeenCalled();
  });

  it('hides the former account immediately and ignores its late hydration', async () => {
    let finish!: (value: ProfileDraft) => void;
    mocks.userId = 'account-a';
    mocks.load.mockImplementationOnce(() => new Promise((resolve) => { finish = resolve; }));
    const view = render(tree());
    mocks.userId = 'account-b';
    view.rerender(tree());
    await screen.findByText('Ready');
    await act(async () => finish({ ...emptyDraft, profile: { ...emptyDraft.profile, handle: 'private-a' } }));
    expect(screen.queryByText('private-a')).not.toBeInTheDocument();
    await act(async () => editor.addLineup(lineup));
    expect(mocks.save).toHaveBeenCalledWith('account-b', expect.objectContaining({ lineups: [lineup] }));
  });

  it('does not treat an account load failure as an empty editable profile', async () => {
    mocks.userId = 'account-a';
    mocks.remote.mockRejectedValue(new Error('Network unavailable'));
    render(tree());
    await waitFor(() => expect(screen.getByRole('alert')).toHaveTextContent('could not be loaded'));
    expect(screen.getByText('Blocked')).toBeInTheDocument();
    await expect(editor.addLineup(lineup)).rejects.toThrow('load your account');
    expect(mocks.save).not.toHaveBeenCalled();
  });

  it('serializes rapid edits and preserves the last committed state after storage failure', async () => {
    mocks.userId = 'account-a';
    render(tree());
    await screen.findByText('Ready');
    await act(async () => Promise.all([editor.addLineup(lineup), editor.addLineup({ ...lineup, id: 'second' })]));
    expect(editor.draft.lineups).toHaveLength(2);
    mocks.save.mockRejectedValueOnce(new Error('Quota exceeded'));
    await act(async () => { await expect(editor.removeLineup('first')).rejects.toThrow('Quota exceeded'); });
    expect(editor.draft.lineups).toHaveLength(2);
    expect(screen.getByRole('alert')).toHaveTextContent('could not be saved');
  });

  it('blocks retained mutation callbacks after signout', async () => {
    mocks.userId = 'account-a';
    const view = render(tree());
    await screen.findByText('Ready');
    const oldMutation = editor.addLineup;
    mocks.userId = null;
    view.rerender(tree());
    await expect(oldMutation(lineup)).rejects.toThrow('Sign in');
    expect(mocks.save).not.toHaveBeenCalled();
    expect(screen.getByText('Blocked')).toBeInTheDocument();
  });
});
