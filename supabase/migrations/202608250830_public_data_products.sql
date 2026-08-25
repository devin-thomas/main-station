create or replace function public.get_my_profile_draft()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  result jsonb;
begin
  if subject is null then
    raise exception 'Authentication is required.' using errcode = '42501';
  end if;

  select jsonb_build_object(
    'version', 1,
    'requestId', '00000000-0000-4000-8000-000000000000',
    'profile', jsonb_build_object(
      'handle', p.handle,
      'displayName', p.display_name,
      'bio', coalesce(p.bio, '')
    ),
    'lineups', coalesce((
      select jsonb_agg(
        jsonb_strip_nulls(jsonb_build_object(
          'id', l.id,
          'gameSlug', gv.slug,
          'category', l.category,
          'lifecycle', l.lifecycle,
          'visibility', l.visibility,
          'teamOption', l.options ->> 'selection',
          'picks', coalesce((
            select jsonb_agg(
              jsonb_strip_nulls(jsonb_build_object(
                'slotId', cp.slot_id,
                'characterSlug', c.slug,
                'option', cp.options ->> 'selection'
              ))
              order by cp.slot_index
            )
            from public.character_picks cp
            join public.characters c
              on c.id = cp.character_id
              and c.game_version_id = cp.game_version_id
            where cp.lineup_id = l.id
          ), '[]'::jsonb),
          'createdAt', l.created_at
        ))
        order by l.sort_order, l.created_at
      )
      from public.lineups l
      join public.game_versions gv on gv.id = l.game_version_id
      where l.owner_id = subject
    ), '[]'::jsonb),
    'updatedAt', p.updated_at
  )
  into result
  from public.profiles p
  where p.id = subject;

  return result;
end;
$$;

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
    'candidates', candidate_payload,
    'createdAt', run_created_at
  );
end;
$$;

create or replace function public.record_recommendation_feedback(
  p_recommendation_run_id uuid,
  p_character_id uuid,
  p_response public.feedback_response,
  p_reason_code text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  feedback_row public.recommendation_feedback;
begin
  if subject is null then
    raise exception 'Authentication is required.' using errcode = '42501';
  end if;
  if p_reason_code is not null and (
    length(p_reason_code) > 64
    or p_reason_code !~ '^[a-z0-9][a-z0-9-]*$'
  ) then
    raise exception 'Feedback reason code is invalid.' using errcode = '22023';
  end if;
  if not exists (
    select 1
    from public.recommendation_runs recommendation_run
    cross join lateral jsonb_array_elements(recommendation_run.candidates) candidate
    where recommendation_run.id = p_recommendation_run_id
      and recommendation_run.owner_id = subject
      and candidate ->> 'characterId' = p_character_id::text
  ) then
    raise exception 'Recommendation candidate not found or not owned by the current user.' using errcode = '42501';
  end if;

  insert into public.recommendation_feedback (
    recommendation_run_id,
    owner_id,
    character_id,
    response,
    reason_code
  ) values (
    p_recommendation_run_id,
    subject,
    p_character_id,
    p_response,
    p_reason_code
  )
  on conflict (owner_id, recommendation_run_id, character_id)
  do update set
    response = excluded.response,
    reason_code = excluded.reason_code
  returning * into feedback_row;

  return jsonb_build_object(
    'feedbackId', feedback_row.id,
    'recommendationRunId', feedback_row.recommendation_run_id,
    'characterId', feedback_row.character_id,
    'response', feedback_row.response,
    'reasonCode', feedback_row.reason_code,
    'updatedAt', feedback_row.updated_at
  );
end;
$$;

revoke insert, update on table public.recommendation_runs from authenticated;
revoke insert, update on table public.recommendation_feedback from authenticated;

revoke all on function public.get_my_profile_draft() from public, anon, authenticated, service_role;
revoke all on function public.run_my_recommendations(uuid) from public, anon, authenticated, service_role;
revoke all on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text) from public, anon, authenticated, service_role;

grant execute on function public.get_my_profile_draft() to authenticated;
grant execute on function public.run_my_recommendations(uuid) to authenticated;
grant execute on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text) to authenticated;

comment on function public.get_my_profile_draft() is 'Returns the authenticated owner complete registered MainStation draft, including private Lineups, for explicit local editing.';
comment on function public.run_my_recommendations(uuid) is 'Computes association-v1 candidates from eligible public profile signatures and atomically records the immutable audit run.';
comment on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text) is 'Records analytics-only feedback for a candidate contained in the authenticated owner Recommendation Run.';
