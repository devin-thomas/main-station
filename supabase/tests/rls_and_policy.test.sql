begin;

select plan(86);

select has_table('public', 'profiles', 'profiles exists');
select has_table('public', 'lineups', 'lineups exists');
select has_table('public', 'character_picks', 'character picks exists');
select has_table('public', 'recommendation_feedback', 'feedback exists');
select has_view('public', 'player_game_signatures', 'signature view exists');
select has_view('public', 'public_profile_mainline', 'public profile Mainline view exists');
select has_function('public', 'recommend_characters', array['uuid', 'uuid'], 'recommendation RPC exists');
select has_function('public', 'delete_my_account', array[]::text[], 'account deletion RPC exists');
select has_function('public', 'claim_profile_draft', array['jsonb', 'uuid'], 'guest-draft claim RPC exists');
select has_function('public', 'save_my_profile_draft', array['jsonb', 'uuid'], 'registered-draft save RPC exists');

select results_eq(
  $$select count(*)::integer
    from (values ('anon'), ('authenticated'), ('service_role')) as caller(role_name)
    where has_schema_privilege(caller.role_name, 'mainstation_private', 'USAGE')$$,
  array[0::integer],
  'application roles cannot enter the private draft writer schema'
);

select policies_are(
  'public',
  'character_picks',
  array[
    'character_picks_owner_delete',
    'character_picks_owner_insert',
    'character_picks_owner_update',
    'character_picks_public_or_owner_read'
  ],
  'child Pick policies inherit access through the owner Lineup'
);

select results_eq(
  $$select (position('recommendation_feedback' in pg_get_viewdef('public.player_game_signatures'::regclass, true)) > 0)::integer$$,
  array[0::integer],
  'signature SQL does not reference analytics-only feedback'
);

select has_trigger(
  'public',
  'lineups',
  'lineups_require_complete_selection',
  'Lineup changes recheck completed Selection Schemas'
);

select has_trigger(
  'public',
  'character_picks',
  'completed_lineups_recheck_character_picks',
  'Pick changes recheck completed Lineups'
);

select has_trigger(
  'public',
  'game_versions',
  'game_versions_revalidate_completed_lineups',
  'Selection Schema changes revalidate completed Lineups'
);

select has_trigger(
  'public',
  'characters',
  'characters_revalidate_completed_lineups',
  'Character eligibility changes revalidate completed Lineups'
);

select results_eq(
  $$select count(*)::integer
    from pg_constraint constraint_row
    where constraint_row.contype = 'f'
      and constraint_row.connamespace = 'public'::regnamespace
      and not exists (
        select 1
        from pg_index index_row
        where index_row.indrelid = constraint_row.conrelid
          and index_row.indpred is null
          and index_row.indnkeyatts >= cardinality(constraint_row.conkey)
          and not exists (
            select 1
            from unnest(constraint_row.conkey) with ordinality as foreign_key(attnum, position)
            where (index_row.indkey::smallint[])[foreign_key.position - 1] <> foreign_key.attnum
          )
      )$$,
  array[0::integer],
  'Every public foreign key has a matching referencing-side index prefix'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true}'::jsonb),
  true,
  'Selection Schemas require slots'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]}]}'::jsonb),
  true,
  'Selection Schemas require a verified boolean'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","verified":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]}]}'::jsonb),
  true,
  'Selection Schemas require an ordered boolean'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","verified":true,"ordered":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]}]}'::jsonb),
  true,
  'Selection Schemas require a uniqueCharacters boolean'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]},{"id":"slot-a","label":"B","allowedRoles":["fighter"]}]}'::jsonb),
  true,
  'Selection Schemas reject duplicate slot IDs'
);

select isnt(
  public.selection_schema_is_valid('{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A"}]}'::jsonb),
  true,
  'Selection Schemas require allowed roles for every slot'
);

select throws_ok(
  $$insert into public.game_versions (
      slug, name, short_name, release_label, launch_order, selection_schema,
      catalog_source_url, catalog_status, source_checked_at
    ) values (
      'test-malformed', 'Test Malformed', 'BAD', 'Test rules', 29999,
      '{"version":1,"noun":"Team"}'::jsonb,
      'https://example.invalid/test-malformed', 'preview', now()
    )$$,
  '23514',
  'new row for relation "game_versions" violates check constraint "game_versions_selection_schema_valid"',
  'the Game Version table rejects a malformed Selection Schema'
);

select isnt(
  has_function_privilege('anon', 'public.lineup_is_complete(uuid)', 'EXECUTE'),
  true,
  'anonymous callers cannot execute the internal completeness checker'
);

select ok(
  has_function_privilege('authenticated', 'public.lineup_is_complete(uuid)', 'EXECUTE'),
  'authenticated mutations can execute the completeness checker'
);

select ok(
  has_function_privilege('service_role', 'public.lineup_is_complete(uuid)', 'EXECUTE'),
  'service-role catalog revalidation can execute the completeness checker'
);

select ok(
  has_function_privilege('anon', 'public.lineup_is_publishable(uuid)', 'EXECUTE'),
  'anonymous RLS can execute the non-leaking publishability helper'
);

select ok(
  has_function_privilege('authenticated', 'public.lineup_is_publishable(uuid)', 'EXECUTE'),
  'authenticated RLS can execute the publishability helper'
);

select ok(
  has_function_privilege('service_role', 'public.lineup_is_publishable(uuid)', 'EXECUTE'),
  'service-role checks can execute the publishability helper'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.finalize_lineup(uuid)'),
      ('public.recommend_characters(uuid,uuid)'),
      ('public.export_my_profile()'),
      ('public.delete_my_account()'),
      ('public.claim_profile_draft(jsonb,uuid)'),
      ('public.save_my_profile_draft(jsonb,uuid)')
    ) as rpc(signature)
    where has_function_privilege('anon', rpc.signature, 'EXECUTE')$$,
  array[0::integer],
  'anonymous callers cannot execute authenticated RPCs'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.finalize_lineup(uuid)'),
      ('public.recommend_characters(uuid,uuid)'),
      ('public.export_my_profile()'),
      ('public.delete_my_account()'),
      ('public.claim_profile_draft(jsonb,uuid)'),
      ('public.save_my_profile_draft(jsonb,uuid)')
    ) as rpc(signature)
    where has_function_privilege('authenticated', rpc.signature, 'EXECUTE')$$,
  array[6::integer],
  'authenticated callers can execute the six account RPCs'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.finalize_lineup(uuid)'),
      ('public.recommend_characters(uuid,uuid)'),
      ('public.export_my_profile()'),
      ('public.delete_my_account()'),
      ('public.claim_profile_draft(jsonb,uuid)'),
      ('public.save_my_profile_draft(jsonb,uuid)')
    ) as rpc(signature)
    where has_function_privilege('service_role', rpc.signature, 'EXECUTE')$$,
  array[0::integer],
  'service_role does not inherit user-facing RPC execution'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.profiles'),
      ('public.game_versions'),
      ('public.characters'),
      ('public.character_art_assets'),
      ('public.lineups'),
      ('public.character_picks'),
      ('public.profile_claims'),
      ('public.recommendation_runs'),
      ('public.recommendation_feedback')
    ) as protected_table(signature)
    cross join (values ('SELECT'), ('INSERT'), ('UPDATE'), ('DELETE')) as required_privilege(privilege)
    where has_table_privilege('service_role', protected_table.signature, required_privilege.privilege)$$,
  array[36::integer],
  'service_role receives explicit data privileges for trusted backend work'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.profiles'),
      ('public.game_versions'),
      ('public.characters'),
      ('public.character_art_assets'),
      ('public.lineups'),
      ('public.character_picks'),
      ('public.profile_claims'),
      ('public.recommendation_runs'),
      ('public.recommendation_feedback')
    ) as protected_table(signature)
    cross join (values ('INSERT'), ('UPDATE'), ('DELETE'), ('TRUNCATE'), ('REFERENCES'), ('TRIGGER')) as forbidden_privilege(privilege)
    where has_table_privilege('anon', protected_table.signature, forbidden_privilege.privilege)$$,
  array[0::integer],
  'anonymous callers receive no direct mutation or table-control privileges'
);

select results_eq(
  $$select
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'INSERT'))::integer,
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'UPDATE'))::integer,
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'DELETE'))::integer,
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'TRUNCATE'))::integer,
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'REFERENCES'))::integer,
      count(*) filter (where has_table_privilege('authenticated', protected_table.signature, 'TRIGGER'))::integer
    from (values
      ('public.profiles'),
      ('public.game_versions'),
      ('public.characters'),
      ('public.character_art_assets'),
      ('public.lineups'),
      ('public.character_picks'),
      ('public.profile_claims'),
      ('public.recommendation_runs'),
      ('public.recommendation_feedback')
    ) as protected_table(signature)$$,
  $$values (5::integer, 4::integer, 2::integer, 0::integer, 0::integer, 0::integer)$$,
  'authenticated table privileges match the explicit RLS-backed write matrix'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.profiles'),
      ('public.game_versions'),
      ('public.characters'),
      ('public.character_art_assets'),
      ('public.lineups'),
      ('public.character_picks'),
      ('public.profile_claims'),
      ('public.recommendation_runs'),
      ('public.recommendation_feedback')
    ) as protected_table(signature)
    cross join (values ('TRUNCATE'), ('REFERENCES'), ('TRIGGER')) as forbidden_privilege(privilege)
    where has_table_privilege('service_role', protected_table.signature, forbidden_privilege.privilege)$$,
  array[0::integer],
  'service_role receives CRUD without table-control privileges'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.public_lineups'),
      ('public.registered_player_counts'),
      ('public.character_usage_stats'),
      ('public.player_game_signatures'),
      ('public.public_profile_mainline')
    ) as public_view(signature)
    cross join (values ('anon'), ('authenticated')) as caller(role_name)
    cross join (values ('INSERT'), ('UPDATE'), ('DELETE'), ('TRUNCATE'), ('REFERENCES'), ('TRIGGER')) as forbidden_privilege(privilege)
    where has_table_privilege(caller.role_name, public_view.signature, forbidden_privilege.privilege)$$,
  array[0::integer],
  'public derived views are read-only to browser roles'
);

select results_eq(
  $$select count(*)::integer
    from (values
      ('public.set_updated_at()'),
      ('public.enforce_pick_lineup_game()'),
      ('public.prevent_invalid_complete_lineup()'),
      ('public.prevent_invalid_complete_lineup_after_pick()'),
      ('public.revalidate_lineups_after_schema_change()'),
      ('public.revalidate_lineups_after_character_change()')
    ) as trigger_function(signature)
    where has_function_privilege('anon', trigger_function.signature, 'EXECUTE')$$,
  array[0::integer],
  'anonymous callers receive no direct trigger-function execution grants'
);

select ok(
  has_function_privilege('service_role', 'public.selection_schema_is_valid(jsonb)', 'EXECUTE'),
  'service-role catalog writes can execute Selection Schema validation'
);

select isnt(
  has_function_privilege('anon', 'public.selection_schema_is_valid(jsonb)', 'EXECUTE'),
  true,
  'anonymous callers cannot probe Selection Schema validation as an RPC'
);

insert into auth.users (
  id,
  instance_id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  raw_app_meta_data,
  raw_user_meta_data,
  created_at,
  updated_at
) values
  (
    '10000000-0000-4000-8000-000000000001',
    '00000000-0000-0000-0000-000000000000',
    'authenticated',
    'authenticated',
    'owner-a@example.invalid',
    '',
    now(),
    '{}'::jsonb,
    '{}'::jsonb,
    now(),
    now()
  ),
  (
    '10000000-0000-4000-8000-000000000002',
    '00000000-0000-0000-0000-000000000000',
    'authenticated',
    'authenticated',
    'owner-b@example.invalid',
    '',
    now(),
    '{}'::jsonb,
    '{}'::jsonb,
    now(),
    now()
  ),
  (
    '10000000-0000-4000-8000-000000000003',
    '00000000-0000-0000-0000-000000000000',
    'authenticated',
    'authenticated',
    'claim-owner@example.invalid',
    '',
    now(),
    '{}'::jsonb,
    '{}'::jsonb,
    now(),
    now()
  );

insert into public.profiles (id, handle, display_name)
values
  ('10000000-0000-4000-8000-000000000001', 'owner-a', 'Owner A'),
  ('10000000-0000-4000-8000-000000000002', 'owner-b', 'Owner B');

insert into public.game_versions (
  id,
  slug,
  name,
  short_name,
  release_label,
  launch_order,
  selection_schema,
  catalog_source_url,
  catalog_status,
  source_checked_at
) values
  (
    '20000000-0000-4000-8000-000000000001',
    'test-verified',
    'Test Verified',
    'TEST',
    'Test rules',
    30000,
    '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"teamOptionLabel":"Mode","teamOptionValues":["Speed","Power"],"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B"]},{"id":"slot-b","label":"B","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B"]}]}'::jsonb,
    'https://example.invalid/test-verified',
    'verified',
    now()
  ),
  (
    '20000000-0000-4000-8000-000000000002',
    'test-unverified',
    'Test Unverified',
    'LOCKED',
    'Test rules',
    30001,
    '{"version":1,"noun":"Team","verified":false,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]},{"id":"slot-b","label":"B","allowedRoles":["fighter"]}]}'::jsonb,
    'https://example.invalid/test-unverified',
    'preview',
    now()
  ),
  (
    '20000000-0000-4000-8000-000000000003',
    'test-plain',
    'Test Plain',
    'PLAIN',
    'Test rules',
    30002,
    '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
    'https://example.invalid/test-plain',
    'verified',
    now()
  );

insert into public.characters (
  id,
  game_version_id,
  slug,
  display_name,
  roster_role,
  summary,
  summary_source_url,
  summary_source_publisher,
  source_checked_at
) values
  ('30000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'alpha', 'Alpha', 'fighter', 'Fixture.', 'https://example.invalid/alpha', 'Test', now()),
  ('30000000-0000-4000-8000-000000000002', '20000000-0000-4000-8000-000000000001', 'beta', 'Beta', 'fighter', 'Fixture.', 'https://example.invalid/beta', 'Test', now()),
  ('30000000-0000-4000-8000-000000000003', '20000000-0000-4000-8000-000000000002', 'gamma', 'Gamma', 'fighter', 'Fixture.', 'https://example.invalid/gamma', 'Test', now()),
  ('30000000-0000-4000-8000-000000000004', '20000000-0000-4000-8000-000000000002', 'delta', 'Delta', 'fighter', 'Fixture.', 'https://example.invalid/delta', 'Test', now()),
  ('30000000-0000-4000-8000-000000000005', '20000000-0000-4000-8000-000000000003', 'epsilon', 'Epsilon', 'fighter', 'Fixture.', 'https://example.invalid/epsilon', 'Test', now());

select set_config(
  'mainstation_test.claim_payload',
  $payload${
    "version": 1,
    "requestId": "81000000-0000-4000-8000-000000000001",
    "updatedAt": "2026-08-24T00:00:00.000Z",
    "profile": {"displayName": "Claim Owner", "handle": "claim-owner", "bio": "Claim flow fixture."},
    "lineups": [{
      "id": "80000000-0000-4000-8000-000000000001",
      "gameSlug": "test-verified",
      "category": "main",
      "lifecycle": "active",
      "visibility": "public",
      "teamOption": "Speed",
      "createdAt": "2026-08-24T00:00:00.000Z",
      "picks": [
        {"slotId": "slot-a", "characterSlug": "alpha", "option": "Assist A"},
        {"slotId": "slot-b", "characterSlug": "beta", "option": "Assist B"}
      ]
    }]
  }$payload$,
  true
);

set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '10000000-0000-4000-8000-000000000003', true);
end;
$$;

select results_eq(
  $$select public.claim_profile_draft(
      current_setting('mainstation_test.claim_payload')::jsonb,
      '81000000-0000-4000-8000-000000000001'
    ) ->> 'handle'$$,
  array['claim-owner'::text],
  'an authenticated Player can atomically claim a valid guest draft'
);

select results_eq(
  $$select
      (select count(*)::integer from public.profiles where id = '10000000-0000-4000-8000-000000000003'),
      (select count(*)::integer from public.lineups where owner_id = '10000000-0000-4000-8000-000000000003'),
      (select count(*)::integer from public.character_picks cp join public.lineups l on l.id = cp.lineup_id where l.owner_id = '10000000-0000-4000-8000-000000000003')$$,
  $$values (1::integer, 1::integer, 2::integer)$$,
  'claim writes one profile, one complete Team, and its two Picks'
);

select results_eq(
  $$select count(*)::integer, coalesce(sum(jsonb_array_length(picks)), 0)::integer
    from public.public_profile_mainline where handle = 'claim-owner'$$,
  $$values (1::integer, 2::integer)$$,
  'the claimed public Team appears as a complete public Mainline row'
);

select results_eq(
  $$select (public.claim_profile_draft(
      current_setting('mainstation_test.claim_payload')::jsonb,
      '81000000-0000-4000-8000-000000000001'
    ) = (
      select response from public.profile_claims
      where owner_id = '10000000-0000-4000-8000-000000000003'
        and request_id = '81000000-0000-4000-8000-000000000001'
    ))::integer$$,
  array[1::integer],
  'a duplicate claim request returns its original successful receipt'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000002"'::jsonb
        ),
        '{lineups,0,gameSlug}',
        '"test-unverified"'::jsonb
      ),
      '81000000-0000-4000-8000-000000000002'
    )$$,
  '22023',
  'Draft stop 1 uses a Selection Schema still under review.',
  'registered save rejects an unverified Selection Schema'
);

select results_eq(
  $$select display_name, (select count(*)::integer from public.lineups where owner_id = profiles.id)
    from public.profiles where id = '10000000-0000-4000-8000-000000000003'$$,
  $$values ('Claim Owner'::text, 1::integer)$$,
  'a rejected registered save rolls the profile and Mainline back together'
);

select results_eq(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          jsonb_set(
            current_setting('mainstation_test.claim_payload')::jsonb,
            '{requestId}',
            '"81000000-0000-4000-8000-000000000003"'::jsonb
          ),
          '{profile,displayName}',
          '"Claim Owner Updated"'::jsonb
        ),
        '{lineups,0,visibility}',
        '"private"'::jsonb
      ),
      '81000000-0000-4000-8000-000000000003'
    ) ->> 'handle'$$,
  array['claim-owner'::text],
  'registered save atomically replaces an existing profile draft'
);

select results_eq(
  $$select p.display_name, count(l.id)::integer, count(l.id) filter (where l.visibility = 'private')::integer
    from public.profiles p
    left join public.lineups l on l.owner_id = p.id
    where p.id = '10000000-0000-4000-8000-000000000003'
    group by p.display_name$$,
  $$values ('Claim Owner Updated'::text, 1::integer, 1::integer)$$,
  'registered save commits the new identity and private Team together'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          jsonb_set(
            jsonb_set(
              current_setting('mainstation_test.claim_payload')::jsonb,
              '{requestId}',
              '"81000000-0000-4000-8000-000000000004"'::jsonb
            ),
            '{lineups,0,gameSlug}',
            '"test-plain"'::jsonb
          ),
          '{lineups,0,teamOption}',
          '"rogue-team"'::jsonb
        ),
        '{lineups,0,picks}',
        '[{"slotId":"slot-a","characterSlug":"epsilon"}]'::jsonb
      ),
      '81000000-0000-4000-8000-000000000004'
    )$$,
  '22023',
  'Draft stop 1 supplies a Team option not declared by its Selection Schema.',
  'registered save rejects an undeclared Team option'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          jsonb_set(
            current_setting('mainstation_test.claim_payload')::jsonb,
            '{requestId}',
            '"81000000-0000-4000-8000-000000000005"'::jsonb
          ) #- '{lineups,0,teamOption}',
          '{lineups,0,gameSlug}',
          '"test-plain"'::jsonb
        ),
        '{lineups,0,picks}',
        '[{"slotId":"slot-a","characterSlug":"epsilon","option":"rogue-pick"}]'::jsonb
      ),
      '81000000-0000-4000-8000-000000000005'
    )$$,
  '22023',
  'Draft stop 1 supplies an option not declared for slot slot-a.',
  'registered save rejects an undeclared Pick option'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000006"'::jsonb
        ),
        '{profile,bio}',
        to_jsonb(repeat('x', 65536))
      ),
      '81000000-0000-4000-8000-000000000006'
    )$$,
  '22023',
  'Draft payload must be at most 64 KiB.',
  'registered save rejects an oversized payload before persistence'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000007"'::jsonb
        ),
        '{version}',
        '"1"'::jsonb
      ),
      '81000000-0000-4000-8000-000000000007'
    )$$,
  '22023',
  'Draft payload must be a version 1 object.',
  'registered save rejects a string-coerced draft version'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000008"'::jsonb
        ),
        '{profile}',
        '{"handle":123,"displayName":456,"bio":{"x":1}}'::jsonb
      ),
      '81000000-0000-4000-8000-000000000008'
    )$$,
  '22023',
  'Draft profile fields must use their declared JSON types.',
  'registered save rejects scalar coercion in profile fields'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000009"'::jsonb
        ),
        '{lineups,0,gameSlug}',
        '123'::jsonb
      ),
      '81000000-0000-4000-8000-000000000009'
    )$$,
  '22023',
  'Draft stop 1 fields must use their declared JSON types.',
  'registered save rejects scalar coercion in Lineup fields'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        jsonb_set(
          current_setting('mainstation_test.claim_payload')::jsonb,
          '{requestId}',
          '"81000000-0000-4000-8000-000000000010"'::jsonb
        ),
        '{lineups,0,picks,0,slotId}',
        '123'::jsonb
      ),
      '81000000-0000-4000-8000-000000000010'
    )$$,
  '22023',
  'Draft stop 1 contains Pick fields with invalid JSON types.',
  'registered save rejects scalar coercion in Pick fields'
);

select throws_ok(
  $$select public.save_my_profile_draft(
      jsonb_set(
        current_setting('mainstation_test.claim_payload')::jsonb,
        '{requestId}',
        '"81000000-0000-4000-8000-000000000011"'::jsonb
      ),
      '81000000-0000-4000-8000-000000000012'
    )$$,
  '22023',
  'Draft payload requestId must match the RPC request id.',
  'registered save binds the payload to its idempotency request id'
);

select results_eq(
  $$select p.display_name, count(l.id)::integer, count(l.id) filter (where l.visibility = 'private')::integer
    from public.profiles p
    left join public.lineups l on l.owner_id = p.id
    where p.id = '10000000-0000-4000-8000-000000000003'
    group by p.display_name$$,
  $$values ('Claim Owner Updated'::text, 1::integer, 1::integer)$$,
  'rejected option and size attacks leave the registered profile unchanged'
);

reset role;
set local role anon;

select results_eq(
  $$select count(*)::integer from public.public_profile_mainline where handle = 'claim-owner'$$,
  array[0::integer],
  'a private registered Team is absent from the anonymous public profile view'
);

reset role;

insert into public.lineups (
  id,
  owner_id,
  game_version_id,
  category,
  lifecycle,
  visibility,
  options
) values
  ('40000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{"selection":"Speed"}'),
  ('40000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{"selection":"Speed"}'),
  ('40000000-0000-4000-8000-000000000003', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{"selection":"Unknown"}'),
  ('40000000-0000-4000-8000-000000000004', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000002', 'main', 'active', 'public', '{}'),
  ('40000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'secondary', 'retired', 'private', '{"selection":"Power"}');

insert into public.character_picks (
  id,
  lineup_id,
  game_version_id,
  character_id,
  slot_id,
  slot_index,
  pick_kind,
  options
) values
  ('50000000-0000-4000-8000-000000000001', '40000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{"selection":"Assist A"}'),
  ('50000000-0000-4000-8000-000000000002', '40000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000002', 'slot-b', 1, 'fighter', '{"selection":"Assist B"}'),
  ('50000000-0000-4000-8000-000000000003', '40000000-0000-4000-8000-000000000002', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{"selection":"Assist A"}'),
  ('50000000-0000-4000-8000-000000000004', '40000000-0000-4000-8000-000000000002', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001', 'slot-b', 1, 'fighter', '{"selection":"Assist B"}'),
  ('50000000-0000-4000-8000-000000000005', '40000000-0000-4000-8000-000000000003', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{"selection":"Assist A"}'),
  ('50000000-0000-4000-8000-000000000006', '40000000-0000-4000-8000-000000000003', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000002', 'slot-b', 1, 'fighter', '{"selection":"Assist B"}'),
  ('50000000-0000-4000-8000-000000000007', '40000000-0000-4000-8000-000000000004', '20000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000003', 'slot-a', 0, 'fighter', '{}'),
  ('50000000-0000-4000-8000-000000000008', '40000000-0000-4000-8000-000000000004', '20000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000004', 'slot-b', 1, 'fighter', '{}'),
  ('50000000-0000-4000-8000-000000000009', '40000000-0000-4000-8000-000000000005', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{"selection":"Assist A"}'),
  ('50000000-0000-4000-8000-000000000010', '40000000-0000-4000-8000-000000000005', '20000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000002', 'slot-b', 1, 'fighter', '{"selection":"Assist B"}');

select ok(
  public.lineup_is_complete('40000000-0000-4000-8000-000000000001'),
  'verified unique lineup with valid Pick and Team options is complete'
);

select isnt(
  public.lineup_is_complete('40000000-0000-4000-8000-000000000002'),
  true,
  'duplicate Characters cannot complete a unique-Characters schema'
);

select isnt(
  public.lineup_is_complete('40000000-0000-4000-8000-000000000003'),
  true,
  'invalid Team options cannot complete a Lineup'
);

select isnt(
  public.lineup_is_complete('40000000-0000-4000-8000-000000000004'),
  true,
  'an unverified Selection Schema cannot complete a Lineup'
);

select throws_ok(
  $$update public.lineups
    set game_version_id = '20000000-0000-4000-8000-000000000002'
    where id = '40000000-0000-4000-8000-000000000002'$$,
  '23503',
  'update or delete on table "lineups" violates foreign key constraint "character_picks_lineup_id_game_version_id_fkey" on table "character_picks"',
  'an incomplete Lineup cannot move away from the Game Version shared by its Picks'
);

update public.lineups
set is_complete = true
where id in (
  '40000000-0000-4000-8000-000000000001',
  '40000000-0000-4000-8000-000000000005'
);
set constraints all immediate;

select throws_ok(
  $$update public.character_picks
    set character_id = '30000000-0000-4000-8000-000000000001'
    where id = '50000000-0000-4000-8000-000000000002'$$,
  '23514',
  'A completed Lineup cannot contain invalid Character Picks.',
  'a Pick update cannot make a completed Lineup invalid'
);

select throws_ok(
  $$delete from public.character_picks
    where id = '50000000-0000-4000-8000-000000000002'$$,
  '23514',
  'A completed Lineup cannot contain invalid Character Picks.',
  'a Pick delete cannot make a completed Lineup invalid'
);

select throws_ok(
  $$update public.lineups
    set game_version_id = '20000000-0000-4000-8000-000000000002'
    where id = '40000000-0000-4000-8000-000000000001'$$,
  '23503',
  'update or delete on table "lineups" violates foreign key constraint "character_picks_lineup_id_game_version_id_fkey" on table "character_picks"',
  'a Lineup cannot move away from the Game Version shared by its Picks'
);

select results_eq(
  $$select count(*)::integer
    from pg_policies
    where schemaname = 'public'
      and tablename = 'recommendation_feedback'
      and policyname = 'recommendation_feedback_owner_update'
      and with_check like '%recommendation_runs%'$$,
  array[1::integer],
  'feedback UPDATE rechecks Recommendation Run ownership'
);

select results_eq(
  $$select (position('lineup_is_publishable' in pg_get_viewdef('public.public_lineups'::regclass, true)) > 0)::integer$$,
  array[1::integer],
  'public Lineups recompute validity instead of trusting a stale flag'
);

set local role anon;

select results_eq(
  $$select count(*)::integer from public.lineups where id = '40000000-0000-4000-8000-000000000001'$$,
  array[1::integer],
  'anonymous readers can see a valid completed public Lineup'
);

select results_eq(
  $$select count(*)::integer from public.lineups where id = '40000000-0000-4000-8000-000000000005'$$,
  array[0::integer],
  'anonymous readers cannot see a private Lineup'
);

select results_eq(
  $$select count(*)::integer from public.character_picks where lineup_id = '40000000-0000-4000-8000-000000000001'$$,
  array[2::integer],
  'anonymous readers can see Picks from a valid completed public Lineup'
);

select results_eq(
  $$select count(*)::integer from public.character_picks where lineup_id = '40000000-0000-4000-8000-000000000005'$$,
  array[0::integer],
  'anonymous readers cannot see Picks from a private Lineup'
);

select is(
  public.lineup_is_publishable('40000000-0000-4000-8000-000000000005'),
  false,
  'a private Lineup is not publishable'
);

select is(
  public.lineup_is_publishable('ffffffff-ffff-4fff-8fff-ffffffffffff'),
  false,
  'an unknown Lineup is indistinguishable from a private Lineup'
);

reset role;
set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '10000000-0000-4000-8000-000000000002', true);
end;
$$;

select results_eq(
  $$select count(*)::integer from public.lineups where id = '40000000-0000-4000-8000-000000000005'$$,
  array[0::integer],
  'another authenticated owner cannot see a private Lineup'
);

select results_eq(
  $$select count(*)::integer from public.character_picks where lineup_id = '40000000-0000-4000-8000-000000000005'$$,
  array[0::integer],
  'another authenticated owner cannot see private child Picks'
);

reset role;
set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '10000000-0000-4000-8000-000000000001', true);
end;
$$;

select results_eq(
  $$select count(*)::integer from public.lineups where id = '40000000-0000-4000-8000-000000000005'$$,
  array[1::integer],
  'the owner can read its private Lineup'
);

select results_eq(
  $$select count(*)::integer from public.character_picks where lineup_id = '40000000-0000-4000-8000-000000000005'$$,
  array[2::integer],
  'the owner can read private child Picks'
);

reset role;

update public.characters
set is_playable = false
where id = '30000000-0000-4000-8000-000000000002';

select results_eq(
  $$select count(*)::integer
    from public.lineups
    where id in (
      '40000000-0000-4000-8000-000000000001',
      '40000000-0000-4000-8000-000000000005'
    ) and is_complete$$,
  array[0::integer],
  'Character eligibility changes reset affected completed Lineups'
);

update public.characters
set is_playable = true
where id = '30000000-0000-4000-8000-000000000002';

update public.lineups
set is_complete = true
where id in (
  '40000000-0000-4000-8000-000000000001',
  '40000000-0000-4000-8000-000000000005'
);

set local role service_role;

select lives_ok(
  $$update public.game_versions
    set selection_schema = jsonb_set(selection_schema, '{verified}', 'false'::jsonb)
    where id = '20000000-0000-4000-8000-000000000001'$$,
  'service-role catalog revalidation completes with explicit helper privileges'
);

reset role;

select results_eq(
  $$select count(*)::integer
    from public.lineups
    where id in (
      '40000000-0000-4000-8000-000000000001',
      '40000000-0000-4000-8000-000000000005'
    ) and is_complete$$,
  array[0::integer],
  'Selection Schema changes reset affected completed Lineups'
);

set local role anon;

select results_eq(
  $$select sum(visible_rows)::integer
    from (
      select count(*) as visible_rows from public.public_lineups
      union all select count(*) from public.registered_player_counts
      union all select count(*) from public.character_usage_stats
      union all select count(*) from public.player_game_signatures
      union all select count(*) from public.public_profile_mainline
    ) as derived_visibility$$,
  array[0::integer],
  'anonymous readers immediately lose every derived row after catalog invalidation'
);

reset role;

insert into public.recommendation_runs (
  id,
  owner_id,
  target_game_version_id,
  scoring_policy,
  candidates
) values
  ('60000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000001', '20000000-0000-4000-8000-000000000001', 'association-v1', '[]'),
  ('60000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000002', '20000000-0000-4000-8000-000000000001', 'association-v1', '[]');

insert into public.recommendation_feedback (
  id,
  recommendation_run_id,
  owner_id,
  character_id,
  response
) values (
  '70000000-0000-4000-8000-000000000001',
  '60000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '30000000-0000-4000-8000-000000000001',
  'would_try'
);

set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '10000000-0000-4000-8000-000000000001', true);
end;
$$;

select lives_ok(
  $$update public.recommendation_feedback
    set response = 'already_play'
    where id = '70000000-0000-4000-8000-000000000001'$$,
  'an owner can update feedback on its own Recommendation Run'
);

select throws_ok(
  $$update public.recommendation_feedback
    set recommendation_run_id = '60000000-0000-4000-8000-000000000002'
    where id = '70000000-0000-4000-8000-000000000001'$$,
  '42501',
  'new row violates row-level security policy for table "recommendation_feedback"',
  'feedback cannot be reassigned to another owner Recommendation Run'
);

reset role;

select * from finish();
rollback;
