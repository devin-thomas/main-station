import { requireSupabase } from '../../lib/supabase';
import type { Database } from '../../types/database';

export type RecommendationFeedback = Database['public']['Enums']['feedback_response'];

export interface RecommendationCandidate {
  characterId: string;
  characterSlug: string;
  characterName: string;
  rank: number;
  score: number;
  supportCount: number;
  policyVersion: string;
}

export interface RecommendationRun {
  runId: string;
  targetGameVersionId: string;
  policyVersion: string;
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

function parseCandidate(value: unknown): RecommendationCandidate {
  if (!isRecord(value)) throw new Error('Supabase returned an invalid recommendation candidate.');
  const rank = requireNumber(value, 'rank');
  const supportCount = requireNumber(value, 'supportCount');
  if (!Number.isInteger(rank) || rank < 1 || !Number.isInteger(supportCount)) {
    throw new Error('Supabase returned invalid recommendation support metadata.');
  }
  return {
    characterId: requireString(value, 'characterId'),
    characterSlug: requireString(value, 'characterSlug'),
    characterName: requireString(value, 'characterName'),
    rank,
    score: requireNumber(value, 'score'),
    supportCount,
    policyVersion: requireString(value, 'policyVersion'),
  };
}

function parseRun(value: unknown): RecommendationRun {
  if (!isRecord(value) || !Array.isArray(value.candidates)) {
    throw new Error('Supabase returned an invalid recommendation run.');
  }
  return {
    runId: requireString(value, 'runId'),
    targetGameVersionId: requireString(value, 'targetGameVersionId'),
    policyVersion: requireString(value, 'policyVersion'),
    candidates: value.candidates.map(parseCandidate),
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
