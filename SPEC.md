# MainStation Implementation Specification

**Status:** Build-ready  
**Version:** 0.1  
**Date:** 2026-08-24  
**Context:** [Context.md](Context.md)  
**Decisions:** [ADR.md](ADR.md)  
**Visual discovery:** [MainStation Discovery v0.1](https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=3-2)
**Implemented visual contract:** [Mainline Dossier tokens and behavior](https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=19-3)  
**Implementation capture:** [MainStation production home capture](https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=20-2)

## 1. Objective

Build a free, FGC-native public main-history profile and cross-game Character recommendation PWA. A player records complete, game-valid Main and Secondary Characters or Teams across the 13 founding Game Versions. Their eligible public history becomes a shareable profile and contributes one normalized unit per Game to a transparent, profile-data-only recommendation model.

The public profile is the primary product. Recommendations are a payoff of that identity, not a replacement for it.

## 2. Authority and scope

Implementation resolves conflicts in this order:

1. Current explicit user decisions.
2. `Context.md` terminology and product rules.
3. Accepted ADRs in `ADR.md`.
4. This specification.
5. Ticket acceptance criteria.
6. Implementation details.

`Ideas.md` is explicitly out of scope unless promoted by a later user decision.

### 2.1 Launch scope

- Guest profile draft stored locally without an account.
- Discord and email authentication through Supabase Auth.
- Let a guest explicitly merge a valid local draft into a registered public Player Profile, discard it after sign-in, or cancel before authentication.
- Public and owner profile views.
- Create, edit, hide, restore, retire, reactivate, reorder, and delete complete Characters or Teams.
- Version-aware Selection Schema validation for all 13 founding Game Versions.
- Public Game and Character routes for the complete seeded launch catalog.
- Character usage statistics and public-profile links.
- Profile-derived Character recommendations with visible support.
- Analytics-only recommendation feedback.
- Account export and account deletion.
- Installable dark PWA, durable guest draft, offline shell, explicit update prompt, and browser-tab fallback.
- Cloudflare Workers Static Assets deployment backed by Supabase Postgres/Auth.

### 2.2 Non-goals

- Founder-authored or LLM-authored recommendation mappings.
- Free-text explanation scoring.
- A generic personality quiz.
- Entire-game recommendations.
- Team-composition recommendations.
- Comments, follows, direct messages, reputation, or editorial review councils.
- Private registered profiles or partial hiding within one Team.
- Offline mutation of registered data.
- Push notifications, background sync, native wrappers, or store packages.
- A permanent custom domain.

## 3. Visual and interaction contract

The discovery Figma nodes define accepted information and workflow behavior. They are wireframes, not a final light-theme styling contract. The production visual system follows this brief.

### 3.1 Product character

- Subdued
- Competitive
- Archival
- Mechanical
- FGC-native

### 3.2 Reference blend

- Fighting-game character select and training-mode information hierarchy.
- Transit departure boards and route diagrams.
- Tournament broadcast lower thirds and match score strips.
- Ableton-style dense controls for repeat profile editing.

### 3.3 Visual thesis

A dark continuous station board uses condensed display typography, hard rules, edge-to-edge Character art, and connected route markers to turn a player's cross-game history into a recognizable line rather than a grid of generic cards.

### 3.4 Signature move

The Mainline is a connected route strip that links Game stops in profile order. Each stop shows the player's eligible Main and Secondary Characters or Teams; choosing a target Game extends the line into recommendation candidates. On mobile it becomes a vertical left-edge spine. The relation must remain understandable with motion disabled.

### 3.5 Typography and tokens

- Display and Character names: Barlow Condensed, ExtraBold.
- Body and controls: Archivo variable, Regular/SemiBold.
- Metadata and numeric support: IBM Plex Mono, Medium/SemiBold.
- All fonts are self-hosted package assets; no runtime font CDN is required.
- Palette is authored dark-only, with near-black graphite, cool steel surfaces, warm off-white text, muted cyan route accents, amber evidence states, and red only for destructive or urgent states.
- Radius vocabulary is 0, 2, 4, and 999px. Large repeated rounded cards are prohibited.
- Elevation uses layering, rules, clipped art, and tonal contrast rather than repeated drop shadows.
- `color-scheme: dark` and `meta[name="darkreader-lock"]` keep Dark Reader from re-transforming the palette.

### 3.6 Composition rules

- Use continuous regions, rules, rails, lists, and edge-to-edge stages before bordered cards.
- Character artwork occupies meaningful visual area and never becomes a tiny decorative avatar.
- Every image has an adjacent or reachable source attribution and a non-image fallback.
- Desktop builder keeps Game navigation, active Team, and validation state visible without a generic left dashboard sidebar.
- Mobile re-composes into a sticky route header, horizontal Game rail, one active Character slot stage, and a bottom action strip. It does not merely stack the desktop columns.
- Focus, selected, invalid, private, pending, offline, and disabled states use the same system vocabulary.
- Motion communicates route continuity, selection, reorder, or update adoption. Reduced-motion mode removes nonessential movement.

## 4. Platform and repository structure

### 4.1 Stack

- Node.js and npm.
- Vite.
- React.
- TypeScript and TSX only for application and Worker source.
- React Router for routes.
- Supabase JS for Auth and database access.
- IndexedDB through a small typed adapter for the guest draft.
- Vite PWA/Workbox integration with prompt-based updates.
- Vitest and React Testing Library for unit/component tests.
- Playwright for browser acceptance.
- Supabase migrations and pgTAP policy tests.
- Wrangler for local Cloudflare runtime and deployment.

### 4.2 Intended layout

```text
src/
  app/
  components/
  data/
  features/
    auth/
    catalog/
    characters/
    draft/
    profiles/
    recommendations/
  lib/
  routes/
  styles/
  types/
worker/
  index.ts
public/
supabase/
  functions/
  migrations/
  tests/
tickets/
tests/
```

Feature modules own domain-specific UI, state, validation, and data calls. Shared components remain visual or behavioral primitives; they do not become a second domain layer.

## 5. Target surfaces and evidence boundary

### 5.1 Product support policy

- Browser tab: current and immediately previous stable generations of Chrome, Edge, Firefox, and Safari.
- Installed validation targets: Android Chrome, Windows Edge, iPhone/iPad Safari Home Screen, and macOS Safari Add to Dock.
- The browser tab remains fully useful when install APIs or installed surfaces are missing.
- Exact browser versions are recorded at release time from primary vendor sources.

### 5.2 Evidence labels

- `verified`: observed on a named build, origin, browser/OS, and profile.
- `guidance`: implemented according to standards or vendor documentation but not observed on the named surface.
- `inference`: likely based on another surface; not acceptance evidence.
- `unknown`: not tested or unavailable.

Build, local browser, deployed origin, offline/update, and installed-surface acceptance are separate gates.

## 6. Routes

| Route | Audience | Required behavior |
| --- | --- | --- |
| `/` | Public | Product entry with founding Game rail, sample Mainline, and direct actions to build or browse. No centered marketing hero plus feature-card grid. |
| `/build` | Guest/owner | Create and edit the active draft/profile with complete Selection Schema validation. |
| `/recommend` | Owner | Select a target Game Version, see ranked candidates or explicit no-data state, then submit analytics-only feedback. |
| `/p/:handle` | Public/owner | Public profile Mainline. Owner can enter edit mode; private entries appear only in owner edit surfaces. |
| `/games/:gameSlug` | Public | Game identity, Registered Player Count, roster, and public usage overview. |
| `/games/:gameSlug/characters/:characterSlug` | Public | Character identity, official/community art, source, summary, usage breakdown, percentage, and public profiles. |
| `/auth/callback` | Auth | Resolve Supabase OAuth/email callback and return to the safe requested app route. |
| `/settings` | Owner | Handle, data export, sign-out, and destructive account deletion with explicit consequences. |
| `*` | All | Product-specific not-found state with route back to the station. |

Unknown public handles, Games, and Characters return a real not-found state in the client. Static asset misses must not masquerade as valid manifest, worker, or icon responses.

## 7. Domain and database contract

### 7.1 Core tables

#### `profiles`

- `id uuid primary key` referencing `auth.users(id)` with cascade deletion.
- `handle citext unique not null` after normalization.
- `display_name text not null` with bounded length.
- `bio text null` with bounded length.
- `created_at`, `updated_at`.
- Every row is a public registered Player Profile.

#### `game_versions`

- Stable UUID, unique slug, public title, short title, release/revision label, launch order, active flag.
- `selection_schema jsonb` validated against the repository schema version.
- Seeded, curator-controlled catalog data; ordinary users cannot mutate it.

#### `characters`

- Stable UUID, `game_version_id`, unique version-scoped slug and name.
- Summary text and structured provenance fields.
- Roster order and active/retired roster state.
- Character identity never crosses Game Versions implicitly.

#### `character_art_assets`

- Character ID, asset URL or approved same-origin path, source URL, publisher/creator, retrieval time, usage basis, review state, attribution text, optional disabled/replaced/takedown time.
- At most one active primary art record per Character.
- Public reads include only active reviewed records.
- Curator-only writes.

#### `lineups`

- Owner/profile ID and Game Version ID.
- Category enum: `main | secondary`.
- Lifecycle enum: `active | retired`.
- Visibility enum: `public | private`.
- Stable client request ID for idempotent claim, merge, and save.
- Owner-defined sort order, timestamps.
- A Lineup is not valid until its complete Character Picks pass the Game Version Selection Schema.

#### `character_picks`

- Lineup ID, Character ID, slot index, pick kind, and validated game-specific options JSON.
- Character and Lineup must share the same Game Version.
- Slot indices are unique within a Lineup.
- Deleting a Lineup cascades to its Character Picks.

#### `recommendation_runs`

- Owner/profile ID, target Game Version, scoring policy version, generated time.
- Stores the returned candidate IDs, rank, score, support count, and contributing observed associations needed to explain what the player saw.
- It is an audit record, not a training input.

#### `recommendation_feedback`

- Recommendation run ID, owner/profile ID, candidate Character ID, enum response, optional structured reason, timestamp.
- Unique per owner/run/candidate.
- Excluded from all launch scoring functions and views.

### 7.2 Selection Schema

The versioned JSON contract defines:

- Player-facing noun: Character or Team.
- Required roster size and whether order matters.
- Slot labels and pick kinds.
- Character uniqueness rules.
- Required and optional per-pick choices such as assists.
- Required Team-level choices such as fuses.
- Validation messages and schema version.

Launch seeds must represent all 13 Game Versions. At minimum they preserve the accepted shapes for 2XKO, Marvel Tokon, MvC2, UMVC3, Avatar, and MK1 rather than flattening every Game into one Character ID.

### 7.3 Derived views and functions

- `public_lineups`: public, complete, valid Lineups only; defined with `security_invoker = true` or held behind a tested function that preserves RLS.
- `registered_player_counts`: unique public contributing profiles per Game Version.
- `character_usage_stats`: unique public players plus Main/Secondary and Active/Retired counts and percentages.
- `player_game_signatures`: normalized versioned Character weights per Player and Game Version.
- `recommend_characters(profile_id, target_game_version_id)`: ranked data-derived candidates and support.
- `export_profile_data(profile_id)`: owner-only machine-readable account export.
- `claim_profile_draft(payload, request_id)`: authenticated transactional validation and import when the account has no registered profile.
- `merge_my_guest_draft(payload, request_id)`: authenticated transactional validation and non-destructive merge of a guest draft into an existing registered profile.

No launch view may bypass source-row visibility or ownership policies.

## 8. Authorization and security

### 8.1 Grants and RLS

- Enable RLS on every exposed table.
- `anon` can read catalog rows, public profiles, reviewed Character Art Assets, and public/derived surfaces explicitly intended for everyone.
- `authenticated` receives the same public reads plus owner reads for its own private Lineups and feedback.
- An owner can insert/update/delete only its own profile, Lineups, Character Picks, recommendation runs, and feedback.
- Ordinary users cannot mutate Games, Selection Schemas, Characters, summaries, art provenance, policy versions, or another Player's data.
- Public views are security-invoker or are placed outside the exposed schema with narrow RPC grants.
- Every policy receives a pgTAP allow/deny test.

### 8.2 Auth and secrets

- The client uses the Supabase project URL and public publishable key only.
- Discord Client Secret, Supabase service-role credentials, and deployment tokens never enter client code or Git.
- Discord callback is `https://bqfzzrasfunysseoogcg.supabase.co/auth/v1/callback`.
- Supabase Auth redirect allow-list includes the chosen localhost port and deployed Cloudflare origin before those flows are accepted.
- Redirect destinations are allow-listed local routes; arbitrary external `next` values are rejected.

### 8.3 Web boundary

- HTTPS only outside localhost.
- Cloudflare responses set CSP, Referrer-Policy, X-Content-Type-Options, Permissions-Policy, and frame protection.
- CSP permits only required self-hosted assets, the scoped Supabase HTTPS/WSS origin, and explicitly allowed HTTPS Character-image hosts.
- No personalized Supabase response is stored in Cache Storage.
- Logs exclude auth tokens, private Lineup payloads, email addresses, and feedback bodies.

## 9. Guest draft, sign-in decision, and merge flow

### 9.1 Local draft

- IndexedDB database: `mainstation`, schema version 1.
- Stores draft profile metadata, Lineups, Character Picks, draft schema version, and last local update time.
- Contains no Supabase credentials or registered server session copies.
- Every local mutation commits atomically before the UI reports it saved.
- A quota or transaction failure shows a persistent error and does not pretend the draft was saved.
- The player can export or clear the guest draft.

### 9.2 Pre-auth draft decision

When a visitor starts sign-in while the Guest Draft contains a profile field or Lineup, the client does not immediately open Discord or send an email link. It presents a focused decision screen that says the draft is saved only on this device and names all three outcomes:

1. **Merge this draft and sign in:** sign in, then add the guest work to the existing account without replacing the saved profile.
2. **Discard this draft and sign in:** sign in, then clear this browser's guest draft and load the saved account profile.
3. **Keep editing:** close the decision screen and make no authentication or draft change.

The selection is stored locally without a draft payload or account data in the redirect URL. Empty drafts may proceed directly to ordinary sign-in. Cancelled, failed, or incomplete provider authentication always returns with the guest draft unchanged, regardless of the chosen intent.

### 9.3 Post-auth behavior

1. Confirm the authenticated session and load the registered profile state.
2. For **discard**, clear the guest draft only now, clear any recovery copy for that discarded draft, and load the registered profile if one exists. A sign-in failure never discards it.
3. For **merge** with no registered profile, validate the draft and create the first public profile through `claim_profile_draft`; profile setup is required when the guest draft lacks a valid display name or handle.
4. For **merge** with an existing registered profile, submit the complete guest draft once with a UUID request ID to `merge_my_guest_draft`.
5. The database revalidates, loads the authenticated owner's profile, computes the merge, and commits the result in one transaction. A duplicate request ID returns the same successful receipt and result.
6. Existing registered display name, handle, and bio always win. Registered Lineups remain. A guest Lineup is appended in its guest order unless a semantic exact duplicate already exists; semantic equality includes Game Version, ordered Picks and options, category, lifecycle, visibility, and team option, but ignores local IDs and timestamps.
7. A guest Lineup with a different category, lifecycle, visibility, option, or pick order is not treated as a duplicate and is preserved rather than silently resolved. The server returns the merged registered draft so the client displays the exact saved result.
8. Before either claim or merge, preserve a local read-only recovery copy. Remove it only after the returned registered draft has been loaded and confirmed. On validation, auth, authorization, conflict, or network failure, leave the editable Guest Draft unchanged and show the precise recovery action.

Registered edits are online-only at launch. Offline owner attempts remain unsent and visibly blocked; there is no silent outbox.

## 10. Selection behavior

- The UI says Character for solo schemas and Team for multi-pick schemas. It never asks the player to manage a Lineup.
- Main and Secondary lists are both unbounded.
- Active/Retired and Public/Private apply to the complete saved Character or Team.
- Partial hiding inside one Team is impossible.
- Save is disabled while a required slot or option is missing, but validation messages remain readable and associated with the relevant control.
- Cancel leaves the stored Character or Team unchanged.
- Deleting a Character or Team requires confirmation and immediately removes it from public and derived reads after success.
- Reordering preserves stable IDs and does not create extra statistical influence.
- Repeated Character appearances across different valid Teams remain stored and affect the normalized signature without increasing the Player's total per-Game contribution above one.

## 11. Signature and recommendation policy v1

### 11.1 Signature weights

Policy ID: `signature-v1`.

- Main multiplier: `1.0`.
- Secondary multiplier: `0.65`.
- Active multiplier: `1.0`.
- Retired multiplier: `0.5`.
- Every public eligible appearance contributes its product of category and lifecycle multipliers.
- Repeated appearances accumulate for that Character.
- Ordered slot and other configuration data remain queryable and may supply a bounded supporting modifier, but they cannot outweigh Character identity. The combined configuration modifier is capped at 10 percent of a Character's pre-normalized weight.
- Sum weights by Character, then divide by the Player's Game total so the signature sums to exactly `1.0` within numeric tolerance.
- Store or return the policy version with every derived signature and recommendation run.

Required fixtures:

- Solo public Active Main Ken has SF6 weight `1.0`.
- Equal public Active Mains Ken and Akuma split evenly absent another modifier.
- Public Active Main Ken outweighs public Active Secondary Sagat.
- Repeated public Active Main Ekko appearances across 2XKO Teams make Ekko dominant while unique partners retain nonzero shares.
- Adding more valid Teams never changes the total Player-Game contribution from `1.0`.
- Private Lineups contribute `0`.

### 11.2 Cross-game associations

Policy ID: `association-v1`.

- Build pairwise cross-Game Character associations only from eligible public Player-Game Signatures.
- One Player contributes at most their normalized per-Game weights to a Character pair.
- Score a target candidate by combining the requesting Player's source Character weights with observed source-to-target association strengths.
- Exclude the target Game from source evidence.
- Support is the distinct eligible Player count with a nonzero observed source-to-target association used for that candidate.
- Return the strongest observed contributing source Characters and their supported association contributions.
- Nonzero support may rank regardless of size, but the UI must label support prominently and avoid a confidence adjective that outruns the data.
- Zero support returns `not_enough_data`; do not substitute popularity, an authored mapping, or feedback.
- Recommendation feedback tables are not referenced by `signature-v1` or `association-v1` SQL.

## 12. Public profiles, Games, and Characters

### 12.1 Profile

- A registered profile is publicly addressable by normalized handle.
- It shows public Main and Secondary Characters/Teams grouped by Game Version, with Active/Retired state.
- The Mainline makes cross-game history recognizable and shareable.
- Private entries never leak through counts, empty slots, image requests, metadata, or public API responses.
- The owner edit surface names private entries and explains their exclusion.

### 12.2 Game

- Shows Game identity, registered public player count, roster, and public usage ordering.
- Counts unique Players rather than raw Character Pick or Team rows.
- Zero participation is displayed as zero, not missing data.

### 12.3 Character

- Shows Character and Game identity.
- Uses the reviewed primary art record when available, with publisher/creator and a direct source link.
- If art fails, is disabled, or is absent, the route remains composed and readable with a typographic fallback.
- Shows an attributed one-sentence summary under the summary reuse policy in Context.
- Shows unique public usage count, Main/Secondary split, Active/Retired split, percentage of Registered Players for the Game, and links to public profiles using the Character.
- A source or art takedown disables only the affected asset, not the Character route.

## 13. Feedback and analytics

- Feedback choices are bounded enums such as `would_try`, `not_for_me`, and `already_play` with an optional structured reason list.
- Submission acknowledges success only after the server commits it.
- Duplicate submission updates the same owner/run/candidate record.
- Analytics can report recommendation runs, support distribution, feedback rates, registrations, valid profile completion, Game coverage, and share actions.
- No launch scoring query, materialized view, Worker route, or client fallback reads feedback as ranking evidence.
- Analytics copy never claims a statistically meaningful conclusion below its displayed sample size.

## 14. Hide, deletion, export, and statistical propagation

- Hiding a public Character or Team commits its visibility change and immediately excludes it from source-filtered public and recommendation queries.
- Account deletion uses an authenticated privileged server/Edge function to delete the Auth user and profile source rows with cascading cleanup.
- The destructive confirmation states that the public profile, Characters/Teams, recommendation contribution, and feedback are removed.
- A failed deletion leaves the account usable and surfaces the error; it never signs out into an ambiguous half-deleted state.
- Current derived state is defined from eligible rows or invalidated on mutation.
- Any future materialized cache or historical snapshot stores input lineage and invalidation status. A hide/delete event marks affected state invalid immediately and a daily-or-faster job removes or recomputes it within 24 hours.
- Invalidated snapshots are never served while awaiting physical cleanup.
- Export returns the owner's profile, public/private Lineups, Character Picks, recommendation runs, and feedback in versioned JSON before deletion.

## 15. PWA lifecycle

### 15.1 Manifest and identity

- Stable manifest `id`, `start_url`, and `scope` are `/`.
- `name` is `MainStation`; `short_name` is `MainStation` unless launcher testing requires a shorter accepted label.
- `display` is `standalone` with dark opaque theme/background colors.
- The supplied MainStation mark at `assets/brand/mainstation-logo.png` is the canonical product identity. Generated derivatives may resize or add opaque safe-zone padding without redrawing the mark.
- The supplied Uppercut Labs logo remains unaltered and appears only beside the `Developed by Uppercut Labs` credit; it is never used as the MainStation app icon.
- Required outputs are ordinary 192/512 icons, separate maskable 192/512 icons, Apple touch icon, and favicon.
- Regenerating or refining the supplied-logo derivatives must not change the manifest app ID.

### 15.2 Service worker and cache

- Stable worker URL: `/sw.js`.
- Precache only the versioned shell and same-origin static assets required for meaningful offline boot.
- Fingerprinted assets use cache-first behavior.
- HTML navigation is network-first with the cached shell as offline fallback.
- Supabase Auth, personalized/profile-owner responses, mutations, redirects, errors, and recommendation runs are network-only.
- Cross-origin promotional Character art is not precached by default.
- A new worker waits. The UI announces an update and offers `Reload now` or `Later`.
- Accepting an update activates at a deliberate boundary and reloads exactly once.
- Activation deletes only known old MainStation caches.
- A same-URL no-fetch recovery worker is documented for rollback.

### 15.3 Offline and failure states

- The shell, local guest draft, catalog fixture data needed to edit that draft, and explicit offline status remain usable.
- Public server data may show the last safe same-origin read model only when labeled with its retrieval time; launch may instead show an unavailable-online state.
- Registered saves, guest-draft claim or merge, feedback, export, deletion, and fresh recommendations are visibly unavailable offline.
- `navigator.onLine` is a hint only; request results determine reachability.
- Storage quota, IndexedDB migration, blocked database, and cleared-storage states have explicit recovery copy.

### 15.4 Installation

- Chromium install affordance is feature-detected and never assumed on Safari or Firefox.
- iOS/iPadOS and macOS get platform-appropriate written installation guidance.
- Dismissing installation does not block any product task.
- Installation guidance is not acceptance evidence; installed surfaces require named device/browser observations.

## 16. Accessibility and responsive behavior

- WCAG 2.2 AA is the launch target.
- Every workflow is keyboard operable with visible high-contrast focus.
- No information depends on color, Character art, hover, or motion alone.
- Inputs have programmatic labels, error descriptions, and status announcements.
- Async loading, offline, save, update-ready, and error states use appropriate live regions without repetitive announcements.
- Character art has concise identity alt text; decorative layers use empty alt text.
- Touch targets are at least 44 by 44 CSS pixels where controls are not grouped into a larger accessible target.
- The layout is accepted at 360, 390, 768, 1024, and 1440 CSS pixels, plus landscape mobile and visible software keyboard states.
- Text remains usable at 200 percent zoom without two-dimensional scrolling for ordinary reading and editing.
- Reduced-motion mode removes route-travel and shared-layout transitions while preserving state changes.

## 17. Loading, empty, and error contract

- Loading states preserve the station-board layout and do not fabricate statistics.
- Empty guest draft: direct invitation to choose a first Game, not a generic blank card.
- Empty public profile: clear no-public-history state; do not reveal whether private data exists.
- Zero recommendation support: explicit not-enough-data state with contribution invitation and no popularity fallback.
- Weak support: rank the result, display the exact support count, and avoid fake precision.
- Supabase/configuration unavailable: keep local draft and public static catalog surfaces usable; identify unavailable account features.
- Art failure: typographic Character stage plus visible source metadata if the record remains active.
- Validation failure: preserve entered data, focus or link to the first invalid field, and list all affected Team requirements.
- Unknown route: real product 404 state.

## 18. Cloudflare release contract

- Wrangler configuration uses Workers Static Assets with `dist/` and SPA not-found handling.
- A small TypeScript Worker may run before assets to apply security and cache headers; it must delegate asset bodies to the asset binding.
- HTML, manifest, and worker revalidate; content-hashed assets may cache immutably.
- The first authorized release uses a generic `workers.dev` URL.
- The public release verifies status, MIME, redirects, bytes, cache headers, CSP, icons, manifest, worker, route fallback, and an actual mobile/desktop browser rendering.
- Rollback retains the prior deploy and compatible old hashed assets. Worker recovery never starts by clearing user storage.

## 19. Validation

### 19.1 Repository gates

```text
npm ci
npm run lint
npm run typecheck
npm test
npm run build
npm run test:e2e
```

### 19.2 Database gates

- Migration applies cleanly to a fresh local database.
- Seed is deterministic and contains all 13 Game Versions.
- pgTAP proves public reads, owner private reads, cross-owner denial, catalog write denial, feedback isolation, and secure views/functions.
- Signature fixtures and association zero/nonzero support cases pass in SQL tests.
- Hide/delete propagation tests prove immediate exclusion from served views.

### 19.3 PWA gates

- Manifest helper passes against build output and actual icon dimensions.
- Worker syntax and stable scope pass.
- Fresh load, returning load, offline reload, failed precache, waiting update, deferred update, accepted one-reload update, two tabs, and recovery worker are exercised.
- IndexedDB version 1 create/read/update/delete, reload persistence, quota/abort simulation, and clear/export behavior pass.
- Deployed release helper verifies HTTP metadata separately from local output.

### 19.4 UI gates

- Playwright covers guest draft, pre-auth merge/discard/cancel choices, cancelled-auth draft preservation, claim and existing-profile merge idempotency, merge duplicate handling, public/private visibility, recommendation no-data/weak-data states, feedback isolation, art fallback, export, and deletion failure.
- Automated accessibility checks run on primary routes; keyboard and screen-reader behavior receive manual verification.
- Desktop and mobile screenshots are reviewed with Dark Reader enabled and disabled; authored appearance should not materially change.
- The anti-slop checklist passes: recognizable composition, Mainline signature move, purposeful typography, semantic containment, intentional mobile composition, project-owned tokens, and no default SaaS/card-grid aesthetic.

## 20. Definition of done

The first-release implementation is complete when:

- Context, ADR, this specification, tickets, seed catalog, and implementation agree.
- All 13 Game Versions have valid Selection Schemas and launch Character data sufficient for complete public routes.
- Supabase migrations, policies, functions, and tests pass in the target project.
- The TypeScript/TSX application passes repository, UI, and PWA static/runtime gates.
- The Cloudflare deployment is live on a generic origin and verified at desktop and mobile widths.
- Email auth works on the deployed origin; Discord works after its provider credentials are configured.
- Hide/delete and feedback isolation behavior are proven.
- Browser-tab, offline, update, persistence, accessibility, and recovery evidence is recorded honestly.
- Every claimed installed surface is tested on that surface or explicitly marked untested.
- Uppercut Labs is the only developer credit, the supplied logo is preserved, and no personal name or social handle appears.
- Installed-surface brand acceptance remains open until the generated MainStation ordinary, maskable, Apple-touch, and favicon artwork is tested on each claimed physical surface.

## 21. Known release risks

- Attributed official promotional art without an explicit reuse license can receive takedown or replacement requests. Per-asset disable/replace behavior is mandatory.
- Full 13-game roster and Selection Schema accuracy is a content-quality gate, not implied by application build success.
- Sparse profile coverage can yield many honest no-data results.
- Supabase/Cloudflare free-tier limits and inactive-project behavior require monitoring; automatic spending is not enabled by this specification.
- The MainStation name/domain is not formally cleared.
- The MainStation logo is supplied and integrated; real installed-surface icon acceptance remains pending physical-device testing.
