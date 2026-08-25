-- Generated from the verified 2XKO block in supabase/seed.sql.
-- The official 15-champion roster and six live Fuse choices were reviewed on 2026-08-25.
begin;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('2xko', '2XKO', '2XKO', 'Current live roster', 1, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]}],"teamOptionLabel":"Fuse","teamOptionValues":["Double Down","Juggernaut","Sidekick","2X Assist","Freestyle","Teamfight"]}'::jsonb, 'https://2xko.riotgames.com/en-us/champions/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ahri', 'Ahri', 'fighter', 'released', true, 1, 'A mobile mage who turns space control into fast approach and conversion routes.', 'https://2xko.riotgames.com/en-us/champions/ahri/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akali', 'Akali', 'fighter', 'released', true, 2, 'A close-range assassin who uses rapid movement and layered follow-ups to stay on top of opponents.', 'https://2xko.riotgames.com/en-us/champions/akali/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blitzcrank', 'Blitzcrank', 'fighter', 'released', true, 3, 'A heavyweight grappler whose Rocket Grab and armored advances turn range into command-grab pressure.', 'https://2xko.riotgames.com/en-us/champions/blitzcrank/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'braum', 'Braum', 'fighter', 'released', true, 4, 'A defensive brawler who protects space with his shield and converts close contact into team-friendly pressure.', 'https://2xko.riotgames.com/en-us/champions/braum/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'caitlyn', 'Caitlyn', 'fighter', 'released', true, 5, 'A long-range marksman who controls lanes with rifle shots and traps before cashing out on precise confirms.', 'https://2xko.riotgames.com/en-us/champions/caitlyn/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'darius', 'Darius', 'fighter', 'released', true, 6, 'A heavy mid-range threat whose axe controls movement and rewards decisive reads.', 'https://2xko.riotgames.com/en-us/champions/darius/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ekko', 'Ekko', 'fighter', 'released', true, 7, 'A mobile close-range fighter built around temporal pressure and layered mixups.', 'https://2xko.riotgames.com/en-us/champions/ekko/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'illaoi', 'Illaoi', 'fighter', 'released', true, 8, 'A heavy-hitting brawler who summons tentacles to extend pressure and punish opponents who contest her space.', 'https://2xko.riotgames.com/en-us/champions/illaoi/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jinx', 'Jinx', 'fighter', 'released', true, 9, 'A projectile specialist who switches weapons and covers movement with gadgets for chaotic screen control.', 'https://2xko.riotgames.com/en-us/champions/jinx/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'senna', 'Senna', 'fighter', 'released', true, 10, 'A long-range marksman who blends deliberate shots with support tools that reshape team positioning.', 'https://2xko.riotgames.com/en-us/champions/senna/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'teemo', 'Teemo', 'fighter', 'released', true, 11, 'A compact trap setter who uses poison, mobility, and mushrooms to make every route risky.', 'https://2xko.riotgames.com/en-us/champions/teemo/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thresh', 'Thresh', 'fighter', 'released', true, 12, 'A control specialist whose chain, hook, and lantern create unusual conversions and tag positions.', 'https://2xko.riotgames.com/en-us/champions/thresh/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vi', 'Vi', 'fighter', 'released', true, 13, 'A forward-driving brawler who uses armored punches and charged movement to force close-range exchanges.', 'https://2xko.riotgames.com/en-us/champions/vi/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'warwick', 'Warwick', 'fighter', 'released', true, 14, 'A relentless rushdown fighter whose lunges and feral pressure reward staying in motion.', 'https://2xko.riotgames.com/en-us/champions/warwick/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yasuo', 'Yasuo', 'fighter', 'released', true, 15, 'A stance-rich swordsman with precise movement and expressive combo routing.', 'https://2xko.riotgames.com/en-us/champions/yasuo/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

commit;
