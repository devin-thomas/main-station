import { requireSupabase } from '../../lib/supabase';
import type { Json } from '../../types/database';
import type { CharacterPick, GuestDraft, Lineup } from '../../types/domain';

export interface DraftReceipt {
  profileId: string;
  handle: string;
  profilePath: string;
  lineupCount: number;
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function requireString(record: Record<string, unknown>, key: string): string {
  const value = record[key];
  if (typeof value !== 'string') throw new Error(`Supabase returned an invalid ${key} value.`);
  return value;
}

function parseReceipt(value: unknown): DraftReceipt {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid draft receipt.');
  const lineupCount = value.lineupCount;
  if (typeof lineupCount !== 'number' || !Number.isInteger(lineupCount) || lineupCount < 0) {
    throw new Error('Supabase returned an invalid lineup count.');
  }
  return {
    profileId: requireString(value, 'profileId'),
    handle: requireString(value, 'handle'),
    profilePath: requireString(value, 'profilePath'),
    lineupCount,
  };
}

function parsePick(value: unknown): CharacterPick {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid Character Pick.');
  const option = value.option;
  if (option !== undefined && typeof option !== 'string') throw new Error('Supabase returned an invalid Character option.');
  return {
    slotId: requireString(value, 'slotId'),
    characterSlug: requireString(value, 'characterSlug'),
    ...(option ? { option } : {}),
  };
}

function parseLineup(value: unknown): Lineup {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid public Mainline row.');
  const category = value.category;
  const lifecycle = value.lifecycle;
  const picks = value.picks;
  if (category !== 'main' && category !== 'secondary') throw new Error('Supabase returned an invalid Character category.');
  if (lifecycle !== 'active' && lifecycle !== 'retired') throw new Error('Supabase returned an invalid Character lifecycle.');
  if (!Array.isArray(picks)) throw new Error('Supabase returned an invalid Character Pick list.');
  const teamOption = value.team_option;
  if (teamOption !== null && teamOption !== undefined && typeof teamOption !== 'string') {
    throw new Error('Supabase returned an invalid Team option.');
  }
  return {
    id: requireString(value, 'id'),
    gameSlug: requireString(value, 'game_slug'),
    category,
    lifecycle,
    visibility: 'public',
    picks: picks.map(parsePick),
    ...(teamOption ? { teamOption } : {}),
    createdAt: requireString(value, 'created_at'),
  };
}

function parseDraftLineup(value: unknown): Lineup {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid registered Lineup.');
  const category = value.category;
  const lifecycle = value.lifecycle;
  const visibility = value.visibility;
  const picks = value.picks;
  if (category !== 'main' && category !== 'secondary') throw new Error('Supabase returned an invalid Character category.');
  if (lifecycle !== 'active' && lifecycle !== 'retired') throw new Error('Supabase returned an invalid Character lifecycle.');
  if (visibility !== 'public' && visibility !== 'private') throw new Error('Supabase returned an invalid Character visibility.');
  if (!Array.isArray(picks)) throw new Error('Supabase returned an invalid Character Pick list.');
  const teamOption = value.teamOption;
  if (teamOption !== null && teamOption !== undefined && typeof teamOption !== 'string') {
    throw new Error('Supabase returned an invalid Team option.');
  }
  return {
    id: requireString(value, 'id'),
    gameSlug: requireString(value, 'gameSlug'),
    category,
    lifecycle,
    visibility,
    picks: picks.map(parsePick),
    ...(teamOption ? { teamOption } : {}),
    createdAt: requireString(value, 'createdAt'),
  };
}

function parseRegisteredDraft(value: unknown): GuestDraft | null {
  if (value === null) return null;
  if (!isRecord(value) || value.version !== 1) throw new Error('Supabase returned an invalid registered draft.');
  const profile = value.profile;
  const lineups = value.lineups;
  if (!isRecord(profile) || !Array.isArray(lineups)) throw new Error('Supabase returned an invalid registered draft payload.');
  const bio = profile.bio;
  if (typeof bio !== 'string') throw new Error('Supabase returned an invalid profile bio.');
  return {
    version: 1,
    requestId: requireString(value, 'requestId'),
    profile: {
      handle: requireString(profile, 'handle'),
      displayName: requireString(profile, 'displayName'),
      bio,
    },
    lineups: lineups.map(parseDraftLineup),
    updatedAt: requireString(value, 'updatedAt'),
  };
}

export async function getMyRegisteredHandle(userId: string): Promise<string | null> {
  const { data, error } = await requireSupabase()
    .from('profiles')
    .select('handle')
    .eq('id', userId)
    .maybeSingle();
  if (error) throw error;
  const value: unknown = data;
  if (value === null) return null;
  if (!isRecord(value)) throw new Error('Supabase returned an invalid profile record.');
  return requireString(value, 'handle');
}

export async function writeProfileDraft(draft: GuestDraft, replace: boolean): Promise<DraftReceipt> {
  const payload: Json = {
    version: draft.version,
    requestId: draft.requestId,
    profile: {
      handle: draft.profile.handle,
      displayName: draft.profile.displayName,
      bio: draft.profile.bio,
    },
    lineups: draft.lineups.map((lineup) => ({
      id: lineup.id,
      gameSlug: lineup.gameSlug,
      category: lineup.category,
      lifecycle: lineup.lifecycle,
      visibility: lineup.visibility,
      ...(lineup.teamOption === undefined ? {} : { teamOption: lineup.teamOption }),
      picks: lineup.picks.map((pick) => ({
        slotId: pick.slotId,
        characterSlug: pick.characterSlug,
        ...(pick.option === undefined ? {} : { option: pick.option }),
      })),
      createdAt: lineup.createdAt,
    })),
    updatedAt: draft.updatedAt,
  };
  const { data, error } = await requireSupabase().rpc(
    replace ? 'save_my_profile_draft' : 'claim_profile_draft',
    { p_payload: payload, p_request_id: draft.requestId },
  );
  if (error) throw error;
  return parseReceipt(data);
}

export async function loadMyProfileDraft(): Promise<GuestDraft | null> {
  const { data, error } = await requireSupabase().rpc('get_my_profile_draft');
  if (error) throw error;
  return parseRegisteredDraft(data);
}

export async function exportMyProfileData(): Promise<Json> {
  const { data, error } = await requireSupabase().rpc('export_my_profile');
  if (error) throw error;
  return data;
}

export async function loadPublicProfile(handle: string): Promise<GuestDraft | null> {
  const client = requireSupabase();
  const [profileResult, lineupsResult] = await Promise.all([
    client.from('profiles').select('handle, display_name, bio, updated_at').eq('handle', handle).maybeSingle(),
    client.from('public_profile_mainline').select('*').eq('handle', handle).order('sort_order'),
  ]);
  if (profileResult.error) throw profileResult.error;
  if (lineupsResult.error) throw lineupsResult.error;

  const profileValue: unknown = profileResult.data;
  if (profileValue === null) return null;
  if (!isRecord(profileValue)) throw new Error('Supabase returned an invalid public profile.');
  const lineupValues: unknown = lineupsResult.data;
  if (!Array.isArray(lineupValues)) throw new Error('Supabase returned an invalid public Mainline.');

  const bio = profileValue.bio;
  if (bio !== null && bio !== undefined && typeof bio !== 'string') throw new Error('Supabase returned an invalid profile bio.');
  return {
    version: 1,
    requestId: '00000000-0000-4000-8000-000000000000',
    profile: {
      handle: requireString(profileValue, 'handle'),
      displayName: requireString(profileValue, 'display_name'),
      bio: bio ?? '',
    },
    lineups: lineupValues.map(parseLineup),
    updatedAt: requireString(profileValue, 'updated_at'),
  };
}
