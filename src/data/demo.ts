import type { GuestDraft, Lineup } from '../types/domain';

const createdAt = '2026-08-24T12:00:00.000Z';

export const demoLineups: Lineup[] = [
  {
    id: 'demo-2xko',
    gameSlug: '2xko',
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks: [
      { slotId: 'slot-1', characterSlug: 'ekko' },
      { slotId: 'slot-2', characterSlug: 'ahri' },
    ],
    createdAt,
  },
  {
    id: 'demo-tokon',
    gameSlug: 'marvel-tokon',
    category: 'main',
    lifecycle: 'active',
    visibility: 'public',
    picks: [
      { slotId: 'slot-1', characterSlug: 'magik' },
      { slotId: 'slot-2', characterSlug: 'spider-man' },
      { slotId: 'slot-3', characterSlug: 'black-panther' },
      { slotId: 'slot-4', characterSlug: 'storm' },
    ],
    createdAt,
  },
  {
    id: 'demo-mvc2',
    gameSlug: 'mvc2',
    category: 'secondary',
    lifecycle: 'retired',
    visibility: 'public',
    picks: [
      { slotId: 'slot-1', characterSlug: 'storm', option: 'Assist A' },
      { slotId: 'slot-2', characterSlug: 'magneto', option: 'Assist A' },
      { slotId: 'slot-3', characterSlug: 'sentinel', option: 'Assist A' },
    ],
    createdAt,
  },
];

export const emptyDraft: GuestDraft = {
  version: 1,
  requestId: '00000000-0000-4000-8000-000000000000',
  profile: { displayName: '', handle: '', bio: '' },
  lineups: [],
  updatedAt: createdAt,
};

export const demoProfile: GuestDraft = {
  version: 1,
  requestId: '00000000-0000-4000-8000-000000000001',
  profile: {
    displayName: 'Station Zero',
    handle: 'station-zero',
    bio: 'Movement, layered pressure, and a little old-Marvel chaos.',
  },
  lineups: demoLineups,
  updatedAt: createdAt,
};
