export type LineupCategory = 'main' | 'secondary';
export type LineupLifecycle = 'active' | 'retired';
export type LineupVisibility = 'public' | 'private';
export type RosterRole = 'fighter' | 'kameo';

export type CharacterArtUsageBasis =
  | 'express-fan-kit'
  | 'publisher-promotional'
  | 'conditional-fan-kit'
  | 'conditional-community-policy'
  | 'written-permission'
  | 'community-licensed';

export interface CharacterArtAsset {
  localPath: string;
  sourceUrl: string;
  sourcePublisher: string;
  reviewUrl: string;
  creditText: string;
  usageBasis: CharacterArtUsageBasis;
  permissionEvidence: string;
  assetHash: string;
  reviewedAt: string;
  displayFit?: 'contain' | 'cover';
  objectPosition?: string;
}

export interface Character {
  slug: string;
  name: string;
  role: RosterRole;
  summary: string;
  sourceUrl: string;
  sourcePublisher?: string;
  sourceCheckedAt?: string;
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
  constraintNote?: string;
  verificationNote?: string;
}

export interface GameVersion {
  slug: string;
  name: string;
  shortName: string;
  releaseLabel: string;
  sourceUrl: string;
  sourceCheckedAt?: string;
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
