import { writeFile } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';

function sql(value: string): string {
  return `'${value.replaceAll("'", "''")}'`;
}

const lines: string[] = [
  '-- Generated from src/data/catalog.ts. Preview rows remain visibly marked until each game audit closes.',
  'begin;',
  '',
];

catalog.forEach((game, index) => {
  lines.push(
    'insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)',
    `values (${sql(game.slug)}, ${sql(game.name)}, ${sql(game.shortName)}, ${sql(game.releaseLabel)}, ${index + 1}, ${sql(JSON.stringify(game.schema))}::jsonb, ${sql(game.sourceUrl)}, ${sql(game.catalogStatus === 'verified' ? 'verified' : 'preview')}, '2026-08-24T00:00:00Z')`,
    'on conflict (slug) do update set',
    '  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,',
    '  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,',
    '  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;',
    '',
  );

  game.characters.forEach((character, characterIndex) => {
    lines.push(
      'insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)',
      `select id, ${sql(character.slug)}, ${sql(character.name)}, ${sql(character.role)}, 'released', true, ${characterIndex + 1}, ${sql(character.summary)}, ${sql(character.sourceUrl)}, ${sql(new URL(character.sourceUrl).hostname)}, 'attributed-paraphrase', '2026-08-24T00:00:00Z'`,
      `from public.game_versions where slug = ${sql(game.slug)}`,
      'on conflict (game_version_id, slug, roster_role) do update set',
      '  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,',
      '  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,',
      '  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;',
      '',
    );

    if (character.art) {
      lines.push(
        'insert into public.character_art_assets (character_id, storage_path, source_url, source_publisher, license_url, asset_reuse_mode, credit_text, permission_evidence, asset_sha256, review_state, is_primary, retrieved_at, reviewed_at)',
        `select c.id, ${sql(character.art.localPath)}, ${sql(character.art.sourceUrl)}, 'Arc System Works', ${sql(character.art.licenseUrl)}, 'express-fan-kit', ${sql(character.art.creditText)}, 'Official fan-kit terms permit website use and unmodified redistribution with notice and official-site link.', ${sql(character.art.assetHash)}, 'approved', true, ${sql(character.art.reviewedAt)}, ${sql(character.art.reviewedAt)}`,
        'from public.characters c',
        'join public.game_versions gv on gv.id = c.game_version_id',
        `where gv.slug = ${sql(game.slug)} and c.slug = ${sql(character.slug)} and c.roster_role = ${sql(character.role)}`,
        'on conflict (asset_sha256) do update set',
        '  character_id = excluded.character_id, storage_path = excluded.storage_path, source_url = excluded.source_url,',
        '  source_publisher = excluded.source_publisher, license_url = excluded.license_url, asset_reuse_mode = excluded.asset_reuse_mode,',
        '  credit_text = excluded.credit_text, permission_evidence = excluded.permission_evidence,',
        '  is_primary = excluded.is_primary, retrieved_at = excluded.retrieved_at, reviewed_at = excluded.reviewed_at;',
        '',
      );
    }
  });
});

lines.push('commit;', '');
await writeFile(path.resolve('supabase/seed.sql'), lines.join('\n'), 'utf8');
