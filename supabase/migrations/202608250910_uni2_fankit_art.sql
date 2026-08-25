insert into public.character_art_assets (
  character_id,
  storage_path,
  source_url,
  source_publisher,
  license_url,
  asset_reuse_mode,
  credit_text,
  permission_evidence,
  asset_sha256,
  review_state,
  is_primary,
  retrieved_at,
  reviewed_at
)
select
  character_row.id,
  asset.storage_path,
  asset.source_url,
  'Arc System Works',
  'https://www.arcsystemworks.jp/uni2celes/en/fankit/',
  'express-fan-kit',
  '© FRENCH-BREAD / ARC SYSTEM WORKS',
  'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.',
  asset.asset_sha256,
  'approved',
  true,
  '2026-08-25',
  '2026-08-25'
from (
  values
    ('hyde', '/art/uni2-hyde.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_000Hyde.png', 'sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4'),
    ('linne', '/art/uni2-linne.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_001Linne.png', 'sha256:c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7'),
    ('yuzuriha', '/art/uni2-yuzuriha.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_009Yuzuriha.png', 'sha256:cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c'),
    ('waldstein', '/art/uni2-waldstein.png', 'https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_002Waldstein.png', 'sha256:fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18')
) as asset(character_slug, storage_path, source_url, asset_sha256)
join public.game_versions game_version on game_version.slug = 'uni2'
join public.characters character_row
  on character_row.game_version_id = game_version.id
  and character_row.slug = asset.character_slug
  and character_row.roster_role = 'fighter'
on conflict (asset_sha256) do update set
  character_id = excluded.character_id,
  storage_path = excluded.storage_path,
  source_url = excluded.source_url,
  source_publisher = excluded.source_publisher,
  license_url = excluded.license_url,
  asset_reuse_mode = excluded.asset_reuse_mode,
  credit_text = excluded.credit_text,
  permission_evidence = excluded.permission_evidence,
  is_primary = excluded.is_primary,
  retrieved_at = excluded.retrieved_at,
  reviewed_at = excluded.reviewed_at;
