-- Generated from src/data/catalog.ts. Preview rows remain visibly marked until each game audit closes.
begin;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('2xko', '2XKO', '2XKO', 'Live roster preview', 1, '{"version":1,"noun":"Team","verified":false,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]}],"teamOptionLabel":"Fuse","verificationNote":"The two-Champion structure is confirmed. Current Fuse values require the catalog verification pass before saves are enabled."}'::jsonb, 'https://2xko.riotgames.com/en-us/champions/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ekko', 'Ekko', 'fighter', 'released', true, 1, 'A mobile close-range fighter built around temporal pressure and layered mixups.', 'https://2xko.riotgames.com/en-us/champions/ekko/', '2xko.riotgames.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ahri', 'Ahri', 'fighter', 'released', true, 2, 'A mobile mage who turns space control into fast approach and conversion routes.', 'https://2xko.riotgames.com/en-us/champions/ahri/', '2xko.riotgames.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'darius', 'Darius', 'fighter', 'released', true, 3, 'A heavy mid-range threat whose axe controls movement and rewards decisive reads.', 'https://2xko.riotgames.com/en-us/champions/', '2xko.riotgames.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yasuo', 'Yasuo', 'fighter', 'released', true, 4, 'A stance-rich swordsman with precise movement and expressive combo routing.', 'https://2xko.riotgames.com/en-us/champions/', '2xko.riotgames.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('marvel-tokon', 'Marvel Tokon: Fighting Souls', 'TOKON', 'Launch roster preview', 2, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]},{"id":"slot-3","label":"Slot 3","allowedRoles":["fighter"]},{"id":"slot-4","label":"Slot 4","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magik', 'Magik', 'fighter', 'released', true, 1, 'A sword-wielding fighter who uses stepping discs to attack from changing angles.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 2, 'A high-mobility fighter who uses webs to close distance and sustain pressure.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'black-panther', 'Black Panther', 'fighter', 'released', true, 3, 'The Queen of Wakanda fights with speed, precision, and close-range control.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 4, 'A technical space-control fighter who redirects offense through Tempest.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 5, 'A mid-range specialist with a broad projectile and air-mobility toolkit.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-doom', 'Doctor Doom', 'fighter', 'released', true, 6, 'A controlling team fighter who turns layered threats into oppressive screen presence.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'www.playstation.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('mvc2', 'Marvel vs. Capcom 2', 'MVC2', 'Arcade / collection ruleset', 3, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Point","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]},{"id":"slot-2","label":"Middle","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]},{"id":"slot-3","label":"Anchor","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist A","Assist B","Assist C"]}]}'::jsonb, 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 1, 'A fast, flight-capable team cornerstone with exceptional movement and control.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'game.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 2, 'An explosive rushdown character built around tri-jump pressure and fast confirms.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'game.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sentinel', 'Sentinel', 'fighter', 'released', true, 3, 'A large-body anchor with flight pressure, armor, and a defining assist.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'game.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cable', 'Cable', 'fighter', 'released', true, 4, 'A projectile specialist who converts meter and assists into screen control.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'game.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('umvc3', 'Ultimate Marvel vs. Capcom 3', 'UMVC3', 'Ultimate roster', 4, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Point","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]},{"id":"slot-2","label":"Middle","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]},{"id":"slot-3","label":"Anchor","allowedRoles":["fighter"],"optionLabel":"Assist","optionValues":["Assist alpha","Assist beta","Assist gamma"]}]}'::jsonb, 'https://www.capcom.com/manuals/umvc3/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zero', 'Zero', 'fighter', 'released', true, 1, 'A highly mobile point character with layered lightning pressure and long confirms.', 'https://www.capcom.com/manuals/umvc3/', 'www.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vergil', 'Vergil', 'fighter', 'released', true, 2, 'A dominant sword user with broad conversion tools and threatening meter use.', 'https://www.capcom.com/manuals/umvc3/', 'www.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doom', 'Doctor Doom', 'fighter', 'released', true, 3, 'A flexible team staple with flight movement and several high-value assists.', 'https://www.capcom.com/manuals/umvc3/', 'www.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dante', 'Dante', 'fighter', 'released', true, 4, 'A technical all-range fighter with an unusually broad special-move kit.', 'https://www.capcom.com/manuals/umvc3/', 'www.capcom.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('uni2', 'Under Night In-Birth II Sys:Celes', 'UNI2', 'Current official roster', 5, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.arcsystemworks.jp/uni2celes/en/character/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hyde', 'Hyde', 'fighter', 'released', true, 1, 'A versatile sword user whose grounded fundamentals lead into strong pressure.', 'https://www.arcsystemworks.jp/uni2celes/en/character/hyde.php', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-hyde.png', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4', 'approved', true, '2026-08-24T00:00:00Z', '2026-08-24T00:00:00Z'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hyde' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  review_state = excluded.review_state, is_primary = excluded.is_primary, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'linne', 'Linne', 'fighter', 'released', true, 2, 'A compact, high-speed fighter who uses fast movement to create close-range openings.', 'https://www.arcsystemworks.jp/uni2celes/en/character/linne.php', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yuzuriha', 'Yuzuriha', 'fighter', 'released', true, 3, 'A long-range stance character who rewards measured spacing and precise commitments.', 'https://www.arcsystemworks.jp/uni2celes/en/character/yuzuriha.php', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'waldstein', 'Waldstein', 'fighter', 'released', true, 4, 'A command-grab threat whose enormous normals force opponents to respect his reach.', 'https://www.arcsystemworks.jp/uni2celes/en/character/waldstein.php', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('avatar-legends', 'Avatar Legends: The Fighting Game', 'AVATAR', 'Roster preview', 6, '{"version":1,"noun":"Team","verified":false,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]}],"verificationNote":"The required support/fuse-equivalent selection is not yet verified against a stable first-party rules reference."}'::jsonb, 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'azula', 'Azula', 'fighter', 'released', true, 1, 'A precise firebender who turns disciplined spacing into explosive offense.', 'https://steamcommunity.com/app/2424420/announcements/', 'steamcommunity.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aang', 'Aang', 'fighter', 'released', true, 2, 'A highly mobile airbender built around evasive movement and redirection.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'store.steampowered.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'korra', 'Korra', 'fighter', 'released', true, 3, 'A direct, athletic bender who shifts elements to cover different ranges.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'store.steampowered.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zuko', 'Zuko', 'fighter', 'released', true, 4, 'A pressure-focused firebender who advances behind controlled flame attacks.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'store.steampowered.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('melee', 'Super Smash Bros. Melee', 'MELEE', 'NTSC 1.02', 7, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'fox', 'Fox', 'fighter', 'released', true, 1, 'A fast, execution-heavy character with explosive punish routes and flexible tools.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'www.smashbros.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marth', 'Marth', 'fighter', 'released', true, 2, 'A spacing-focused swordsman whose strongest hits reward precise range control.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'www.smashbros.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'falco', 'Falco', 'fighter', 'released', true, 3, 'A high-pressure glass cannon with dominant vertical combos and a disruptive laser.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'www.smashbros.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sheik', 'Sheik', 'fighter', 'released', true, 4, 'A grounded conversion specialist with quick normals and reliable edge pressure.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'www.smashbros.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('ggxxacpr', 'Guilty Gear XX Accent Core Plus R', '+R', 'Plus R', 8, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 1, 'An aggressive all-rounder with explosive close-range conversions.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ky', 'Ky Kiske', 'fighter', 'released', true, 2, 'A measured all-rounder who controls lanes with sword normals and projectiles.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'testament', 'Testament', 'fighter', 'released', true, 3, 'A trap-oriented space controller who layers threats across the screen.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zappa', 'Zappa', 'fighter', 'released', true, 4, 'An unorthodox stance character whose summoned spirits radically alter his options.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'www.arcsystemworks.jp', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('vampire-savior', 'Vampire Savior', 'VSAV', 'Darkstalkers 3 arcade rules', 9, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan', 'fighter', 'released', true, 1, 'A mobile offense character with flight movement and layered projectile pressure.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'www.capcom-games.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jedah', 'Jedah', 'fighter', 'released', true, 2, 'A mobile space-control character with unusual air movement and command threats.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'www.capcom-games.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bulleta', 'Bulleta', 'fighter', 'released', true, 3, 'A deceptive rushdown fighter who hides dangerous pressure behind playful movement.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'www.capcom-games.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'q-bee', 'Q-Bee', 'fighter', 'released', true, 4, 'A fast aerial attacker whose mobility creates difficult left-right pressure.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'www.capcom-games.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('sf6', 'Street Fighter 6', 'SF6', 'Current live version', 10, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://game.capcom.com/manual/SF6/en/ps5/page/1/1', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ken', 'Ken', 'fighter', 'released', true, 1, 'An aggressive shoto who converts forward movement into corner pressure.', 'https://www.streetfighter.com/6/en-us/character/ken', 'www.streetfighter.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 2, 'A technical neutral specialist with fast buttons, charge tools, and stance routes.', 'https://www.streetfighter.com/6/en-us/character/chunli', 'www.streetfighter.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 3, 'A volatile shoto with broad offensive options balanced by lower vitality.', 'https://www.streetfighter.com/6/en-us/character/akuma', 'www.streetfighter.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'juri', 'Juri', 'fighter', 'released', true, 4, 'A mobile pressure character who stores resources to extend offense and routing.', 'https://www.streetfighter.com/6/en-us/character/juri', 'www.streetfighter.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('mk1', 'Mortal Kombat 1', 'MK1', 'Definitive roster', 11, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Fighter","allowedRoles":["fighter"]},{"id":"kameo","label":"Kameo","allowedRoles":["kameo"]}]}'::jsonb, 'https://www.mortalkombat.com/en-gb/roster', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'scorpion', 'Scorpion', 'fighter', 'released', true, 1, 'A direct pressure fighter whose spear and teleports punish careless space.', 'https://www.mortalkombat.com/en-gb/roster', 'www.mortalkombat.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sub-zero', 'Sub-Zero', 'fighter', 'released', true, 2, 'A defensive fighter who uses ice to control movement and confirm openings.', 'https://www.mortalkombat.com/en-gb/roster', 'www.mortalkombat.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mileena', 'Mileena', 'fighter', 'released', true, 3, 'A fast attacker with sudden movement and punishing close-range sequences.', 'https://www.mortalkombat.com/en-gb/roster', 'www.mortalkombat.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sonya', 'Sonya', 'kameo', 'released', true, 4, 'A Kameo partner who extends pressure and converts grounded openings.', 'https://www.mortalkombat.com/en-gb/roster', 'www.mortalkombat.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kano', 'Kano', 'kameo', 'released', true, 5, 'A Kameo partner whose knives and ball attacks add flexible coverage.', 'https://www.mortalkombat.com/en-gb/roster', 'www.mortalkombat.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('tekken-8', 'Tekken 8', 'TEKKEN 8', 'Current live roster', 12, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://tekken.com/fighters', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jin', 'Jin Kazama', 'fighter', 'released', true, 1, 'A versatile Mishima-style fighter with strong punishment and stance transitions.', 'https://tekken.com/fighters/jin-kazama', 'tekken.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reina', 'Reina', 'fighter', 'released', true, 2, 'An assertive close-range fighter combining Mishima tools with agile stance pressure.', 'https://tekken.com/fighters/reina', 'tekken.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'king', 'King', 'fighter', 'released', true, 3, 'A grappler with layered throw chains and powerful counter-hit offense.', 'https://tekken.com/fighters/king', 'tekken.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lili', 'Lili', 'fighter', 'released', true, 4, 'A movement-oriented fighter who creates evasive angles and wall pressure.', 'https://tekken.com/fighters/lili', 'tekken.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('ggst', 'Guilty Gear -Strive-', 'STRIVE', 'Current live roster', 13, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.guiltygear.com/ggst/en/character/', 'preview', '2026-08-24T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 1, 'A forceful close-range all-rounder with explosive damage and direct pressure.', 'https://www.guiltygear.com/ggst/en/character/sol/', 'www.guiltygear.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ramlethal', 'Ramlethal Valentine', 'fighter', 'released', true, 2, 'A mid-range controller who turns sword placement into suffocating corner offense.', 'https://www.guiltygear.com/ggst/en/character/ramlethal/', 'www.guiltygear.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nagoriyuki', 'Nagoriyuki', 'fighter', 'released', true, 3, 'A high-damage swordsman whose blood resource governs movement and restraint.', 'https://www.guiltygear.com/ggst/en/character/nagoriyuki/', 'www.guiltygear.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bridget', 'Bridget', 'fighter', 'released', true, 4, 'A mobile setplay fighter who uses yo-yo placement to sustain layered approaches.', 'https://www.guiltygear.com/ggst/en/character/bridget/', 'www.guiltygear.com', 'attributed-paraphrase', '2026-08-24T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

commit;
