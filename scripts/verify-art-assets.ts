import { createHash } from 'node:crypto';
import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { catalog } from '../src/data/catalog';

const publicRoot = path.resolve('public');
let verified = 0;

for (const game of catalog) {
  for (const character of game.characters) {
    if (!character.art) continue;
    const assetPath = path.resolve(publicRoot, character.art.localPath.replace(/^\/+/, ''));
    if (!assetPath.startsWith(`${publicRoot}${path.sep}`)) {
      throw new Error(`${game.slug}/${character.slug} art resolves outside public/.`);
    }
    const digest = createHash('sha256').update(await readFile(assetPath)).digest('hex');
    const expected = character.art.assetHash.replace(/^sha256:/, '').toLowerCase();
    if (digest !== expected) {
      throw new Error(`${game.slug}/${character.slug} art hash mismatch: expected ${expected}, received ${digest}.`);
    }
    verified += 1;
  }
}

if (verified === 0) throw new Error('No approved local Character art records were found.');
console.log(`Verified ${verified} Character art assets against their recorded SHA-256 values.`);
