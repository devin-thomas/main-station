-- MS-024: the six signature-v1 fixtures required by SPEC 11.1, asserted against the
--         authoritative public.player_game_signatures view.
-- MS-025: association-v1 nonzero-support ranking and contributing source disclosure.
-- MS-026: explicit not_enough_data state and stored run lineage.
-- MS-028: hide and delete are excluded from every served derived view on the next read.

begin;

select plan(29);

-- ---------------------------------------------------------------------------
-- Fixtures. Each signature fixture owns its own Game Version so that normalization
-- (partitioned by profile and Game Version) stays independent per fixture.
-- ---------------------------------------------------------------------------

insert into auth.users (
  id, instance_id, aud, role, email, encrypted_password,
  email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at
) values
  ('11000000-0000-4000-8000-000000000001', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'sig-owner@example.invalid', '', now(), '{}'::jsonb, '{}'::jsonb, now(), now()),
  ('11000000-0000-4000-8000-000000000002', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'pop-b@example.invalid', '', now(), '{}'::jsonb, '{}'::jsonb, now(), now()),
  ('11000000-0000-4000-8000-000000000003', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'pop-c@example.invalid', '', now(), '{}'::jsonb, '{}'::jsonb, now(), now());

insert into public.profiles (id, handle, display_name) values
  ('11000000-0000-4000-8000-000000000001', 'sig-owner', 'Signature Owner'),
  ('11000000-0000-4000-8000-000000000002', 'pop-b', 'Population B'),
  ('11000000-0000-4000-8000-000000000003', 'pop-c', 'Population C');

insert into public.game_versions (
  id, slug, name, short_name, release_label, launch_order,
  selection_schema, catalog_source_url, catalog_status, source_checked_at
) values
  ('21000000-0000-4000-8000-000000000001', 'sig-solo', 'Signature Solo', 'SOLO', 'Fixture rules', 31000,
   '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-solo', 'verified', now()),
  ('21000000-0000-4000-8000-000000000002', 'sig-split', 'Signature Split', 'SPLIT', 'Fixture rules', 31001,
   '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-split', 'verified', now()),
  ('21000000-0000-4000-8000-000000000003', 'sig-rank', 'Signature Rank', 'RANK', 'Fixture rules', 31002,
   '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-rank', 'verified', now()),
  ('21000000-0000-4000-8000-000000000004', 'sig-team', 'Signature Team', 'TEAM', 'Fixture rules', 31003,
   '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"A","allowedRoles":["fighter"]},{"id":"slot-b","label":"B","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-team', 'verified', now()),
  ('21000000-0000-4000-8000-000000000005', 'sig-private', 'Signature Private', 'PRIV', 'Fixture rules', 31004,
   '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-private', 'verified', now()),
  ('21000000-0000-4000-8000-000000000006', 'sig-target', 'Signature Target', 'TARGET', 'Fixture rules', 31005,
   '{"version":1,"noun":"Character","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-a","label":"Character","allowedRoles":["fighter"]}]}'::jsonb,
   'https://example.invalid/sig-target', 'verified', now());

insert into public.characters (
  id, game_version_id, slug, display_name, roster_role,
  summary, summary_source_url, summary_source_publisher, source_checked_at
) values
  ('31000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000001', 'ken', 'Ken', 'fighter', 'Fixture.', 'https://example.invalid/ken', 'Test', now()),
  ('31000000-0000-4000-8000-000000000002', '21000000-0000-4000-8000-000000000002', 'split-ken', 'Split Ken', 'fighter', 'Fixture.', 'https://example.invalid/split-ken', 'Test', now()),
  ('31000000-0000-4000-8000-000000000003', '21000000-0000-4000-8000-000000000002', 'split-akuma', 'Split Akuma', 'fighter', 'Fixture.', 'https://example.invalid/split-akuma', 'Test', now()),
  ('31000000-0000-4000-8000-000000000004', '21000000-0000-4000-8000-000000000003', 'rank-ken', 'Rank Ken', 'fighter', 'Fixture.', 'https://example.invalid/rank-ken', 'Test', now()),
  ('31000000-0000-4000-8000-000000000005', '21000000-0000-4000-8000-000000000003', 'rank-sagat', 'Rank Sagat', 'fighter', 'Fixture.', 'https://example.invalid/rank-sagat', 'Test', now()),
  ('31000000-0000-4000-8000-000000000006', '21000000-0000-4000-8000-000000000003', 'rank-retired', 'Rank Retired', 'fighter', 'Fixture.', 'https://example.invalid/rank-retired', 'Test', now()),
  ('31000000-0000-4000-8000-000000000007', '21000000-0000-4000-8000-000000000004', 'ekko', 'Ekko', 'fighter', 'Fixture.', 'https://example.invalid/ekko', 'Test', now()),
  ('31000000-0000-4000-8000-000000000008', '21000000-0000-4000-8000-000000000004', 'ahri', 'Ahri', 'fighter', 'Fixture.', 'https://example.invalid/ahri', 'Test', now()),
  ('31000000-0000-4000-8000-000000000009', '21000000-0000-4000-8000-000000000004', 'darius', 'Darius', 'fighter', 'Fixture.', 'https://example.invalid/darius', 'Test', now()),
  ('31000000-0000-4000-8000-000000000010', '21000000-0000-4000-8000-000000000005', 'priv-ken', 'Private Ken', 'fighter', 'Fixture.', 'https://example.invalid/priv-ken', 'Test', now()),
  ('31000000-0000-4000-8000-000000000011', '21000000-0000-4000-8000-000000000006', 'target-ace', 'Target Ace', 'fighter', 'Fixture.', 'https://example.invalid/target-ace', 'Test', now()),
  ('31000000-0000-4000-8000-000000000012', '21000000-0000-4000-8000-000000000006', 'target-nova', 'Target Nova', 'fighter', 'Fixture.', 'https://example.invalid/target-nova', 'Test', now());

insert into public.lineups (id, owner_id, game_version_id, category, lifecycle, visibility, options) values
  -- Fixture 1: solo public Active Main Ken.
  ('41000000-0000-4000-8000-000000000001', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{}'),
  -- Fixture 2: equal public Active Mains split evenly.
  ('41000000-0000-4000-8000-000000000002', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000002', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000003', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000002', 'main', 'active', 'public', '{}'),
  -- Fixture 3: Active Main outweighs Active Secondary; Retired halves its category weight.
  ('41000000-0000-4000-8000-000000000004', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000003', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000005', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000003', 'secondary', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000006', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000003', 'main', 'retired', 'public', '{}'),
  -- Fixture 4: repeated Character across Teams dominates while partners stay nonzero.
  ('41000000-0000-4000-8000-000000000007', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000004', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000008', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000004', 'main', 'active', 'public', '{}'),
  -- Fixture 6: private history contributes zero.
  ('41000000-0000-4000-8000-000000000009', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000005', 'main', 'active', 'private', '{}'),
  -- Population evidence for association-v1.
  ('41000000-0000-4000-8000-000000000010', '11000000-0000-4000-8000-000000000002', '21000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000011', '11000000-0000-4000-8000-000000000002', '21000000-0000-4000-8000-000000000006', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000012', '11000000-0000-4000-8000-000000000003', '21000000-0000-4000-8000-000000000001', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000013', '11000000-0000-4000-8000-000000000003', '21000000-0000-4000-8000-000000000006', 'main', 'active', 'public', '{}'),
  ('41000000-0000-4000-8000-000000000014', '11000000-0000-4000-8000-000000000003', '21000000-0000-4000-8000-000000000006', 'secondary', 'active', 'public', '{}');

insert into public.character_picks (id, lineup_id, game_version_id, character_id, slot_id, slot_index, pick_kind, options) values
  ('51000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000001', '31000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000002', '41000000-0000-4000-8000-000000000002', '21000000-0000-4000-8000-000000000002', '31000000-0000-4000-8000-000000000002', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000003', '41000000-0000-4000-8000-000000000003', '21000000-0000-4000-8000-000000000002', '31000000-0000-4000-8000-000000000003', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000004', '41000000-0000-4000-8000-000000000004', '21000000-0000-4000-8000-000000000003', '31000000-0000-4000-8000-000000000004', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000005', '41000000-0000-4000-8000-000000000005', '21000000-0000-4000-8000-000000000003', '31000000-0000-4000-8000-000000000005', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000006', '41000000-0000-4000-8000-000000000006', '21000000-0000-4000-8000-000000000003', '31000000-0000-4000-8000-000000000006', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000007', '41000000-0000-4000-8000-000000000007', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000007', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000008', '41000000-0000-4000-8000-000000000007', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000008', 'slot-b', 1, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000009', '41000000-0000-4000-8000-000000000008', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000007', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000010', '41000000-0000-4000-8000-000000000008', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000009', 'slot-b', 1, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000011', '41000000-0000-4000-8000-000000000009', '21000000-0000-4000-8000-000000000005', '31000000-0000-4000-8000-000000000010', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000012', '41000000-0000-4000-8000-000000000010', '21000000-0000-4000-8000-000000000001', '31000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000013', '41000000-0000-4000-8000-000000000011', '21000000-0000-4000-8000-000000000006', '31000000-0000-4000-8000-000000000011', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000014', '41000000-0000-4000-8000-000000000012', '21000000-0000-4000-8000-000000000001', '31000000-0000-4000-8000-000000000001', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000015', '41000000-0000-4000-8000-000000000013', '21000000-0000-4000-8000-000000000006', '31000000-0000-4000-8000-000000000011', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000016', '41000000-0000-4000-8000-000000000014', '21000000-0000-4000-8000-000000000006', '31000000-0000-4000-8000-000000000012', 'slot-a', 0, 'fighter', '{}');

update public.lineups set is_complete = true
where id >= '41000000-0000-4000-8000-000000000001'
  and id <= '41000000-0000-4000-8000-000000000014';
set constraints all immediate;

-- ---------------------------------------------------------------------------
-- MS-024 - signature-v1 fixtures (SPEC 11.1)
-- ---------------------------------------------------------------------------

select results_eq(
  $$select round(raw_weight, 6), round(normalized_weight, 6), policy_version
    from public.player_game_signatures
    where profile_id = '11000000-0000-4000-8000-000000000001'
      and game_version_id = '21000000-0000-4000-8000-000000000001'$$,
  $$values (round(1.0::numeric, 6), round(1.0::numeric, 6), 'signature-v1'::text)$$,
  'a solo public Active Main carries the full one-unit Game contribution and its policy version'
);

select results_eq(
  $$select c.slug, round(s.normalized_weight, 6)
    from public.player_game_signatures s
    join public.characters c on c.id = s.character_id
    where s.profile_id = '11000000-0000-4000-8000-000000000001'
      and s.game_version_id = '21000000-0000-4000-8000-000000000002'
    order by c.slug$$,
  $$values ('split-akuma'::text, round(0.5::numeric, 6)), ('split-ken'::text, round(0.5::numeric, 6))$$,
  'equal public Active Mains split the Game unit evenly absent another modifier'
);

select results_eq(
  $$select c.slug, round(s.raw_weight, 6)
    from public.player_game_signatures s
    join public.characters c on c.id = s.character_id
    where s.profile_id = '11000000-0000-4000-8000-000000000001'
      and s.game_version_id = '21000000-0000-4000-8000-000000000003'
    order by s.raw_weight desc$$,
  $$values
    ('rank-ken'::text, round(1.0::numeric, 6)),
    ('rank-sagat'::text, round(0.65::numeric, 6)),
    ('rank-retired'::text, round(0.5::numeric, 6))$$,
  'Main outweighs Secondary and Retired halves its appearance at the documented multipliers'
);

select ok(
  (select s1.normalized_weight > s2.normalized_weight
   from public.player_game_signatures s1, public.player_game_signatures s2
   where s1.character_id = '31000000-0000-4000-8000-000000000004'
     and s2.character_id = '31000000-0000-4000-8000-000000000005'
     and s1.profile_id = '11000000-0000-4000-8000-000000000001'
     and s2.profile_id = '11000000-0000-4000-8000-000000000001'),
  'a public Active Main ranks above a public Active Secondary after normalization'
);

select results_eq(
  $$select c.slug, round(s.normalized_weight, 6)
    from public.player_game_signatures s
    join public.characters c on c.id = s.character_id
    where s.profile_id = '11000000-0000-4000-8000-000000000001'
      and s.game_version_id = '21000000-0000-4000-8000-000000000004'
    order by s.normalized_weight desc, c.slug$$,
  $$values
    ('ekko'::text, round(0.5::numeric, 6)),
    ('ahri'::text, round(0.25::numeric, 6)),
    ('darius'::text, round(0.25::numeric, 6))$$,
  'repeated Team appearances make a Character dominant while unique partners retain nonzero shares'
);

select is(
  (select count(*)::integer from public.player_game_signatures
   where profile_id = '11000000-0000-4000-8000-000000000001'
     and game_version_id = '21000000-0000-4000-8000-000000000005'),
  0,
  'private Lineups contribute zero signature weight'
);

select is(
  (select count(*)::integer
   from (
     select profile_id, game_version_id, sum(normalized_weight) as total
     from public.player_game_signatures
     group by profile_id, game_version_id
   ) totals
   where abs(totals.total - 1.0) > 1e-9),
  0,
  'every Player-Game Signature normalizes to exactly one unit within numeric tolerance'
);

-- Adding another valid Team must redistribute shares without changing the Game total.
insert into public.lineups (id, owner_id, game_version_id, category, lifecycle, visibility, options)
values ('41000000-0000-4000-8000-000000000015', '11000000-0000-4000-8000-000000000001', '21000000-0000-4000-8000-000000000004', 'main', 'active', 'public', '{}');
insert into public.character_picks (id, lineup_id, game_version_id, character_id, slot_id, slot_index, pick_kind, options) values
  ('51000000-0000-4000-8000-000000000017', '41000000-0000-4000-8000-000000000015', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000008', 'slot-a', 0, 'fighter', '{}'),
  ('51000000-0000-4000-8000-000000000018', '41000000-0000-4000-8000-000000000015', '21000000-0000-4000-8000-000000000004', '31000000-0000-4000-8000-000000000009', 'slot-b', 1, 'fighter', '{}');
update public.lineups set is_complete = true where id = '41000000-0000-4000-8000-000000000015';
set constraints all immediate;

select results_eq(
  $$select round(sum(normalized_weight), 6)
    from public.player_game_signatures
    where profile_id = '11000000-0000-4000-8000-000000000001'
      and game_version_id = '21000000-0000-4000-8000-000000000004'$$,
  $$values (round(1.0::numeric, 6))$$,
  'adding more valid Teams never changes the total Player-Game contribution from one unit'
);

select results_eq(
  $$select round(raw_weight, 6)
    from public.player_game_signatures
    where profile_id = '11000000-0000-4000-8000-000000000001'
      and game_version_id = '21000000-0000-4000-8000-000000000004'
      and character_id = '31000000-0000-4000-8000-000000000007'$$,
  $$values (round(2.0::numeric, 6))$$,
  'repeated appearances keep accumulating raw weight as Teams are added'
);

-- ---------------------------------------------------------------------------
-- MS-025 / MS-026 - association-v1 nonzero support, contributions, and states
-- ---------------------------------------------------------------------------

set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '11000000-0000-4000-8000-000000000001', true);
end;
$$;

select results_eq(
  $$select character_name, rank, support_count
    from public.recommend_characters(
      '11000000-0000-4000-8000-000000000001',
      '21000000-0000-4000-8000-000000000006'
    )$$,
  $$values
    ('Target Ace'::text, 1::integer, 2::bigint),
    ('Target Nova'::text, 2::integer, 1::bigint)$$,
  'nonzero observed support ranks candidates and counts distinct contributing Players'
);

select results_eq(
  $$select round(score, 6)
    from public.recommend_characters(
      '11000000-0000-4000-8000-000000000001',
      '21000000-0000-4000-8000-000000000006'
    )
    order by rank$$,
  $$values (round(1.606061::numeric, 6)), (round(0.393939::numeric, 6))$$,
  'candidate scores combine requester source weights with observed source-to-target strengths'
);

select results_eq(
  $$select
      contributions -> 0 ->> 'characterSlug',
      contributions -> 0 ->> 'gameSlug',
      (contributions -> 0 ->> 'supportCount')::bigint,
      jsonb_array_length(contributions)
    from public.recommend_characters(
      '11000000-0000-4000-8000-000000000001',
      '21000000-0000-4000-8000-000000000006'
    )
    where rank = 1$$,
  $$values ('ken'::text, 'sig-solo'::text, 2::bigint, 1::integer)$$,
  'association-v1 returns the strongest observed contributing source Characters and their support'
);

select is(
  public.run_my_recommendations('21000000-0000-4000-8000-000000000006') ->> 'state',
  'ok',
  'a supported recommendation run reports the ok state'
);

select is(
  (select jsonb_array_length(candidates -> 0 -> 'contributions')
   from public.recommendation_runs
   where owner_id = '11000000-0000-4000-8000-000000000001'
     and target_game_version_id = '21000000-0000-4000-8000-000000000006'
   order by created_at desc
   limit 1),
  1,
  'the audit run stores the contributing associations needed to explain what the player saw'
);

select is(
  public.run_my_recommendations('21000000-0000-4000-8000-000000000002') ->> 'state',
  'not_enough_data',
  'zero observed support returns the explicit not_enough_data state'
);

select is(
  jsonb_array_length(
    public.run_my_recommendations('21000000-0000-4000-8000-000000000002') -> 'candidates'
  ),
  0,
  'the not_enough_data state carries no popularity or authored fallback candidates'
);

select results_eq(
  $$select count(*)::integer from public.recommendation_runs
    where owner_id = '11000000-0000-4000-8000-000000000001'
      and target_game_version_id = '21000000-0000-4000-8000-000000000002'$$,
  array[2::integer],
  'not_enough_data runs are still recorded as immutable audit rows'
);

reset role;

-- ---------------------------------------------------------------------------
-- MS-027 - analytics-only feedback stays out of every scoring path
-- ---------------------------------------------------------------------------

select is(
  (select (position('recommendation_feedback' in pg_get_functiondef('public.recommend_characters(uuid,uuid)'::regprocedure)) > 0)),
  false,
  'association-v1 SQL does not reference analytics-only feedback'
);

select is(
  (select (position('recommendation_feedback' in pg_get_functiondef('public.run_my_recommendations(uuid)'::regprocedure)) > 0)),
  false,
  'the audited recommendation RPC does not reference analytics-only feedback'
);

-- ---------------------------------------------------------------------------
-- MS-028 - hide and delete are excluded from served queries on the next read
-- ---------------------------------------------------------------------------

set local role anon;

select is(
  (select count(*)::integer from public.public_lineups
   where id = '41000000-0000-4000-8000-000000000011'),
  1,
  'a public Lineup is served before it is hidden'
);

select results_eq(
  $$select public_player_count from public.character_usage_stats
    where character_id = '31000000-0000-4000-8000-000000000011'$$,
  array[2::bigint],
  'public usage counts both contributing Players before the hide'
);

reset role;

update public.lineups
set visibility = 'private'
where id = '41000000-0000-4000-8000-000000000011';

set local role anon;

select is(
  (select count(*)::integer from public.public_lineups
   where id = '41000000-0000-4000-8000-000000000011'),
  0,
  'hiding a Lineup immediately removes it from the served public Lineup view'
);

select is(
  (select count(*)::integer from public.player_game_signatures
   where profile_id = '11000000-0000-4000-8000-000000000002'
     and game_version_id = '21000000-0000-4000-8000-000000000006'),
  0,
  'hiding a Lineup immediately removes its statistical contribution'
);

select is(
  (select count(*)::integer from public.public_profile_mainline
   where id = '41000000-0000-4000-8000-000000000011'),
  0,
  'hiding a Lineup immediately removes it from the public profile Mainline'
);

select results_eq(
  $$select public_player_count from public.character_usage_stats
    where character_id = '31000000-0000-4000-8000-000000000011'$$,
  array[1::bigint],
  'public usage counts drop to the remaining contributing Player after the hide'
);

reset role;
set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '11000000-0000-4000-8000-000000000001', true);
end;
$$;

select results_eq(
  $$select character_name, support_count
    from public.recommend_characters(
      '11000000-0000-4000-8000-000000000001',
      '21000000-0000-4000-8000-000000000006'
    )
    where rank = 1$$,
  $$values ('Target Ace'::text, 1::bigint)$$,
  'a hidden Lineup is excluded from recommendation support on the very next run'
);

reset role;

delete from public.lineups where id = '41000000-0000-4000-8000-000000000014';
set constraints all immediate;

select is(
  (select count(*)::integer from public.player_game_signatures
   where character_id = '31000000-0000-4000-8000-000000000012'),
  0,
  'deleting a Lineup immediately removes its Character from served signatures'
);

set local role authenticated;
do $$
begin
  perform set_config('request.jwt.claim.sub', '11000000-0000-4000-8000-000000000001', true);
end;
$$;

select is(
  (select count(*)::integer
   from public.recommend_characters(
     '11000000-0000-4000-8000-000000000001',
     '21000000-0000-4000-8000-000000000006'
   )
   where character_id = '31000000-0000-4000-8000-000000000012'),
  0,
  'a deleted Lineup stops supporting its candidate on the very next run'
);

reset role;

-- Derived state is defined from eligible rows at read time. No materialized cache or
-- historical snapshot exists, so there is nothing that could outlive a hide or delete
-- by up to 24 hours. This assertion fails the moment one is introduced without an
-- accompanying lineage and invalidation design (SPEC 14).
select is(
  (select count(*)::integer from pg_matviews where schemaname = 'public'),
  0,
  'no materialized snapshot of derived state exists to survive a hide or delete'
);

select * from finish();
rollback;
