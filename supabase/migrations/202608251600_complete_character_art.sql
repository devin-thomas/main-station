-- Generated from the reviewed Character art records in src/data/catalog.ts.
begin;

alter table public.character_art_assets
  drop constraint character_art_reuse_mode,
  add constraint character_art_reuse_mode check (asset_reuse_mode in ('express-fan-kit', 'publisher-promotional', 'conditional-fan-kit', 'conditional-community-policy', 'written-permission', 'community-licensed'));

-- One official composite may legitimately depict several version-scoped Characters.
alter table public.character_art_assets
  drop constraint character_art_assets_asset_sha256_key,
  add constraint character_art_assets_character_hash_key unique (character_id, asset_sha256);

comment on column public.character_art_assets.license_url is 'Rights-review URL: a fan-kit license, terms page, permission record, or other controlling review basis. The URL is not necessarily an express license.';

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-ahri.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/593043e42b15c4826f7e0fc2a0bea85a05cdd994-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:a8b7868f1782f73790bb95976f0124b522909cba99cd5fcc8f57e66b22ba1f70', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'ahri' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-akali.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/1705793c7046ee13bb9027b868a91e5b935095b6-472x630.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:29a29fcf24cfa7a3e2fc1d6c7296fc2bde78d5779bc7fa52ca01ca414996d14e', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'akali' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-blitzcrank.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/5af8a16de4c87ea5bb8a3b3f945e90f3306a4cfe-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:beecc00b38bf24c55fca13d48fa14211212b4ae706a4d14dae26e620bf8a7691', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'blitzcrank' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-braum.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/96bcb8cdcee7f3fd12b379c8517aa1f33504c371-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:4c3778c3a2f3c2bd3715a7a95b58143d698503f296256617a4c96628e2b939fe', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'braum' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-caitlyn.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7d7c3713add9fe798cc71ba66217a1a46d6634bc-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:b866957ee92e1832262d79b5b26336ae0f2a7c3a3751e6a09db11a49aeb5e164', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'caitlyn' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-darius.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/67e08591a957c9068e3b146976785fb8308d6cd4-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:ad35f39c908a5b5f3386a5a3a2bd85e575ee9a53bdcc7580c0f9230a32cb3b6a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'darius' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-ekko.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f98dcc375555b36de58cc991c381c4fce641b636-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:3956f83f517517a8d86ab1dd6780b47ffe4f298c783d3dc4ace34681bd89e977', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'ekko' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-illaoi.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/12a5e9cea0ea7626b0d89e3740180f13341b5dc8-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:5faf3f20c07751a798a6e9727c67324c10f1aeecb0ce35e1a94225d836c5fe4f', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'illaoi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-jinx.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f0e8ed7da57962c1245dfca8c26a8a81ddab017d-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:b9807815aaf85b1bf6848b9014ade9568a2be86e98075319eac9b53193537839', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'jinx' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-senna.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0606aa0ee6b494a762057c971c7bb642fe607bba-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:3a1b260485576fcf812f7906fa76bc5166e6a3f48021319d5cf370f69aa59877', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'senna' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-teemo.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0933542e8d4fc57628e7fe7dff9cd17d2ff457a4-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:185a0c0bd7a1d932b21ddb71e499ab47eb7b671c7e0118720ad7a94f04721593', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'teemo' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-thresh.jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/2c9af0c83fd43c0a8f5258f75f8f197655971de9-780x1040.jpg?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:a08696516143ef646c54e8a41d6c567de8c591a71dd370e9ff9798fc6a2db71c', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'thresh' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-vi.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/d69d95df23f8a7e5c951a1021f4f5b118fadaec3-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:692475c52ffe6346d8a0fe0161f1d3035ccafff3b3cb5b60df46f26d379d3e0e', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'vi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-warwick.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/6aa9fb38660c1b63c37716c6f44739ba406b501f-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:d9e8e03c1357ee068298dc5506a431874ce26bd9415d9293f391614510306fdc', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'warwick' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/2xko-yasuo.png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7e9459768d4641533fdbfa1c0e84b6574d8e05ab-780x1040.png?accountingTag=2XKO', 'Riot Games', 'https://www.riotgames.com/en/legal', 'conditional-community-policy', 'MainStation was created under Riot Games'' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.', 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.', 'sha256:296dbb227cbccb9b67091d7b586d37c9fbd6743306094570bcb2848ac7f44f15', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = '2xko' and c.slug = 'yasuo' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-magik.png', 'https://gmedia.playstation.com/is/image/SIEPDC/magik-big-10-02-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:51401dc3f3048d15f88013b39f31e3c46885a1f32db05d846a32a5ddf1ed781f', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'magik' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-spider-man.png', 'https://gmedia.playstation.com/is/image/SIEPDC/spider-man-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:9c1ff858cd3c773da6fda90a80916c9379a795866fc49402d0505e37890743d5', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'spider-man' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-black-panther.png', 'https://gmedia.playstation.com/is/image/SIEPDC/black-panther-big-21-04-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:c15cc1540105a6b4d66f2308ab40459262c0241578431d8196ad03e2251a610a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'black-panther' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-storm.png', 'https://gmedia.playstation.com/is/image/SIEPDC/storm-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:558bbb66e3580c4f1a5543eaea1ff426ff4bf78b8bd9f0af101a9c48bdf5e9d3', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'storm' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-iron-man.png', 'https://gmedia.playstation.com/is/image/SIEPDC/iron-man-big-16-02-2026?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:0431f9ecaa2d0f3ab66a60887c10e23ff33355f763772838c241938ed8407c55', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'iron-man' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/marvel-tokon-doctor-doom.png', 'https://gmedia.playstation.com/is/image/SIEPDC/dr-doom-big-20-11-2025?$1600px--t$', 'Sony Interactive Entertainment / Marvel', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel', 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:6cb2bb0244b68eb0d778b4bdcb680d62808a73604df1d1962227e40f73d420f6', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'marvel-tokon' and c.slug = 'doctor-doom' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mvc2-storm.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/storm.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:ccb6b88438a76bc7d61831a3171fa8cd14eec18c006d5f73f555c94e8e13ade6', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'storm' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mvc2-magneto.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/magneto.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:419c3f9d88276fd2d65c10f21f4b930f80e871cba719d55b3e522370f73e58c2', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'magneto' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mvc2-sentinel.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/sentinel.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:693e4b48a209f9656dbf37ba970c4c242d84d4d985f93de00ffe72b6f7d99c2a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'sentinel' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mvc2-cable.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/cable.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:c76a8626ac3e2908044ed3688d91459d7cadb54f5db5b54a6d8b96e27d94ce54', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mvc2' and c.slug = 'cable' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/umvc3-zero.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/2f7319c0e9932a47d0e9db7ef453ec4f.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:66f595785490a5e6cadb6e05607b26bc8b1ef0fb9d718c21b0de789d5ee73b7e', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'zero' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/umvc3-vergil.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/b910a3cc3952012c7111b152af718e2f.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:4dfdd583f5462e8db772896c825170bf4c2fc1d39a54aea376dd0cc2f63477c3', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'vergil' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/umvc3-doom.png', 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/doctor_doom.png', 'Capcom / Marvel', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Marvel vs. Capcom 2 Doctor Doom art via Capcom; cross-version identity fallback for UMVC3', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. No live first-party version-matched UMVC3 Doctor Doom render was found; this MVC2 art is explicitly cross-version.', 'sha256:2867aaa52ef1094fbdfd24d961fd6e904182e2631a71591fb30f75029420b5a2', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'doom' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/umvc3-dante.png', 'https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/893d1dc95c1896f2177e84bea51dad7d.png', 'Capcom / UMVC3 development team', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded. The official art post invites fan creations but does not grant unchanged app reuse.', 'sha256:6641ca935f62229c8e1f416315711ff606366ebbab375882b4869b0b18e4cb95', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'umvc3' and c.slug = 'dante' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-hyde.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_000Hyde.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hyde' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-linne.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_001Linne.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'linne' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-waldstein.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_002Waldstein.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'waldstein' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-carmine.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_003Carmine.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:532eac2560010c3d30a78e10517b7b4a142e1b2b5339f1ae82523fe2477fb87b', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'carmine' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-orie.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_004Orie.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d034e2e20297dd150d69b2337cb9beb130a56e2503ea0be74ec3d07d55d9f9e3', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'orie' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-gordeau.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_005Gordeau.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:7e4f743ab31a913642633d0331c8e275e6c17540ef16d00545616315fbe1b1b1', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'gordeau' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-merkava.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_006Merkava.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:dcf8c5f5c85d31d357288aab1876f6111c14fe7801840d6bb60a064d4ba65512', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'merkava' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-vatista.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_007Vatista.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:c5bd16037b77842456c7406d9686ba4efd6f8f116ebf6ddda03cab1809e161d4', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'vatista' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-seth.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_008Seth.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d764d96b9ddf29d57b0f3430db98d0eab446010cbaa96a723ff75ffc961cc0b5', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'seth' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-yuzuriha.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_009Yuzuriha.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'yuzuriha' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-hilda.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_010Hilda.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:f4b26461883d7655697c8e8920d11134b06db267ce6eaa333a04cf32e689df86', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hilda' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-chaos.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_015Chaos.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fb2cf6eb6b6e81650b5d25828f24f888d6cc2f7755537120c1b20186f3faf78b', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'chaos' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-nanase.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_012Nanase.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:dd7f0a9408971650777e665972dc2ccd06fbbaa346695c10559061b35e6b1566', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'nanase' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-byakuya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_013Byakuya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:2eb71cb253c9d2682ef38fa6af7eeddd200eac5cf013a21711ab60772b90dac2', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'byakuya' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-phonon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_024phonon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:60b21d7571dc0bcf5626e73c9b419bd822fec88658f48a26f5182074176399ca', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'phonon' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-mika.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_021Mika.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:fa56a74db9792734738822b69b3ebf93375a3db05efa0225c9060e4811aa1075', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'mika' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-wagner.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_016Wagner.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:e8eb4fcea9347ad992b50ded641c18aa54c46526d293af0566c46f24dcd1f22a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'wagner' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-enkidu.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_017Enkidu.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:e264f609214b897ed8499ee4cc3eae58859f55675876d300d8b639bad532a49b', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'enkidu' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-londrekia.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_018Londrekia.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:0f6a279fcef6057aa8f0152fcca18ae0ba04416cbe37627cd6fa8e2b3d180642', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'londrekia' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-tsurugi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_019Tsurugi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:895b5721a45d379276f39535b1ccea1707c42a8537b66717cc291f6ce3501d21', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'tsurugi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-kaguya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_022Kaguya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:5f11e1b3b566bd44be459891ca85826499e7a345459ee749a292fbc8496130a0', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kaguya' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-kuon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_023Kuon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:9b3aaa0143daa03a3ba424460784446ffff8477a8b8465a2a01344cc6191babd', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kuon' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-uzuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_020Uzuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:a553e77ee3c92798060c818b7679d59a6c8b9d774faa604fd7f5c05f4baedaf4', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'uzuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-ogre.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_025Ogre.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:3aa92b8eecc4a346961a0a79f7b64532176d624edb250cb2b13363d330d0aeef', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'ogre' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-izumi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_026Izumi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:f547ea2a60643c078f0bfbabe63779ad97e6725e0e1f5185ef56c04e5e4764c1', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'izumi' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-zohar.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_027zohar.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:ff2f7b33f659edbd3c909b0d5002acd6ce37a95522e7cb4261861a92181a4cd5', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'zohar' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-eltnum.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_011Eltnum.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:d3ad6b4fc2780287c53e3fb724d63616ff8e82177f57257bc2bf09a0b05f4e80', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'eltnum' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/uni2-akatsuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_014Akatsuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.', 'sha256:51ce0e39c69595e0facebb6b1010e62830932e06cd97934c9a186904590a7403', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'akatsuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/avatar-azula.jpg', 'https://live.staticflickr.com/65535/55168531880_df00c7e87a_k.jpg', 'Gameplay Group International via PlayStation Blog', 'https://www.playstation.com/en-us/legal/website-terms-of-use/', 'publisher-promotional', 'Avatar Legends: The Fighting Game promotional screenshot © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. This version-exact screenshot features Azula rather than a standalone cutout.', 'sha256:9cf595dacb4d71c1eef1af50a9ca4ad6134859393ad8dd52a81603fde4d4ec6e', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'azula' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party aang cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'aang' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party korra cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'korra' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/avatar-key-art.jpg', 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg', 'PM Studios / Gameplay Group International', 'https://thegameplaygroup.com/terms-of-service', 'publisher-promotional', 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International', 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded. No standalone first-party zuko cutout was found; this shared key art is character-focused in the page crop.', 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'avatar-legends' and c.slug = 'zuko' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/melee-fox.png', 'https://www.smashbros.com/assets_v2/img/fighter/fox/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 07)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:67db02396021221a109fff6b83940b5879705a77e07cb2740d90b50fb00add82', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'fox' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/melee-marth.png', 'https://www.smashbros.com/assets_v2/img/fighter/marth/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 21)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:0437c89299459e11811e76e3b322a851d00619e93c5b55c9437ace13dfb3b1a4', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'marth' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/melee-falco.png', 'https://www.smashbros.com/assets_v2/img/fighter/falco/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 20)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:a616cc0cba78d999dec0eb1d43dee61117dd5e9decae0ed2a8a5e47262505d03', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'falco' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/melee-sheik.png', 'https://www.smashbros.com/assets_v2/img/fighter/sheik/main.png', 'Nintendo', 'https://www.nintendo.com/us/terms-of-use/ncl/', 'publisher-promotional', 'Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter 16)', 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.', 'sha256:1bc2bbceb4a1caacd3944c5d556243a401cc587b2b00bf7c672e7c4642ca941e', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'melee' and c.slug = 'sheik' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggxxacpr-sol.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_15.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:df54c4c9296de3bdcc0c8d978d6a8351dc44aa86ec2233c3b5a3e8585ffd3cd9', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'sol' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggxxacpr-ky.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_07.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:0ddd478928d6e92eb516eae273a439b2fa80ddad4dcf4531dc4f3a628e5448fc', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'ky' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggxxacpr-testament.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_18.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:8694ae2f59904d619ed97b649406cbfd76871dd28493718e88ab6a57ce755ff2', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'testament' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggxxacpr-zappa.png', 'https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_09.png', 'Arc System Works', 'https://www.arcsystemworks.jp/portal/fancontent/en/', 'publisher-promotional', '© ARC SYSTEM WORKS', 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.', 'sha256:bc0b04ed27aad92bc2b940f00dcfb354ead3971c1ada92e67dd0fdc2ffcb73ae', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggxxacpr' and c.slug = 'zappa' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/vampire-savior-morrigan.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/9-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:953ea42cbc7b84d930ec056985768ef4c0bced4f90a6373dc6ec852cdd6d80d9', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'morrigan' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/vampire-savior-jedah.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/0-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:64b1f9913b9ac101d1e2643147adada5b786826a1bb3f3610b60d09d60e69373', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'jedah' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/vampire-savior-bulleta.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/1-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:a1cdaee20de0e86fc7c9697ceae141fb45de5f4369ebc916c11529ef04b2cb78', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'bulleta' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/vampire-savior-q-bee.png', 'https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/3-e.png', 'Capcom', 'https://www.capcom-games.com/en/terms/', 'publisher-promotional', 'Official Vampire Savior promotional art ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:78bdb1a0805b0031cb3a1f18644da2bd92a8d467f5c420e42d22181d93247b79', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'vampire-savior' and c.slug = 'q-bee' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/sf6-ken.png', 'https://www.streetfighter.com/6/assets/images/character/ken/ken.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:cb5052e9506ad88dfb430236f2dfa2b93979dcd1c0a440b5ca00026ce8eff7a7', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'ken' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/sf6-chun-li.png', 'https://www.streetfighter.com/6/assets/images/character/chunli/chunli.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:2d96b387d2a2dda6e65e5cdfb4baeb4c1b80f6e554066522482bc75e7c9d7c29', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'chun-li' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/sf6-akuma.png', 'https://www.streetfighter.com/6/assets/images/character/gouki_akuma/gouki_akuma.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:27b005a34450c691ae04a24ebf1c6e5c70ee399754e77a102b10a62b990166a0', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'akuma' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/sf6-juri.png', 'https://www.streetfighter.com/6/assets/images/character/juri/juri.png', 'Capcom', 'https://www.capcom-games.com/en/fan-content-guidelines/', 'publisher-promotional', 'Street Fighter 6 ©CAPCOM', 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.', 'sha256:991ba53250a47db5f09ade953750d10a64d36146d3c4c6f32eb0e42b221431c8', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'sf6' and c.slug = 'juri' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mk1-scorpion.webp', 'https://cdn-mk1.mortalkombat.com/roster/scorpion/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:dd4235ccd1b35ab31986473ab94ffb45e79c657a570780ab13f7708466e756cc', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'scorpion' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mk1-sub-zero.webp', 'https://cdn-mk1.mortalkombat.com/roster/sub-zero/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:876ce25cd0bc55849f48dd2c96ff8053fa778a20a9ff1f4a3d55d7018af84cff', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'sub-zero' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mk1-mileena.webp', 'https://cdn-mk1.mortalkombat.com/roster/mileena/hero.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:25f601067356c7b1fff6fddcdf68f1550364a07a7565cde68ae82cbd069e9fce', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'mileena' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mk1-sonya.webp', 'https://cdn-mk1.mortalkombat.com/roster/kameos/sonya.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:ad51c7cb6e3929558eb60c8b885582695b4922f34683a8299108104789abfd9b', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'sonya' and c.roster_role = 'kameo'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/mk1-kano.webp', 'https://cdn-mk1.mortalkombat.com/roster/kameos/kano.webp', 'Warner Bros. Games / NetherRealm Studios', 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html', 'publisher-promotional', 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios', 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.', 'sha256:b3876a74989be498442d16bd366282a754b93f67924879a3f28db13881241034', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'mk1' and c.slug = 'kano' and c.roster_role = 'kameo'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/tekken-8-jin.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/CSlAd5qETdKPCZ06jH88', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:112a0e87360839ecc7ba2c97ff5b05f7eacb4388166be5873aa61173145d7bba', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'jin' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/tekken-8-reina.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/TfCpIKWORbmnzyPWwqkK', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:d7c04a8c79b6c2f45cfc9a0a5e71e2040387e896520cff43dc9ee7d17d795377', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'reina' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/tekken-8-king.webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/ESDBWWFCTiWikbaNUkLm', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:4d19461384934edc9ffef3ad6e83365815c97982e6f0b223e174436de1b126d0', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'king' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/tekken-8-lili.png', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/pQi3O39ATPipjt8KqWgz', 'Bandai Namco Entertainment', 'https://www.bandainamcoent.com/legal/terms', 'publisher-promotional', 'TEKKEN 8 ©Bandai Namco Entertainment Inc.', 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.', 'sha256:155d22e8f6de4f6e4bb1a0426abe0f16c86abe154298b6fd3e42fd9533222088', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'tekken-8' and c.slug = 'lili' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggst-sol.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara01_sol.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:7fd6a1a4cc85e7196d3ca68df3e248b92df4abd84601b8292274ed3020677477', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'sol' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggst-ramlethal.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara10_ram.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:1033fb5a445a2d774091d10c26e3a7360036fb9aad94e3f3aefc4db853356806', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'ramlethal' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggst-nagoriyuki.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara12_nag.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:e856f37d4379827d0edf3d1b66dd3a559d48753969969071c4c97dbc3537f973', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'nagoriyuki' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)
select c.id, '/art/ggst-bridget.png', 'https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara21_bgt.png', 'Arc System Works', 'https://www.guiltygear.com/ggst/en/fankit/', 'conditional-fan-kit', '© ARC SYSTEM WORKS', 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.', 'sha256:e9d2043da468825cda117f0eac9db930a43ec7b547e0e041a29f0660d14311da', 'approved', true, '2026-08-25', '2026-08-25', null
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'ggst' and c.slug = 'bridget' and c.roster_role = 'fighter'
on conflict (character_id, asset_sha256) do update set
  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,
  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;

commit;
