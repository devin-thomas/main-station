-- Creation starts in a confirmed account session. Existing signed-in create,
-- save, and reload contracts stay stable; guest/account reconciliation is retired.
drop function public.merge_my_guest_draft(jsonb, uuid);

create or replace function public.save_my_profile_draft(p_payload jsonb, p_request_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  receipt_response jsonb;
  receipt_completed_at timestamptz;
  result jsonb;
begin
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
  end if;
  perform pg_catalog.pg_advisory_xact_lock(pg_catalog.hashtextextended(subject::text, 0));
  if not exists (select 1 from public.profiles where id = subject) then
    raise exception 'Create your MainStation profile before saving changes.' using errcode = 'P0002';
  end if;

  insert into public.profile_claims (owner_id, request_id)
  values (subject, p_request_id)
  on conflict (owner_id, request_id) do nothing;

  select response, completed_at into receipt_response, receipt_completed_at
  from public.profile_claims
  where owner_id = subject and request_id = p_request_id
  for update;

  if receipt_completed_at is not null then
    return receipt_response;
  end if;

  result := mainstation_private.apply_profile_draft(subject, p_payload, p_request_id, true);
  update public.profile_claims
  set response = result, completed_at = now()
  where owner_id = subject and request_id = p_request_id;
  return result;
end;
$$;

revoke all on function public.claim_profile_draft(jsonb, uuid) from public, anon, authenticated, service_role;
revoke all on function public.save_my_profile_draft(jsonb, uuid) from public, anon, authenticated, service_role;
revoke all on function public.get_my_profile_draft() from public, anon, authenticated, service_role;
grant execute on function public.claim_profile_draft(jsonb, uuid) to authenticated;
grant execute on function public.save_my_profile_draft(jsonb, uuid) to authenticated;
grant execute on function public.get_my_profile_draft() to authenticated;

comment on function public.claim_profile_draft(jsonb, uuid) is 'Creates the authenticated owner initial profile and Mainline atomically. The legacy RPC name is retained for compatibility.';
comment on function public.save_my_profile_draft(jsonb, uuid) is 'Replaces the authenticated owner profile and Mainline atomically.';
comment on function public.get_my_profile_draft() is 'Returns the authenticated owner profile and Mainline, including private Lineups and stable client Lineup IDs.';
