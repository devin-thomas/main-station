-- A guest draft can be joined to an existing account without allowing browser
-- identity fields or an out-of-date local snapshot to replace registered data.
create or replace function public.get_my_profile_draft()
returns jsonb
language plpgsql
volatile
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
          -- client_request_id is the durable lineage used for merge dedupe.
          'id', l.client_request_id,
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

create or replace function public.merge_my_guest_draft(p_payload jsonb, p_request_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  receipt_response jsonb;
  receipt_completed_at timestamptz;
  registered_draft jsonb;
  merged_lineups jsonb;
  registered_lineup jsonb;
  guest_lineup jsonb;
  candidate_lineup jsonb;
  result jsonb;
  added_count integer := 0;
  duplicate_count integer := 0;
  conflict_count integer := 0;
begin
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
  end if;
  perform pg_catalog.pg_advisory_xact_lock(pg_catalog.hashtextextended(subject::text, 0));
  if not exists (select 1 from public.profiles where id = subject) then
    raise exception 'Create a registered MainStation profile before merging a guest draft.' using errcode = 'P0002';
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

  registered_draft := public.get_my_profile_draft();
  if registered_draft is null then
    raise exception 'Registered profile not found.' using errcode = 'P0002';
  end if;
  if jsonb_typeof(p_payload) is distinct from 'object'
    or jsonb_typeof(p_payload -> 'lineups') is distinct from 'array'
  then
    raise exception 'Draft payload requires a Lineup list.' using errcode = '22023';
  end if;

  merged_lineups := coalesce(registered_draft -> 'lineups', '[]'::jsonb);
  for guest_lineup in select value from jsonb_array_elements(p_payload -> 'lineups')
  loop
    -- Equality is semantic: IDs and timestamps are lineage/audit details, not a second saved main.
    if exists (
      select 1
      from jsonb_array_elements(merged_lineups) existing(value)
      where (existing.value - 'id' - 'createdAt') = (guest_lineup - 'id' - 'createdAt')
    ) then
      duplicate_count := duplicate_count + 1;
      continue;
    end if;

    candidate_lineup := guest_lineup;
    if exists (
      select 1
      from jsonb_array_elements(merged_lineups) existing(value)
      where existing.value ->> 'id' = guest_lineup ->> 'id'
    ) then
      candidate_lineup := jsonb_set(
        guest_lineup,
        '{id}',
        to_jsonb(extensions.gen_random_uuid()::text)
      );
      conflict_count := conflict_count + 1;
    end if;
    merged_lineups := merged_lineups || jsonb_build_array(candidate_lineup);
    added_count := added_count + 1;
  end loop;

  -- Registered identity is preserved; apply_profile_draft revalidates the complete union.
  result := mainstation_private.apply_profile_draft(
    subject,
    jsonb_set(
      jsonb_set(p_payload, '{profile}', registered_draft -> 'profile'),
      '{lineups}', merged_lineups
    ),
    p_request_id,
    true
  );
  result := result || jsonb_build_object(
    'addedLineupCount', added_count,
    'duplicateLineupCount', duplicate_count,
    'conflictingLineupCount', conflict_count,
    'draft', public.get_my_profile_draft()
  );
  update public.profile_claims
  set response = result, completed_at = now()
  where owner_id = subject and request_id = p_request_id;
  return result;
end;
$$;

revoke all on function public.merge_my_guest_draft(jsonb, uuid) from public, anon, authenticated, service_role;
grant execute on function public.merge_my_guest_draft(jsonb, uuid) to authenticated;

comment on function public.get_my_profile_draft() is 'Returns the authenticated owner complete registered MainStation draft using stable client Lineup lineage IDs.';
comment on function public.merge_my_guest_draft(jsonb, uuid) is 'Atomically unions a guest draft into an existing profile. Registered identity wins; semantic duplicates are retained once.';
