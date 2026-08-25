# MainStation

MainStation is an FGC main-history profile and cross-game Character recommendation PWA. The public identity is the product; recommendations are a transparent, profile-data-only payoff.

The current release is an implementation preview. It includes a complete local guest-draft workflow, explicit account claim/sync, 12 saveable Selection Schema shapes, review locks for unresolved game options, public profile/Game/Character statistics, audited profile-data-only recommendations and feedback, a generated typed Supabase client, and Cloudflare Workers Static Assets packaging. The 2XKO and UNI2 catalogs are complete and source-checked; the other 11 remain clearly marked preview catalogs.

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

The hosted project `bqfzzrasfunysseoogcg` has the source schema, public data-product RPCs, private policy helper, and verified 2XKO/UNI2 catalog migrations applied. It currently contains 13 game versions, 90 Character records, two verified complete catalogs, 28 approved UNI2 art records, one live-accepted Discord identity, and no registered public profile. Discord OAuth completed its callback and PKCE token exchange successfully on 2026-08-25; claiming or syncing a guest draft remains a separate explicit action.

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
- All 28 playable UNI2 Characters use their corresponding `express-fan-kit` image. Each official file is stored unchanged with its SHA-256, required notice, exact source, and official terms link; the five nonroster fan-kit images are intentionally excluded.
- Public publisher imagery without an express app-reuse basis remains in the intentional typographic fallback state.

The authoritative product and data contracts are `Context.md`, `ADR.md`, and `SPEC.md`.
