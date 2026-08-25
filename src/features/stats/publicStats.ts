import { supabase } from '../../lib/supabase';

export interface GamePublicStats {
  registeredPlayerCount: number;
}

export interface CharacterPublicProfile {
  handle: string;
  displayName: string;
}

export interface CharacterPublicStats {
  publicPlayerCount: number;
  mainPlayerCount: number;
  secondaryPlayerCount: number;
  activePlayerCount: number;
  retiredPlayerCount: number;
  registeredPlayerShare: number | null;
  profiles: CharacterPublicProfile[];
}

function countValue(value: number | string | null | undefined): number {
  const parsed = typeof value === 'number' ? value : Number(value ?? 0);
  if (!Number.isFinite(parsed) || parsed < 0) throw new Error('Supabase returned an invalid public count.');
  return parsed;
}

async function requireGameVersionId(gameSlug: string): Promise<string> {
  if (!supabase) throw new Error('Public data is not configured on this release.');
  const { data, error } = await supabase.from('game_versions').select('id').eq('slug', gameSlug).maybeSingle();
  if (error) throw error;
  if (!data) throw new Error('The requested Game Version is not available in the public catalog.');
  return data.id;
}

export async function loadGamePublicStats(gameSlug: string): Promise<GamePublicStats> {
  if (!supabase) return { registeredPlayerCount: 0 };
  const gameVersionId = await requireGameVersionId(gameSlug);
  const { data, error } = await supabase
    .from('registered_player_counts')
    .select('registered_player_count')
    .eq('game_version_id', gameVersionId)
    .maybeSingle();
  if (error) throw error;
  return { registeredPlayerCount: countValue(data?.registered_player_count) };
}

export async function loadCharacterPublicStats(gameSlug: string, characterSlug: string): Promise<CharacterPublicStats> {
  if (!supabase) {
    return {
      publicPlayerCount: 0,
      mainPlayerCount: 0,
      secondaryPlayerCount: 0,
      activePlayerCount: 0,
      retiredPlayerCount: 0,
      registeredPlayerShare: null,
      profiles: [],
    };
  }

  const gameVersionId = await requireGameVersionId(gameSlug);
  const characterResult = await supabase
    .from('characters')
    .select('id')
    .eq('game_version_id', gameVersionId)
    .eq('slug', characterSlug)
    .maybeSingle();
  if (characterResult.error) throw characterResult.error;
  if (!characterResult.data) throw new Error('The requested Character is not available in the public catalog.');

  const characterId = characterResult.data.id;
  const [statsResult, picksResult] = await Promise.all([
    supabase.from('character_usage_stats').select('*').eq('character_id', characterId).maybeSingle(),
    supabase.from('character_picks').select('lineup_id').eq('character_id', characterId),
  ]);
  if (statsResult.error) throw statsResult.error;
  if (picksResult.error) throw picksResult.error;

  const lineupIds = [...new Set(picksResult.data.map((pick) => pick.lineup_id))];
  let profiles: CharacterPublicProfile[] = [];
  if (lineupIds.length > 0) {
    const profileResult = await supabase
      .from('public_lineups')
      .select('handle, display_name')
      .in('id', lineupIds)
      .order('handle')
      .limit(24);
    if (profileResult.error) throw profileResult.error;
    const byHandle = new Map<string, CharacterPublicProfile>();
    for (const row of profileResult.data) {
      if (row.handle && row.display_name && !byHandle.has(row.handle)) {
        byHandle.set(row.handle, { handle: row.handle, displayName: row.display_name });
      }
    }
    profiles = [...byHandle.values()];
  }

  const stats = statsResult.data;
  const share = stats?.registered_player_share;
  const registeredPlayerShare = share === null || share === undefined ? null : Number(share);
  if (registeredPlayerShare !== null && (!Number.isFinite(registeredPlayerShare) || registeredPlayerShare < 0)) {
    throw new Error('Supabase returned an invalid public Character share.');
  }

  return {
    publicPlayerCount: countValue(stats?.public_player_count),
    mainPlayerCount: countValue(stats?.main_player_count),
    secondaryPlayerCount: countValue(stats?.secondary_player_count),
    activePlayerCount: countValue(stats?.active_player_count),
    retiredPlayerCount: countValue(stats?.retired_player_count),
    registeredPlayerShare,
    profiles,
  };
}
