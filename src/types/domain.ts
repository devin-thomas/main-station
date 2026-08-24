export type LineupCategory = 'main' | 'secondary';
export type LineupLifecycle = 'active' | 'retired';
export type LineupVisibility = 'public' | 'private';
export type RosterRole = 'fighter' | 'kameo';

export interface CharacterArtAsset {
  localPath: string;
  sourceUrl: string;
  licenseUrl: string;
  creditText: string;
  usageBasis: 'official-fankit' | 'written-permission' | 'community-license';
  assetHash: string;
  reviewedAt: string;
}

export interface Character {
  slug: string;
  name: string;
  role: RosterRole;
  summary: string;
  sourceUrl: string;
  art?: CharacterArtAsset;
}

export interface SelectionSlot {
  id: string;
  label: string;
  allowedRoles: RosterRole[];
  optionLabel?: string;
  optionValues?: string[];
}

export interface SelectionSchema {
  version: 1;
  noun: 'Character' | 'Team';
  verified: boolean;
  ordered: boolean;
  uniqueCharacters: boolean;
  slots: SelectionSlot[];
  teamOptionLabel?: string;
  teamOptionValues?: string[];
  verificationNote?: string;
}

export interface GameVersion {
  slug: string;
  name: string;
  shortName: string;
  releaseLabel: string;
  sourceUrl: string;
  catalogStatus: 'fixture' | 'verified';
  playerCount: number | null;
  schema: SelectionSchema;
  characters: Character[];
}

export interface CharacterPick {
  slotId: string;
  characterSlug: string;
  option?: string;
}

export interface Lineup {
  id: string;
  gameSlug: string;
  category: LineupCategory;
  lifecycle: LineupLifecycle;
  visibility: LineupVisibility;
  picks: CharacterPick[];
  teamOption?: string;
  createdAt: string;
}

export interface DraftProfile {
  displayName: string;
  handle: string;
  bio: string;
}

export interface GuestDraft {
  version: 1;
  requestId: string;
  profile: DraftProfile;
  lineups: Lineup[];
  updatedAt: string;
}

export interface LineupValidation {
  valid: boolean;
  errors: string[];
}
