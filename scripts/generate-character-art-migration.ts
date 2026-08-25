import { writeFile } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';

function sql(value: string): string {
  return `'${value.replaceAll("'", "''")}'`;
}

const artEntries = catalog.flatMap((game) => game.characters.flatMap((character) => (
  character.art ? [{ game, character, art: character.art }] : []
)));

if (artEntries.length !== 90) {
  throw new Error(`Expected artwork for all 90 current Character rows; found ${artEntries.length}.`);
}

const lines: string[] = [
  '-- Generated from the reviewed Character art records in src/data/catalog.ts.',
  'begin;',
  '',
  'alter table public.character_art_assets',
  '  drop constraint character_art_reuse_mode,',
  '  add constraint character_art_reuse_mode check (asset_reuse_mode in (\'express-fan-kit\', \'publisher-promotional\', \'conditional-fan-kit\', \'conditional-community-policy\', \'written-permission\', \'community-licensed\'));',
  '',
  '-- One official composite may legitimately depict several version-scoped Characters.',
  'alter table public.character_art_assets',
  '  drop constraint character_art_assets_asset_sha256_key,',
  '  add constraint character_art_assets_character_hash_key unique (character_id, asset_sha256);',
  '',
  "comment on column public.character_art_assets.license_url is 'Rights-review URL: a fan-kit license, terms page, permission record, or other controlling review basis. The URL is not necessarily an express license.';",
  '',
];

for (const { game, character, art } of artEntries) {
  lines.push(
    'insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at, disabled_at)',
    `select c.id, ${sql(art.localPath)}, ${sql(art.sourceUrl)}, ${sql(art.sourcePublisher)}, ${sql(art.reviewUrl)}, ${sql(art.usageBasis)}, ${sql(art.creditText)}, ${sql(art.permissionEvidence)}, ${sql(art.assetHash)}, 'approved', true, ${sql(art.reviewedAt)}, ${sql(art.reviewedAt)}, null`,
    'from public.characters c',
    'join public.game_versions gv on gv.id = c.game_version_id',
    `where gv.slug = ${sql(game.slug)} and c.slug = ${sql(character.slug)} and c.roster_role = ${sql(character.role)}`,
    'on conflict (character_id, asset_sha256) do update set',
    '  storage_path = excluded.storage_path, source_url = excluded.source_url, source_publisher = excluded.source_publisher,',
    '  license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode, credit_text = excluded.credit_text,',
    '  permission_evidence = excluded.permission_evidence, review_state = excluded.review_state, is_primary = excluded.is_primary,',
    '  retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at, disabled_at = null;',
    '',
  );
}

lines.push('commit;', '');

await writeFile(
  path.resolve('supabase/migrations/202608251600_complete_character_art.sql'),
  lines.join('\n'),
  'utf8',
);
