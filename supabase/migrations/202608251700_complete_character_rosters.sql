-- Generated from src/data/catalog.ts. Roster completeness is separate from art rights review.
begin;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('2xko', '2XKO', '2XKO', 'Current live roster', 1, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"point","label":"Point","allowedRoles":["fighter"]},{"id":"assist","label":"Assist","allowedRoles":["fighter"]}],"teamOptionLabel":"Fuse","teamOptionValues":["Double Down","Juggernaut","Sidekick","2X Assist","Freestyle","Teamfight"],"constraintNote":"Riot does not publish a same-Champion team rule. MainStation conservatively requires distinct Point and Assist picks so saved teams remain valid under either outcome."}'::jsonb, 'https://2xko.riotgames.com/en-us/champions/', 'verified', '2026-08-25T00:00:00Z')
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

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('marvel-tokon', 'Marvel Tokon: Fighting Souls', 'TOKON', 'Launch roster', 2, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]},{"id":"slot-3","label":"Slot 3","allowedRoles":["fighter"]},{"id":"slot-4","label":"Slot 4","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 1, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 2, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 3, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'black-panther', 'Black Panther', 'fighter', 'released', true, 4, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 5, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magik', 'Magik', 'fighter', 'released', true, 6, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 7, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'danger', 'Danger', 'fighter', 'released', true, 8, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 9, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ms-marvel', 'Ms. Marvel', 'fighter', 'released', true, 10, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'star-lord', 'Star-Lord', 'fighter', 'released', true, 11, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peni-parker', 'Peni Parker', 'fighter', 'released', true, 12, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghost-rider', 'Ghost Rider', 'fighter', 'released', true, 13, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blade', 'Blade', 'fighter', 'released', true, 14, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'loki', 'Loki', 'fighter', 'released', true, 15, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'deadpool', 'Deadpool', 'fighter', 'released', true, 16, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-doom', 'Doctor Doom', 'fighter', 'released', true, 17, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 18, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'green-goblin', 'Green Goblin', 'fighter', 'released', true, 19, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'carnage', 'Carnage', 'fighter', 'released', true, 20, 'Selectable Marvel Tokon roster entry for the checked version boundary.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('mvc2', 'Marvel vs. Capcom 2', 'MVC2', 'Arcade / collection ruleset', 3, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Point","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]},{"id":"slot-2","label":"Middle","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]},{"id":"slot-3","label":"Anchor","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]}]}'::jsonb, 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blackheart', 'Blackheart', 'fighter', 'released', true, 1, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cable', 'Cable', 'fighter', 'released', true, 2, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 3, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'colossus', 'Colossus', 'fighter', 'released', true, 4, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyclops', 'Cyclops', 'fighter', 'released', true, 5, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-doom', 'Doctor Doom', 'fighter', 'released', true, 6, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'gambit', 'Gambit', 'fighter', 'released', true, 7, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 8, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iceman', 'Iceman', 'fighter', 'released', true, 9, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 10, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'juggernaut', 'Juggernaut', 'fighter', 'released', true, 11, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 12, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marrow', 'Marrow', 'fighter', 'released', true, 13, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'omega-red', 'Omega Red', 'fighter', 'released', true, 14, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'psylocke', 'Psylocke', 'fighter', 'released', true, 15, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rogue', 'Rogue', 'fighter', 'released', true, 16, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sabretooth', 'Sabretooth', 'fighter', 'released', true, 17, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sentinel', 'Sentinel', 'fighter', 'released', true, 18, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shuma-gorath', 'Shuma-Gorath', 'fighter', 'released', true, 19, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'silver-samurai', 'Silver Samurai', 'fighter', 'released', true, 20, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 21, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spiral', 'Spiral', 'fighter', 'released', true, 22, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 23, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thanos', 'Thanos', 'fighter', 'released', true, 24, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 25, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'war-machine', 'War Machine', 'fighter', 'released', true, 26, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 27, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine-bone', 'Wolverine (Bone Claws)', 'fighter', 'released', true, 28, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 29, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'amingo', 'Amingo', 'fighter', 'released', true, 30, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anakaris', 'Anakaris', 'fighter', 'released', true, 31, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bulleta', 'B.B. Hood (Bulleta)', 'fighter', 'released', true, 32, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cammy', 'Cammy', 'fighter', 'released', true, 33, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-commando', 'Captain Commando', 'fighter', 'released', true, 34, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'charlie', 'Charlie', 'fighter', 'released', true, 35, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 36, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dan', 'Dan', 'fighter', 'released', true, 37, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dhalsim', 'Dhalsim', 'fighter', 'released', true, 38, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 39, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'guile', 'Guile', 'fighter', 'released', true, 40, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hayato', 'Hayato Kanzaki', 'fighter', 'released', true, 41, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jill-valentine', 'Jill Valentine', 'fighter', 'released', true, 42, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jin-saotome', 'Jin Saotome', 'fighter', 'released', true, 43, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ken', 'Ken', 'fighter', 'released', true, 44, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'm-bison', 'M. Bison', 'fighter', 'released', true, 45, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mega-man', 'Mega Man', 'fighter', 'released', true, 46, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan', 'fighter', 'released', true, 47, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'roll', 'Roll', 'fighter', 'released', true, 48, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ruby-heart', 'Ruby Heart', 'fighter', 'released', true, 49, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 50, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sakura', 'Sakura', 'fighter', 'released', true, 51, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'servbot', 'Servbot', 'fighter', 'released', true, 52, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sonson', 'SonSon', 'fighter', 'released', true, 53, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'strider-hiryu', 'Strider Hiryu', 'fighter', 'released', true, 54, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tron-bonne', 'Tron Bonne', 'fighter', 'released', true, 55, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zangief', 'Zangief', 'fighter', 'released', true, 56, 'Selectable Marvel vs. Capcom 2 roster entry for the checked version boundary.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('umvc3', 'Ultimate Marvel vs. Capcom 3', 'UMVC3', 'Ultimate roster', 4, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Point","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]},{"id":"slot-2","label":"Middle","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]},{"id":"slot-3","label":"Anchor","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]}]}'::jsonb, 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'strider-hiryu', 'Strider Hiryu', 'fighter', 'released', true, 1, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-fist', 'Iron Fist', 'fighter', 'released', true, 2, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nova', 'Nova', 'fighter', 'released', true, 3, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phoenix-wright', 'Phoenix Wright', 'fighter', 'released', true, 4, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-strange', 'Doctor Strange', 'fighter', 'released', true, 5, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vergil', 'Vergil', 'fighter', 'released', true, 6, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghost-rider', 'Ghost Rider', 'fighter', 'released', true, 7, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'frank-west', 'Frank West', 'fighter', 'released', true, 8, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'firebrand', 'Firebrand', 'fighter', 'released', true, 9, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hawkeye', 'Hawkeye', 'fighter', 'released', true, 10, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rocket-raccoon', 'Rocket Raccoon', 'fighter', 'released', true, 11, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nemesis-t-type', 'Nemesis T-Type', 'fighter', 'released', true, 12, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 13, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 14, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 15, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thor', 'Thor', 'fighter', 'released', true, 16, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 17, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dante', 'Dante', 'fighter', 'released', true, 18, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'trish', 'Trish', 'fighter', 'released', true, 19, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 20, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'crimson-viper', 'Crimson Viper', 'fighter', 'released', true, 21, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'viewtiful-joe', 'Viewtiful Joe', 'fighter', 'released', true, 22, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spencer', 'Spencer', 'fighter', 'released', true, 23, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'amaterasu', 'Amaterasu', 'fighter', 'released', true, 24, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 25, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 26, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 27, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'deadpool', 'Deadpool', 'fighter', 'released', true, 28, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'super-skrull', 'Super-Skrull', 'fighter', 'released', true, 29, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'modok', 'M.O.D.O.K.', 'fighter', 'released', true, 30, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tron-bonne', 'Tron Bonne', 'fighter', 'released', true, 31, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan', 'fighter', 'released', true, 32, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phoenix', 'Phoenix', 'fighter', 'released', true, 33, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 34, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'x-23', 'X-23', 'fighter', 'released', true, 35, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doom', 'Doctor Doom', 'fighter', 'released', true, 36, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dormammu', 'Dormammu', 'fighter', 'released', true, 37, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'haggar', 'Mike Haggar', 'fighter', 'released', true, 38, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 39, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'arthur', 'Arthur', 'fighter', 'released', true, 40, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'she-hulk', 'She-Hulk', 'fighter', 'released', true, 41, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 42, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'taskmaster', 'Taskmaster', 'fighter', 'released', true, 43, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hsien-ko', 'Hsien-Ko', 'fighter', 'released', true, 44, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sentinel', 'Sentinel', 'fighter', 'released', true, 45, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chris-redfield', 'Chris Redfield', 'fighter', 'released', true, 46, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wesker', 'Wesker', 'fighter', 'released', true, 47, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zero', 'Zero', 'fighter', 'released', true, 48, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jill-valentine', 'Jill Valentine', 'fighter', 'released', true, 49, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shuma-gorath', 'Shuma-Gorath', 'fighter', 'released', true, 50, 'Selectable Ultimate Marvel vs. Capcom 3 roster entry for the checked version boundary.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('uni2', 'Under Night In-Birth II Sys:Celes', 'UNI2', 'Current official roster', 5, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.arcsystemworks.jp/uni2celes/en/character/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hyde', 'Hyde', 'fighter', 'released', true, 1, 'A mid-range sword fighter whose strong pokes, interrupts, and flexible combo routes reward measured neutral control.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'linne', 'Linne', 'fighter', 'released', true, 2, 'A fast close-range fighter who uses quick normals, frame traps, block strings, and aerial throw punishes to sustain offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'waldstein', 'Waldstein', 'fighter', 'released', true, 3, 'A large claw fighter who uses mix-ups, anti-air attacks, and reliable follow-ups to turn openings into damaging combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'carmine', 'Carmine', 'fighter', 'released', true, 4, 'A blood-powered mix-up fighter whose overheads, placed attacks, and mid-range knockdowns feed extended combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'orie', 'Orie', 'fighter', 'released', true, 5, 'A flexible neutral fighter who uses delayed thrust strings, defensive buttons, and aerial Thanatos commands to vary pressure.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'gordeau', 'Gordeau', 'fighter', 'released', true, 6, 'A close-range pressure specialist whose approach tools and long-reaching attacks let him threaten from mid- and long-range.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'merkava', 'Merkava', 'fighter', 'released', true, 7, 'An air-mobile setplay fighter who uses drill routes and cling setups to maintain point-blank pressure after combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vatista', 'Vatista', 'fighter', 'released', true, 8, 'A technical charge fighter whose enhanced aerial options and expanded EX routes support air control and varied combo routing.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'seth', 'Seth', 'fighter', 'released', true, 9, 'A deceptive setup fighter who converts aerial attacks and Vanishing Confusion into varied neutral and high-reward offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yuzuriha', 'Yuzuriha', 'fighter', 'released', true, 10, 'A mobile stance-and-sword fighter who baits movement, pokes from range, and turns flexible cancels into offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hilda', 'Hilda', 'fighter', 'released', true, 11, 'A deceptive ranged pressure fighter whose delayed attacks and block strings turn neutral openings into high-damage combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chaos', 'Chaos', 'fighter', 'released', true, 12, 'A setup fighter who commands Azhi Dahaka to extend pressure, reposition the summon, and diversify combo routes.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nanase', 'Nanase', 'fighter', 'released', true, 13, 'A mobile wind fighter with safer pokes, aerial tools, and conversions that carry stray hits into full combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'byakuya', 'Byakuya', 'fighter', 'released', true, 14, 'An aggressive setup fighter whose improved normals, traps, and dash attacks help him close space and force pressure.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phonon', 'Phonon', 'fighter', 'released', true, 15, 'A long-reach specialist who controls neutral with mid-range pokes and threatening block strings while covering a weaker defense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mika', 'Mika', 'fighter', 'released', true, 16, 'A lunging close-range fighter whose missiles, cannon, and advancing attacks create varied offense with useful defensive options.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wagner', 'Wagner', 'fighter', 'released', true, 17, 'A sword-and-shield power-up fighter who strengthens pressure and damage by activating and managing both weapons.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'enkidu', 'Enkidu', 'fighter', 'released', true, 18, 'A hand-to-hand ground fighter who uses frame traps, attack strings, and strong single-hit damage to win close interactions.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'londrekia', 'Londrekia', 'fighter', 'released', true, 19, 'An ice-based mid-range fighter whose frozen projectiles and pressure resets control space and support overhead conversions.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tsurugi', 'Tsurugi', 'fighter', 'released', true, 20, 'An aggressive armored fighter whose dashing attacks and projectile-invulnerable movement let him force his way through neutral.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kaguya', 'Kaguya', 'fighter', 'released', true, 21, 'A flexible dual-gun fighter who uses movement feints, projectiles, and anti-air tools to adapt her neutral and combo routes.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kuon', 'Kuon', 'fighter', 'released', true, 22, 'A ground-and-air space controller who places persistent projectiles to restrict movement and open throws or layered offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'uzuki', 'Uzuki', 'fighter', 'released', true, 23, 'A versatile trap-and-summon fighter who tracks opponents with dolls and coffins to build unpredictable offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ogre', 'Ogre', 'fighter', 'released', true, 24, 'A neutral-focused brawler whose long pokes and whiff punishes convert clean hits into consistent combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'izumi', 'Izumi', 'fighter', 'released', true, 25, 'A companion-led fighter who uses Elefee and a bouncing Bubbly Breath projectile to shape close-range exchanges.', 'https://www.arcsystemworks.jp/portal/post-30481/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zohar', 'Zohar', 'fighter', 'released', true, 26, 'A claw-armed close-range fighter who uses a doppelganger to mirror and layer attacks.', 'https://www.youtube.com/watch?v=YOJNP1c36B8', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'eltnum', 'Eltnum', 'fighter', 'released', true, 27, 'A versatile close-range and gun fighter who balances Etherite pressure with Hollow Point and Warning Shot confirms.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akatsuki', 'Akatsuki', 'fighter', 'released', true, 28, 'A close-range specialist who pairs fast Blitz Shot projectiles with lockdown strings and high-reward strike mix-ups.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('avatar-legends', 'Avatar Legends: The Fighting Game', 'AVATAR', 'Launch roster + support pools', 6, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"],"optionLabel":"Support","optionValues":["Gyatso","Momo","Appa","Mai","Ran & Shaw","June","Kanna","Hakoda","Master Pakku","Badgermole","The Boulder","The Hippo","Master Piandao","Suki","Princess Yue","Lo and Li","Joo Dee","Ursa","Rangi","Kelsang","Yun","Firelord Sozin","Admiral Zhao","Imperial Firebender","Naga","Tonraq","Raava","P''Li","Ming-Hua","Ghazan","Vaatu","Dark Spirit","Dark Avatar Unalaq","Katara","Avatar Roku","Guru Pathik"],"optionValuesByCharacter":{"aang":["Gyatso","Momo","Appa"],"zuko":["Mai","Ran & Shaw","June"],"katara":["Kanna","Hakoda","Master Pakku"],"toph":["Badgermole","The Boulder","The Hippo"],"sokka":["Master Piandao","Suki","Princess Yue"],"azula":["Lo and Li","Joo Dee","Ursa"],"kyoshi":["Rangi","Kelsang","Yun"],"ozai":["Firelord Sozin","Admiral Zhao","Imperial Firebender"],"korra":["Naga","Tonraq","Raava"],"zaheer":["P''Li","Ming-Hua","Ghazan"],"nightmare-korra":["Vaatu","Dark Spirit","Dark Avatar Unalaq"],"avatar-aang":["Katara","Avatar Roku","Guru Pathik"]}}],"constraintNote":"Each fighter exposes the three support choices published for the launch build. Supports change the fighter loadout; they are not separate roster slots."}'::jsonb, 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aang', 'Aang', 'fighter', 'released', true, 1, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zuko', 'Zuko', 'fighter', 'released', true, 2, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'katara', 'Katara', 'fighter', 'released', true, 3, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'toph', 'Toph', 'fighter', 'released', true, 4, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sokka', 'Sokka', 'fighter', 'released', true, 5, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'azula', 'Azula', 'fighter', 'released', true, 6, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kyoshi', 'Avatar Kyoshi', 'fighter', 'released', true, 7, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ozai', 'Fire Lord Ozai', 'fighter', 'released', true, 8, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'korra', 'Korra', 'fighter', 'released', true, 9, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zaheer', 'Zaheer', 'fighter', 'released', true, 10, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nightmare-korra', 'Nightmare Korra', 'fighter', 'released', true, 11, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'avatar-aang', 'Avatar Aang', 'fighter', 'released', true, 12, 'Selectable Avatar Legends roster entry for the checked version boundary.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('melee', 'Super Smash Bros. Melee', 'MELEE', 'NTSC 1.02 playable forms', 7, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dr-mario', 'Dr. Mario', 'fighter', 'released', true, 1, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mario', 'Mario', 'fighter', 'released', true, 2, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'luigi', 'Luigi', 'fighter', 'released', true, 3, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bowser', 'Bowser', 'fighter', 'released', true, 4, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peach', 'Peach', 'fighter', 'released', true, 5, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yoshi', 'Yoshi', 'fighter', 'released', true, 6, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'donkey-kong', 'Donkey Kong', 'fighter', 'released', true, 7, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-falcon', 'Captain Falcon', 'fighter', 'released', true, 8, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ganondorf', 'Ganondorf', 'fighter', 'released', true, 9, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'falco', 'Falco', 'fighter', 'released', true, 10, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'fox', 'Fox', 'fighter', 'released', true, 11, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ness', 'Ness', 'fighter', 'released', true, 12, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ice-climbers', 'Ice Climbers', 'fighter', 'released', true, 13, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kirby', 'Kirby', 'fighter', 'released', true, 14, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'samus', 'Samus', 'fighter', 'released', true, 15, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zelda', 'Zelda', 'fighter', 'released', true, 16, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sheik', 'Sheik', 'fighter', 'released', true, 17, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'link', 'Link', 'fighter', 'released', true, 18, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'young-link', 'Young Link', 'fighter', 'released', true, 19, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mewtwo', 'Mewtwo', 'fighter', 'released', true, 20, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marth', 'Marth', 'fighter', 'released', true, 21, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'roy', 'Roy', 'fighter', 'released', true, 22, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'pichu', 'Pichu', 'fighter', 'released', true, 23, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'pikachu', 'Pikachu', 'fighter', 'released', true, 24, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jigglypuff', 'Jigglypuff', 'fighter', 'released', true, 25, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mr-game-and-watch', 'Mr. Game & Watch', 'fighter', 'released', true, 26, 'Selectable Super Smash Bros. Melee roster entry for the checked version boundary.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('ggxxacpr', 'Guilty Gear XX Accent Core Plus R', '+R', 'Plus R', 8, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 1, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ky', 'Ky Kiske', 'fighter', 'released', true, 2, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'may', 'May', 'fighter', 'released', true, 3, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'millia', 'Millia Rage', 'fighter', 'released', true, 4, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zato-1', 'Eddie / Zato=1', 'fighter', 'released', true, 5, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baiken', 'Baiken', 'fighter', 'released', true, 6, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'faust', 'Faust', 'fighter', 'released', true, 7, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anji', 'Anji Mito', 'fighter', 'released', true, 8, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny', 'Johnny', 'fighter', 'released', true, 9, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jam', 'Jam Kuradoberi', 'fighter', 'released', true, 10, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 11, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dizzy', 'Dizzy', 'fighter', 'released', true, 12, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'testament', 'Testament', 'fighter', 'released', true, 13, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'slayer', 'Slayer', 'fighter', 'released', true, 14, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'i-no', 'I-No', 'fighter', 'released', true, 15, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zappa', 'Zappa', 'fighter', 'released', true, 16, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bridget', 'Bridget', 'fighter', 'released', true, 17, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'robo-ky', 'Robo-Ky', 'fighter', 'released', true, 18, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aba', 'A.B.A', 'fighter', 'released', true, 19, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'order-sol', 'Order-Sol', 'fighter', 'released', true, 20, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kliff', 'Kliff Undersn', 'fighter', 'released', true, 21, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'justice', 'Justice', 'fighter', 'released', true, 22, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'potemkin', 'Potemkin', 'fighter', 'released', true, 23, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chipp', 'Chipp Zanuff', 'fighter', 'released', true, 24, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'axl', 'Axl Low', 'fighter', 'released', true, 25, 'Selectable Guilty Gear XX Accent Core Plus R roster entry for the checked version boundary.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('vampire-savior', 'Vampire Savior', 'VSAV', 'Darkstalkers 3 arcade rules', 9, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anakaris', 'Anakaris', 'fighter', 'released', true, 1, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bishamon', 'Bishamon', 'fighter', 'released', true, 2, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'demitri', 'Demitri Maximoff', 'fighter', 'released', true, 3, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 4, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hsien-ko', 'Hsien-Ko', 'fighter', 'released', true, 5, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jon-talbain', 'Jon Talbain', 'fighter', 'released', true, 6, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lord-raptor', 'Lord Raptor', 'fighter', 'released', true, 7, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan Aensland', 'fighter', 'released', true, 8, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rikuo', 'Rikuo', 'fighter', 'released', true, 9, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sasquatch', 'Sasquatch', 'fighter', 'released', true, 10, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'victor', 'Victor von Gerdenheim', 'fighter', 'released', true, 11, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bulleta', 'B.B. Hood', 'fighter', 'released', true, 12, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jedah', 'Jedah Dohma', 'fighter', 'released', true, 13, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lilith', 'Lilith', 'fighter', 'released', true, 14, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'q-bee', 'Q-Bee', 'fighter', 'released', true, 15, 'Selectable Vampire Savior roster entry for the checked version boundary.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('sf6', 'Street Fighter 6', 'SF6', 'Current live roster', 10, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://news.capcomusa.com/street_fighter', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 1, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'luke', 'Luke', 'fighter', 'released', true, 2, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 3, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jamie', 'Jamie', 'fighter', 'released', true, 4, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'guile', 'Guile', 'fighter', 'released', true, 5, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kimberly', 'Kimberly', 'fighter', 'released', true, 6, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'juri', 'Juri', 'fighter', 'released', true, 7, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ken', 'Ken', 'fighter', 'released', true, 8, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blanka', 'Blanka', 'fighter', 'released', true, 9, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dhalsim', 'Dhalsim', 'fighter', 'released', true, 10, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'e-honda', 'E. Honda', 'fighter', 'released', true, 11, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dee-jay', 'Dee Jay', 'fighter', 'released', true, 12, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cammy', 'Cammy', 'fighter', 'released', true, 13, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'manon', 'Manon', 'fighter', 'released', true, 14, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marisa', 'Marisa', 'fighter', 'released', true, 15, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lily', 'Lily', 'fighter', 'released', true, 16, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jp', 'JP', 'fighter', 'released', true, 17, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zangief', 'Zangief', 'fighter', 'released', true, 18, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rashid', 'Rashid', 'fighter', 'released', true, 19, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aki', 'A.K.I.', 'fighter', 'released', true, 20, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ed', 'Ed', 'fighter', 'released', true, 21, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 22, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'm-bison', 'M. Bison', 'fighter', 'released', true, 23, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'terry', 'Terry', 'fighter', 'released', true, 24, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mai', 'Mai', 'fighter', 'released', true, 25, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'elena', 'Elena', 'fighter', 'released', true, 26, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sagat', 'Sagat', 'fighter', 'released', true, 27, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'c-viper', 'C. Viper', 'fighter', 'released', true, 28, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'alex', 'Alex', 'fighter', 'released', true, 29, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ingrid', 'Ingrid', 'fighter', 'released', true, 30, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yasmine', 'Yasmine', 'fighter', 'released', true, 31, 'Selectable Street Fighter 6 roster entry for the checked version boundary.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('mk1', 'Mortal Kombat 1', 'MK1', 'Definitive roster + Kameos', 11, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Fighter","allowedRoles":["fighter"]},{"id":"kameo","label":"Kameo","allowedRoles":["kameo"]}]}'::jsonb, 'https://www.mortalkombat.com/en-us/roster', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'liu-kang', 'Liu Kang', 'fighter', 'released', true, 1, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'scorpion', 'Scorpion', 'fighter', 'released', true, 2, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sub-zero', 'Sub-Zero', 'fighter', 'released', true, 3, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'raiden', 'Raiden', 'fighter', 'released', true, 4, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kung-lao', 'Kung Lao', 'fighter', 'released', true, 5, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kitana', 'Kitana', 'fighter', 'released', true, 6, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mileena', 'Mileena', 'fighter', 'released', true, 7, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny-cage', 'Johnny Cage', 'fighter', 'released', true, 8, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kenshi', 'Kenshi', 'fighter', 'released', true, 9, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'smoke', 'Smoke', 'fighter', 'released', true, 10, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rain', 'Rain', 'fighter', 'released', true, 11, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'li-mei', 'Li Mei', 'fighter', 'released', true, 12, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tanya', 'Tanya', 'fighter', 'released', true, 13, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baraka', 'Baraka', 'fighter', 'released', true, 14, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'geras', 'Geras', 'fighter', 'released', true, 15, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reptile', 'Reptile', 'fighter', 'released', true, 16, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ashrah', 'Ashrah', 'fighter', 'released', true, 17, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'havik', 'Havik', 'fighter', 'released', true, 18, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'general-shao', 'General Shao', 'fighter', 'released', true, 19, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sindel', 'Sindel', 'fighter', 'released', true, 20, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reiko', 'Reiko', 'fighter', 'released', true, 21, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nitara', 'Nitara', 'fighter', 'released', true, 22, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shang-tsung', 'Shang Tsung', 'fighter', 'released', true, 23, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'omni-man', 'Omni-Man', 'fighter', 'released', true, 24, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'quan-chi', 'Quan Chi', 'fighter', 'released', true, 25, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peacemaker', 'Peacemaker', 'fighter', 'released', true, 26, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ermac', 'Ermac', 'fighter', 'released', true, 27, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'homelander', 'Homelander', 'fighter', 'released', true, 28, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'takeda-takahashi', 'Takeda Takahashi', 'fighter', 'released', true, 29, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyrax', 'Cyrax', 'fighter', 'released', true, 30, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sektor', 'Sektor', 'fighter', 'released', true, 31, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'noob-saibot', 'Noob Saibot', 'fighter', 'released', true, 32, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghostface', 'Ghostface', 'fighter', 'released', true, 33, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'conan', 'Conan the Barbarian', 'fighter', 'released', true, 34, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 't-1000', 'T-1000 Terminator', 'fighter', 'released', true, 35, 'Selectable Mortal Kombat 1 roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sub-zero-kameo', 'Sub-Zero', 'kameo', 'released', true, 36, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shujinko', 'Shujinko', 'kameo', 'released', true, 37, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'scorpion-kameo', 'Scorpion', 'kameo', 'released', true, 38, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'motaro', 'Motaro', 'kameo', 'released', true, 39, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kung-lao-kameo', 'Kung Lao', 'kameo', 'released', true, 40, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyrax-kameo', 'Cyrax', 'kameo', 'released', true, 41, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'frost', 'Frost', 'kameo', 'released', true, 42, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'goro', 'Goro', 'kameo', 'released', true, 43, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jax', 'Jax', 'kameo', 'released', true, 44, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kano', 'Kano', 'kameo', 'released', true, 45, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'darrius', 'Darrius', 'kameo', 'released', true, 46, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sareena', 'Sareena', 'kameo', 'released', true, 47, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sektor-kameo', 'Sektor', 'kameo', 'released', true, 48, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sonya', 'Sonya', 'kameo', 'released', true, 49, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'stryker', 'Stryker', 'kameo', 'released', true, 50, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tremor', 'Tremor', 'kameo', 'released', true, 51, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'khameleon', 'Khameleon', 'kameo', 'released', true, 52, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'janet-cage', 'Janet Cage', 'kameo', 'released', true, 53, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mavado', 'Mavado', 'kameo', 'released', true, 54, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ferra', 'Ferra', 'kameo', 'released', true, 55, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'madam-bo', 'Madam Bo', 'kameo', 'released', true, 56, 'Selectable Mortal Kombat 1 Kameo roster entry for the checked version boundary.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('tekken-8', 'Tekken 8', 'TEKKEN 8', 'Current live roster', 12, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://tekken.com/fighters', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kazuya', 'Kazuya', 'fighter', 'released', true, 1, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jin', 'Jin', 'fighter', 'released', true, 2, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'king', 'King', 'fighter', 'released', true, 3, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jun', 'Jun', 'fighter', 'released', true, 4, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'paul', 'Paul', 'fighter', 'released', true, 5, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'law', 'Law', 'fighter', 'released', true, 6, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jack-8', 'Jack-8', 'fighter', 'released', true, 7, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lars', 'Lars', 'fighter', 'released', true, 8, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'xiaoyu', 'Xiaoyu', 'fighter', 'released', true, 9, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nina', 'Nina', 'fighter', 'released', true, 10, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leroy', 'Leroy', 'fighter', 'released', true, 11, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'asuka', 'Asuka', 'fighter', 'released', true, 12, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lili', 'Lili', 'fighter', 'released', true, 13, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bryan', 'Bryan', 'fighter', 'released', true, 14, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hwoarang', 'Hwoarang', 'fighter', 'released', true, 15, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'claudio', 'Claudio', 'fighter', 'released', true, 16, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'azucena', 'Azucena', 'fighter', 'released', true, 17, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'raven', 'Raven', 'fighter', 'released', true, 18, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leo', 'Leo', 'fighter', 'released', true, 19, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'steve', 'Steve', 'fighter', 'released', true, 20, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kuma', 'Kuma', 'fighter', 'released', true, 21, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yoshimitsu', 'Yoshimitsu', 'fighter', 'released', true, 22, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shaheen', 'Shaheen', 'fighter', 'released', true, 23, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dragunov', 'Dragunov', 'fighter', 'released', true, 24, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'feng', 'Feng', 'fighter', 'released', true, 25, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'panda', 'Panda', 'fighter', 'released', true, 26, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lee', 'Lee', 'fighter', 'released', true, 27, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'alisa', 'Alisa', 'fighter', 'released', true, 28, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zafina', 'Zafina', 'fighter', 'released', true, 29, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'devil-jin', 'Devil Jin', 'fighter', 'released', true, 30, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'victor', 'Victor', 'fighter', 'released', true, 31, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reina', 'Reina', 'fighter', 'released', true, 32, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'eddy', 'Eddy', 'fighter', 'released', true, 33, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lidia', 'Lidia', 'fighter', 'released', true, 34, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'heihachi', 'Heihachi', 'fighter', 'released', true, 35, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'clive', 'Clive', 'fighter', 'released', true, 36, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anna', 'Anna', 'fighter', 'released', true, 37, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'fahkumram', 'Fahkumram', 'fighter', 'released', true, 38, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'armor-king', 'Armor King', 'fighter', 'released', true, 39, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'miary-zo', 'Miary Zo', 'fighter', 'released', true, 40, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kunimitsu', 'Kunimitsu', 'fighter', 'released', true, 41, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bob', 'Bob', 'fighter', 'released', true, 42, 'Selectable Tekken 8 roster entry for the checked version boundary.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('ggst', 'Guilty Gear -Strive-', 'STRIVE', 'Current live roster', 13, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.guiltygear.com/ggst/en/character/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'robo-ky', 'Robo-Ky', 'fighter', 'released', true, 1, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jam', 'Jam Kuradoberi', 'fighter', 'released', true, 2, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lucy', 'Lucy', 'fighter', 'released', true, 3, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'unika', 'Unika', 'fighter', 'released', true, 4, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 5, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dizzy', 'Queen Dizzy', 'fighter', 'released', true, 6, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'slayer', 'Slayer', 'fighter', 'released', true, 7, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aba', 'A.B.A', 'fighter', 'released', true, 8, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'elphelt', 'Elphelt Valentine', 'fighter', 'released', true, 9, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny', 'Johnny', 'fighter', 'released', true, 10, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'asuka-r', 'Asuka R#', 'fighter', 'released', true, 11, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bedman', 'Bedman?', 'fighter', 'released', true, 12, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sin', 'Sin Kiske', 'fighter', 'released', true, 13, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bridget', 'Bridget', 'fighter', 'released', true, 14, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'testament', 'Testament', 'fighter', 'released', true, 15, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baiken', 'Baiken', 'fighter', 'released', true, 16, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'happy-chaos', 'Happy Chaos', 'fighter', 'released', true, 17, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jack-o', 'Jack-O''', 'fighter', 'released', true, 18, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'goldlewis', 'Goldlewis Dickinson', 'fighter', 'released', true, 19, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'i-no', 'I-No', 'fighter', 'released', true, 20, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anji', 'Anji Mito', 'fighter', 'released', true, 21, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'giovanna', 'Giovanna', 'fighter', 'released', true, 22, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nagoriyuki', 'Nagoriyuki', 'fighter', 'released', true, 23, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leo', 'Leo Whitefang', 'fighter', 'released', true, 24, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ramlethal', 'Ramlethal Valentine', 'fighter', 'released', true, 25, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zato-1', 'Zato=1 / Eddie', 'fighter', 'released', true, 26, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'millia', 'Millia Rage', 'fighter', 'released', true, 27, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'faust', 'Faust', 'fighter', 'released', true, 28, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'potemkin', 'Potemkin', 'fighter', 'released', true, 29, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chipp', 'Chipp Zanuff', 'fighter', 'released', true, 30, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'axl', 'Axl Low', 'fighter', 'released', true, 31, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'may', 'May', 'fighter', 'released', true, 32, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ky', 'Ky Kiske', 'fighter', 'released', true, 33, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 34, 'Selectable Guilty Gear -Strive- roster entry for the checked version boundary.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

commit;
