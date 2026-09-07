# Copy and mobile icons release - 2026-09-04

Historical snapshot of the release identified below. ADR-028 subsequently removed guest creation and pre-auth draft decisions. The recorded guest workflow and its acceptance results describe this earlier deployment; they do not establish acceptance of the current authenticated editor.

Historical public deployment: https://mainstation-preview.uppercut-labs.workers.dev

Runtime commit: `08ac2a9` on `main`.
Cloudflare Worker version: `bdc12d7f-659c-402d-9799-589b32a11fed`.
Runtime assets: `index-CpUj2GY2.js`, `index-BYVzKR0z.css`.

## Interface review

Applied the no-useless-copy skill across the home, builder, account, profile, recommendation, game, character, callback, and missing-page surfaces.

| Surface | Removed or corrected | Preserved |
| --- | --- | --- |
| Home | Slogans, decorative section codes, implementation metrics, repeated method explanation | Main action, example profile, game discovery |
| Builder and profiles | Numbered labels, schema state, duplicate save messages, internal lifecycle wording | Character/Team rules, privacy, local versus online saving, Main/Secondary and Active/Retired choices |
| Games and characters | Roster grades, placeholder summaries, duplicate version labels and artwork review copy | Specific version scope, character identity, source links, publisher credits and cross-version notices |
| Recommendations | Policy names, hashes, raw scores, duplicated recovery text | Public-data scope, distinct player support, feedback, empty and failure states |
| Account and callbacks | Repeated headings, vague progress text, redundant retry instructions | Explicit merge/discard/cancel, email label, destructive consequences and safe errors |

The mobile header uses two rows. Shared Lucide icons support navigation, selected games, edit, move up/down, remove, settings, and dismiss. Ambiguous actions retain text. Icon-only controls keep accessible names and at least 44 x 44 CSS-pixel targets. The selected-game buttons retain native button semantics and loading headings retain heading semantics.

Eleven SVGs (3,652 bytes) were copied unchanged from `C:\dev\resources\icon-packs\lucide\icons`, checkout `b442632`. SHA-256 comparisons matched every source file. The original ISC/MIT license is included at `public/ui-icons/LICENSE`. No icon package dependency or unused icons were added. CSS masks use the authored text color and work under the existing strict content security policy.

## Validation

- `npm run validate`: ESLint, TypeScript, 26 unit tests, 90 artwork SHA-256 checks, and the production build pass.
- All 48 distinct local browser cases verified across desktop Chromium, iPhone 16 Pro WebKit, and Galaxy S21 Ultra Chromium. The long 13-game WebKit save flow passed after its timeout was raised from 30 to 60 seconds; no application change was needed.
- Mobile targets: iPhone 402 x 874 CSS pixels at DPR 3, native 1206 x 2622 / 460 ppi; Galaxy 384 x 854 CSS pixels at DPR 3.75, native 1440 x 3200 / 515 ppi. Physical density is recorded as hardware metadata, not a CSS width.
- Seven route layouts and populated draft screenshots reviewed under ignored `output/playwright/`. Checked horizontal overflow, icon names, 44-pixel controls, selection, editing, reorder/remove, privacy/status changes, guest reload persistence, and sign-in decisions.
- Public HTML serves the new JS/CSS. JS, CSS, manifest, service worker, and SVG responses have the expected MIME types. A nonexistent JS asset returns 404 with `no-store`. Security headers remain intact.
- Final public deployment: **48/48 Playwright cases pass** in 1.5 minutes using two workers. Each browser project checked all 90 artwork and 11 SVG URLs, all 13 game save flows, draft editing/reorder/remove and persistence, account recovery, seven route layouts, and PWA resources. Both phone screenshot sets were regenerated and visually reviewed from the public origin; icon glyphs render under its CSP.

## Acceptance limits

Windows Playwright WebKit cannot reload an offline service-worker page in this environment; the same internal error was reproduced with a minimal cache-only page, active controller, and verified cached HTML. The WebKit case verifies offline saving and persistence after reconnecting, and records an explicit limitation annotation. Chromium verifies offline reload. Physical iPhone Safari offline reload, device toolbars/safe areas, and installed-PWA behavior remain device-only checks. Browser emulation does not claim physical-device acceptance.

No emails were sent or registered profiles modified during this release's verification. Existing build warnings about bundle size and the PWA plugin's deprecated option remain unchanged.
