-- Generated from the verified UNI2 block in supabase/seed.sql.
-- The official 28-character index and unmodified fan-kit assets were reviewed on 2026-08-25.
begin;

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
select c.id, '/art/uni2-hyde.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_000Hyde.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hyde' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-linne.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_001Linne.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'linne' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-waldstein.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_002Waldstein.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'waldstein' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-carmine.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_003Carmine.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:532eac2560010c3d30a78e10517b7b4a142e1b2b5339f1ae82523fe2477fb87b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'carmine' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-orie.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_004Orie.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:d034e2e20297dd150d69b2337cb9beb130a56e2503ea0be74ec3d07d55d9f9e3', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'orie' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-gordeau.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_005Gordeau.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:7e4f743ab31a913642633d0331c8e275e6c17540ef16d00545616315fbe1b1b1', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'gordeau' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-merkava.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_006Merkava.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:dcf8c5f5c85d31d357288aab1876f6111c14fe7801840d6bb60a064d4ba65512', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'merkava' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-vatista.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_007Vatista.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:c5bd16037b77842456c7406d9686ba4efd6f8f116ebf6ddda03cab1809e161d4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'vatista' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-seth.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_008Seth.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:d764d96b9ddf29d57b0f3430db98d0eab446010cbaa96a723ff75ffc961cc0b5', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'seth' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-yuzuriha.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_009Yuzuriha.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'yuzuriha' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-hilda.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_010Hilda.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:f4b26461883d7655697c8e8920d11134b06db267ce6eaa333a04cf32e689df86', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'hilda' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-chaos.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_015Chaos.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:fb2cf6eb6b6e81650b5d25828f24f888d6cc2f7755537120c1b20186f3faf78b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'chaos' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-nanase.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_012Nanase.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:dd7f0a9408971650777e665972dc2ccd06fbbaa346695c10559061b35e6b1566', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'nanase' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-byakuya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_013Byakuya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:2eb71cb253c9d2682ef38fa6af7eeddd200eac5cf013a21711ab60772b90dac2', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'byakuya' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-phonon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_024phonon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:60b21d7571dc0bcf5626e73c9b419bd822fec88658f48a26f5182074176399ca', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'phonon' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-mika.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_021Mika.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:fa56a74db9792734738822b69b3ebf93375a3db05efa0225c9060e4811aa1075', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'mika' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-wagner.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_016Wagner.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:e8eb4fcea9347ad992b50ded641c18aa54c46526d293af0566c46f24dcd1f22a', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'wagner' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-enkidu.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_017Enkidu.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:e264f609214b897ed8499ee4cc3eae58859f55675876d300d8b639bad532a49b', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'enkidu' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-londrekia.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_018Londrekia.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:0f6a279fcef6057aa8f0152fcca18ae0ba04416cbe37627cd6fa8e2b3d180642', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'londrekia' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-tsurugi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_019Tsurugi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:895b5721a45d379276f39535b1ccea1707c42a8537b66717cc291f6ce3501d21', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'tsurugi' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-kaguya.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_022Kaguya.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:5f11e1b3b566bd44be459891ca85826499e7a345459ee749a292fbc8496130a0', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kaguya' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-kuon.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_023Kuon.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:9b3aaa0143daa03a3ba424460784446ffff8477a8b8465a2a01344cc6191babd', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'kuon' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-uzuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_020Uzuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:a553e77ee3c92798060c818b7679d59a6c8b9d774faa604fd7f5c05f4baedaf4', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'uzuki' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-ogre.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_025Ogre.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:3aa92b8eecc4a346961a0a79f7b64532176d624edb250cb2b13363d330d0aeef', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'ogre' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-izumi.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_026Izumi.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:f547ea2a60643c078f0bfbabe63779ad97e6725e0e1f5185ef56c04e5e4764c1', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'izumi' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-zohar.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_027zohar.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:ff2f7b33f659edbd3c909b0d5002acd6ce37a95522e7cb4261861a92181a4cd5', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'zohar' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-eltnum.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_011Eltnum.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:d3ad6b4fc2780287c53e3fb724d63616ff8e82177f57257bc2bf09a0b05f4e80', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'eltnum' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
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
select c.id, '/art/uni2-akatsuki.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_014Akatsuki.png', 'Arc System Works', 'https://www.arcsystemworks.jp/uni2celes/en/fankit/', 'express-fan-kit', '© FRENCH-BREAD / ARC SYSTEM WORKS', 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', 'sha256:51ce0e39c69595e0facebb6b1010e62830932e06cd97934c9a186904590a7403', 'approved', true, '2026-08-25', '2026-08-25'
from public.characters c
join public.game_versions gv on gv.id = c.game_version_id
where gv.slug = 'uni2' and c.slug = 'akatsuki' and c.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,
  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;

commit;
