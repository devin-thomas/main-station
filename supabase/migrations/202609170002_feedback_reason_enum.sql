-- SPEC §13 requires "an optional structured reason list" for feedback.
-- recommendation_feedback.reason_code was text with only a format check in the function.
-- Replace it with a bounded enum so the column itself enforces the allowed values.

create type public.feedback_reason as enum (
  'too_complex',
  'not_my_style',
  'poor_matchups',
  'looks_fun',
  'fits_my_team',
  'want_to_learn'
);

comment on type public.feedback_reason is
  'Structured sub-reasons for recommendation feedback, per SPEC §13. Values are analytics labels kept intentionally small for launch.';

-- Convert the column: NULL stays NULL, any existing text values that match a valid
-- code are preserved, unrecognised codes (none expected in launch data) become NULL.
alter table public.recommendation_feedback
  alter column reason_code drop default,
  alter column reason_code type public.feedback_reason
    using (
      case reason_code
        when 'too_complex'    then 'too_complex'::public.feedback_reason
        when 'not_my_style'   then 'not_my_style'::public.feedback_reason
        when 'poor_matchups'  then 'poor_matchups'::public.feedback_reason
        when 'looks_fun'      then 'looks_fun'::public.feedback_reason
        when 'fits_my_team'   then 'fits_my_team'::public.feedback_reason
        when 'want_to_learn'  then 'want_to_learn'::public.feedback_reason
        else null
      end
    );

-- Re-create record_recommendation_feedback with typed p_reason_code.
create or replace function public.record_recommendation_feedback(
  p_recommendation_run_id uuid,
  p_character_id uuid,
  p_response public.feedback_response,
  p_reason_code public.feedback_reason default null
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

revoke all on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, public.feedback_reason) from public, anon, authenticated, service_role;
grant execute on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, public.feedback_reason) to authenticated;

-- The old text-signature overload is superseded; revoke it so callers must use the typed one.
revoke all on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, text) from public, anon, authenticated, service_role;

comment on function public.record_recommendation_feedback(uuid, uuid, public.feedback_response, public.feedback_reason) is
  'Records analytics-only feedback for a candidate contained in the authenticated owner Recommendation Run. reason_code is a bounded feedback_reason enum per SPEC §13.';
