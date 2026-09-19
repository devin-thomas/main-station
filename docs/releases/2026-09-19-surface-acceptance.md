# MS-030 security, accessibility, and surface acceptance — 2026-09-19

Acceptance evidence for the security, accessibility, and surface ticket, recorded as
required by `tickets/README.md`. Produced by running the `surface-sweep` skill
(`devin-thomas/skills`, `surface-sweep/SKILL.md`) over the deployed product.

Every claim below carries one label, as MS-030 requires:

- **verified** — a named build, origin, browser, and OS produced the observation.
- **guidance** — implemented to a documented rule, not observed on the claimed surface.
- **inference** — reasoned from adjacent evidence, not directly observed.
- **unknown** — not observed; no claim is made.

## Execution contract

| Field | Value |
| --- | --- |
| Revision | `main` at the commit carrying this document, clean tree |
| Local origin | `http://127.0.0.1:4173` (`vite preview`, production build) |
| Deployed origin | `https://mainstation.uppercut-labs.workers.dev`, Worker version `e8b16983-c179-4235-80a4-eda44fb1cfef` |
| Browser | Chromium 141.0.7390.37 via Playwright 1.62.1 |
| OS | Linux 6.18 x86_64 (cloud session container) |
| Fixtures | `tests/e2e/auth-fixture.ts`; Supabase origin routed and mocked — **simulated**, not provider integration |
| Accessibility engine | `@axe-core/playwright` 4.13.0, tags `wcag2a wcag2aa wcag21a wcag21aa wcag22aa` |
| Probes | `tests/e2e/surface-probes.ts`, adapted from the skill's `browser-probes.mjs` |

External-action boundary: this sweep deployed the app (already-authorized release path) and
made no other outbound change.

## Coverage matrix

Case IDs are stable and live in `tests/e2e/surface-sweep.spec.ts`. Screenshot filenames are
not identity.

| Family | Cases | Axes | Disposition |
| --- | --- | --- | --- |
| `geo-<surface>-<width>` | 49 | 7 surfaces × 320/360/390/768/1024/1440/landscape-844×390 | all passed |
| `a11y-<surface>-w<width>` | 14 | 7 surfaces × 390/1440, axe WCAG 2.2 AA | all passed |
| touch targets | 1 | 7 surfaces at 390 | passed after fixes |
| keyboard and focus | 1 | 1440, 12 tab stops | passed |
| reduced motion | 1 | `prefers-reduced-motion: reduce` | passed |
| forced colors | 1 | `forced-colors: active` | passed |
| 200% zoom | 1 | 640×512 layout viewport, 7 surfaces | passed |
| Uppercut Labs mark | 1 | 1440 | passed |
| signed-in builder | 1 | 390, geometry + targets + axe | passed after fixes |

Surfaces: home, game, character, public profile, recommend, settings, 404. **70 unique
executed cases, 70 passed, 0 failed, 0 blocked.** Retries are not counted.

Excluded with reason: `/auth/callback` is covered by the existing smoke suite's four
callback cases and has no independent layout; the signed-in recommendation result surface
is covered by `tests/e2e/recommendations.spec.ts`, which asserts its content rather than
its geometry.

## Findings

Three product defects, all found by the sweep, all fixed and covered by an assertion that
fails on the original behaviour.

**UI-001 — undersized touch targets (serious).** Nineteen standalone controls rendered
14–18 CSS pixels tall at 390, against the 44×44 minimum in SPEC 16: the skip link, Mainline
Game links, the character route link, provenance and source links, and the empty-state
"Add a character or team" call to action on the builder. Diagnosed before changing code:
every one computed to `display: block` with no sibling text, so the WCAG 2.2 SC 2.5.8
inline exception did not cover any of them. Root cause was the typographic scale setting
the target height. Fixed in shared styles, growing the target rather than the text, with
the minimum applied at ≤768px plus the always-visible skip link. `undersizedTargets` now
encodes the inline exception explicitly — inline display **and** sibling text — so the one
genuinely inline link ("Sign in to get recommendations.") is exempt on its merits rather
than by a relaxed threshold.

**UI-002 — Mainline metadata misalignment, introduced by the UI-001 fix (moderate).**
Caught by inspecting a capture, not by an assertion: with the Game link at 44px and
`.mainline__meta` defaulting to `align-items: stretch`, the link's text centred in its box
while the sibling `MAIN ACTIVE` chips sat at the top, so they no longer read as one line.
Fixed by centring the row. `.provenance-block__links` had the same latent default and was
centred with it. This is why the skill inspects images rather than trusting a green run.

**UI-003 — nav label flush against its cell rule (minor).** At 1440 the `Recommend` label
measured 102px of text in a 103px cell, leaving under 1px beside the divider. Measured
rather than eyeballed: no clipping and zero scroll overflow at any width, so this was
cramping, not breakage. Gutters were added only at ≥768px, because at 320 the same padding
would push the nav into horizontal scrolling — the worse outcome.

No harness defects required a fix. No finding remains open.

## Claims

### Security — verified

The RLS and policy matrix runs as 136 pgTAP assertions across two files
(`npm run test:db`, PASS), covering public reads, owner private reads, cross-owner denial,
catalog write denial, feedback isolation, secure views and functions, and hide/delete
propagation. Signed-out creation denial, authentication loading and failure, session loss,
and account switching are covered by `tests/e2e/smoke.spec.ts` against both origins.
Supabase responses are mocked in those cases, so the UI boundary is **verified** and
provider integration is **not** claimed here.

### Accessibility — verified, with a stated automated-scan boundary

Zero axe violations at WCAG 2.2 AA across 14 surface/width combinations and the signed-in
builder. Keyboard: the first 12 tab stops on home each expose a visible focus indicator
(outline or ring) and primary navigation is reachable. Touch targets meet 44×44 after
UI-001. Reduced motion removes every transition and animation over 50 ms while navigation
still changes state. Forced colors keeps the heading, games navigation, and primary action
visible with no overflow. Text survives a 640 CSS pixel layout viewport (200% of 1280) on
all seven surfaces without two-dimensional scrolling.

An automated engine cannot establish reading order sense, alt-text quality, or screen-reader
output. Those remain **unknown**: no assistive technology was run.

### Responsive — verified

No document overflow beyond 1px, and no wordmark/header-actions collision, on 7 surfaces ×
7 viewport configurations including landscape 844×390 and the 320 narrow edge.

### Uppercut Labs mark — verified

The supplied square mark computes `border-radius: 0px`, `clip-path: none`, `mask: none`, a
non-cropping `object-fit`, and a parent with no rounding. It appears only beside the
"Developed by Uppercut Labs" credit and is never used as the app icon. The existing smoke
suite independently asserts its `border-radius`.

### Dark Reader — guidance at the time of this sweep; since verified

`index.html` ships `<meta name="darkreader-lock" />` and `color-scheme: dark`, confirmed in
the deployed HTML. Per the skill's browser-checks reference, a theme-lock meta tag proves
markup only; extension API injection and a real extension run are different evidence. The
extension was not run during this sweep.

**Superseded 2026-09-19 by MS-031**, which ran Dark Reader 4.9.132 as a real unpacked
extension against the deployed origin, with a control page proving the extension was active.
MainStation received zero injected style tags and kept its authored colour tokens exactly.
See `docs/releases/2026-09-19-public-release.md`.

### Browser-tab matrix — partly verified

Verified on Chromium 141 only, local and deployed. The project matrix also names
iPhone 16 Pro / WebKit and Galaxy S21 Ultra / Chromium; the container has no WebKit build,
so WebKit is **unknown** for this sweep. The mobile viewports are exercised as Chromium
emulation, which is emulation and not Safari.

### Installed surfaces — unknown

No installed surface, launcher icon rendering, or install prompt was observed on any
platform. Per SPEC 15.4 the in-product installation guidance is guidance, not evidence.
**Final installed-icon acceptance remains open until the supplied MainStation artwork is
physically tested on a device.** MS-031 owns that gate.

## Commands and results

```
npm run validate         # lint, typecheck, verify:art, 38 unit tests, lint:db,
                         # 136 pgTAP assertions, build - PASS
npx playwright test      # 109 specs, Chromium, local preview - PASS
PLAYWRIGHT_BASE_URL=https://mainstation.uppercut-labs.workers.dev \
  npx playwright test    # 109 specs against the deployed origin - PASS
npm run deploy           # Worker version e8b16983-c179-4235-80a4-eda44fb1cfef
```

Captures for UI-002 were written to an ignored run directory outside the repository and
inspected at full resolution; the corrected state is held by the assertions above rather
than by a committed screenshot baseline.
