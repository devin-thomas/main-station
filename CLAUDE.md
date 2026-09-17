# main-station

FGC (Fighting Game Community) cross-game character recommendation PWA.
React + TypeScript + Vite, Supabase backend, Cloudflare Workers.

## Branch naming

Use plain kebab-case with no prefix: `add-character-filters`, `fix-auth-redirect`, `update-art`.
Append `-2`, `-3` if a second branch for the same topic is needed.
No `claude/`, `feat/`, `dev/` or other prefixes.

## Shared assets

Character art and data are maintained in the `fgc-assets` submodule at `shared/fgc-assets/`.
Run `git submodule update --init` after cloning.
Add new art to the submodule repo, not directly to `public/art/`.

## Key data files

- `src/data/catalog.ts` — 410 character records across 13 game versions
- `src/data/promotionalArt.ts` — SHA-256 provenance ledger for all character art
- `src/data/characterSummaries/` — character description files
