-- Generated from src/data/catalog.ts. Roster completeness and art rights review are tracked separately.
begin;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('2xko', '2XKO', '2XKO', 'Current live roster', 1, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"point","label":"Point","allowedRoles":["fighter"]},{"id":"assist","label":"Assist","allowedRoles":["fighter"]}],"teamOptionLabel":"Fuse","teamOptionValues":["Double Down","Juggernaut","Sidekick","2X Assist","Freestyle","Teamfight"],"constraintNote":"Choose different champions for Point and Assist."}'::jsonb, 'https://2xko.riotgames.com/en-us/champions/', 'verified', '2026-08-25T00:00:00Z')
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

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-ahri.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/593043e42b15c4826f7e0fc2a0bea85a05cdd994-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:a8b7868f1782f73790bb95976f0124b522909cba99cd5fcc8f57e66b22ba1f70', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'ahri' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akali', 'Akali', 'fighter', 'released', true, 2, 'A close-range assassin who uses rapid movement and layered follow-ups to stay on top of opponents.', 'https://2xko.riotgames.com/en-us/champions/akali/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-akali.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/1705793c7046ee13bb9027b868a91e5b935095b6-472x630.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:29a29fcf24cfa7a3e2fc1d6c7296fc2bde78d5779bc7fa52ca01ca414996d14e', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'akali' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blitzcrank', 'Blitzcrank', 'fighter', 'released', true, 3, 'A heavyweight grappler whose Rocket Grab and armored advances turn range into command-grab pressure.', 'https://2xko.riotgames.com/en-us/champions/blitzcrank/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-blitzcrank.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/5af8a16de4c87ea5bb8a3b3f945e90f3306a4cfe-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:beecc00b38bf24c55fca13d48fa14211212b4ae706a4d14dae26e620bf8a7691', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'blitzcrank' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'braum', 'Braum', 'fighter', 'released', true, 4, 'A defensive brawler who protects space with his shield and converts close contact into team-friendly pressure.', 'https://2xko.riotgames.com/en-us/champions/braum/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-braum.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/96bcb8cdcee7f3fd12b379c8517aa1f33504c371-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:4c3778c3a2f3c2bd3715a7a95b58143d698503f296256617a4c96628e2b939fe', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'braum' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'caitlyn', 'Caitlyn', 'fighter', 'released', true, 5, 'A long-range marksman who controls lanes with rifle shots and traps before cashing out on precise confirms.', 'https://2xko.riotgames.com/en-us/champions/caitlyn/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-caitlyn.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7d7c3713add9fe798cc71ba66217a1a46d6634bc-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:b866957ee92e1832262d79b5b26336ae0f2a7c3a3751e6a09db11a49aeb5e164', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'caitlyn' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'darius', 'Darius', 'fighter', 'released', true, 6, 'A heavy mid-range threat whose axe controls movement and rewards decisive reads.', 'https://2xko.riotgames.com/en-us/champions/darius/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-darius.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/67e08591a957c9068e3b146976785fb8308d6cd4-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:ad35f39c908a5b5f3386a5a3a2bd85e575ee9a53bdcc7580c0f9230a32cb3b6a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'darius' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ekko', 'Ekko', 'fighter', 'released', true, 7, 'A mobile close-range fighter built around temporal pressure and layered mixups.', 'https://2xko.riotgames.com/en-us/champions/ekko/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-ekko.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f98dcc375555b36de58cc991c381c4fce641b636-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:3956f83f517517a8d86ab1dd6780b47ffe4f298c783d3dc4ace34681bd89e977', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'ekko' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'illaoi', 'Illaoi', 'fighter', 'released', true, 8, 'A heavy-hitting brawler who summons tentacles to extend pressure and punish opponents who contest her space.', 'https://2xko.riotgames.com/en-us/champions/illaoi/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-illaoi.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/12a5e9cea0ea7626b0d89e3740180f13341b5dc8-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:5faf3f20c07751a798a6e9727c67324c10f1aeecb0ce35e1a94225d836c5fe4f', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'illaoi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jinx', 'Jinx', 'fighter', 'released', true, 9, 'A projectile specialist who switches weapons and covers movement with gadgets for chaotic screen control.', 'https://2xko.riotgames.com/en-us/champions/jinx/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-jinx.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f0e8ed7da57962c1245dfca8c26a8a81ddab017d-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:b9807815aaf85b1bf6848b9014ade9568a2be86e98075319eac9b53193537839', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'jinx' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'senna', 'Senna', 'fighter', 'released', true, 10, 'A long-range marksman who blends deliberate shots with support tools that reshape team positioning.', 'https://2xko.riotgames.com/en-us/champions/senna/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-senna.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0606aa0ee6b494a762057c971c7bb642fe607bba-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:3a1b260485576fcf812f7906fa76bc5166e6a3f48021319d5cf370f69aa59877', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'senna' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'teemo', 'Teemo', 'fighter', 'released', true, 11, 'A compact trap setter who uses poison, mobility, and mushrooms to make every route risky.', 'https://2xko.riotgames.com/en-us/champions/teemo/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-teemo.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0933542e8d4fc57628e7fe7dff9cd17d2ff457a4-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:185a0c0bd7a1d932b21ddb71e499ab47eb7b671c7e0118720ad7a94f04721593', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'teemo' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thresh', 'Thresh', 'fighter', 'released', true, 12, 'A control specialist whose chain, hook, and lantern create unusual conversions and tag positions.', 'https://2xko.riotgames.com/en-us/champions/thresh/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-thresh.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/2c9af0c83fd43c0a8f5258f75f8f197655971de9-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:a08696516143ef646c54e8a41d6c567de8c591a71dd370e9ff9798fc6a2db71c', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'thresh' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vi', 'Vi', 'fighter', 'released', true, 13, 'A forward-driving brawler who uses armored punches and charged movement to force close-range exchanges.', 'https://2xko.riotgames.com/en-us/champions/vi/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-vi.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/d69d95df23f8a7e5c951a1021f4f5b118fadaec3-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:692475c52ffe6346d8a0fe0161f1d3035ccafff3b3cb5b60df46f26d379d3e0e', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'vi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'warwick', 'Warwick', 'fighter', 'released', true, 14, 'A relentless rushdown fighter whose lunges and feral pressure reward staying in motion.', 'https://2xko.riotgames.com/en-us/champions/warwick/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-warwick.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/6aa9fb38660c1b63c37716c6f44739ba406b501f-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:d9e8e03c1357ee068298dc5506a431874ce26bd9415d9293f391614510306fdc', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'warwick' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yasuo', 'Yasuo', 'fighter', 'released', true, 15, 'A stance-rich swordsman with precise movement and expressive combo routing.', 'https://2xko.riotgames.com/en-us/champions/yasuo/', 'Riot Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = '2xko'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/2xko-yasuo.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7e9459768d4641533fdbfa1c0e84b6574d8e05ab-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:296dbb227cbccb9b67091d7b586d37c9fbd6743306094570bcb2848ac7f44f15', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'yasuo' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('marvel-tokon', 'Marvel Tokon: Fighting Souls', 'TOKON', 'Launch roster', 2, '{"version":1,"noun":"Team","verified":true,"ordered":true,"uniqueCharacters":true,"slots":[{"id":"slot-1","label":"Slot 1","allowedRoles":["fighter"]},{"id":"slot-2","label":"Slot 2","allowedRoles":["fighter"]},{"id":"slot-3","label":"Slot 3","allowedRoles":["fighter"]},{"id":"slot-4","label":"Slot 4","allowedRoles":["fighter"]}]}'::jsonb, 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 1, 'A durable shield fighter who controls approach with thrown-shield pressure and turns disciplined defense into team-friendly counterattacks.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 2, 'A ranged armored fighter who uses repulsor shots and air control to keep opponents at the distance where his team can convert safely.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-iron-man.png', 'https://gmedia.playstation.com/is/image/SIEPDC/iron-man-big-16-02-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:0431f9ecaa2d0f3ab66a60887c10e23ff33355f763772838c241938ed8407c55', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'iron-man' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 3, 'A heavyweight bruiser who advances behind powerful strikes and turns close-range openings into high-damage team sequences.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'black-panther', 'Black Panther', 'fighter', 'released', true, 4, 'A fast claw fighter who uses pouncing movement and close-range strings to break through space and maintain momentum.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-black-panther.png', 'https://gmedia.playstation.com/is/image/SIEPDC/black-panther-big-21-04-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:c15cc1540105a6b4d66f2308ab40459262c0241578431d8196ad03e2251a610a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'black-panther' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 5, 'An aerial space controller who combines weather projectiles with strong movement to shape where both teams can safely fight.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-storm.png', 'https://gmedia.playstation.com/is/image/SIEPDC/storm-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:558bbb66e3580c4f1a5543eaea1ff426ff4bf78b8bd9f0af101a9c48bdf5e9d3', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'storm' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magik', 'Magik', 'fighter', 'released', true, 6, 'A sword-and-portal fighter who mixes grounded slashes with portal setups and quick approach routes for layered team pressure.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-magik.png', 'https://gmedia.playstation.com/is/image/SIEPDC/magik-big-10-02-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:51401dc3f3048d15f88013b39f31e3c46885a1f32db05d846a32a5ddf1ed781f', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'magik' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 7, 'A relentless claw rushdown fighter who relies on fast advancing attacks and close-range conversions to stay on top of the opponent.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'danger', 'Danger', 'fighter', 'released', true, 8, 'A technical robotic fighter who uses ranged weapons and deployable gadgets to support controlled approaches and team extensions.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 9, 'A mobile web-slinging fighter who changes trajectory quickly and converts evasive movement into scramble-heavy offense.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-spider-man.png', 'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:9c1ff858cd3c773da6fda90a80916c9379a795866fc49402d0505e37890743d5', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'spider-man' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ms-marvel', 'Ms. Marvel', 'fighter', 'released', true, 10, 'A flexible close-range fighter whose elastic limbs extend her buttons and let her turn unusual angles into continued pressure.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'star-lord', 'Star-Lord', 'fighter', 'released', true, 11, 'A projectile-focused blaster who controls lanes with ranged shots and uses mobility to reposition before confirming damage.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peni-parker', 'Peni Parker', 'fighter', 'released', true, 12, 'A mech-based fighter who combines armored robot attacks with ranged tools to cover space while her team rotates in.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghost-rider', 'Ghost Rider', 'fighter', 'released', true, 13, 'A long-reaching chain fighter who uses fire-based attacks and wide control zones to make approaches costly.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blade', 'Blade', 'fighter', 'released', true, 14, 'A weapon fighter who blends sword strings with firearm pressure, giving his team a grounded way to contest both close and mid range.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'loki', 'Loki', 'fighter', 'released', true, 15, 'A deceptive control fighter who uses trickery and ranged magic to create uncertain approach timings for the opposing team.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'deadpool', 'Deadpool', 'fighter', 'released', true, 16, 'A fast weapon-and-firearm fighter who switches between sword pressure and gunfire to keep offense unpredictable.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-doom', 'Doctor Doom', 'fighter', 'released', true, 17, 'A versatile armored fighter who uses energy projectiles and summoned technology to control space and extend team offense.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/marvel-tokon-doctor-doom.png', 'https://gmedia.playstation.com/is/image/SIEPDC/dr-doom-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:6cb2bb0244b68eb0d778b4bdcb680d62808a73604df1d1962227e40f73d420f6', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'doctor-doom' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 18, 'A highly mobile magnetic fighter who combines airborne movement with projectile control to attack from changing angles.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'green-goblin', 'Green Goblin', 'fighter', 'released', true, 19, 'A gadget fighter who uses explosive pumpkin attacks and glider mobility to harass opponents while controlling the screen.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'marvel-tokon'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'carnage', 'Carnage', 'fighter', 'released', true, 20, 'A symbiote weapon fighter who extends attacks with tendrils and traps movement with persistent, difficult-to-ignore pressure.', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'blackheart', 'Blackheart', 'fighter', 'released', true, 1, 'A summon-based zoner who fills the screen with dark projectiles and traps before using his assist to preserve space.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cable', 'Cable', 'fighter', 'released', true, 2, 'A long-range gunner who controls neutral with grenades and beam supers, especially the assist-friendly Air Hyper Viper Beam.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mvc2-cable.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/cable.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:c76a8626ac3e2908044ed3688d91459d7cadb54f5db5b54a6d8b96e27d94ce54', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'cable' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 3, 'A shield specialist who converts sturdy normals, shield throws, and charging attacks into straightforward team pressure.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'colossus', 'Colossus', 'fighter', 'released', true, 4, 'A large armored rushdown fighter who uses super armor and rushing command attacks to force his way into close range.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyclops', 'Cyclops', 'fighter', 'released', true, 5, 'A well-rounded beam fighter whose optic blasts, fast normals, and strong anti-air assist make him useful from any team position.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-doom', 'Doctor Doom', 'fighter', 'released', true, 6, 'A versatile projectile fighter who combines rocks, hidden missiles, and beam attacks to control space and extend combos.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'gambit', 'Gambit', 'fighter', 'released', true, 7, 'A mid-range pressure fighter who throws charged cards and uses staff attacks to turn controlled pokes into explosive supers.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 8, 'A high-damage bruiser who relies on armored normals, Gamma Wave, and an imposing assist to make close exchanges dangerous.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iceman', 'Iceman', 'fighter', 'released', true, 9, 'A projectile specialist who uses ice beams and hail to dominate lanes while threatening long-range DHCs and assists.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 10, 'A technical flight-capable fighter who layers repulsor beams and air movement into precise confirms and team extensions.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'juggernaut', 'Juggernaut', 'fighter', 'released', true, 11, 'A heavy armored fighter who turns forward-moving strikes, headcrush attacks, and a damaging assist into blunt-force offense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 12, 'A fast flight fighter who uses magnetic projectiles, tri-dash movement, and air strings to maintain relentless pressure.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mvc2-magneto.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/magneto.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:419c3f9d88276fd2d65c10f21f4b930f80e871cba719d55b3e522370f73e58c2', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'magneto' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marrow', 'Marrow', 'fighter', 'released', true, 13, 'A mid-range mutant who creates bone weapons and projectiles to control space before cashing out with grounded combos.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'omega-red', 'Omega Red', 'fighter', 'released', true, 14, 'A setplay fighter who uses carbonadium coils and long-reaching tentacles to restrict movement and lock down approaches.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'psylocke', 'Psylocke', 'fighter', 'released', true, 15, 'A quick ninja fighter who uses psychic blades, mobility, and a reliable anti-air assist to start and sustain rushdown.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rogue', 'Rogue', 'fighter', 'released', true, 16, 'A close-range power-copy fighter who steals useful properties through contact and converts strong buttons into flexible offense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sabretooth', 'Sabretooth', 'fighter', 'released', true, 17, 'A rushdown fighter who uses claw strings and Berserker-style pressure to turn a clean approach into extended corner offense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sentinel', 'Sentinel', 'fighter', 'released', true, 18, 'A giant zoning fighter who uses drones, rockets, flight, and large normals to dominate both screen space and team neutral.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mvc2-sentinel.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/sentinel.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:693e4b48a209f9656dbf37ba970c4c242d84d4d985f93de00ffe72b6f7d99c2a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'sentinel' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shuma-gorath', 'Shuma-Gorath', 'fighter', 'released', true, 19, 'A strange space-control fighter who combines tentacles, eye beams, and teleporting movement with disruptive assists.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'silver-samurai', 'Silver Samurai', 'fighter', 'released', true, 20, 'A stance-based sword fighter who changes elemental weapon properties to vary neutral control and combo routes.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 21, 'A mobile rushdown fighter who uses web balls, wall movement, and fast air strings to convert scrambles into pressure.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spiral', 'Spiral', 'fighter', 'released', true, 22, 'A weapon-summoning fighter who creates sword storms and weapon patterns to overwhelm opponents from multiple ranges.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 23, 'A mobile weather fighter who controls the screen with wind, lightning, ice, and flight before routing into team supers.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mvc2-storm.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/storm.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:ccb6b88438a76bc7d61831a3171fa8cd14eec18c006d5f73f555c94e8e13ade6', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'storm' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thanos', 'Thanos', 'fighter', 'released', true, 24, 'A large power fighter who cycles Infinity Gems to change his neutral tools and punish opponents with huge normals and supers.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 25, 'A mid-range symbiote fighter who uses web projectiles, long limbs, and Venom Fang pressure to control grounded exchanges.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'war-machine', 'War Machine', 'fighter', 'released', true, 26, 'A heavy gunner who saturates the screen with bullets, missiles, and armor-breaking supers while contributing a strong projectile assist.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 27, 'A premier claw rushdown fighter who uses Berserker Barrage, drill attacks, and fast normals to convert any close opening.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine-bone', 'Wolverine (Bone Claws)', 'fighter', 'released', true, 28, 'A shorter-claw Wolverine variant that keeps the same close-range rushdown identity while changing reach and combo spacing from the metal-claw form.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 29, 'A glass-cannon rushdown fighter who combines air fireballs, teleport movement, and Shun Goku Satsu threat to attack from unexpected angles.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'amingo', 'Amingo', 'fighter', 'released', true, 30, 'A summon fighter who calls cactus helpers and uses unusual projectiles and command attacks to create awkward mid-range situations.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anakaris', 'Anakaris', 'fighter', 'released', true, 31, 'A large curse-and-setplay fighter who uses transformation, mummy projectiles, and teleports to disrupt normal defense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bulleta', 'B.B. Hood (Bulleta)', 'fighter', 'released', true, 32, 'A trap-heavy gunner who mixes firearms, bombs, and fast approach options to make every blocked sequence hard to read.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cammy', 'Cammy', 'fighter', 'released', true, 33, 'A fast rushdown fighter who uses Cannon Spike, Spiral Arrow, and Hooligan movement to attack low, high, and from the air.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-commando', 'Captain Commando', 'fighter', 'released', true, 34, 'A balanced brawler who combines punches, fire, and electric attacks with a dependable assist that covers advancing teammates.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'charlie', 'Charlie', 'fighter', 'released', true, 35, 'A charge-based footsie fighter who uses Sonic Boom and Flash Kick to control lanes and punish careless jumps.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 36, 'A technical neutral fighter whose long-reaching normals, Kikoken, and lightning-leg pressure support both pokes and combos.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dan', 'Dan', 'fighter', 'released', true, 37, 'A compact pressure fighter who uses Gadoken, Dankukyaku, and Shoryuken-style counters to turn close reads into expressive offense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dhalsim', 'Dhalsim', 'fighter', 'released', true, 38, 'A long-range zoner who controls space with stretchy limbs, Yoga Fire, teleport movement, and difficult-to-approach angles.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 39, 'A mobile cat fighter who uses rolling attacks, wall movement, and rapid close-range strings to keep opponents scrambling.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'guile', 'Guile', 'fighter', 'released', true, 40, 'A charge-based defensive fighter who builds a wall with Sonic Boom and Flash Kick before advancing behind disciplined spacing.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hayato', 'Hayato Kanzaki', 'fighter', 'released', true, 41, 'A sword rushdown fighter who uses plasma blade slashes, projectiles, and fast advancing attacks to punish gaps in defense.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jill-valentine', 'Jill Valentine', 'fighter', 'released', true, 42, 'A setup fighter who combines firearm attacks with zombie and creature calls to create layered pressure and unusual screen control.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jin-saotome', 'Jin Saotome', 'fighter', 'released', true, 43, 'A close-range brawler who uses explosive punches, rocket attacks, and fiery supers to convert aggressive reads into damage.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ken', 'Ken', 'fighter', 'released', true, 44, 'A direct shoto fighter who uses Hadoken, Shoryuken, and Tatsumaki Senpukyaku to cover neutral, anti-air, and combo needs.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'm-bison', 'M. Bison', 'fighter', 'released', true, 45, 'A rushdown dictator who uses Psycho Crusher, Scissor Kicks, and teleport movement to stay mobile and pressure the corner.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mega-man', 'Mega Man', 'fighter', 'released', true, 46, 'A projectile-focused fighter who uses lemons, charged shots, and weapon-copy supers to control the screen from a safe distance.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan', 'fighter', 'released', true, 47, 'A flight-and-projectile fighter who fills the screen with Soul Fists and uses air movement to attack from ambiguous angles.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'roll', 'Roll', 'fighter', 'released', true, 48, 'A small technical fighter who uses broom attacks, compact hurtbox movement, and unusual normals to frustrate conventional spacing.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ruby-heart', 'Ruby Heart', 'fighter', 'released', true, 49, 'A versatile mid-range fighter who uses summoned spells, an anchor, and flexible movement to control space and set up confirms.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 50, 'A well-rounded shoto fighter who uses Hadoken, Shoryuken, and Tatsumaki routes to cover neutral and convert clean hits.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sakura', 'Sakura', 'fighter', 'released', true, 51, 'A fast close-range shoto who uses compact fireballs, Shouoken, and rapid pressure to turn momentum into long combos.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'servbot', 'Servbot', 'fighter', 'released', true, 52, 'A small trickster fighter who relies on bombs, odd movement, and a difficult-to-hit body to create scrambles and punish whiffs.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sonson', 'SonSon', 'fighter', 'released', true, 53, 'A staff-wielding fighter who changes size and uses projectiles, long pokes, and transformation options to vary her neutral game.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'strider-hiryu', 'Strider Hiryu', 'fighter', 'released', true, 54, 'A highly mobile sword fighter who uses Formation summons, wall movement, and teleports to attack from every angle.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tron-bonne', 'Tron Bonne', 'fighter', 'released', true, 55, 'A trap-and-summon fighter who uses Servbots, Gustaff armor, and projectile gadgets to control space before rushing in.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mvc2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zangief', 'Zangief', 'fighter', 'released', true, 56, 'A grappler who uses Spinning Piledriver, Green Hand, and armored lariats to turn one close read into sustained threat.', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'strider-hiryu', 'Strider Hiryu', 'fighter', 'released', true, 1, 'A hyper-mobile sword fighter who uses Formation summons, wall movement, and teleports to create rapid cross-screen pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-fist', 'Iron Fist', 'fighter', 'released', true, 2, 'A close-range martial artist who builds damage through Rekku and Immortal Weapon pressure after forcing his way inside.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nova', 'Nova', 'fighter', 'released', true, 3, 'A mid-range space fighter who uses gravimetric projectiles, flight movement, and powerful normals to control approach lanes.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phoenix-wright', 'Phoenix Wright', 'fighter', 'released', true, 4, 'A stance-based investigator who gathers evidence, then turns a successful case into an unpredictable turnabout offense.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doctor-strange', 'Doctor Strange', 'fighter', 'released', true, 5, 'A long-range mystic who uses multiple spell patterns, teleport movement, and projectile control to dictate neutral.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vergil', 'Vergil', 'fighter', 'released', true, 6, 'A high-damage stance fighter who combines rapid sword slashes, teleporting movement, and Spiral Swords lockdown.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/umvc3-vergil.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/b910a3cc3952012c7111b152af718e2f.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:4dfdd583f5462e8db772896c825170bf4c2fc1d39a54aea376dd0cc2f63477c3', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'vergil' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghost-rider', 'Ghost Rider', 'fighter', 'released', true, 7, 'A long-range chain fighter who uses fire, vertical control, and wide normals to make approaching his team difficult.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'frank-west', 'Frank West', 'fighter', 'released', true, 8, 'A resource fighter who levels up through photographs and then uses weapons, items, and stronger normals to snowball offense.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'firebrand', 'Firebrand', 'fighter', 'released', true, 9, 'An aerial rushdown fighter who uses flight, wall cling movement, and fireball pressure to keep opponents trapped above or below.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hawkeye', 'Hawkeye', 'fighter', 'released', true, 10, 'A precision zoner who switches arrow types to cover horizontal, vertical, and delayed spaces before confirming from safety.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rocket-raccoon', 'Rocket Raccoon', 'fighter', 'released', true, 11, 'A trap-focused small-body fighter who fills the screen with gadgets, log traps, and projectiles to control movement.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nemesis-t-type', 'Nemesis T-Type', 'fighter', 'released', true, 12, 'A heavyweight weapon fighter who uses armor, rockets, and long-reaching punches to force slow but dangerous approaches.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-america', 'Captain America', 'fighter', 'released', true, 13, 'A durable shield fighter who uses charging strikes, shield throws, and defensive normals to provide stable team pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 14, 'A balanced shoto fighter who uses Hadoken, Shoryuken, and Tatsumaki routes before changing power through his available modes.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 15, 'A technical neutral fighter whose long normals, Kikoken, and lightning-leg pressure convert grounded control into team damage.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'thor', 'Thor', 'fighter', 'released', true, 16, 'A heavyweight thunder fighter who uses armored hammer attacks, lightning, and command-grab threat to dominate close range.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spider-man', 'Spider-Man', 'fighter', 'released', true, 17, 'A mobile web fighter who uses web swings, wall movement, and fast air strings to turn evasive movement into rushdown.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dante', 'Dante', 'fighter', 'released', true, 18, 'A stance-rich weapon fighter who switches styles and weapons to cover neutral, setplay, and high-expression combo routes.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/umvc3-dante.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/893d1dc95c1896f2177e84bea51dad7d.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:6641ca935f62229c8e1f416315711ff606366ebbab375882b4869b0b18e4cb95', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'dante' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'trish', 'Trish', 'fighter', 'released', true, 19, 'A trap-and-sword fighter who uses delayed round-trip attacks, lightning, and teleport movement to create layered pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'storm', 'Storm', 'fighter', 'released', true, 20, 'A flight-capable weather fighter who combines wind, lightning, and ice projectiles with strong air movement and team supers.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'crimson-viper', 'Crimson Viper', 'fighter', 'released', true, 21, 'A mobility fighter who uses feints, seismic attacks, and burning kicks to create sudden left-right pressure and conversions.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'viewtiful-joe', 'Viewtiful Joe', 'fighter', 'released', true, 22, 'A small rushdown fighter who uses Slow, Mach Speed, and Zoom to change attack timing and amplify close-range conversions.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'spencer', 'Spencer', 'fighter', 'released', true, 23, 'A grappling-arm fighter who uses Bionic Maneuvers to swing through space, extend combos, and punish careless positioning.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'amaterasu', 'Amaterasu', 'fighter', 'released', true, 24, 'A stance-based sword fighter who changes divine instruments to gain projectiles, traps, and close-range pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'magneto', 'Magneto', 'fighter', 'released', true, 25, 'A flight fighter who uses magnetic projectiles, fast air movement, and repulsion tools to maintain offense from any angle.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'iron-man', 'Iron Man', 'fighter', 'released', true, 26, 'A technical armored fighter who uses repulsor beams, flight, and precise air routes to control space and extend team combos.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wolverine', 'Wolverine', 'fighter', 'released', true, 27, 'A fast claw rushdown fighter who uses Berserker Charge, drill attacks, and close-range normals to stay on top of opponents.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'deadpool', 'Deadpool', 'fighter', 'released', true, 28, 'A weapon-switching rushdown fighter who blends katanas, pistols, teleport movement, and quick mix-ups into constant pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'super-skrull', 'Super-Skrull', 'fighter', 'released', true, 29, 'A versatile grappler who combines elastic limbs, fire, rock armor, and command attacks to threaten at multiple ranges.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'modok', 'M.O.D.O.K.', 'fighter', 'released', true, 30, 'A technical screen controller who uses floating movement, psychic projectiles, and barriers to make approach routes highly deliberate.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tron-bonne', 'Tron Bonne', 'fighter', 'released', true, 31, 'A gadget-based setplay fighter who uses Servbots, Gustaff armor, and Bonne Strike pressure to control space and start offense.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan', 'fighter', 'released', true, 32, 'A flight-and-projectile specialist who uses Soul Fists, air movement, and Astral Vision to overwhelm opponents with layered patterns.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phoenix', 'Phoenix', 'fighter', 'released', true, 33, 'A resource-sensitive fighter who builds meter and then uses Dark Phoenix or resurrection threat to turn a fragile neutral game into momentum.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 34, 'A mobile rushdown fighter who uses rolling movement, wall attacks, and quick normals to force scrambles at close range.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'x-23', 'X-23', 'fighter', 'released', true, 35, 'A fast claw fighter who uses teleporting movement, dive attacks, and Ankle Slicer pressure to create ambiguous rushdown.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'doom', 'Doctor Doom', 'fighter', 'released', true, 36, 'A versatile armored fighter who uses Hidden Missiles, rocks, and Plasma Beam to control space and provide exceptional team support.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/umvc3-doom.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/doctor_doom.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Marvel vs. Capcom 2 Doctor Doom art via Capcom; cross-version identity fallback for UMVC3', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. No live first-party version-matched UMVC3 Doctor Doom render was found; this MVC2 art is explicitly cross-version.', 'sha256:2867aaa52ef1094fbdfd24d961fd6e904182e2631a71591fb30f75029420b5a2', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'doom' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dormammu', 'Dormammu', 'fighter', 'released', true, 37, 'A spell-stacking zoner who combines dark projectiles, Liberation charges, and teleports to build layered screen control.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'haggar', 'Mike Haggar', 'fighter', 'released', true, 38, 'A grappler who uses pipe normals, Lariat, and Spinning Piledriver to turn armored approaches into damaging corner pressure.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hulk', 'Hulk', 'fighter', 'released', true, 39, 'A heavyweight rushdown fighter who uses super armor, Gamma Wave, and large normals to make close-range trades heavily favor him.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'arthur', 'Arthur', 'fighter', 'released', true, 40, 'A projectile-and-resource fighter who cycles armor and weapons while using daggers, axes, and shield tools to control space.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'she-hulk', 'She-Hulk', 'fighter', 'released', true, 41, 'A mobile grappler who uses command grabs, armored approaches, and torpedo movement to convert pressure into strong corner carry.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 42, 'A fast glass-cannon fighter who uses air fireballs, teleport movement, and high-damage demon supers to attack from changing angles.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'taskmaster', 'Taskmaster', 'fighter', 'released', true, 43, 'A weapon-copy fighter who uses arrows, sword normals, and shield attacks to borrow familiar tools and adapt to matchups.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hsien-ko', 'Hsien-Ko', 'fighter', 'released', true, 44, 'A stance-and-projectile fighter who uses talismans, sentinels, and armored special attacks to create awkward layered offense.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sentinel', 'Sentinel', 'fighter', 'released', true, 45, 'A giant zoning fighter who uses drones, rockets, flight, and huge normals to dominate screen space and support team conversions.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chris-redfield', 'Chris Redfield', 'fighter', 'released', true, 46, 'A methodical gunner who switches firearms and explosives to control lanes, punish approaches, and convert grounded hits.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wesker', 'Wesker', 'fighter', 'released', true, 47, 'A fast teleporting rushdown fighter who uses gunshots, Samurai Edge pressure, and wall-bounce routes to stay unpredictable.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zero', 'Zero', 'fighter', 'released', true, 48, 'A high-execution sword fighter who chains Rekkoha, Raikousen, and projectile specials into relentless confirms and mix-ups.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/umvc3-zero.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/2f7319c0e9932a47d0e9db7ef453ec4f.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:66f595785490a5e6cadb6e05607b26bc8b1ef0fb9d718c21b0de789d5ee73b7e', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'zero' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jill-valentine', 'Jill Valentine', 'fighter', 'released', true, 49, 'A setup fighter who combines guns, knives, and creature summons to create layered pressure and unusual neutral patterns.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'umvc3'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shuma-gorath', 'Shuma-Gorath', 'fighter', 'released', true, 50, 'A strange space-control fighter who uses tentacles, eye beams, and teleport movement to disrupt standard approaches.', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-hyde.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_000Hyde.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hyde' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'linne', 'Linne', 'fighter', 'released', true, 2, 'A fast close-range fighter who uses quick normals, frame traps, block strings, and aerial throw punishes to sustain offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-linne.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_001Linne.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'linne' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'waldstein', 'Waldstein', 'fighter', 'released', true, 3, 'A large claw fighter who uses mix-ups, anti-air attacks, and reliable follow-ups to turn openings into damaging combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-waldstein.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_002Waldstein.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'waldstein' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'carmine', 'Carmine', 'fighter', 'released', true, 4, 'A blood-powered mix-up fighter whose overheads, placed attacks, and mid-range knockdowns feed extended combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-carmine.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_003Carmine.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:532eac2560010c3d30a78e10517b7b4a142e1b2b5339f1ae82523fe2477fb87b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'carmine' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'orie', 'Orie', 'fighter', 'released', true, 5, 'A flexible neutral fighter who uses delayed thrust strings, defensive buttons, and aerial Thanatos commands to vary pressure.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-orie.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_004Orie.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d034e2e20297dd150d69b2337cb9beb130a56e2503ea0be74ec3d07d55d9f9e3', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'orie' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'gordeau', 'Gordeau', 'fighter', 'released', true, 6, 'A close-range pressure specialist whose approach tools and long-reaching attacks let him threaten from mid- and long-range.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-gordeau.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_005Gordeau.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:7e4f743ab31a913642633d0331c8e275e6c17540ef16d00545616315fbe1b1b1', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'gordeau' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'merkava', 'Merkava', 'fighter', 'released', true, 7, 'An air-mobile setplay fighter who uses drill routes and cling setups to maintain point-blank pressure after combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-merkava.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_006Merkava.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:dcf8c5f5c85d31d357288aab1876f6111c14fe7801840d6bb60a064d4ba65512', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'merkava' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'vatista', 'Vatista', 'fighter', 'released', true, 8, 'A technical charge fighter whose enhanced aerial options and expanded EX routes support air control and varied combo routing.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-vatista.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_007Vatista.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:c5bd16037b77842456c7406d9686ba4efd6f8f116ebf6ddda03cab1809e161d4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'vatista' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'seth', 'Seth', 'fighter', 'released', true, 9, 'A deceptive setup fighter who converts aerial attacks and Vanishing Confusion into varied neutral and high-reward offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-seth.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_008Seth.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d764d96b9ddf29d57b0f3430db98d0eab446010cbaa96a723ff75ffc961cc0b5', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'seth' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yuzuriha', 'Yuzuriha', 'fighter', 'released', true, 10, 'A mobile stance-and-sword fighter who baits movement, pokes from range, and turns flexible cancels into offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-yuzuriha.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_009Yuzuriha.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'yuzuriha' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hilda', 'Hilda', 'fighter', 'released', true, 11, 'A deceptive ranged pressure fighter whose delayed attacks and block strings turn neutral openings into high-damage combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-hilda.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_010Hilda.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:f4b26461883d7655697c8e8920d11134b06db267ce6eaa333a04cf32e689df86', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hilda' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chaos', 'Chaos', 'fighter', 'released', true, 12, 'A setup fighter who commands Azhi Dahaka to extend pressure, reposition the summon, and diversify combo routes.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-chaos.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_015Chaos.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fb2cf6eb6b6e81650b5d25828f24f888d6cc2f7755537120c1b20186f3faf78b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'chaos' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nanase', 'Nanase', 'fighter', 'released', true, 13, 'A mobile wind fighter with safer pokes, aerial tools, and conversions that carry stray hits into full combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-nanase.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_012Nanase.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:dd7f0a9408971650777e665972dc2ccd06fbbaa346695c10559061b35e6b1566', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'nanase' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'byakuya', 'Byakuya', 'fighter', 'released', true, 14, 'An aggressive setup fighter whose improved normals, traps, and dash attacks help him close space and force pressure.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-byakuya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_013Byakuya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:2eb71cb253c9d2682ef38fa6af7eeddd200eac5cf013a21711ab60772b90dac2', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'byakuya' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'phonon', 'Phonon', 'fighter', 'released', true, 15, 'A long-reach specialist who controls neutral with mid-range pokes and threatening block strings while covering a weaker defense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-phonon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_024phonon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:60b21d7571dc0bcf5626e73c9b419bd822fec88658f48a26f5182074176399ca', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'phonon' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mika', 'Mika', 'fighter', 'released', true, 16, 'A lunging close-range fighter whose missiles, cannon, and advancing attacks create varied offense with useful defensive options.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-mika.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_021Mika.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fa56a74db9792734738822b69b3ebf93375a3db05efa0225c9060e4811aa1075', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'mika' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'wagner', 'Wagner', 'fighter', 'released', true, 17, 'A sword-and-shield power-up fighter who strengthens pressure and damage by activating and managing both weapons.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-wagner.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_016Wagner.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:e8eb4fcea9347ad992b50ded641c18aa54c46526d293af0566c46f24dcd1f22a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'wagner' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'enkidu', 'Enkidu', 'fighter', 'released', true, 18, 'A hand-to-hand ground fighter who uses frame traps, attack strings, and strong single-hit damage to win close interactions.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-enkidu.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_017Enkidu.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:e264f609214b897ed8499ee4cc3eae58859f55675876d300d8b639bad532a49b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'enkidu' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'londrekia', 'Londrekia', 'fighter', 'released', true, 19, 'An ice-based mid-range fighter whose frozen projectiles and pressure resets control space and support overhead conversions.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-londrekia.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_018Londrekia.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:0f6a279fcef6057aa8f0152fcca18ae0ba04416cbe37627cd6fa8e2b3d180642', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'londrekia' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tsurugi', 'Tsurugi', 'fighter', 'released', true, 20, 'An aggressive armored fighter whose dashing attacks and projectile-invulnerable movement let him force his way through neutral.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-tsurugi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_019Tsurugi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:895b5721a45d379276f39535b1ccea1707c42a8537b66717cc291f6ce3501d21', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'tsurugi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kaguya', 'Kaguya', 'fighter', 'released', true, 21, 'A flexible dual-gun fighter who uses movement feints, projectiles, and anti-air tools to adapt her neutral and combo routes.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-kaguya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_022Kaguya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:5f11e1b3b566bd44be459891ca85826499e7a345459ee749a292fbc8496130a0', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kaguya' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kuon', 'Kuon', 'fighter', 'released', true, 22, 'A ground-and-air space controller who places persistent projectiles to restrict movement and open throws or layered offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-kuon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_023Kuon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:9b3aaa0143daa03a3ba424460784446ffff8477a8b8465a2a01344cc6191babd', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kuon' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'uzuki', 'Uzuki', 'fighter', 'released', true, 23, 'A versatile trap-and-summon fighter who tracks opponents with dolls and coffins to build unpredictable offense.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-uzuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_020Uzuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:a553e77ee3c92798060c818b7679d59a6c8b9d774faa604fd7f5c05f4baedaf4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'uzuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ogre', 'Ogre', 'fighter', 'released', true, 24, 'A neutral-focused brawler whose long pokes and whiff punishes convert clean hits into consistent combos.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-ogre.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_025Ogre.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:3aa92b8eecc4a346961a0a79f7b64532176d624edb250cb2b13363d330d0aeef', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'ogre' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'izumi', 'Izumi', 'fighter', 'released', true, 25, 'A companion-led fighter who uses Elefee and a bouncing Bubbly Breath projectile to shape close-range exchanges.', 'https://www.arcsystemworks.jp/portal/post-30481/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-izumi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_026Izumi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:f547ea2a60643c078f0bfbabe63779ad97e6725e0e1f5185ef56c04e5e4764c1', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'izumi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zohar', 'Zohar', 'fighter', 'released', true, 26, 'A claw-armed close-range fighter who uses a doppelganger to mirror and layer attacks.', 'https://www.youtube.com/watch?v=YOJNP1c36B8', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-zohar.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_027zohar.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:ff2f7b33f659edbd3c909b0d5002acd6ce37a95522e7cb4261861a92181a4cd5', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'zohar' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'eltnum', 'Eltnum', 'fighter', 'released', true, 27, 'A versatile close-range and gun fighter who balances Etherite pressure with Hollow Point and Warning Shot confirms.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-eltnum.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_011Eltnum.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d3ad6b4fc2780287c53e3fb724d63616ff8e82177f57257bc2bf09a0b05f4e80', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'eltnum' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akatsuki', 'Akatsuki', 'fighter', 'released', true, 28, 'A close-range specialist who pairs fast Blitz Shot projectiles with lockdown strings and high-reward strike mix-ups.', 'https://www.arcsystemworks.jp/portal/post-30285/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'uni2'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/uni2-akatsuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_014Akatsuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:51ce0e39c69595e0facebb6b1010e62830932e06cd97934c9a186904590a7403', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'akatsuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('avatar-legends', 'Avatar Legends: The Fighting Game', 'AVATAR', 'Launch roster + support pools', 6, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"],"optionLabel":"Support","optionValues":["Gyatso","Momo","Appa","Mai","Ran & Shaw","June","Kanna","Hakoda","Master Pakku","Badgermole","The Boulder","The Hippo","Master Piandao","Suki","Princess Yue","Lo and Li","Joo Dee","Ursa","Rangi","Kelsang","Yun","Firelord Sozin","Admiral Zhao","Imperial Firebender","Naga","Tonraq","Raava","P''Li","Ming-Hua","Ghazan","Vaatu","Dark Spirit","Dark Avatar Unalaq","Katara","Avatar Roku","Guru Pathik"],"optionValuesByCharacter":{"aang":["Gyatso","Momo","Appa"],"zuko":["Mai","Ran & Shaw","June"],"katara":["Kanna","Hakoda","Master Pakku"],"toph":["Badgermole","The Boulder","The Hippo"],"sokka":["Master Piandao","Suki","Princess Yue"],"azula":["Lo and Li","Joo Dee","Ursa"],"kyoshi":["Rangi","Kelsang","Yun"],"ozai":["Firelord Sozin","Admiral Zhao","Imperial Firebender"],"korra":["Naga","Tonraq","Raava"],"zaheer":["P''Li","Ming-Hua","Ghazan"],"nightmare-korra":["Vaatu","Dark Spirit","Dark Avatar Unalaq"],"avatar-aang":["Katara","Avatar Roku","Guru Pathik"]}}],"constraintNote":"Each fighter has three support choices. Support is part of the fighter loadout."}'::jsonb, 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aang', 'Aang', 'fighter', 'released', true, 1, 'An airbending mobility fighter who uses evasive movement and gust-based attacks to create space for his chosen Support.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party aang cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'aang' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zuko', 'Zuko', 'fighter', 'released', true, 2, 'A firebending rushdown fighter who combines close sword strings with flame pressure and a Support that extends his approach.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party zuko cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'zuko' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'katara', 'Katara', 'fighter', 'released', true, 3, 'A waterbending control fighter who uses flowing projectiles and defensive space management to set up Support-assisted offense.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'toph', 'Toph', 'fighter', 'released', true, 4, 'An earthbending heavyweight who uses grounded force and armor-like pressure to make close exchanges favor her team.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sokka', 'Sokka', 'fighter', 'released', true, 5, 'A weapon-focused all-rounder who mixes boomerang zoning with sword attacks and Support calls to cover his approach.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'azula', 'Azula', 'fighter', 'released', true, 6, 'A fast firebending pressure fighter who uses aggressive flame attacks and lightning-based threat to force quick defensive decisions.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/avatar-azula.jpg', 'https://live.staticflickr.com/65535/55168531880_df00c7e87a_k.jpg', 'Gameplay Group International via PlayStation Blog', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Avatar Legends: The Fighting Game promotional screenshot © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. This version-exact screenshot features Azula rather than a standalone cutout.', 'sha256:9cf595dacb4d71c1eef1af50a9ca4ad6134859393ad8dd52a81603fde4d4ec6e', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'azula' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kyoshi', 'Avatar Kyoshi', 'fighter', 'released', true, 7, 'A powerful earthbending fighter who uses broad grounded attacks and Support coverage to control the center of the stage.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ozai', 'Fire Lord Ozai', 'fighter', 'released', true, 8, 'A firebending zoner who uses sustained flame pressure and long-range attacks to keep opponents from starting their offense.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'korra', 'Korra', 'fighter', 'released', true, 9, 'A versatile bending fighter who shifts between elemental tools and uses her Support loadout to adapt to different ranges.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party korra cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'korra' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zaheer', 'Zaheer', 'fighter', 'released', true, 10, 'An aerial airbender who uses unusual movement and wind attacks to attack from above while Support options cover his landings.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nightmare-korra', 'Nightmare Korra', 'fighter', 'released', true, 11, 'A corrupted Korra form that emphasizes aggressive elemental pressure and dangerous close-range conversions with its Support choices.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'avatar-legends'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'avatar-aang', 'Avatar Aang', 'fighter', 'released', true, 12, 'An advanced Aang form that draws on multiple elements to switch between mobility, zoning, and pressure within the Support system.', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'dr-mario', 'Dr. Mario', 'fighter', 'released', true, 1, 'A Mario variant who trades mobility for stronger pills, heavier close-range hits, and reliable pill-to-aerial conversions.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mario', 'Mario', 'fighter', 'released', true, 2, 'A balanced platform fighter who uses fireballs, quick aerials, and up-special recovery to convert neutral wins into edge pressure.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'luigi', 'Luigi', 'fighter', 'released', true, 3, 'A slippery brawler who uses fireballs, strong aerials, and wavedash movement to create unusual approach angles and grab pressure.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bowser', 'Bowser', 'fighter', 'released', true, 4, 'A heavyweight fighter who uses armored-looking fire and claw attacks, powerful throws, and high knockback to punish close commitments.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peach', 'Peach', 'fighter', 'released', true, 5, 'A float-based fighter who controls the air with turnips and disjointed aerials while converting float movement into pressure.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yoshi', 'Yoshi', 'fighter', 'released', true, 6, 'A mobile fighter with an armored double jump who uses eggs, crouch movement, and strong aerials to contest space unexpectedly.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'donkey-kong', 'Donkey Kong', 'fighter', 'released', true, 7, 'A heavyweight grappler who uses cargo throws, Giant Punch, and long-reaching normals to carry opponents toward the edge.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'captain-falcon', 'Captain Falcon', 'fighter', 'released', true, 8, 'A fast rushdown fighter who combines strong aerials, knee pressure, and burst movement with devastating punish conversions.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ganondorf', 'Ganondorf', 'fighter', 'released', true, 9, 'A slow powerhouse who uses large disjointed strikes and Dark Dive to turn a single hard read into heavy knockback.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'falco', 'Falco', 'fighter', 'released', true, 10, 'A fast spacer who uses lasers, Shine, and high-falling aerials to start pillar combos and edgeguarding sequences.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/melee-falco.png', 'https://www.smashbros.com/assets_v2/img/fighter/falco/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 20)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:a616cc0cba78d999dec0eb1d43dee61117dd5e9decae0ed2a8a5e47262505d03', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'falco' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'fox', 'Fox', 'fighter', 'released', true, 11, 'A high-speed glass cannon who uses lasers, Shine, and up-smash confirms to overwhelm grounded defense before recovering with Fire Fox.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/melee-fox.png', 'https://www.smashbros.com/assets_v2/img/fighter/fox/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 07)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:67db02396021221a109fff6b83940b5879705a77e07cb2740d90b50fb00add82', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'fox' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ness', 'Ness', 'fighter', 'released', true, 12, 'A floaty pressure fighter who uses PK Fire, yo-yo attacks, and magnetic recovery to create awkward traps around the ledge.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ice-climbers', 'Ice Climbers', 'fighter', 'released', true, 13, 'A partner-based fighter who uses Blizzard, desynchronized movement, and grab conversions to make coordinated pressure snowball.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kirby', 'Kirby', 'fighter', 'released', true, 14, 'A small aerial fighter who uses Copy abilities, flexible jumps, and compact normals to punish overextended opponents.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'samus', 'Samus', 'fighter', 'released', true, 15, 'A projectile-based fighter who uses Charge Shot, missiles, bombs, and grapple recovery to control approach lanes.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zelda', 'Zelda', 'fighter', 'released', true, 16, 'A magic-based zoner who uses Din''s Fire and Nayru''s Love before transforming into Sheik for faster close-range options.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sheik', 'Sheik', 'fighter', 'released', true, 17, 'A fast technical fighter who uses needles, long-reaching aerials, and chain throws to convert neutral wins into edgeguards.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/melee-sheik.png', 'https://www.smashbros.com/assets_v2/img/fighter/sheik/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 16)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:1bc2bbceb4a1caacd3944c5d556243a401cc587b2b00bf7c672e7c4642ca941e', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'sheik' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'link', 'Link', 'fighter', 'released', true, 18, 'A weapon-and-projectile fighter who uses bombs, boomerangs, arrows, and a disjointed sword to control grounded approaches.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'young-link', 'Young Link', 'fighter', 'released', true, 19, 'A faster Link variant who uses quick fire arrows, boomerangs, bombs, and nimble aerials to keep opponents at mid range.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mewtwo', 'Mewtwo', 'fighter', 'released', true, 20, 'A light psychic fighter who uses Shadow Ball, teleport movement, and a long tail to create floaty spacing and edgeguard traps.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marth', 'Marth', 'fighter', 'released', true, 21, 'A precise sword fighter who rewards spacing at the blade tip and converts disjointed aerials into grabs and edge pressure.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/melee-marth.png', 'https://www.smashbros.com/assets_v2/img/fighter/marth/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 21)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:0437c89299459e11811e76e3b322a851d00619e93c5b55c9437ace13dfb3b1a4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'marth' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'roy', 'Roy', 'fighter', 'released', true, 22, 'A close-range sword fighter whose hilt-centered sweet spots reward aggressive spacing and explosive jab-to-aerial conversions.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'pichu', 'Pichu', 'fighter', 'released', true, 23, 'A tiny electric rushdown fighter who uses Quick Attack and fast aerials to scramble around opponents while taking self-damage.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'pikachu', 'Pikachu', 'fighter', 'released', true, 24, 'A mobile electric fighter who uses Quick Attack, Thunder Jolt, and edgeguarding aerials to control both stage and recovery routes.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jigglypuff', 'Jigglypuff', 'fighter', 'released', true, 25, 'A highly aerial fighter who uses drift, repeated jumps, and Rest confirms to turn patient edge pressure into sudden stocks.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'melee'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mr-game-and-watch', 'Mr. Game & Watch', 'fighter', 'released', true, 26, 'A floaty multi-tool fighter who uses unusual disjoints, Bucket, and Judge to create matchup-specific pressure and punishment.', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 1, 'A close-range powerhouse who uses Gunflame, Bandit Revolver, and strong frame traps to turn a grounded opening into knockdown pressure.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggxxacpr-sol.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_15.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:df54c4c9296de3bdcc0c8d978d6a8351dc44aa86ec2233c3b5a3e8585ffd3cd9', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'sol' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ky', 'Ky Kiske', 'fighter', 'released', true, 2, 'A balanced sword fighter who controls space with Stun Edge and Vapor Thrust before using Greed Sever and Stun Dipper to vary offense.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggxxacpr-ky.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_07.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:0ddd478928d6e92eb516eae273a439b2fa80ddad4dcf4531dc4f3a628e5448fc', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'ky' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'may', 'May', 'fighter', 'released', true, 3, 'A charge-based rushdown fighter who uses Mr. Dolphin, beach balls, and strong aerials to approach from unpredictable angles.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'millia', 'Millia Rage', 'fighter', 'released', true, 4, 'A fast setplay fighter who uses Tandem Top and summoned hair discs to create repeated left-right and high-low pressure after knockdowns.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zato-1', 'Eddie / Zato=1', 'fighter', 'released', true, 5, 'A summon fighter who manages Eddie''s gauge to layer drills, oppose attacks, and command-grab pressure over Zato''s own buttons.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baiken', 'Baiken', 'fighter', 'released', true, 6, 'A defensive sword fighter who uses Tatami Gaeshi, parries, and tether-based follow-ups to punish approaches and force close decisions.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'faust', 'Faust', 'fighter', 'released', true, 7, 'A disruptive item-throw fighter who uses random objects, long pokes, and pogo movement to make every round play out differently.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anji', 'Anji Mito', 'fighter', 'released', true, 8, 'A counter-oriented fighter who uses autoguard fans and Fuujin follow-ups to absorb predictable attacks and open defensive gaps.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny', 'Johnny', 'fighter', 'released', true, 9, 'A mid-range sword fighter who stocks coins and uses Mist Finer stance attacks to control space and threaten high-damage confirms.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jam', 'Jam Kuradoberi', 'fighter', 'released', true, 10, 'A close-range martial artist who stocks special move enhancements and uses fast kicks, Rekka pressure, and frame traps to stay active.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 11, 'A technical zoner who places billiard balls at chosen angles, then uses ball returns and charged shots to build layered offense.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dizzy', 'Dizzy', 'fighter', 'released', true, 12, 'A summon-and-projectile fighter who combines fish, fire, and ice attacks to control multiple lanes and punish impatient approaches.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'testament', 'Testament', 'fighter', 'released', true, 13, 'A trap fighter who plants seals and uses Grave Reaper, webs, and succubus pressure to make grounded movement unsafe.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggxxacpr-testament.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_18.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:8694ae2f59904d619ed97b649406cbfd76871dd28493718e88ab6a57ce755ff2', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'testament' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'slayer', 'Slayer', 'fighter', 'released', true, 14, 'A close-range counter fighter who uses Dandy Step, backdash invulnerability, and Pilebunker to turn reads into huge damage.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'i-no', 'I-No', 'fighter', 'released', true, 15, 'A hover-dash rushdown fighter who uses musical notes, Chemical Love, and fast overhead routes to attack from changing heights.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zappa', 'Zappa', 'fighter', 'released', true, 16, 'A stance-based setplay fighter who cycles spirit summons to gain different attacks, movement patterns, and pressure sequences.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggxxacpr-zappa.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_09.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:bc0b04ed27aad92bc2b940f00dcfb354ead3971c1ada92e67dd0fdc2ffcb73ae', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'zappa' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bridget', 'Bridget', 'fighter', 'released', true, 17, 'A mobile yo-yo fighter who places setplay tools and uses rolling movement to approach, retreat, and attack from awkward angles.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'robo-ky', 'Robo-Ky', 'fighter', 'released', true, 18, 'A resource fighter who charges his electric gauge to improve specials and then spends that power on stronger pressure and conversions.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aba', 'A.B.A', 'fighter', 'released', true, 19, 'A resource fighter who manages key and blood states to shift between a slower neutral mode and a powerful aggressive transformation.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'order-sol', 'Order-Sol', 'fighter', 'released', true, 20, 'A charge-based sword fighter who stores power for stronger specials and uses Dragon Install threat to amplify close-range offense.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kliff', 'Kliff Undersn', 'fighter', 'released', true, 21, 'A slow, high-damage veteran who uses an enormous sword and powerful anti-airs to make every grounded approach a serious risk.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'justice', 'Justice', 'fighter', 'released', true, 22, 'A projectile trap fighter who layers missiles and laser swords across the screen before cashing out with explosive conversions.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'potemkin', 'Potemkin', 'fighter', 'released', true, 23, 'A heavyweight grappler who uses Hammer Fall armor, Slide Head, and Potemkin Buster to force respect at close range.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chipp', 'Chipp Zanuff', 'fighter', 'released', true, 24, 'A fragile speed fighter who uses Alpha Blade, teleports, and wall movement to create rapid cross-ups and relentless mix-ups.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggxxacpr'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'axl', 'Axl Low', 'fighter', 'released', true, 25, 'A long-range chain fighter who uses sickle attacks, Rensen, and time-control pressure to punish movement from across the screen.', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'anakaris', 'Anakaris', 'fighter', 'released', true, 1, 'A large setplay fighter who uses coffin attacks, curses, transformation, and teleport movement to make conventional defense unreliable.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bishamon', 'Bishamon', 'fighter', 'released', true, 2, 'A sword rushdown fighter who uses long katana normals, armor, and unblockable-looking pressure to turn close openings into knockdowns.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'demitri', 'Demitri Maximoff', 'fighter', 'released', true, 3, 'A well-rounded vampire who uses fireballs, teleport movement, and command grabs to threaten both grounded space and close defense.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'felicia', 'Felicia', 'fighter', 'released', true, 4, 'A mobile rushdown fighter who uses rolling attacks, wall movement, and fast normals to force scrambles at close range.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hsien-ko', 'Hsien-Ko', 'fighter', 'released', true, 5, 'A projectile-and-item fighter who throws talismans and weapons while using armored specials to disrupt the opponent''s timing.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jon-talbain', 'Jon Talbain', 'fighter', 'released', true, 6, 'A fast werewolf rushdown fighter who uses air mobility, Beast Cannon, and rekka-like attacks to keep pressure moving forward.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lord-raptor', 'Lord Raptor', 'fighter', 'released', true, 7, 'A weapon rushdown fighter who combines chainsaws, projectiles, and fast air movement to make close-range pressure hard to escape.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'morrigan', 'Morrigan Aensland', 'fighter', 'released', true, 8, 'A mobile succubus who uses Soul Fist projectiles, air dashes, and flight-like movement to attack from ambiguous heights.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/vampire-savior-morrigan.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/9-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:953ea42cbc7b84d930ec056985768ef4c0bced4f90a6373dc6ec852cdd6d80d9', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'morrigan' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rikuo', 'Rikuo', 'fighter', 'released', true, 9, 'A water-based space controller who uses bubbles, aquatic movement, and long-reaching normals to punish approaches and shape neutral.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sasquatch', 'Sasquatch', 'fighter', 'released', true, 10, 'A fast heavyweight who uses ice projectiles, powerful limbs, and sudden aerial movement to turn momentum into corner pressure.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'victor', 'Victor von Gerdenheim', 'fighter', 'released', true, 11, 'A large electric bruiser who uses armor, long-reaching punches, and command attacks to win trades and force close-range respect.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bulleta', 'B.B. Hood', 'fighter', 'released', true, 12, 'A trap-heavy gunner who uses firearms, grenades, and deceptive movement to turn prepared space into explosive pressure.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/vampire-savior-bulleta.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/1-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:a1cdaee20de0e86fc7c9697ceae141fb45de5f4369ebc916c11529ef04b2cb78', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'bulleta' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jedah', 'Jedah Dohma', 'fighter', 'released', true, 13, 'A flight-capable setplay fighter who uses scythes, soul traps, and unusual movement to control where the opponent can stand.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/vampire-savior-jedah.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/0-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:64b1f9913b9ac101d1e2643147adada5b786826a1bb3f3610b60d09d60e69373', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'jedah' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lilith', 'Lilith', 'fighter', 'released', true, 14, 'A fast projectile fighter who uses Soul Flash, air movement, and close-range mix-ups to convert mobility into sustained offense.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'q-bee', 'Q-Bee', 'fighter', 'released', true, 15, 'A highly mobile rushdown fighter who uses flight, air dashes, and bee-based attacks to swarm opponents from changing angles.', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'vampire-savior'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/vampire-savior-q-bee.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/3-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:78bdb1a0805b0031cb3a1f18644da2bd92a8d467f5c420e42d22181d93247b79', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'q-bee' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)
values ('sf6', 'Street Fighter 6', 'SF6', 'Current live roster', 10, '{"version":1,"noun":"Character","verified":true,"ordered":false,"uniqueCharacters":true,"slots":[{"id":"fighter","label":"Character","allowedRoles":["fighter"]}]}'::jsonb, 'https://news.capcomusa.com/street_fighter', 'verified', '2026-08-25T00:00:00Z')
on conflict (slug) do update set
  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,
  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,
  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ryu', 'Ryu', 'fighter', 'released', true, 1, 'A disciplined shoto who uses Hadoken, Denjin charge, and Hashogeki to control space before converting a Drive-enhanced opening.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'luke', 'Luke', 'fighter', 'released', true, 2, 'A mid-range boxer who uses charged Flash Knuckle follow-ups, Sand Blast, and advancing normals to turn whiff punishes into pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chun-li', 'Chun-Li', 'fighter', 'released', true, 3, 'A technical stance fighter who combines Kikoken, Spinning Bird Kick, and Serenity Stream to vary her neutral and close pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/sf6-chun-li.png', 'https://www.streetfighter.com/6/assets/images/character/chunli/chunli.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:2d96b387d2a2dda6e65e5cdfb4baeb4c1b80f6e554066522482bc75e7c9d7c29', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'chun-li' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jamie', 'Jamie', 'fighter', 'released', true, 4, 'A stance-and-resource fighter who raises his drink level to unlock stronger moves while using Rekka attacks and dives to stay close.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'guile', 'Guile', 'fighter', 'released', true, 5, 'A charge-based zoner who builds a wall with Sonic Boom and Flash Kick, then uses Drive Rush to turn controlled space into offense.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kimberly', 'Kimberly', 'fighter', 'released', true, 6, 'A mobile ninja who uses spray-can setups, run special moves, and teleport-style movement to create sudden left-right pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'juri', 'Juri', 'fighter', 'released', true, 7, 'A flexible rushdown fighter who stores Fuha stocks and spends them on fireball, dive-kick, and Fuha-enhanced pressure routes.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/sf6-juri.png', 'https://www.streetfighter.com/6/assets/images/character/juri/juri.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:991ba53250a47db5f09ade953750d10a64d36146d3c4c6f32eb0e42b221431c8', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'juri' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ken', 'Ken', 'fighter', 'released', true, 8, 'A forward-driving shoto who combines Hadoken and Shoryuken with Jinrai kicks, run pressure, and corner-carrying Drive Rush routes.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/sf6-ken.png', 'https://www.streetfighter.com/6/assets/images/character/ken/ken.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:cb5052e9506ad88dfb430236f2dfa2b93979dcd1c0a440b5ca00026ce8eff7a7', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'ken' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'blanka', 'Blanka', 'fighter', 'released', true, 9, 'A trickster charge fighter who uses Blanka-chan dolls, rolling attacks, and Electric Thunder to make approach timing hard to predict.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dhalsim', 'Dhalsim', 'fighter', 'released', true, 10, 'A long-range yoga fighter who controls space with stretched limbs, Yoga Fire, teleport movement, and Drive-enhanced approach traps.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'e-honda', 'E. Honda', 'fighter', 'released', true, 11, 'A heavyweight charge fighter who uses Headbutt, Hundred Hand Slap, and Sumo Dash to force grounded respect and corner pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dee-jay', 'Dee Jay', 'fighter', 'released', true, 12, 'A feint-heavy mid-range fighter who uses Air Slasher, Sobat attacks, and sway-based follow-ups to make his offense difficult to call out.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cammy', 'Cammy', 'fighter', 'released', true, 13, 'A fast rushdown fighter who uses Spiral Arrow, Cannon Strike, and Hooligan Combination to attack from grounded and aerial angles.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'manon', 'Manon', 'fighter', 'released', true, 14, 'A grappling footsie fighter who builds medal levels through command grabs and hit confirms, increasing the reward for every clean read.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'marisa', 'Marisa', 'fighter', 'released', true, 15, 'A heavyweight boxer who uses armored Gladius, charged strikes, and Scutum movement to turn one close-range hit into massive damage.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lily', 'Lily', 'fighter', 'released', true, 16, 'A small rushdown fighter who stores wind stocks to strengthen Condor Spire, Condor Wind, and her forward-moving pressure routes.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jp', 'JP', 'fighter', 'released', true, 17, 'A long-range control fighter who uses portals, Partisan projectiles, and Departure traps to force careful movement before opening defense.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zangief', 'Zangief', 'fighter', 'released', true, 18, 'A classic grappler who uses Spinning Piledriver, Screw Piledriver, and Drive Rush to turn a single approach into devastating pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rashid', 'Rashid', 'fighter', 'released', true, 19, 'A mobile wind fighter who builds tornado setups and uses parkour movement, Whirlwind Shot, and Arabian Cyclone to attack from shifting angles.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aki', 'A.K.I.', 'fighter', 'released', true, 20, 'A poison-focused setplay fighter who applies toxins with Serpent Lash and then uses long-range tentacles and command movement to exploit them.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ed', 'Ed', 'fighter', 'released', true, 21, 'A mid-range boxer who uses Psycho Flicker, Kill Rush, and shadow-based follow-ups to pull opponents into close pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'akuma', 'Akuma', 'fighter', 'released', true, 22, 'A high-damage shoto who combines grounded and aerial fireballs with demon-flip movement and Adamant Flame to keep neutral volatile.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/sf6-akuma.png', 'https://www.streetfighter.com/6/assets/images/character/gouki_akuma/gouki_akuma.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:27b005a34450c691ae04a24ebf1c6e5c70ee399754e77a102b10a62b990166a0', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'akuma' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'm-bison', 'M. Bison', 'fighter', 'released', true, 23, 'A pressure fighter who plants Psycho Mines and uses Scissor Kicks, Head Press, and explosive Drive conversions to maintain momentum.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'terry', 'Terry', 'fighter', 'released', true, 24, 'A well-rounded brawler who uses Power Wave, Burn Knuckle, and Crack Shoot to cover grounded, advancing, and anti-air interactions.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mai', 'Mai', 'fighter', 'released', true, 25, 'A mobile weapon fighter who uses fans, fire projectiles, and aerial movement to control lanes before rushing down behind Drive pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'elena', 'Elena', 'fighter', 'released', true, 26, 'A rhythm-based footwork fighter who uses long-reaching kicks, healing options, and mobile pokes to control the pace of neutral exchanges.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sagat', 'Sagat', 'fighter', 'released', true, 27, 'A charge-and-space fighter who uses high and low Tiger Shots, Tiger Knee, and Tiger Uppercut to control lanes and punish jumps.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'c-viper', 'C. Viper', 'fighter', 'released', true, 28, 'A feint-oriented pressure fighter who uses burning kicks, seismic attacks, and sudden movement to turn Drive Rush approaches into mix-ups.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'alex', 'Alex', 'fighter', 'released', true, 29, 'A close-range grappler who combines long-reaching strikes, command grabs, and Power Bomb pressure to reward decisive forward movement.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ingrid', 'Ingrid', 'fighter', 'released', true, 30, 'A close-range power fighter whose light-based attacks, advancing normals, and Drive Gauge management are used to force compact exchanges.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'sf6'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yasmine', 'Yasmine', 'fighter', 'released', true, 31, 'A spacing-focused SF6 roster entry that emphasizes whiff punishment, Drive Rush conversions, and controlled close-range pressure.', 'https://news.capcomusa.com/street_fighter', 'Capcom', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'liu-kang', 'Liu Kang', 'fighter', 'released', true, 1, 'A fire-and-space fighter who uses low and high fireballs, bicycle kicks, and air control to convert patient neutral into pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'scorpion', 'Scorpion', 'fighter', 'released', true, 2, 'A weapon rushdown fighter who uses the Spear, teleport attacks, and fiery sword strings to pull opponents into close offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mk1-scorpion.webp', 'https://cdn-mk1.mortalkombat.com/roster/scorpion/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:dd4235ccd1b35ab31986473ab94ffb45e79c657a570780ab13f7708466e756cc', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'scorpion' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sub-zero', 'Sub-Zero', 'fighter', 'released', true, 3, 'An ice-based setup fighter who uses frozen clones, slides, and ice projectiles to control movement and create layered pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mk1-sub-zero.webp', 'https://cdn-mk1.mortalkombat.com/roster/sub-zero/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:876ce25cd0bc55849f48dd2c96ff8053fa778a20a9ff1f4a3d55d7018af84cff', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'sub-zero' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'raiden', 'Raiden', 'fighter', 'released', true, 4, 'An electric rushdown fighter who uses torpedoes, lightning attacks, and charged specials to make forward movement difficult to stop.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kung-lao', 'Kung Lao', 'fighter', 'released', true, 5, 'A fast weapon fighter who uses hat attacks, teleport movement, and spinning pressure to open defense from multiple ranges.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kitana', 'Kitana', 'fighter', 'released', true, 6, 'A mid-range fan fighter who uses Fan Toss, Fan-Nado, and aerial fan attacks to control lanes and convert whiff punishes.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mileena', 'Mileena', 'fighter', 'released', true, 7, 'A mobile rushdown fighter who uses sais, Teleport Kick, and Ball Roll to close distance and turn openings into brutal corner pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mk1-mileena.webp', 'https://cdn-mk1.mortalkombat.com/roster/mileena/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:25f601067356c7b1fff6fddcdf68f1550364a07a7565cde68ae82cbd069e9fce', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'mileena' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny-cage', 'Johnny Cage', 'fighter', 'released', true, 8, 'A close-range pressure fighter who builds Star Power through taunts and attacks, then uses enhanced specials to extend his offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kenshi', 'Kenshi', 'fighter', 'released', true, 9, 'A stance-and-sword fighter who calls his ancestral spirit to extend attacks, control space, and create layered pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'smoke', 'Smoke', 'fighter', 'released', true, 10, 'A deceptive ninja who uses teleport attacks, invisibility, and smoke-based movement to create ambiguous approaches and whiff punishes.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'rain', 'Rain', 'fighter', 'released', true, 11, 'A water-magic fighter who uses portals, projectiles, and stance-like movement to redirect attacks and control the ground.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'li-mei', 'Li Mei', 'fighter', 'released', true, 12, 'A mid-range brawler who uses lantern projectiles, explosive attacks, and strong kicks to turn grounded control into pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tanya', 'Tanya', 'fighter', 'released', true, 13, 'A mobile weapon fighter who uses staff attacks, aerial movement, and safe advancing specials to maintain close-range momentum.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baraka', 'Baraka', 'fighter', 'released', true, 14, 'A blade rushdown fighter who uses arm blades, projectile slashes, and advancing attacks to overwhelm opponents at close range.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'geras', 'Geras', 'fighter', 'released', true, 15, 'A heavyweight setup fighter who uses sand constructs, command grabs, and time-based resets to make his pressure difficult to escape.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reptile', 'Reptile', 'fighter', 'released', true, 16, 'A transforming rushdown fighter who uses acid, invisibility, and lizard movement to approach from deceptive angles.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ashrah', 'Ashrah', 'fighter', 'released', true, 17, 'A sword fighter who manages holy and demonic damage states to vary her specials, neutral control, and combo reward.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'havik', 'Havik', 'fighter', 'released', true, 18, 'A chaotic pressure fighter who uses dismemberment-based attacks, body-part projectiles, and unusual resets to keep defense unstable.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'general-shao', 'General Shao', 'fighter', 'released', true, 19, 'A heavy weapon fighter who uses an axe, hammering pressure, and weapon-enhanced attacks to win slow, damaging exchanges.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sindel', 'Sindel', 'fighter', 'released', true, 20, 'A control fighter who uses scream projectiles, levitation, hair attacks, and mobility to pressure from both ground and air.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reiko', 'Reiko', 'fighter', 'released', true, 21, 'A grappling rushdown fighter who uses command grabs, spear attacks, and advancing strikes to force repeated close-range guesses.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nitara', 'Nitara', 'fighter', 'released', true, 22, 'An aerial rushdown fighter who uses flight, blood-based attacks, and sharp dive-ins to attack from unusual heights.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shang-tsung', 'Shang Tsung', 'fighter', 'released', true, 23, 'A stance-switching sorcerer who morphs between forms and uses skull projectiles, ground traps, and stolen attacks to vary offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'omni-man', 'Omni-Man', 'fighter', 'released', true, 24, 'A heavyweight rushdown fighter who uses Viltrumite strength, flight-like movement, and brutal advancing strikes to carry opponents cornerward.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'quan-chi', 'Quan Chi', 'fighter', 'released', true, 25, 'A portal-and-trap fighter who uses skulls, portals, and summoned hazards to make neutral space dangerous before opening defense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'peacemaker', 'Peacemaker', 'fighter', 'released', true, 26, 'A gadget gunner who combines firearms, force fields, and anti-air tools with aggressive close-range pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ermac', 'Ermac', 'fighter', 'released', true, 27, 'A spirit-based mobility fighter who uses teleports, soul attacks, and possession-style movement to create layered offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'homelander', 'Homelander', 'fighter', 'released', true, 28, 'An aerial pressure fighter who uses flight, heat vision, and strong mid-range attacks to harass opponents from changing heights.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'takeda-takahashi', 'Takeda Takahashi', 'fighter', 'released', true, 29, 'A weapon-and-whip fighter who uses kunai, chained attacks, and agile movement to control space and extend corner combos.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyrax', 'Cyrax', 'fighter', 'released', true, 30, 'A gadget fighter who uses bombs, traps, and explosive armor attacks to create delayed pressure and team openings.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sektor', 'Sektor', 'fighter', 'released', true, 31, 'A missile-and-armor fighter who uses rockets, flamethrowers, and powered movement to control approach lanes and force corner pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'noob-saibot', 'Noob Saibot', 'fighter', 'released', true, 32, 'A shadow-clone fighter who uses portals, sickle attacks, and a controllable shadow to attack from two angles at once.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ghostface', 'Ghostface', 'fighter', 'released', true, 33, 'A weapon-based stance fighter who uses ambush attacks, hidden weapons, and identity-swapping pressure to create unpredictable offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'conan', 'Conan the Barbarian', 'fighter', 'released', true, 34, 'A heavy sword fighter who uses broad weapon swings, armor, and grappling attacks to turn close-range reads into high damage.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 't-1000', 'T-1000 Terminator', 'fighter', 'released', true, 35, 'A shapeshifting weapon fighter who uses liquid-metal attacks, blades, and body-morphing movement to vary pressure and punish whiffs.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sub-zero-kameo', 'Sub-Zero', 'kameo', 'released', true, 36, 'A defensive Kameo who adds ice armor and freezing attacks that help a fighter challenge pressure or extend a safe approach.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shujinko', 'Shujinko', 'kameo', 'released', true, 37, 'A mimic Kameo who cycles through borrowed techniques to give the paired fighter changing neutral, combo, and punish options.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'scorpion-kameo', 'Scorpion', 'kameo', 'released', true, 38, 'An offensive Kameo who uses spear pulls and fiery strikes to extend combos, cover approaches, and reposition the opponent.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'motaro', 'Motaro', 'kameo', 'released', true, 39, 'A utility Kameo who uses teleporting movement, projectile reflection, and long-reaching attacks to change how the paired fighter controls space.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kung-lao-kameo', 'Kung Lao', 'kameo', 'released', true, 40, 'A flexible Kameo who adds hat throws, teleport pressure, and low-to-high coverage to extend the paired fighter''s offense.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'cyrax-kameo', 'Cyrax', 'kameo', 'released', true, 41, 'A trap-oriented Kameo who adds bombs and explosive attacks that delay pressure and create combo extensions.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'frost', 'Frost', 'kameo', 'released', true, 42, 'A control Kameo who contributes ice projectiles and freezing ground attacks that help the paired fighter restrict movement.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'goro', 'Goro', 'kameo', 'released', true, 43, 'A heavyweight Kameo who adds command grabs, stomps, and armored-looking pressure to make close-range offense more threatening.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jax', 'Jax', 'kameo', 'released', true, 44, 'A pressure Kameo who contributes ground pounds, throws, and high-impact attacks that help the paired fighter force defensive reactions.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kano', 'Kano', 'kameo', 'released', true, 45, 'A projectile Kameo who uses knives, a rolling ball, and grounded pressure to cover movement and extend attacks.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mk1-kano.webp', 'https://cdn-mk1.mortalkombat.com/roster/kameos/kano.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:b3876a74989be498442d16bd366282a754b93f67924879a3f28db13881241034', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'kano' and c.roster_role = 'kameo'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'darrius', 'Darrius', 'kameo', 'released', true, 46, 'A close-range Kameo who adds advancing kicks and follow-up attacks that create extra pressure after the paired fighter commits.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sareena', 'Sareena', 'kameo', 'released', true, 47, 'A projectile Kameo who throws returning blades and demon attacks that extend combos and cover retreating or airborne opponents.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sektor-kameo', 'Sektor', 'kameo', 'released', true, 48, 'A gadget Kameo who adds missiles, rocket movement, and armor-breaking coverage to help the paired fighter control approach lanes.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sonya', 'Sonya', 'kameo', 'released', true, 49, 'A versatile Kameo who contributes energy rings, anti-air attacks, and advancing strikes for neutral coverage and combo support.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/mk1-sonya.webp', 'https://cdn-mk1.mortalkombat.com/roster/kameos/sonya.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:ad51c7cb6e3929558eb60c8b885582695b4922f34683a8299108104789abfd9b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'sonya' and c.roster_role = 'kameo'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'stryker', 'Stryker', 'kameo', 'released', true, 50, 'A firearm-and-grenade Kameo who adds delayed explosives and ranged shots that make the paired fighter''s pressure harder to challenge.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'tremor', 'Tremor', 'kameo', 'released', true, 51, 'A stance-based Kameo who cycles elemental attacks and armor options to give the paired fighter flexible neutral and defensive support.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'khameleon', 'Khameleon', 'kameo', 'released', true, 52, 'A morphing Kameo who rotates between ninja tools to supply different approach, zoning, and combo-extension options.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'janet-cage', 'Janet Cage', 'kameo', 'released', true, 53, 'A close-range Kameo who adds energetic strikes and launcher support that help the paired fighter extend pressure and juggle routes.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'mavado', 'Mavado', 'kameo', 'released', true, 54, 'A weapon Kameo who uses hooks, traps, and mobility tools to alter spacing and create unusual combo extensions.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ferra', 'Ferra', 'kameo', 'released', true, 55, 'A setup Kameo who adds low-profile attacks and throw-based assistance that help the paired fighter create layered close pressure.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'mk1'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'madam-bo', 'Madam Bo', 'kameo', 'released', true, 56, 'A support Kameo who adds grounded strikes, launcher coverage, and utility attacks that help the paired fighter maintain momentum.', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'kazuya', 'Kazuya', 'fighter', 'released', true, 1, 'A precise Mishima fighter who uses Electric Wind God Fist, wavedash pressure, and Devil tools to turn small openings into oppressive offense.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jin', 'Jin', 'fighter', 'released', true, 2, 'A versatile Mishima fighter who combines disciplined pokes, stance transitions, and Devil Jin-inspired tools to control neutral and Heat pressure.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/tekken-8-jin.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/CSlAd5qETdKPCZ06jH88', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:112a0e87360839ecc7ba2c97ff5b05f7eacb4388166be5873aa61173145d7bba', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'jin' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'king', 'King', 'fighter', 'released', true, 3, 'A grappler who uses chain throws, giant swings, and strong pokes to make every close-range opening lead to a damaging decision tree.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/tekken-8-king.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/ESDBWWFCTiWikbaNUkLm', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:4d19461384934edc9ffef3ad6e83365815c97982e6f0b223e174436de1b126d0', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'king' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jun', 'Jun', 'fighter', 'released', true, 4, 'A balanced martial artist who uses Kazama techniques, healing properties, and stance transitions to convert careful pokes into pressure.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'paul', 'Paul', 'fighter', 'released', true, 5, 'A heavyweight striker who uses Phoenix Smasher, Deathfist, and powerful whiff punishment to make mid-range mistakes extremely costly.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'law', 'Law', 'fighter', 'released', true, 6, 'A fast martial artist who uses Dragon Tail, flips, and nunchaku strings to rush down opponents and carry hits toward the wall.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jack-8', 'Jack-8', 'fighter', 'released', true, 7, 'A large robot who uses long limbs, guns, and armored Heat-enhanced attacks to control space and punish approaches.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lars', 'Lars', 'fighter', 'released', true, 8, 'A mobile stance fighter who uses Dynamic Entry, Silent Entry, and Storm Gear transitions to attack quickly from changing angles.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'xiaoyu', 'Xiaoyu', 'fighter', 'released', true, 9, 'A nimble stance fighter who uses Art of Phoenix evasion, Rain Dance, and low-profile movement to create awkward close-range openings.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nina', 'Nina', 'fighter', 'released', true, 10, 'A precise assassin who uses fast strings, throws, and gun-based extensions to keep pressure active after small neutral wins.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leroy', 'Leroy', 'fighter', 'released', true, 11, 'A defensive martial artist who uses parries, cane strikes, and compact pressure to punish predictable offense and control close range.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'asuka', 'Asuka', 'fighter', 'released', true, 12, 'A counter-oriented fighter who uses sabaki attacks, command throws, and strong mid-range strikes to punish overaggressive approaches.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lili', 'Lili', 'fighter', 'released', true, 13, 'A mobile footwork fighter who uses evasive movement, long kicks, and wall carry to whiff-punish and sustain graceful pressure.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/tekken-8-lili.png', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/pQi3O39ATPipjt8KqWgz', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:155d22e8f6de4f6e4bb1a0426abe0f16c86abe154298b6fd3e42fd9533222088', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'lili' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bryan', 'Bryan', 'fighter', 'released', true, 14, 'A counter-hit specialist who uses long limbs, taunt pressure, and explosive launchers to make defensive hesitation dangerous.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'hwoarang', 'Hwoarang', 'fighter', 'released', true, 15, 'A stance-heavy kickboxer who cycles Left Flamingo and Right Flamingo attacks to maintain relentless high-low pressure.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'claudio', 'Claudio', 'fighter', 'released', true, 16, 'A mid-range exorcist who uses Starburst-powered attacks, projectiles, and strong launchers to make neutral wins highly rewarding.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'azucena', 'Azucena', 'fighter', 'released', true, 17, 'A mobile striker who uses Libertador stance evasions, coffee-fueled pressure, and fast pokes to force awkward counter-hit situations.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'raven', 'Raven', 'fighter', 'released', true, 18, 'A stealthy ninja who uses shadow clones, teleport movement, and long-reaching attacks to create deceptive whiff-punish routes.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leo', 'Leo', 'fighter', 'released', true, 19, 'A stance-based martial artist who uses Bajiquan power strikes and KNK transitions to pressure from grounded and close-range angles.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'steve', 'Steve', 'fighter', 'released', true, 20, 'A boxing specialist who uses weaving, ducking, and counter-hit punches to slip under attacks and build pressure without conventional kicks.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kuma', 'Kuma', 'fighter', 'released', true, 21, 'A bear fighter who uses unusual stances, hunting attacks, and large swings to make spacing and punish timing unfamiliar.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'yoshimitsu', 'Yoshimitsu', 'fighter', 'released', true, 22, 'A trickster sword fighter who uses stance changes, spins, teleport-like movement, and health-risk attacks to disrupt standard defense.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'shaheen', 'Shaheen', 'fighter', 'released', true, 23, 'A grounded rushdown fighter who uses slide transitions, stealth stance pressure, and efficient pokes to control the space in front of him.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dragunov', 'Dragunov', 'fighter', 'released', true, 24, 'A pressure grappler who uses Running Two, strong lows, and command throws to keep opponents pinned after every approach.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'feng', 'Feng', 'fighter', 'released', true, 25, 'A counter-hit martial artist who uses Kenpo evasions, shoulder attacks, and stance movement to punish buttons and reclaim space.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'panda', 'Panda', 'fighter', 'released', true, 26, 'A bear variant who uses large swings, unusual stance interactions, and matchup-specific movement to create offbeat neutral exchanges.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lee', 'Lee', 'fighter', 'released', true, 27, 'A precision martial artist who uses just-frame attacks, Mist Step movement, and elegant launchers to reward exact execution.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'alisa', 'Alisa', 'fighter', 'released', true, 28, 'A mobile robot who uses detachable chainsaws, rocket movement, and aerial attacks to harass opponents and carry them to the wall.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zafina', 'Zafina', 'fighter', 'released', true, 29, 'A stance-heavy fighter who uses evasive postures, acrobatic attacks, and Azazel-linked powers to create difficult-to-track offense.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'devil-jin', 'Devil Jin', 'fighter', 'released', true, 30, 'An aerial Mishima fighter who combines Electric Wind God Fist, lasers, flight, and powerful Heat conversions to attack from every range.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'victor', 'Victor', 'fighter', 'released', true, 31, 'A weapon specialist who uses a sword, firearms, and teleporting movement to control mid range and punish failed approaches.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'reina', 'Reina', 'fighter', 'released', true, 32, 'A fast Mishima fighter who combines electric attacks with stance transitions and aggressive pressure to turn neutral wins into Heat momentum.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/tekken-8-reina.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/TfCpIKWORbmnzyPWwqkK', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:d7c04a8c79b6c2f45cfc9a0a5e71e2040387e896520cff43dc9ee7d17d795377', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'reina' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'eddy', 'Eddy', 'fighter', 'released', true, 33, 'A capoeira stance fighter who switches between grounded and handstand attacks to create flowing pressure and evasive approach routes.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lidia', 'Lidia', 'fighter', 'released', true, 34, 'A karate fighter who uses stance transitions, strong fundamentals, and power-enhanced Heat attacks to make disciplined pressure snowball.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'heihachi', 'Heihachi', 'fighter', 'released', true, 35, 'A classic Mishima powerhouse who uses electric uppercuts, wavedash pressure, and hard-hitting mids to dominate close neutral exchanges.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'clive', 'Clive', 'fighter', 'released', true, 36, 'A long-reaching sword fighter who uses Phoenix Shift movement, ranged blade attacks, and Heat-enhanced pressure to control the middle of the stage.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anna', 'Anna', 'fighter', 'released', true, 37, 'A close-range assassin who uses deceptive strings, explosive launchers, and stance-like transitions to keep pressure difficult to predict.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'fahkumram', 'Fahkumram', 'fighter', 'released', true, 38, 'A long-limbed Muay Thai fighter who uses powerful kicks, knee pressure, and wall carry to make blocked movement increasingly dangerous.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'armor-king', 'Armor King', 'fighter', 'released', true, 39, 'A masked grappler who combines chain throws, dark uppercuts, and armored strikes to punish close-range mistakes with heavy damage.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'miary-zo', 'Miary Zo', 'fighter', 'released', true, 40, 'A nimble acrobatic fighter who uses fast stance transitions, evasive movement, and animal-assisted attacks to create unusual approach timings.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'kunimitsu', 'Kunimitsu', 'fighter', 'released', true, 41, 'A fast ninja fighter who uses teleporting movement, kunai, and stance transitions to attack from changing sides and distances.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'tekken-8'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bob', 'Bob', 'fighter', 'released', true, 42, 'A speed-focused heavyweight who uses fast rushing strings, spin movement, and weight-backed launchers to make his offense unusually mobile.', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
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
select id, 'robo-ky', 'Robo-Ky', 'fighter', 'released', true, 1, 'A resource fighter who charges an electric gauge to improve specials, then spends that power on stronger pressure and conversions.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jam', 'Jam Kuradoberi', 'fighter', 'released', true, 2, 'A fast martial artist who stocks enhancements for her special moves and uses kick pressure to convert close openings into offense.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'lucy', 'Lucy', 'fighter', 'released', true, 3, 'A mobile cybernetic fighter who uses hacking tools and quick close-range attacks to create sudden approach and pressure sequences.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'unika', 'Unika', 'fighter', 'released', true, 4, 'A versatile fighter who shifts between ranged weapon pressure and close attacks to keep opponents guessing about her next approach.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'venom', 'Venom', 'fighter', 'released', true, 5, 'A technical zoner who places billiard balls at chosen angles and then redirects them to build layered neutral and pressure patterns.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'dizzy', 'Queen Dizzy', 'fighter', 'released', true, 6, 'A summon-and-projectile fighter who combines fish, fire, and ice effects to control multiple lanes and punish impatient approaches.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'slayer', 'Slayer', 'fighter', 'released', true, 7, 'A close-range counter fighter who uses Dandy Step, evasive movement, and Pilebunker to turn reads into explosive damage.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'aba', 'A.B.A', 'fighter', 'released', true, 8, 'A resource fighter who manages her key and blood states to shift from a slower neutral mode into a powerful aggressive transformation.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'elphelt', 'Elphelt Valentine', 'fighter', 'released', true, 9, 'A weapon-stance fighter who switches between grenade, shotgun, and rifle pressure to create varied blockstrings and corner setups.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'johnny', 'Johnny', 'fighter', 'released', true, 10, 'A mid-range sword fighter who uses Mist Finer cards and coins to control space, set up pressure, and cash out on clean confirms.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'asuka-r', 'Asuka R#', 'fighter', 'released', true, 11, 'A spellbook resource fighter who manages mana and randomized spells to build flexible zoning, defense, and combo routes.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bedman', 'Bedman?', 'fighter', 'released', true, 12, 'A setplay fighter whose error follow-ups and autonomous attacks let the bed keep pressure active while Bedman? repositions.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sin', 'Sin Kiske', 'fighter', 'released', true, 13, 'A mobile spear fighter who spends stamina on special attacks and uses Beak Driver to carry grounded openings into corner pressure.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'bridget', 'Bridget', 'fighter', 'released', true, 14, 'A mobile yo-yo fighter who places setplay tools and uses rolling movement, Roman Cancels, and wall-break routes to attack from awkward angles.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggst-bridget.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara21_bgt.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:e9d2043da468825cda117f0eac9db930a43ec7b547e0e041a29f0660d14311da', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'bridget' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'testament', 'Testament', 'fighter', 'released', true, 15, 'A trap fighter who applies Stain and uses Grave Reaper, succubi, and teleport movement to make grounded defense uncertain.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'baiken', 'Baiken', 'fighter', 'released', true, 16, 'A defensive sword fighter who uses Tatami Gaeshi, parries, and tethered follow-ups to punish approaches and force close decisions.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'happy-chaos', 'Happy Chaos', 'fighter', 'released', true, 17, 'A gun-resource fighter who aims his revolver and manages concentration to control neutral with bullets and flexible curse pressure.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'jack-o', 'Jack-O''', 'fighter', 'released', true, 18, 'A minion setplay fighter who builds and commands servants to occupy space, then uses their formations to extend offense.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'goldlewis', 'Goldlewis Dickinson', 'fighter', 'released', true, 19, 'A heavyweight who uses Behemoth Typhoon swings and security-level management to turn corner pressure into huge damage.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'i-no', 'I-No', 'fighter', 'released', true, 20, 'A hover-dash rushdown fighter who uses musical notes, Chemical Love, and Roman Cancel routes to attack from changing heights and carry pressure to the wall.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'anji', 'Anji Mito', 'fighter', 'released', true, 21, 'A counter-oriented fighter who uses Fuujin follow-ups, projectile butterflies, and autoguard movement to absorb predictable attacks.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'giovanna', 'Giovanna', 'fighter', 'released', true, 22, 'A close-range rushdown fighter who uses Sol Poente, Trovao, and strong plus-frame pressure to stay attached to opponents.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'nagoriyuki', 'Nagoriyuki', 'fighter', 'released', true, 23, 'A powerful sword fighter who manages the Blood Gauge while using Fukyo and wide slashes to control mid range and burst damage.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggst-nagoriyuki.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara12_nag.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:e856f37d4379827d0edf3d1b66dd3a559d48753969969071c4c97dbc3537f973', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'nagoriyuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'leo', 'Leo Whitefang', 'fighter', 'released', true, 24, 'A stance-heavy sword fighter who uses Brynhildr transitions, cross-up attacks, and projectile pressure to keep offense active.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ramlethal', 'Ramlethal Valentine', 'fighter', 'released', true, 25, 'A sword-throwing fighter who places her greatswords around the opponent, then uses rekka pressure and corner control to cash out.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggst-ramlethal.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara10_ram.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:1033fb5a445a2d774091d10c26e3a7360036fb9aad94e3f3aefc4db853356806', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'ramlethal' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'zato-1', 'Zato=1 / Eddie', 'fighter', 'released', true, 26, 'A summon fighter who manages Eddie''s gauge to layer drills, flight, and command-grab pressure over Zato''s own attacks.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'millia', 'Millia Rage', 'fighter', 'released', true, 27, 'A fast setplay fighter who uses Tandem Top and hair discs to create repeated high-low and left-right pressure after knockdowns.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'faust', 'Faust', 'fighter', 'released', true, 28, 'A disruptive item-throw fighter who uses random objects, long pokes, and pogo movement to make neutral timing unpredictable.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'potemkin', 'Potemkin', 'fighter', 'released', true, 29, 'A heavyweight grappler who uses Hammer Fall armor, Garuda Impact, and Potemkin Buster to force respect at close range before a wall break.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'chipp', 'Chipp Zanuff', 'fighter', 'released', true, 30, 'A fragile speed fighter who uses Alpha Blade, teleports, and wall movement to create rapid cross-ups and layered mix-ups.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'axl', 'Axl Low', 'fighter', 'released', true, 31, 'A long-range chain fighter who uses sickle attacks, Rensen, and time-control pressure to punish movement across the screen.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'may', 'May', 'fighter', 'released', true, 32, 'A charge-based rushdown fighter who uses Mr. Dolphin, beach-ball returns, and wall-break routes to approach from unpredictable angles.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'ky', 'Ky Kiske', 'fighter', 'released', true, 33, 'A balanced sword fighter who uses Stun Edge, Vapor Thrust, and Dire Eclat to control space before turning a knockdown into pressure.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)
select id, 'sol', 'Sol Badguy', 'fighter', 'released', true, 34, 'A close-range powerhouse who uses Gunflame, Bandit Revolver, and strong frame traps to turn grounded openings into knockdown pressure.', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', 'attributed-paraphrase', '2026-08-25T00:00:00Z'
from public.game_versions where slug = 'ggst'
on conflict (game_version_id, slug, roster_role) do update set
  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,
  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,
  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)
select c.id, '/art/ggst-sol.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara01_sol.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:7fd6a1a4cc85e7196d3ca68df3e248b92df4abd84601b8292274ed3020677477', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'sol' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

commit;
