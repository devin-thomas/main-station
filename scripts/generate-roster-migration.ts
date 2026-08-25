import { writeFile } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';

function sql(value: string): string {
  return `'${value.replaceAll("'", "''")}'`;
}

const lines: string[] = [
  '-- Generated from src/data/catalog.ts. Roster completeness is separate from art rights review.',
  'begin;',
  '',
];

catalog.forEach((game, index) => {
  const gameSourceCheckedAt = game.sourceCheckedAt ?? '2026-08-24';

  lines.push(
    'insert into public.game_versions (slug, name, short_name, release_label, launch_order, selection_schema, catalog_source_url, catalog_status, source_checked_at)',
    `values (${sql(game.slug)}, ${sql(game.name)}, ${sql(game.shortName)}, ${sql(game.releaseLabel)}, ${index + 1}, ${sql(JSON.stringify(game.schema))}::jsonb, ${sql(game.sourceUrl)}, ${sql(game.catalogStatus === 'verified' ? 'verified' : 'preview')}, ${sql(`${gameSourceCheckedAt}T00:00:00Z`)})`,
    'on conflict (slug) do update set',
    '  name = excluded.name, short_name = excluded.short_name, release_label = excluded.release_label,',
    '  launch_order = excluded.launch_order, selection_schema = excluded.selection_schema,',
    '  catalog_source_url = excluded.catalog_source_url, catalog_status = excluded.catalog_status, source_checked_at = excluded.source_checked_at;',
    '',
  );

  game.characters.forEach((character, characterIndex) => {
    const characterSourceCheckedAt = character.sourceCheckedAt ?? gameSourceCheckedAt;
    const characterSourcePublisher = character.sourcePublisher ?? new URL(character.sourceUrl).hostname;

    lines.push(
      'insert into public.characters (game_version_id, slug, display_name, roster_role, roster_status, is_playable, roster_order, summary, summary_source_url, summary_source_publisher, summary_reuse_mode, source_checked_at)',
      `select id, ${sql(character.slug)}, ${sql(character.name)}, ${sql(character.role)}, 'released', true, ${characterIndex + 1}, ${sql(character.summary)}, ${sql(character.sourceUrl)}, ${sql(characterSourcePublisher)}, 'attributed-paraphrase', ${sql(`${characterSourceCheckedAt}T00:00:00Z`)}`,
      `from public.game_versions where slug = ${sql(game.slug)}`,
      'on conflict (game_version_id, slug, roster_role) do update set',
      '  display_name = excluded.display_name, roster_status = excluded.roster_status, is_playable = excluded.is_playable,',
      '  roster_order = excluded.roster_order, summary = excluded.summary, summary_source_url = excluded.summary_source_url,',
      '  summary_source_publisher = excluded.summary_source_publisher, summary_reuse_mode = excluded.summary_reuse_mode, source_checked_at = excluded.source_checked_at;',
      '',
    );
  });
});

lines.push('commit;', '');

await writeFile(
  path.resolve('supabase/migrations/202608251700_complete_character_rosters.sql'),
  lines.join('\n'),
  'utf8',
);
