import { describe, expect, it } from 'vitest';
import { catalogBySlug } from '../src/data/catalog';
import {
  applyCharacterChoice,
  candidateLineup,
  clearSlot,
  emptyPicks,
  nextOpenSlotId,
  onboardingReadiness,
  suggestHandle,
  targetSlotId,
} from '../src/features/onboarding/onboardingModel';
import { validateLineup } from '../src/lib/lineupValidation';
import { emptyDraft } from '../src/data/demo';
import type { Lineup, ProfileDraft } from '../src/types/domain';

const sf6 = catalogBySlug.get('sf6')!;
const twoXko = catalogBySlug.get('2xko')!;

function draftWith(lineups: Lineup[]): ProfileDraft {
  return { ...emptyDraft, lineups };
}

const juriMain: Lineup = {
  id: 'a', gameSlug: 'sf6', category: 'main', lifecycle: 'active', visibility: 'public',
  picks: [{ slotId: 'fighter', characterSlug: 'juri' }], createdAt: '2026-09-20T00:00:00.000Z',
};

describe('onboarding roster choices', () => {
  it('fills the first empty slot and moves focus to the next one', () => {
    let picks = emptyPicks(twoXko);
    expect(picks).toHaveLength(2);

    picks = applyCharacterChoice(twoXko, picks, 'ekko', picks[0].slotId);
    expect(picks[0].characterSlug).toBe('ekko');
    expect(nextOpenSlotId(picks)).toBe(picks[1].slotId);

    picks = applyCharacterChoice(twoXko, picks, 'jinx', nextOpenSlotId(picks));
    expect(picks.map((pick) => pick.characterSlug)).toEqual(['ekko', 'jinx']);
    expect(nextOpenSlotId(picks)).toBeNull();
  });

  it('refuses a duplicate Character when the schema requires unique picks', () => {
    let picks = applyCharacterChoice(twoXko, emptyPicks(twoXko), 'ekko', null);
    const unchanged = applyCharacterChoice(twoXko, picks, 'ekko', picks[1].slotId);
    expect(unchanged[1].characterSlug).toBe('');

    picks = applyCharacterChoice(twoXko, picks, 'jinx', picks[1].slotId);
    expect(picks[1].characterSlug).toBe('jinx');
  });

  it('replaces the focused slot rather than appending when the player reopens it', () => {
    let picks = applyCharacterChoice(twoXko, emptyPicks(twoXko), 'ekko', null);
    picks = applyCharacterChoice(twoXko, picks, 'jinx', null);
    picks = applyCharacterChoice(twoXko, picks, 'ahri', picks[0].slotId);
    expect(picks.map((pick) => pick.characterSlug)).toEqual(['ahri', 'jinx']);
  });

  it('clearing a slot reopens it as the next target', () => {
    let picks = applyCharacterChoice(twoXko, emptyPicks(twoXko), 'ekko', null);
    picks = applyCharacterChoice(twoXko, picks, 'jinx', null);
    picks = clearSlot(picks, picks[0].slotId);
    expect(targetSlotId(picks, null)).toBe(picks[0].slotId);
  });

  it('a solo Character entry validates as soon as one Character is chosen', () => {
    const picks = applyCharacterChoice(sf6, emptyPicks(sf6), 'juri', null);
    expect(validateLineup(candidateLineup(sf6, picks, '')).valid).toBe(true);
  });

  it('a 2XKO team stays invalid until the team-wide Fuse is chosen', () => {
    let picks = applyCharacterChoice(twoXko, emptyPicks(twoXko), 'ekko', null);
    picks = applyCharacterChoice(twoXko, picks, 'jinx', null);
    expect(validateLineup(candidateLineup(twoXko, picks, '')).valid).toBe(false);

    const fuse = twoXko.schema.teamOptionValues?.[0] ?? '';
    expect(validateLineup(candidateLineup(twoXko, picks, fuse)).valid).toBe(true);
  });

  it('the candidate is always an active, public main', () => {
    const lineup = candidateLineup(sf6, applyCharacterChoice(sf6, emptyPicks(sf6), 'juri', null), '');
    expect(lineup.category).toBe('main');
    expect(lineup.lifecycle).toBe('active');
    expect(lineup.visibility).toBe('public');
  });
});

describe('onboarding readiness', () => {
  it('blocks profile creation until at least one main exists', () => {
    const profile = { displayName: 'Station Zero', handle: 'station-zero', bio: '' };
    const empty = onboardingReadiness(draftWith([]), profile);
    expect(empty.ready).toBe(false);
    expect(empty.mainCount).toBe(0);
    expect(empty.issues).toContain('Add at least one main');

    const withMain = onboardingReadiness(draftWith([juriMain]), profile);
    expect(withMain.ready).toBe(true);
    expect(withMain.mainCount).toBe(1);
  });

  it('does not count a secondary entry as a main', () => {
    const secondary: Lineup = { ...juriMain, id: 'b', category: 'secondary' };
    const readiness = onboardingReadiness(draftWith([secondary]), { displayName: 'A', handle: 'abc', bio: '' });
    expect(readiness.mainCount).toBe(0);
    expect(readiness.ready).toBe(false);
  });

  it('reports an incomplete entry alongside the identity checks', () => {
    const incomplete: Lineup = { ...juriMain, id: 'c', picks: [{ slotId: 'fighter', characterSlug: '' }] };
    const readiness = onboardingReadiness(draftWith([incomplete]), { displayName: '', handle: 'no', bio: '' });
    expect(readiness.issues).toEqual([
      'Add at least one main',
      'Finish 1 incomplete entry',
      'Add a display name',
      'Choose a handle of 3–32 lowercase letters, numbers, or hyphens',
    ]);
  });

  it('accepts any number of mains', () => {
    const many = [juriMain, { ...juriMain, id: 'd' }, { ...juriMain, id: 'e' }];
    const readiness = onboardingReadiness(draftWith(many), { displayName: 'A', handle: 'abc', bio: '' });
    expect(readiness.mainCount).toBe(3);
    expect(readiness.ready).toBe(true);
  });
});

describe('handle suggestions', () => {
  it('derives a valid handle from a display name', () => {
    expect(suggestHandle('Station Zero')).toBe('station-zero');
    expect(suggestHandle('  Juri!! Main  ')).toBe('juri-main');
    expect(suggestHandle('ばか')).toBe('');
  });

  it('never suggests a trailing hyphen after truncation', () => {
    expect(suggestHandle('a'.repeat(31) + ' b')).not.toMatch(/-$/);
  });
});
