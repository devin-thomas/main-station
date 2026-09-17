-- MS-025/MS-026: association-v1 must return the strongest observed contributing
-- source Characters and their supported association contributions (SPEC 11.2), and
-- recommendation_runs must store enough lineage to explain what the player saw (SPEC 7).
-- MS-026 also requires zero support to return an explicit `not_enough_data` state
-- rather than an untyped empty list.

drop function if exists public.recommend_characters(uuid, uuid);

create function public.recommend_characters(p_profile_id uuid, p_target_game_version_id uuid)
returns table (
  character_id uuid,
  character_name text,
  rank integer,
  score numeric,
  support_count bigint,
  contributions jsonb,
  policy_version text
)
language sql
stable
security invoker
set search_path = ''
as $$
  with authorized as (
    select 1 where (select auth.uid()) = p_profile_id
  ), requester as (
    select signature.character_id, signature.normalized_weight
    from public.player_game_signatures signature, authorized
    where signature.profile_id = p_profile_id
      and signature.game_version_id <> p_target_game_version_id
  ), observed as (
    -- One row per (candidate, source Character, contributing Player). A Player can
    -- only ever supply its own normalized per-Game weights to a pair.
    select
      population_target.character_id as candidate_character_id,
      requester.character_id as source_character_id,
      population_source.profile_id as source_profile_id,
      sum(requester.normalized_weight * population_source.normalized_weight * population_target.normalized_weight)::numeric as contribution
    from requester
    join public.player_game_signatures population_source
      on population_source.character_id = requester.character_id
      and population_source.profile_id <> p_profile_id
    join public.player_game_signatures population_target
      on population_target.profile_id = population_source.profile_id
      and population_target.game_version_id = p_target_game_version_id
    group by population_target.character_id, requester.character_id, population_source.profile_id
  ), candidate_totals as (
    select
      observed.candidate_character_id,
      sum(observed.contribution)::numeric as candidate_score,
      count(distinct observed.source_profile_id)::bigint as candidate_support_count
    from observed
    group by observed.candidate_character_id
  ), source_totals as (
    select
      observed.candidate_character_id,
      observed.source_character_id,
      sum(observed.contribution)::numeric as source_contribution,
      count(distinct observed.source_profile_id)::bigint as source_support_count
    from observed
    group by observed.candidate_character_id, observed.source_character_id
  ), ranked_sources as (
    select
      source_totals.*,
      row_number() over (
        partition by source_totals.candidate_character_id
        order by source_totals.source_contribution desc, source_totals.source_support_count desc, source_totals.source_character_id
      ) as source_rank
    from source_totals
  ), candidate_contributions as (
    select
      ranked_sources.candidate_character_id,
      jsonb_agg(
        jsonb_build_object(
          'characterId', ranked_sources.source_character_id,
          'characterSlug', source_character.slug,
          'characterName', source_character.display_name,
          'gameSlug', source_game.slug,
          'contribution', ranked_sources.source_contribution,
          'supportCount', ranked_sources.source_support_count
        )
        order by ranked_sources.source_rank
      ) as contributions
    from ranked_sources
    join public.characters source_character on source_character.id = ranked_sources.source_character_id
    join public.game_versions source_game on source_game.id = source_character.game_version_id
    where ranked_sources.source_rank <= 5
    group by ranked_sources.candidate_character_id
  ), ranked as (
    select
      candidate_totals.*,
      row_number() over (
        order by candidate_totals.candidate_score desc, candidate_totals.candidate_support_count desc, candidate_totals.candidate_character_id
      )::integer as candidate_rank
    from candidate_totals
    where candidate_totals.candidate_support_count > 0
  )
  select
    ranked.candidate_character_id,
    candidate_character.display_name,
    ranked.candidate_rank,
    ranked.candidate_score,
    ranked.candidate_support_count,
    coalesce(candidate_contributions.contributions, '[]'::jsonb),
    'association-v1'::text
  from ranked
  join public.characters candidate_character on candidate_character.id = ranked.candidate_character_id
  left join candidate_contributions
    on candidate_contributions.candidate_character_id = ranked.candidate_character_id
  order by ranked.candidate_rank
  limit 20;
$$;

revoke all on function public.recommend_characters(uuid, uuid) from public, anon, authenticated, service_role;
grant execute on function public.recommend_characters(uuid, uuid) to authenticated;

comment on function public.recommend_characters(uuid, uuid) is
  'association-v1 candidates with candidate-level support and the strongest observed contributing source Characters. Reads only eligible public signatures; never reads recommendation_feedback.';

create or replace function public.run_my_recommendations(p_target_game_version_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  candidate_payload jsonb;
  run_id uuid;
  run_created_at timestamptz;
begin
  if subject is null then
    raise exception 'Authentication is required.' using errcode = '42501';
  end if;
  if not exists (select 1 from public.profiles p where p.id = subject) then
    raise exception 'Create a registered MainStation profile before requesting recommendations.' using errcode = '23503';
  end if;
  if not exists (
    select 1
    from public.game_versions gv
    where gv.id = p_target_game_version_id
      and gv.active
  ) then
    raise exception 'The target Game Version is unavailable.' using errcode = '22023';
  end if;

  select coalesce(jsonb_agg(
    jsonb_build_object(
      'characterId', recommendation.character_id,
      'characterSlug', character_row.slug,
      'characterName', recommendation.character_name,
      'rank', recommendation.rank,
      'score', recommendation.score,
      'supportCount', recommendation.support_count,
      'contributions', recommendation.contributions,
      'policyVersion', recommendation.policy_version
    )
    order by recommendation.rank
  ), '[]'::jsonb)
  into candidate_payload
  from public.recommend_characters(subject, p_target_game_version_id) recommendation
  join public.characters character_row on character_row.id = recommendation.character_id;

  insert into public.recommendation_runs (
    owner_id,
    target_game_version_id,
    scoring_policy,
    candidates
  ) values (
    subject,
    p_target_game_version_id,
    'association-v1',
    candidate_payload
  )
  returning id, created_at into run_id, run_created_at;

  return jsonb_build_object(
    'runId', run_id,
    'targetGameVersionId', p_target_game_version_id,
    'policyVersion', 'association-v1',
    -- ADR-018: zero observed support is a named state, never a popularity fallback.
    'state', case when jsonb_array_length(candidate_payload) = 0 then 'not_enough_data' else 'ok' end,
    'candidates', candidate_payload,
    'createdAt', run_created_at
  );
end;
$$;

revoke all on function public.run_my_recommendations(uuid) from public, anon, authenticated, service_role;
grant execute on function public.run_my_recommendations(uuid) to authenticated;

comment on function public.run_my_recommendations(uuid) is
  'Computes association-v1 candidates with contributing associations from eligible public profile signatures, returns an explicit not_enough_data state on zero support, and atomically records the immutable audit run.';

-- MS-028: privacy in the derived stack is enforced by this predicate, not by RLS.
-- run_my_recommendations is SECURITY DEFINER, so the signature view below it runs as
-- the migration owner and RLS on public.lineups is bypassed. Any change to this view
-- must keep the visibility/completeness filter or private Lineups leak into public
-- reads, recommendations, and every derived count.
comment on view public.public_lineups is
  'Eligibility gate for every derived public surface. Filters visibility = public, is_complete, and lineup_is_publishable in the view body so hide and delete take effect on the next read. Do not remove these predicates: callers reach this view through SECURITY DEFINER functions where RLS on public.lineups does not apply.';
