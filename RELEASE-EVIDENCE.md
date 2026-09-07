# MainStation historical release evidence

Current release: [2026-09-04 authenticated creation](docs/releases/2026-09-04-authenticated-creation.md).

Historical snapshot of the release identified below. Guest-draft flows and their acceptance results were superseded by ADR-028 on 2026-09-04; they are retained as evidence of that earlier build, not current product requirements or verification. See `docs/releases/` for later release records.

Captured: `2026-08-25T16:28:20Z`

## Release identity

- Historical Cloudflare origin: `https://mainstation-preview.uppercut-labs.workers.dev`
- Cloudflare Worker version: `d5d186c3-c4c7-4f69-9561-60b2fb541843`
- Deployed application commit: `60882b084613e9d973643c444d0671a914a0e226`
- Supabase project: `bqfzzrasfunysseoogcg`
- Figma design contract: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=19-3`
- Figma implementation capture: `https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=20-2`

## Hosted Supabase state

- Applied hosted migrations: the original eight release migrations, `20260825162444 expand_selection_option_limit`, and 13 game-scoped complete-roster data migrations covering all founding games.
- Hosted catalog: 13 active Game Versions, 410 Character records, 90 active primary art records, 320 Characters without reviewed art, 0 Profiles, and 0 Lineups.
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
- Selection option-limit migration SHA-256: `C1813CEC43C6B63B9397CCF23F3396DAEC555693969D4FA8B8757DB1F7A4751D`
- Complete roster migration SHA-256: `263B6E4B174E50D9C55C70438F6F8F4080025B9AF80F9BE616E50D1314D060A2`
- Production JS: `index-I8xM8EzB.js` (`551475` bytes)
- Production CSS: `index-458cEPj2.css` (`34194` bytes)

## Validation completed

- Fresh local Supabase reset applies all eight local migrations and the generated seed successfully.
- pgTAP: `98/98` assertions pass.
- Supabase DB lint: no schema errors.
- Hosted catalog checks: 13 Game Versions, 410 Characters, 90 active primary art records, 320 explicit art fallbacks, the expected four-basis distribution, 0 Profiles, and 0 Lineups.
- Frontend validation: ESLint, strict TypeScript, all 90 Character art hash checks, 13 Vitest checks, and the production PWA build pass.
- Local Playwright: `24/24` checks pass across desktop and mobile Chromium, including all 90 Character art references, representative Character pages for all 13 games, a save flow through every complete roster, IndexedDB persistence, verified 2XKO team/Fuse validation, viewport bounds, a real product 404, and offline shell/draft behavior.
- PWA manifest audit: pass with zero errors and zero warnings. Static validation does not prove physical installed-surface behavior.
- PWA precache: 30 entries totaling `3042.26 KiB`; the 88 distinct full-resolution Character art files are deliberately fetched on demand rather than precached.
- Cloudflare deployment: 119 static files discovered, 3 new or modified assets uploaded, and Worker version `d5d186c3-c4c7-4f69-9561-60b2fb541843` activated.
- Live Playwright: `24/24` checks pass against the public Worker across desktop and mobile Chromium, covering every published Character art reference, all 13 game pages, and a save flow through every game.
- Live HTTP boundary: HTML, manifest, service worker, product logo, favicon, and all published Character artwork return the expected content and image types; a missing JavaScript asset returns `404` with `no-store`.
- Visual review: the live Build page was inspected at `1440x1000` and the Avatar roster page at Pixel 7 dimensions. The expanded roster remains legible, verified catalog state is visible, artless rows use the explicit fallback, and the existing shared-art crops, long Riot credit text, cross-version notices, and provenance links remain legible without horizontal page overflow or console warnings.
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
- Review and source approved art for the 320 expanded roster rows that currently use the explicit text-only art fallback; roster selection is complete independently of that rights ledger.
- Avatar's 12 launch fighters and 36 support choices are represented conditionally in the UI; the fighter names and support transcription retain the secondary-source boundary documented in `research/character-roster-completeness-2026-08-25.md` because the accessible first-party pages do not publish a complete text index.
- Re-review promotional-art policy and remove affected assets promptly if a publisher requests it or the app's operator, monetization, or distribution model changes. The four GGST fan-kit records remain conditional on noncommercial eligibility, and Riot's required 2XKO notice must remain visible.
- Replace the five explicitly labeled cross-version fallbacks when version-matched official art becomes available: UMVC3 Doctor Doom currently uses MVC2 art, and the four Melee entries use official Smash Ultimate renders.
- Choose a permanent custom domain after the generic Worker origin has enough usage evidence.
- The production build emits a non-blocking `>500 kB` chunk warning and the current PWA plugin emits an upstream `inlineDynamicImports` deprecation warning. Revisit code splitting and plugin configuration based on observed load/update data.
