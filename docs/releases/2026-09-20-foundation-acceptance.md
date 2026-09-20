# MS-001–023 foundation acceptance — 2026-09-20

`tickets/README.md` requires every numbered ticket to record acceptance evidence before it is
closed. MS-024 through MS-031 did so as they were completed. MS-001 through MS-023 were built
and shipped before that practice started and had no evidence records, so the project
contradicted its own rule. This closes that gap.

## Read this as retrospective evidence

Every claim below was re-verified on 2026-09-20 against the shipped system — the committed
source, the migrated production database, the deployed origin, and the test suites. It is
**not** a reconstruction of what was observed when each ticket was originally finished, and it
does not claim those observations happened.

Two kinds of acceptance are distinguished throughout:

- **verified** — re-checked now, with the command, query, or suite named.
- **attested** — an editorial or source-research judgement made by the original author and
  recorded in the repository. The artefact exists and is cited; its factual accuracy against
  external sources was not independently re-audited here.

Labels follow MS-030: verified, guidance, inference, unknown.

## Shared gate evidence

```
npm run validate    # lint, typecheck, verify:art, 44 unit tests,
                    # lint:db, 140 pgTAP assertions, production build — PASS
npx playwright test # 109 specs, Chromium, local preview and deployed origin — PASS
```

Deployed origin `https://mainstation.uppercut-labs.workers.dev`; production Supabase project
`bqfzzrasfunysseoogcg` at migration head `202609200001`.

---

## MS-001 — TypeScript application foundation

**Acceptance:** clean install succeeds; lint, typecheck, tests, and production build pass;
Worker delegates SPA assets and applies security headers; no secret or personal identity is
present.

- **verified** — `npm ci` from the committed lockfile, then lint, typecheck, unit tests, and
  `vite build` all pass; these are the first four stages of `npm run validate`.
- **verified** — `worker/index.ts` delegates every body to the `ASSETS` binding and rewraps the
  response, adding CSP, `Permissions-Policy`, `Referrer-Policy`, `X-Content-Type-Options`, and
  `X-Frame-Options`. Confirmed live on every deployed route in
  `docs/releases/2026-09-19-public-release.md`.
- **verified** — the browser client reads only `VITE_SUPABASE_URL` and
  `VITE_SUPABASE_PUBLISHABLE_KEY` (`src/lib/supabase.ts`). No service-role key, secret key, or
  private key material appears anywhere in `src/`, `worker/`, or `index.html`.
- **verified** — no personal name or social handle appears in shipped source or markup;
  Uppercut Labs is the only developer credit, as SPEC 20 requires.

## MS-002 — Mainline Dossier visual system

**Acceptance:** desktop and mobile are intentionally recomposed; keyboard focus and 200% zoom
remain usable; no generic card-grid/dashboard shell; Dark Reader does not materially transform
the authored palette.

- **verified** — 49 geometry cases across 7 surfaces × 7 viewport configurations (320, 360,
  390, 768, 1024, 1440, landscape 844×390) show no document overflow beyond 1px and no
  header collision (`tests/e2e/surface-sweep.spec.ts`).
- **verified** — keyboard focus: the first 12 tab stops each expose a visible focus indicator,
  and primary navigation is reachable. 200% zoom: all seven surfaces survive a 640 CSS pixel
  layout viewport without two-dimensional scrolling.
- **verified** — reduced motion removes every transition and animation over 50ms while
  navigation still changes state; forced colors keeps heading, navigation, and primary action
  visible.
- **verified** — Dark Reader 4.9.132, run as a real unpacked extension against the deployed
  origin with a control page proving it was active: MainStation received zero injected style
  tags and kept `rgb(9,11,12)` / `rgb(242,238,223)`, its authored `--canvas` and `--text`
  exactly. Detail in `docs/releases/2026-09-19-public-release.md`.
- **verified** — the supplied Uppercut Labs mark computes `border-radius: 0px`,
  `clip-path: none`, `mask: none`, and a non-cropping `object-fit`, with no rounding on its
  parent.
- **attested** — "intentionally recomposed" and "no generic card-grid/dashboard shell" are
  design judgements. The anti-slop checklist in SPEC 19.4 is the project's own standard; the
  captures reviewed during MS-030 are consistent with it, but this is an editorial call rather
  than a measurement.

## MS-003 — Supabase schema, RLS, and RPC boundary

**Acceptance:** fresh migration succeeds; allow/deny tests cover anonymous, owner, cross-owner,
curator, and feedback isolation; private child Picks never leak; only the publishable browser
key is used by the client.

- **verified** — `supabase db reset` applies all 15 migrations to an empty database cleanly.
- **verified** — 140 pgTAP assertions across two files cover public reads, owner private reads,
  cross-owner denial, catalog write denial, feedback isolation, secure views and functions,
  signature fixtures, association support, and hide/delete propagation.
- **verified** — named assertions prove anonymous readers cannot see a private Lineup or its
  child Picks, another authenticated owner cannot see either, an unknown Lineup is
  indistinguishable from a private one, and the owner can read both.
- **verified** — client key boundary as recorded under MS-001.

## MS-004 — Versioned catalog contract

**Acceptance:** all 13 founding Games have a schema; solo, ordered Team, assist, fuse,
fighter/Kameo, and other required shapes have fixtures; every published summary/art row has
auditable provenance.

- **verified** — production holds exactly **13 Game Versions, every one with a Selection Schema
  marked `verified: true`**. Shape coverage spans 1-slot Character schemas and 2-, 3-, and
  4-slot Team schemas.
- **verified** — **410 Characters, and all 410 carry a summary** with
  `summary_source_url` and `summary_source_publisher`. **90 approved primary art records**, each
  with source, creator/publisher, usage basis, review state, and a disable path
  (`character_art_assets`).
- **verified** — `selection_schema_is_valid` plus the `lineups_require_complete_selection`
  constraint trigger reject partial and cross-version Teams; pgTAP proves duplicate Characters
  cannot complete a unique-Characters schema, invalid Team options cannot complete a Lineup,
  and an unverified schema cannot complete one.
- **attested** — that each schema matches the real game's rules is source research recorded in
  `research/`, not re-audited here.

## MS-005 — PWA shell and account editing storage

**Acceptance:** manifest/icon audit passes; first/return/offline/update flows are exercised;
local unsaved edits survive reload only for their confirmed authenticated owner; signed-out
offline use remains browse-only; registered mutations are never silently queued; browser use
remains complete without installation.

- **verified** — the `pwa-development` skill's manifest audit passes against build output with
  0 errors and 0 warnings; the release probe passes against the deployed origin.
- **verified** — fresh, returning, offline, waiting-update, deferral, one-reload adoption,
  two-tab, quota, and recovery paths are all exercised in `tests/e2e/pwa-lifecycle.spec.ts`.
  Full record in `docs/releases/2026-09-19-pwa-lifecycle-acceptance.md`.
- **verified** — account drafts live in the `mainstation-accounts` IndexedDB database keyed by
  authenticated user id; e2e proves a different account cannot see the previous account's
  draft, sign-out locks creation, and signing out in another tab closes the open editor.
- **verified** — offline, the cached shell stays browsable while creation stays locked, and
  `/recommend` states it needs a connection. No offline mutation queue exists; ADR-028 forbids
  one and account saves are blocked rather than deferred.
- **verified** — installation is feature-detected with written platform guidance, and every
  product task is reachable in an ordinary browser tab.

## MS-006–018 — Founding Game catalog tracks

**Acceptance:** the track validator passes; roster and schema are verified against primary or
specialist sources; summaries distinguish licensed reuse from attributed paraphrase; images
record source, creator/publisher, usage basis, review state, and takedown path.

- **verified** — per-Game counts on production:

  | Game | Noun | Slots | Characters | Summaries | Approved art |
  | --- | --- | --- | --- | --- | --- |
  | 2XKO | Team | 2 | 15 | 15 | 15 |
  | Marvel Tokon | Team | 4 | 20 | 20 | 6 |
  | MvC2 | Team | 3 | 56 | 56 | 4 |
  | UMVC3 | Team | 3 | 50 | 50 | 4 |
  | UNI2 | Character | 1 | 28 | 28 | 28 |
  | Avatar Legends | Character | 1 | 12 | 12 | 4 |
  | Melee | Character | 1 | 26 | 26 | 4 |
  | GGXX AC+R | Character | 1 | 25 | 25 | 4 |
  | Vampire Savior | Character | 1 | 15 | 15 | 4 |
  | SF6 | Character | 1 | 31 | 31 | 4 |
  | MK1 | Team | 2 | 56 | 56 | 5 |
  | Tekken 8 | Character | 1 | 42 | 42 | 4 |
  | GG Strive | Character | 1 | 34 | 34 | 4 |
  | **Total** | | | **410** | **410** | **90** |

- **verified** — `npm run verify:art` passes, and e2e proves every current art file and UI icon
  is served as an image, and that every founding game renders reviewed art and provenance on a
  Character page.
- **verified** — art usage bases remain distinguishable in the ledger: 28 express-fan-kit, 43
  publisher-promotional, 15 conditional-community-policy, 4 conditional-fan-kit, asserted in
  pgTAP.
- **attested** — roster completeness and schema accuracy against primary or specialist sources
  are recorded in `research/character-roster-completeness-2026-08-25.md` and the three art
  audits in `research/`. `RELEASE-EVIDENCE.md` already records an explicit limitation for
  Avatar Legends, whose fighter and support transcription retains a secondary-source boundary
  because no complete first-party text index is published. Those judgements stand as the
  original author recorded them and were not re-audited here.

## MS-019–023 — Authenticated builder and public identity

**Acceptance:** every selection shape validates; signed-out and loading-auth direct builder
visits expose no editable controls or anonymous storage writes; failed auth never starts an
editor; callbacks only confirm the session and return safely; local edits are isolated by
authenticated account; sign-out, session loss, and account switching hide prior-owner state;
legacy anonymous state is ignored without deletion; create/save are explicit, owner-only,
idempotent, and preserve unsaved work on failure; public/private and Active/Retired behavior is
consistent; art failure retains a complete typographic route; source and support details remain
adjacent to claims.

Each clause maps to a named executing test rather than a general claim:

| Acceptance clause | Evidence |
| --- | --- |
| Every selection shape validates | `signed-in member can select and save a valid roster entry for every founding game`; solo Character and 2XKO team-plus-Fuse cases |
| Signed-out direct builder exposes nothing editable | `signed-out visitors must sign in before opening the editor` |
| Failed auth never starts an editor | `a rejected sign-in code never opens the editor`; `account load failure keeps the creation controls unavailable` |
| Callbacks confirm and return safely | four `successful PKCE callback uses a safe destination` cases plus two cancelled-sign-in cases |
| Local edits isolated by account | `sign-out locks creation and a different account cannot see the previous account draft` |
| Session loss and account switching | `signing out in another tab immediately closes the open editor` |
| Legacy anonymous state ignored, not deleted | `legacy guest drafts and pending merges are never imported after sign-in` |
| Create/save explicit, owner-only, idempotent | `signed-in creation is local until the member explicitly creates a public profile`; `an existing member loads their saved profile and explicitly saves edits online` |
| Unsaved work preserved on failure | `serializes rapid edits and preserves the last committed state after storage failure` (unit); quota case in the lifecycle suite |
| Public/private and Active/Retired | `signed-in member can edit, hide, restore, retire, reorder, and remove saved entries`; pgTAP hide/delete propagation |
| Art failure retains a typographic route | `every founding game renders reviewed art and provenance on a Character page`; typographic fallback in `CharacterPage` |
| Source and support adjacent to claims | provenance block asserted in e2e; recommendation support counts and contributing Characters asserted in `tests/e2e/recommendations.spec.ts` |

- **verified** — all of the above execute in the 109-spec Playwright suite against both the
  local preview and the deployed origin.
- **note** — auth flows are exercised against a mocked Supabase origin, which is labelled
  **simulated evidence**. The live provider round trip is recorded separately:
  email sign-in end to end on 2026-09-19, Discord still needing a human login.

---

## What remains open

Unchanged from `tickets/MS-031-release.md`: Discord sign-in end to end, installed-surface brand
acceptance pending physical devices, and WebKit coverage. None is a code defect and none
belongs to MS-001–023.
