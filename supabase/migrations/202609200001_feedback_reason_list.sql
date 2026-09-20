-- SPEC 13 describes feedback as a bounded enum response "with an optional structured
-- reason list". The launch schema stored a single `reason_code`, which cannot express a
-- player picking more than one reason. This replaces it with a bounded list.
--
-- Bounds are enforced in the column so they hold regardless of which path writes the row:
-- at most 5 reasons, each matching the existing slug shape, no duplicates, no nulls.

alter table public.recommendation_feedback
  add column reason_codes text[] not null default '{}';

-- Carry any existing single reason across. Empty at the time of writing, but the migration
-- must not depend on that.
update public.recommendation_feedback
set reason_codes = array[reason_code]
where reason_code is not null;

alter table public.recommendation_feedback
  drop column reason_code;

-- A CHECK expression cannot contain a subquery, and the bounds need to walk the array,
-- so the predicate lives in an immutable helper the constraint calls.
create or replace function public.reason_codes_are_valid(p_codes text[])
returns boolean
language sql
immutable
set search_path = ''
as $$
  select p_codes is null
    or array_length(p_codes, 1) is null
    or (
      array_length(p_codes, 1) <= 5
      and array_position(p_codes, null) is null
      and not exists (
        select 1 from unnest(p_codes) as code
        where length(code) > 64 or code !~ '^[a-z0-9][a-z0-9-]*$'
      )
      and (select count(distinct code) = count(*) from unnest(p_codes) as code)
    );
$$;

revoke all on function public.reason_codes_are_valid(text[]) from public, anon, authenticated, service_role;

alter table public.recommendation_feedback
  add constraint recommendation_feedback_reason_codes_bounded
  check (public.reason_codes_are_valid(reason_codes));

comment on column public.recommendation_feedback.reason_codes is
  'Optional structured reason list (SPEC 13). Bounded to 5 distinct slugs; analytics only, never read by signature-v1 or association-v1.';

-- The parameter type changes, so the old signature must go rather than be overloaded:
-- two callable shapes would let a caller reach the unbounded single-reason path.
drop function if exists public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text);

create function public.record_recommendation_feedback(
  p_recommendation_run_id uuid,
  p_character_id uuid,
  p_response public.feedback_response,
  p_reason_codes text[] default '{}'
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  feedback_row public.recommendation_feedback;
  cleaned text[];
begin
  if subject is null then
    raise exception 'Authentication is required.' using errcode = '42501';
  end if;

  -- Normalise before validating so a caller cannot smuggle duplicates past the check
  -- through casing or padding.
  select coalesce(array_agg(distinct trimmed order by trimmed), '{}')
  into cleaned
  from (
    select lower(btrim(code)) as trimmed
    from unnest(coalesce(p_reason_codes, '{}')) as code
    where btrim(code) <> ''
  ) as normalised;

  if array_length(cleaned, 1) > 5 then
    raise exception 'Give at most five feedback reasons.' using errcode = '22023';
  end if;
  if exists (
    select 1 from unnest(cleaned) as code
    where length(code) > 64 or code !~ '^[a-z0-9][a-z0-9-]*$'
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
    reason_codes
  ) values (
    p_recommendation_run_id,
    subject,
    p_character_id,
    p_response,
    cleaned
  )
  on conflict (owner_id, recommendation_run_id, character_id)
  do update set
    response = excluded.response,
    reason_codes = excluded.reason_codes
  returning * into feedback_row;

  return jsonb_build_object(
    'feedbackId', feedback_row.id,
    'recommendationRunId', feedback_row.recommendation_run_id,
    'characterId', feedback_row.character_id,
    'response', feedback_row.response,
    'reasonCodes', to_jsonb(feedback_row.reason_codes),
    'updatedAt', feedback_row.updated_at
  );
end;
$$;

revoke all on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text[]) from public, anon, authenticated, service_role;
grant execute on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text[]) to authenticated;

comment on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text[]) is
  'Records analytics-only feedback for a candidate contained in the authenticated owner Recommendation Run, with an optional bounded reason list.';
