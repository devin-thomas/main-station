# MainStation preview release evidence

Captured: `2026-08-24T22:46:55Z`

## Release identity

- Cloudflare origin: `https://mainstation-preview.uppercut-labs.workers.dev`
- Cloudflare Worker version: `6d765928-d466-4645-8fd7-30dd54c518b6`
- Supabase project: `bqfzzrasfunysseoogcg`
- Supabase migration: `20260824224033_initial_mainstation`
- Figma design contract: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=19-3`
- Figma implementation capture: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=20-2`

## Controlled inputs

- Migration SHA-256: `5583F606F4B37BC0ED407251761F2461BDC54CD130562B5EF6ABD32671F241EF`
- Seed SHA-256: `D51553270821207E145A7FC235C329D5799708E9E0F0D092B7EB9EFD35F71F73`
- Uppercut Labs logo SHA-256: `6DEFC8F4C479633529A6A73E284EA88A3D06A485D677AF42B44549AB6E4F412F`
- UNI2 Hyde source asset SHA-256: `6DEB04B76669E9E05EA301E53DDAECB0A31D312C4B313C675BA41A2B3F5038E4`
- Production JS: `index-Cudwsd8t.js` (`504991` bytes)
- Production CSS: `index-UcVV5d0t.css` (`30678` bytes)

## Validation completed

- Fresh local Supabase reset applies migration and seed successfully.
- pgTAP: `86/86` assertions pass.
- Supabase DB lint: no schema errors.
- Independent revision-8 database replay: READY, including hosted-default ACL simulation, malformed payload rollback, concurrent request serialization, direct-completion checks, and anonymous privacy checks.
- Hosted data: 13 active Game Versions, 55 Character records, one approved art record, zero Profiles, zero Lineups, and zero invalid Selection Schemas.
- Hosted browser-role checks: anonymous table-control privileges `0`; authenticated table-control privileges `0`; anonymous claim/delete execution denied; authenticated claim execution granted.
- Hosted anonymous reads: 13 games, 55 Characters, one approved art record, and zero Profile/Mainline rows.
- Frontend validation: ESLint, strict TypeScript, 9 Vitest checks, and production PWA build pass.
- Live Playwright: `12/12` checks pass across desktop Chromium and Pixel 7, including IndexedDB persistence, route bounds, real product 404, and offline shell/draft behavior.
- PWA manifest audit: pass with zero errors and warnings.
- Deployed PWA HTTP probe: 8 resources, zero errors and warnings.
- HTTP boundary: HTML `200` with `must-revalidate`; hashed JS `200` with one-year immutable caching; missing JS `404` with `no-store`; CSP present.
- Visual review: desktop Home, mobile Settings, and mobile Builder inspected on the deployed origin. Account controls are visible and the mobile global action no longer covers Settings content.

## Advisor disposition

- Supabase security-definer warnings are intentional for the non-leaking publishability RLS helper and the authenticated claim/save/delete RPC boundaries. The rationale and official remediation links are recorded in `supabase/README.md`.
- Fresh-database unused-index notices are expected before user traffic. The indexes protect foreign keys and public derived-query paths and remain until real query statistics support removal.

## Open acceptance gates

- Set the Supabase Site URL and deployed callback allow-list, then configure Discord Client ID/Secret in the dashboard.
- Complete one real email and Discord sign-in, guest claim, registered save, public read, sign-out, and deletion acceptance cycle. No external email was sent during this release.
- Supply the final MainStation logo and replace the provisional `MS` launcher assets.
- Run install/update/standalone checks on physical target devices. Static PWA checks and browser offline tests do not prove installed-surface behavior.
- Run Dark Reader extension acceptance where the extension exists. The release has dark defaults, a Dark Reader lock, explicit opaque surfaces, forced-colors handling, and reduced-motion handling, but physical extension coverage remains separate.
- Continue the bounded 24-hour official-source catalog diff with human review. The 55 Character records are preview fixtures; only the unchanged UNI2 fan-kit asset currently has an approved reuse basis.
- The production bundle emits a non-blocking `>500 kB` chunk warning and the current PWA plugin emits an upstream `inlineDynamicImports` deprecation warning. Revisit code splitting and plugin configuration after usage data, without changing launch behavior preemptively.
