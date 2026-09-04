# MainStation

MainStation is an FGC main-history profile and cross-game Character recommendation PWA. The public identity is the product; recommendations are a transparent, profile-data-only payoff.

The current release is an implementation preview. Visitors can browse public profiles, Games, and Characters; sign-in is required before profile setup, selection, or editing. Unsaved edits belong to the signed-in account and server saves are explicit. It includes 13 saveable Selection Schema shapes, complete checked selection rosters for all 13 founding games, public profile/Game/Character statistics, audited profile-data-only recommendations and feedback, a generated typed Supabase client, and Cloudflare Workers Static Assets packaging. Character art provenance remains a separate 90-record review ledger; roster rows without approved art stay visibly text-only.

Guest creation, guest-draft import/merge/discard decisions, and guest recovery are outside scope. Old anonymous browser storage is not loaded into an account or deleted by the editor. Sign-out, session loss, and account switching remove the previous owner's editing state from view; public browsing remains available.

Current deployment and verification: [Sign-in-first release](docs/releases/2026-09-04-authenticated-creation.md).

## Local development

```powershell
npm install
Copy-Item .env.example .env.local
# Set VITE_SUPABASE_PUBLISHABLE_KEY in .env.local before running.
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

`validate` runs lint, strict TypeScript, unit/domain tests, and the production PWA build. The Playwright suite uses the production preview with desktop Chromium and these portrait mobile targets:

| Device / browser engine | CSS viewport | Device pixel ratio | Native display | Density |
| --- | --- | --- | --- | --- |
| iPhone 16 Pro / WebKit | 402 x 874 | 3 | 1206 x 2622 | 460 ppi |
| Galaxy S21 Ultra / Chromium | 384 x 854 | 3.75 | 1440 x 3200 | 515 ppi |

Native display specifications: [Apple](https://support.apple.com/en-ie/121031) and [Samsung](https://news.samsung.com/uk/samsung-galaxy-s21-ultra-5g-the-ultimate-smartphone-experience-designed-to-be-epic-in-every-way). CSS dimensions and scale are the configured emulation targets.

PPI describes the physical display; responsive layout uses CSS pixels. These full-screen emulations check navigation, accessible icon controls, touch targets, overflow, signed-out creation gates, and authenticated editing flows. Actual browser toolbars, display/zoom settings, the iPhone safe area, and installed-PWA behavior still require physical-device acceptance. Set `PLAYWRIGHT_BASE_URL` to test a deployed origin. Mobile screenshots are saved under ignored `output/playwright/`.

On Windows, Playwright WebKit reports an internal error when reloading offline, also reproduced with a minimal cache-only service worker after confirming its active controller and cached HTML. The suite records this limitation explicitly; physical Safari offline reload remains unverified. Offline mode never enables guest creation or queues account saves.

## Supabase

The hosted project is `bqfzzrasfunysseoogcg`. Its schema provides owner/public RLS, authenticated profile creation and save, public data-product RPCs, and the generated complete catalog seed. The catalog contains 13 game versions, 410 Character records, and 90 active primary art records. Discord OAuth completed its callback and PKCE token exchange successfully on 2026-08-25; that historical provider check does not by itself prove the current complete account workflow. Authentication now precedes all creation and editing, and callbacks never import or publish profile work.

For another checkout, copy `.env.example` to `.env.local` and set only the modern publishable key. Vite loads `.env.local` for development and production; `.env.production.local` is an optional production-only override. Without configuration, public browsing remains available and creation stays blocked. Regenerate `src/types/database.ts` after every hosted schema migration.

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

- UI controls use 11 selected Lucide SVGs (3,652 bytes) copied from the local icon library into `public/ui-icons/`, alongside their original ISC/MIT license. Only icons used by the interface are included.
- Uppercut Labs appears only as the developer credit, using the complete square `public/uppercut-labs-logo.png` unchanged and without circular cropping.
- The supplied MainStation mark is tracked canonically at `assets/brand/mainstation-logo.png` (SHA-256 `7BCACF1A848FC405483844588E0790DB64C6CD76E8BCC2326C00C1C63C55D732`). The original root-level drop remains ignored.
- `npm run generate:icons` derives the runtime mark, ordinary and maskable launcher icons, Apple touch icon, and favicon without redrawing the identity. Installed-surface visual acceptance remains open until physical-device testing.
- 90 of the 410 currently published Character rows have reviewed, localized artwork with an exact source, publisher, rights-review URL, visible credit, retrieval date, and verified SHA-256. The remaining roster rows use an explicit art-rights fallback until a reviewed asset is available. Full-resolution art remains outside the service-worker precache.
- The usage ledger distinguishes 28 UNI2 `express-fan-kit` files, 4 GGST `conditional-fan-kit` files, 15 2XKO `conditional-community-policy` portraits, and 43 `publisher-promotional` records accepted under ADR-023. Attribution is not represented as publisher permission.
- UMVC3 Doctor Doom and the four Melee entries visibly identify their cross-version fallback art. Aang, Korra, and Zuko share official Avatar key art with Character-specific focal positions because no standalone first-party cutouts were located.
- First-party asset and terms evidence is preserved in `research/character-art-audit-riot-modern.md`, `research/character-art-audit-arc-bamco.md`, and `research/character-art-audit-legacy.md`.

The authoritative product and data contracts are `Context.md`, `ADR.md`, and `SPEC.md`.
