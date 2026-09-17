-- Extend recommend_characters to return top-3 source character contributions per candidate.
-- Extends run_my_recommendations to include contributions in the stored candidate payload.

create or replace function public.recommend_characters(p_profile_id uuid, p_target_game_version_id uuid)
returns table (
  character_id uuid,
  character_name text,
  rank integer,
  score numeric,
  support_count bigint,
  policy_version text,
  contributions jsonb
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
  ), candidate_scores as (
    select
      population_target.character_id,
      sum(requester.normalized_weight * population_source.normalized_weight * population_target.normalized_weight)::numeric as score,
      count(distinct population_source.profile_id)::bigint as support_count
    from requester
    join public.player_game_signatures population_source
      on population_source.character_id = requester.character_id
      and population_source.profile_id <> p_profile_id
    join public.player_game_signatures population_target
      on population_target.profile_id = population_source.profile_id
      and population_target.game_version_id = p_target_game_version_id
    group by population_target.character_id
  ), ranked as (
    select
      candidate_scores.*,
      row_number() over (order by candidate_scores.score desc, candidate_scores.support_count desc, candidate_scores.character_id)::integer as candidate_rank
    from candidate_scores
    where candidate_scores.support_count > 0
  ), source_char_contributions as (
    select
      population_target.character_id as target_character_id,
      requester.character_id as source_character_id,
      sum(requester.normalized_weight * population_source.normalized_weight * population_target.normalized_weight)::numeric as contribution
    from requester
    join public.player_game_signatures population_source
      on population_source.character_id = requester.character_id
      and population_source.profile_id <> p_profile_id
    join public.player_game_signatures population_target
      on population_target.profile_id = population_source.profile_id
      and population_target.game_version_id = p_target_game_version_id
    group by population_target.character_id, requester.character_id
  ), top_contributions as (
    select
      rc.target_character_id,
      jsonb_agg(
        jsonb_build_object(
          'characterId', rc.source_character_id,
          'characterName', src_char.display_name,
          'characterSlug', src_char.slug,
          'contribution', rc.contribution
        )
        order by rc.contribution desc
      ) as contributions
    from (
      select
        scc.*,
        row_number() over (partition by scc.target_character_id order by scc.contribution desc, scc.source_character_id) as rn
      from source_char_contributions scc
      where exists (select 1 from ranked where ranked.character_id = scc.target_character_id)
    ) rc
    join public.characters src_char on src_char.id = rc.source_character_id
    where rc.rn <= 3
    group by rc.target_character_id
  )
  select
    ranked.character_id,
    c.display_name,
    ranked.candidate_rank,
    ranked.score,
    ranked.support_count,
    'association-v1'::text,
    coalesce(tc.contributions, '[]'::jsonb)
  from ranked
  join public.characters c on c.id = ranked.character_id
  left join top_contributions tc on tc.target_character_id = ranked.character_id
  order by ranked.candidate_rank
  limit 20;
$$;

create or replace function public.run_my_recommendations(p_target_game_version_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid;
  candidate_payload jsonb;
  run_id uuid;
  run_created_at timestamptz;
begin
  subject := (select auth.uid());
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
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
      'policyVersion', recommendation.policy_version,
      'contributions', recommendation.contributions
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
    'candidates', candidate_payload,
    'createdAt', run_created_at
  );
end;
$$;

comment on function public.recommend_characters(uuid, uuid) is 'Returns association-v1 ranked candidates with top-3 source character contributions for the requesting profile.';
comment on function public.run_my_recommendations(uuid) is 'Computes association-v1 candidates with source character contributions and atomically records the immutable audit run.';
