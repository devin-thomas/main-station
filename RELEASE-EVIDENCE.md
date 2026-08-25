# MainStation preview release evidence

Captured: `2026-08-25T15:45:46Z`

## Release identity

- Cloudflare origin: `https://mainstation-preview.uppercut-labs.workers.dev`
- Cloudflare Worker version: `e7673511-6a90-4e20-89d4-39379ba32645`
- Deployed application commit: `506dd2a29798b067f39f6788320184850d042057`
- Supabase project: `bqfzzrasfunysseoogcg`
- Figma design contract: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=19-3`
- Figma implementation capture: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=20-2`

## Hosted Supabase state

- Applied hosted migrations: `20260824224033 initial_mainstation`, `20260825133553 public_data_products`, `20260825133820 private_policy_helper`, `20260825134405 uni2_fankit_art`, `20260825140412 complete_uni2_catalog`, `20260825140943 complete_2xko_catalog`, `20260825141439 refine_2xko_schema`, and `20260825153339 complete_character_art`.
- Hosted catalog: 13 active Game Versions, 90 Character records, 2 complete verified catalogs, 90 active primary art records, 0 Characters without art, 0 Profiles, and 0 Lineups.
- Hosted art basis: 28 `express-fan-kit`, 4 `conditional-fan-kit`, 15 `conditional-community-policy`, and 43 `publisher-promotional` records. These labels document review disposition and do not turn attribution into permission.
- Discord OAuth completed a live callback and PKCE token exchange. Supabase returned the signed-in Discord identity; claiming a guest draft remains a separate explicit action.
- The hosted 2XKO Selection Schema contains ordered Point and Assist slots, six current Fuse values, and a disclosed conservative distinct-pick constraint.

## Controlled inputs

- Seed SHA-256: `9BA46CBD7026BEE0429505FF5419FA2CC49186A96EAF730C5A17FC9E7F5B3FC4`
- MainStation source logo SHA-256: `7BCACF1A848FC405483844588E0790DB64C6CD76E8BCC2326C00C1C63C55D732`
- Uppercut Labs logo SHA-256: `6DEFC8F4C479633529A6A73E284EA88A3D06A485D677AF42B44549AB6E4F412F`
- Sorted 28-file UNI2 art manifest SHA-256: `12BEA3D6517DF5396E9BC03A5D4F80F16A3B60F5DF671400751740C3D2855570`
- Sorted 88-file complete art manifest SHA-256: `150E065EF230FDE2137B671EE7AFF171EA868FDE16FA6D22D13493F677046A88`
- Initial schema migration SHA-256: `5583F606F4B37BC0ED407251761F2461BDC54CD130562B5EF6ABD32671F241EF`
- Public data-products migration SHA-256: `A9743F5943BC7DCB9712C72631B21AD7DE327FA4063F7E70E123494C01735D48`
- Private policy-helper migration SHA-256: `E638FC7F9BF5544F8C6E3059DC82675B5853E0B3A857FBFCF5285AE780F7B7F7`
- Initial UNI2 art migration SHA-256: `3C4196EBD141EBAFD31FFE99F198E581A9BE4557E9C3541D57DBED8871F4E991`
- Complete UNI2 catalog migration SHA-256: `511B26EBE557000D062B667373BC2D7915993CD12E4B66513DA2E55B0429EDF0`
- Complete 2XKO catalog migration SHA-256: `972B46C9C6E32FEC0A6ED8E509260D3333454F15E8EA78BB8B0AB5BC0A8347C9`
- Refined 2XKO schema migration SHA-256: `A714AAFB7343CCA686397791C1ACDB9B01708CBF0476F550A9F17BC558576406`
- Complete Character art migration SHA-256: `39E610B843D303DB13E2028B0CBEEF398E92B95050B758C6A01023BC22B01D28`
- Production JS: `index-BeMVoA7q.js` (`547288` bytes)
- Production CSS: `index-458cEPj2.css` (`34194` bytes)

## Validation completed

- Fresh local Supabase reset applies all eight local migrations and the generated seed successfully.
- pgTAP: `98/98` assertions pass.
- Supabase DB lint: no schema errors.
- Hosted catalog checks: 13 Game Versions, 90 Characters, 90 active primary art records, 0 missing art records, the expected four-basis distribution, 0 Profiles, and 0 Lineups.
- Frontend validation: ESLint, strict TypeScript, all 90 Character art hash checks, 12 Vitest checks, and the production PWA build pass.
- Local Playwright: `22/22` checks pass across desktop and mobile Chromium, including all 90 Character art references, representative Character pages for all 13 games, IndexedDB persistence, verified 2XKO team/Fuse validation, viewport bounds, a real product 404, and offline shell/draft behavior.
- PWA manifest audit: pass with zero errors and zero warnings. Static validation does not prove physical installed-surface behavior.
- PWA precache: 30 entries totaling `3042.26 KiB`; the 88 distinct full-resolution Character art files are deliberately fetched on demand rather than precached.
- Cloudflare deployment: 119 static files discovered, 64 new or modified assets uploaded, and Worker version `e7673511-6a90-4e20-89d4-39379ba32645` activated.
- Live Playwright: `22/22` checks pass against the public Worker across desktop and mobile Chromium, covering every published Character art reference and every game.
- Live HTTP boundary: HTML, manifest, service worker, product logo, favicon, and all published Character artwork return the expected content and image types; a missing JavaScript asset returns `404` with `no-store`.
- Visual review: Sol, Aang, Ahri, and Fox were inspected locally; Magik and Zuko were inspected live at `1440x1000` and `390x844`. Shared-art crops, long Riot credit text, cross-version notices, and provenance links remain legible without horizontal page overflow or console warnings.
- Dark-by-default authored colors, opaque surfaces, forced-colors handling, reduced-motion handling, and Dark Reader compatibility controls remain in the deployed build.

## Advisor disposition

- Supabase security-definer warnings are intentional for authenticated RPC boundaries that bind work to `auth.uid()`, validate bounded payloads, and expose no anonymous mutation grant. The policy helper is outside the exposed `public` schema. Rationale and official linter links are recorded in `supabase/README.md`.
- The leaked-password-protection warning is currently non-applicable because MainStation exposes Discord OAuth and email magic links, not password authentication. Protection becomes a release gate before any password sign-in is enabled.
- Fresh-database unused-index notices are expected before user traffic. The indexes protect foreign keys and public derived-query paths and remain until real query statistics support removal.

## Open acceptance gates

- Complete one explicit guest-draft claim, registered save, public read, sign-out, export, and account-deletion acceptance cycle. A live Discord sign-in is complete, but no Profile or Lineup was created or deleted without the user's explicit request.
- Test email magic-link sign-in if it remains a supported launch method; this would send a real email and was not triggered during implementation.
- Run install, update, standalone, and launcher-icon checks on physical Android, Windows, iOS/iPadOS, and macOS targets. Browser and static PWA checks do not prove installed-surface behavior.
- Run Dark Reader extension acceptance on each desktop browser where the extension is part of the support claim.
- Audit and promote the remaining 11 preview catalogs from bounded fixtures to complete source-checked rosters. Avatar remains save-locked until its fighter-specific support pool is represented conditionally rather than as an inaccurate global list.
- Re-review promotional-art policy and remove affected assets promptly if a publisher requests it or the app's operator, monetization, or distribution model changes. The four GGST fan-kit records remain conditional on noncommercial eligibility, and Riot's required 2XKO notice must remain visible.
- Replace the five explicitly labeled cross-version fallbacks when version-matched official art becomes available: UMVC3 Doctor Doom currently uses MVC2 art, and the four Melee entries use official Smash Ultimate renders.
- Choose a permanent custom domain after the generic Worker preview has enough usage evidence.
- The production build emits a non-blocking `>500 kB` chunk warning and the current PWA plugin emits an upstream `inlineDynamicImports` deprecation warning. Revisit code splitting and plugin configuration based on observed load/update data.
