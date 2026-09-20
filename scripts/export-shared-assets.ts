// Mirrors the delivered Character art and its provenance into the shared fgc-assets repository,
// so every repo in the Uppercut Labs FGC ecosystem draws on the same reviewed set.
//
//   FGC_ASSETS_DIR=../fgc-assets npx tsx scripts/export-shared-assets.ts
//
import { mkdir, writeFile, copyFile, rm } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';
import { characterArtThumbPath } from '../src/types/domain';

const PUBLIC = path.resolve('public');
const ASSETS = process.env.FGC_ASSETS_DIR ?? path.resolve('..', 'fgc-assets');
const DELIVERED = path.join(ASSETS, 'delivered');

await rm(DELIVERED, { recursive: true, force: true });

interface Entry {
  game: string;
  character: string;
  name: string;
  role: string;
  delivered: { full: string; thumb: string };
  source: {
    url: string;
    publisher: string;
    reviewUrl: string;
    usageBasis: string;
    creditText: string;
    permissionEvidence: string;
  };
  sha256: { full: string; thumb: string };
  reviewedAt: string;
}

const entries: Entry[] = [];
const uncovered: string[] = [];

for (const game of catalog) {
  for (const character of game.characters) {
    if (!character.art) {
      uncovered.push(`${game.slug}/${character.slug}`);
      continue;
    }
    const art = character.art;
    const file = path.basename(art.localPath);
    const fullOut = path.join(DELIVERED, game.slug, `${character.slug}.webp`);
    const thumbOut = path.join(DELIVERED, game.slug, 'thumb', `${character.slug}.webp`);
    await mkdir(path.dirname(fullOut), { recursive: true });
    await mkdir(path.dirname(thumbOut), { recursive: true });
    await copyFile(path.join(PUBLIC, 'art', file), fullOut);
    await copyFile(path.join(PUBLIC, characterArtThumbPath(art).replace(/^\//, '')), thumbOut);
    entries.push({
      game: game.slug,
      character: character.slug,
      name: character.name,
      role: character.role,
      delivered: {
        full: `delivered/${game.slug}/${character.slug}.webp`,
        thumb: `delivered/${game.slug}/thumb/${character.slug}.webp`,
      },
      source: {
        url: art.sourceUrl,
        publisher: art.sourcePublisher,
        reviewUrl: art.reviewUrl,
        usageBasis: art.usageBasis,
        creditText: art.creditText,
        permissionEvidence: art.permissionEvidence,
      },
      sha256: {
        full: art.assetHash.replace(/^sha256:/, ''),
        thumb: (art.thumbHash ?? '').replace(/^sha256:/, ''),
      },
      reviewedAt: art.reviewedAt,
    });
  }
}

const coverage = catalog.map((game) => ({
  game: game.slug,
  name: game.name,
  characters: game.characters.length,
  delivered: game.characters.filter((character) => character.art).length,
}));

await writeFile(path.join(ASSETS, 'data', 'provenance.json'), `${JSON.stringify({
  generatedAt: '2026-09-20',
  generatedBy: 'main-station scripts/export-shared-assets.ts',
  note: 'Delivered files are WebP re-encodes of the publisher source named in each record. The source URL identifies the original asset; the hashes cover the delivered files in this repository.',
  coverage,
  uncovered,
  characters: entries,
}, null, 2)}\n`, 'utf8');

console.log(`delivered ${entries.length} characters across ${coverage.length} games; ${uncovered.length} uncovered`);
