# MS-030 — Security, accessibility, and surface acceptance

**Depends on:** MS-028, MS-029

Run the RLS/security matrix, signed-out creation denial, auth loading/failure, session-loss/account-switch isolation, WCAG checks, keyboard and focus review, reduced-motion and forced-colors review, responsive/Dark Reader screenshots, browser-tab matrix, and installed-surface checks.

**Acceptance:** each claim is labeled verified, guidance, inference, or unknown with exact build/origin/browser/OS; the supplied square Uppercut Labs mark has no circular crop; final installed-icon acceptance remains open until the supplied MainStation artwork is physically tested.

## Status

**Closed 2026-09-19.** Acceptance evidence: `docs/releases/2026-09-19-surface-acceptance.md`.

Swept under the `surface-sweep` skill: 70 unique executed cases across 7 surfaces, 7 viewport
configurations, WCAG 2.2 AA, keyboard and focus, reduced motion, forced colors, 200% zoom, and
the Uppercut Labs mark. All 70 passed; every claim carries a verified / guidance / inference /
unknown label with its exact build, origin, browser, and OS.

Three product defects were found and fixed, each now covered by an assertion that fails on the
original behaviour:

- **UI-001** nineteen standalone controls sat 14–18px tall against the 44×44 minimum. The WCAG
  2.5.8 inline exception was checked per element before any code changed, and none qualified.
- **UI-002** the UI-001 fix misaligned the Mainline metadata row. Caught by inspecting a
  capture while the suite was green.
- **UI-003** the `Recommend` nav label sat under 1px from its cell rule at 1440.

The supplied square Uppercut Labs mark is verified uncropped: no border radius, clip path, or
mask, and no rounding on its parent.

## Remaining open by design

Installed surfaces, launcher icon rendering, and install prompts are unobserved on every
platform, so **final installed-icon acceptance stays open until the supplied MainStation
artwork is physically tested**, exactly as this ticket requires. WebKit is unknown for this
sweep because the container has no WebKit build, and Dark Reader is labelled guidance because
the shipped `darkreader-lock` markup is not a run of the extension. MS-031 owns the release
gate that closes the physical-device items.
