import { requireSupabase } from '../../lib/supabase';
import type { Database } from '../../types/database';

export type RecommendationFeedback = Database['public']['Enums']['feedback_response'];

/** One observed source Character behind a candidate, as required by SPEC 11.2. */
export interface RecommendationContribution {
  characterId: string;
  characterSlug: string;
  characterName: string;
  gameSlug: string;
  contribution: number;
  supportCount: number;
}

export interface RecommendationCandidate {
  characterId: string;
  characterSlug: string;
  characterName: string;
  rank: number;
  score: number;
  supportCount: number;
  contributions: RecommendationContribution[];
  policyVersion: string;
}

/** ADR-018: zero observed support is a named state, never a popularity fallback. */
export type RecommendationState = 'ok' | 'not_enough_data';

export interface RecommendationRun {
  runId: string;
  targetGameVersionId: string;
  policyVersion: string;
  state: RecommendationState;
  candidates: RecommendationCandidate[];
  createdAt: string;
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value);
}

function requireString(record: Record<string, unknown>, key: string): string {
  const value = record[key];
  if (typeof value !== 'string') throw new Error(`Supabase returned an invalid ${key} value.`);
  return value;
}

function requireNumber(record: Record<string, unknown>, key: string): number {
  const parsed = Number(record[key]);
  if (!Number.isFinite(parsed) || parsed < 0) throw new Error(`Supabase returned an invalid ${key} value.`);
  return parsed;
}

function parseContribution(value: unknown): RecommendationContribution {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid recommendation contribution.');
  const supportCount = requireNumber(value, 'supportCount');
  if (!Number.isInteger(supportCount) || supportCount < 1) {
    throw new Error('Supabase returned an invalid recommendation contribution support count.');
  }
  return {
    characterId: requireString(value, 'characterId'),
    characterSlug: requireString(value, 'characterSlug'),
    characterName: requireString(value, 'characterName'),
    gameSlug: requireString(value, 'gameSlug'),
    contribution: requireNumber(value, 'contribution'),
    supportCount,
  };
}

function parseCandidate(value: unknown): RecommendationCandidate {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid recommendation candidate.');
  const rank = requireNumber(value, 'rank');
  const supportCount = requireNumber(value, 'supportCount');
  if (!Number.isInteger(rank) || rank < 1 || !Number.isInteger(supportCount) || supportCount < 1) {
    throw new Error('Supabase returned invalid recommendation support metadata.');
  }
  if (!Array.isArray(value.contributions)) {
    throw new Error('Supabase returned a recommendation candidate without its contributing associations.');
  }
  return {
    characterId: requireString(value, 'characterId'),
    characterSlug: requireString(value, 'characterSlug'),
    characterName: requireString(value, 'characterName'),
    rank,
    score: requireNumber(value, 'score'),
    supportCount,
    contributions: value.contributions.map(parseContribution),
    policyVersion: requireString(value, 'policyVersion'),
  };
}

function parseState(value: Record<string, unknown>): RecommendationState {
  const state = requireString(value, 'state');
  if (state !== 'ok' && state !== 'not_enough_data') {
    throw new Error('Supabase returned an unknown recommendation state.');
  }
  return state;
}

function parseRun(value: unknown): RecommendationRun {
  if (!isRecord(value) || !Array.isArray(value.candidates)) {
    throw new Error('Supabase returned an invalid recommendation run.');
  }
  const state = parseState(value);
  const candidates = value.candidates.map(parseCandidate);
  if ((state === 'not_enough_data') !== (candidates.length === 0)) {
    throw new Error('Supabase returned a recommendation state that contradicts its candidates.');
  }
  return {
    runId: requireString(value, 'runId'),
    targetGameVersionId: requireString(value, 'targetGameVersionId'),
    policyVersion: requireString(value, 'policyVersion'),
    state,
    candidates,
    createdAt: requireString(value, 'createdAt'),
  };
}

export async function runRecommendations(targetGameSlug: string): Promise<RecommendationRun> {
  const client = requireSupabase();
  const gameResult = await client.from('game_versions').select('id').eq('slug', targetGameSlug).maybeSingle();
  if (gameResult.error) throw gameResult.error;
  if (!gameResult.data) throw new Error('The target Game Version is not available.');
  const { data, error } = await client.rpc('run_my_recommendations', {
    p_target_game_version_id: gameResult.data.id,
  });
  if (error) throw error;
  return parseRun(data);
}

export async function saveRecommendationFeedback(
  runId: string,
  characterId: string,
  response: RecommendationFeedback,
): Promise<void> {
  const { error } = await requireSupabase().rpc('record_recommendation_feedback', {
    p_recommendation_run_id: runId,
    p_character_id: characterId,
    p_response: response,
  });
  if (error) throw error;
}
