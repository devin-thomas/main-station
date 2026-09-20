import { createHash } from 'node:crypto';
import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';
import { characterArtThumbPath } from '../src/types/domain';

const publicRoot = path.resolve('public');

async function digestOf(assetPath: string, label: string): Promise<string> {
  const resolved = path.resolve(publicRoot, assetPath.replace(/^\/+/, ''));
  if (!resolved.startsWith(`${publicRoot}${path.sep}`)) {
    throw new Error(`${label} resolves outside public/.`);
  }
  return createHash('sha256').update(await readFile(resolved)).digest('hex');
}

function assertHash(actual: string, expected: string, label: string) {
  const wanted = expected.replace(/^sha256:/, '').toLowerCase();
  if (actual !== wanted) {
    throw new Error(`${label} hash mismatch: expected ${wanted}, received ${actual}.`);
  }
}

let verified = 0;
let missingArt = 0;

for (const game of catalog) {
  for (const character of game.characters) {
    const label = `${game.slug}/${character.slug}`;
    if (!character.art) {
      missingArt += 1;
      continue;
    }
    assertHash(await digestOf(character.art.localPath, label), character.art.assetHash, label);
    verified += 1;
    if (!character.art.thumbHash) continue;
    const thumbPath = characterArtThumbPath(character.art);
    if (thumbPath === character.art.localPath) {
      throw new Error(`${label} records a thumbnail hash but no distinct thumbnail path.`);
    }
    assertHash(await digestOf(thumbPath, `${label} thumbnail`), character.art.thumbHash, `${label} thumbnail`);
    verified += 1;
  }
}

if (verified === 0) throw new Error('No approved local Character art records were found.');
console.log(`Verified ${verified} Character art files against their recorded SHA-256 values.`);
console.log(missingArt === 0
  ? 'Every catalog Character has reviewed art.'
  : `${missingArt} Characters still use the typographic fallback.`);
