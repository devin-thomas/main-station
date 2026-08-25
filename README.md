# MainStation

MainStation is an FGC main-history profile and cross-game Character recommendation PWA. The public identity is the product; recommendations are a transparent, profile-data-only payoff.

The current release is an implementation preview. It includes a complete local guest-draft workflow, an explicit pre-sign-in merge/discard/cancel decision, 13 saveable Selection Schema shapes, complete checked selection rosters for all 13 founding games, public profile/Game/Character statistics, audited profile-data-only recommendations and feedback, a generated typed Supabase client, and Cloudflare Workers Static Assets packaging. Character art provenance remains a separate 90-record review ledger; roster rows without approved art stay visibly text-only.

## Local development

```powershell
npm install
npm run dev
```

Open `http://127.0.0.1:4173`.

## Validation

```powershell
npm run validate
npm run test:e2e
npm run test:db
npm run lint:db
node C:\Users\lilgo\.codex\skills\pwa-development\scripts\audit-manifest.mjs --manifest dist\manifest.webmanifest --root dist
```

`validate` runs lint, strict TypeScript, unit/domain tests, and the production PWA build. The Playwright suite uses the production preview at desktop Chromium and Pixel 7 dimensions.

## Supabase

The hosted project `bqfzzrasfunysseoogcg` has the source schema, public data-product RPCs, private policy helper, and the generated complete catalog seed. It currently contains 13 game versions, 410 Character records, 90 active primary art records, one live-accepted Discord identity, and no registered public profile. Discord OAuth completed its callback and PKCE token exchange successfully on 2026-08-25; guest-draft ownership is decided explicitly before sign-in, then claimed or merged only after the session is confirmed.

For another checkout, copy `.env.example` to `.env.production.local` and set only the modern publishable key. This working copy already has that ignored browser configuration. Regenerate `src/types/database.ts` after every hosted schema migration.

```powershell
npx supabase start
npx supabase db reset --local
npm run test:db
npm run lint:db
npx supabase stop
```

Never place the Discord Client Secret, service-role key, or access token in a `VITE_` variable. Hosted schema instructions and the callback contract are in `supabase/README.md`.

## Cloudflare

```powershell
npm run build
npx wrangler deploy
```

The Worker applies CSP and related security headers, delegates static bodies to the assets binding, and uses SPA not-found handling. A generic `workers.dev` origin is expected until a domain is selected.

Preview origin: `https://mainstation-preview.uppercut-labs.workers.dev`.

## Identity and imagery

- Uppercut Labs appears only as the developer credit, using `public/uppercut-labs-logo.png` unchanged.
- The supplied MainStation mark is tracked canonically at `assets/brand/mainstation-logo.png` (SHA-256 `7BCACF1A848FC405483844588E0790DB64C6CD76E8BCC2326C00C1C63C55D732`). The original root-level drop remains ignored.
- `npm run generate:icons` derives the runtime mark, ordinary and maskable launcher icons, Apple touch icon, and favicon without redrawing the identity. Installed-surface visual acceptance remains open until physical-device testing.
- 90 of the 410 currently published Character rows have reviewed, localized artwork with an exact source, publisher, rights-review URL, visible credit, retrieval date, and verified SHA-256. The remaining roster rows use an explicit art-rights fallback until a reviewed asset is available. Full-resolution art remains outside the service-worker precache.
- The usage ledger distinguishes 28 UNI2 `express-fan-kit` files, 4 GGST `conditional-fan-kit` files, 15 2XKO `conditional-community-policy` portraits, and 43 `publisher-promotional` records accepted under ADR-023. Attribution is not represented as publisher permission.
- UMVC3 Doctor Doom and the four Melee entries visibly identify their cross-version fallback art. Aang, Korra, and Zuko share official Avatar key art with Character-specific focal positions because no standalone first-party cutouts were located.
- First-party asset and terms evidence is preserved in `research/character-art-audit-riot-modern.md`, `research/character-art-audit-arc-bamco.md`, and `research/character-art-audit-legacy.md`.

The authoritative product and data contracts are `Context.md`, `ADR.md`, and `SPEC.md`.
