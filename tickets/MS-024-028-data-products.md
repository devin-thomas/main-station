# MS-024–028 — Statistical policy and data lifecycle

**Depends on:** MS-019–023

Version and test Player-Game Signatures, cross-game association scoring, recommendation support disclosure, analytics-only feedback, immediate source exclusion, and daily-or-faster derived-state deletion propagation.

**Acceptance:** each Player contributes exactly one unit per Game; private data contributes zero; zero support returns `not_enough_data`; feedback tables are absent from scoring queries; hide/delete is immediately excluded from served queries and no affected snapshot remains serveable after 24 hours.

## Status

Acceptance evidence: `docs/releases/2026-09-17-data-products-acceptance.md`.

| Ticket | Scope | Status |
| --- | --- | --- |
| MS-024 | Version and test Player-Game Signatures | Acceptance met 2026-09-17 |
| MS-025 | Cross-game association scoring | Acceptance met 2026-09-17 |
| MS-026 | Recommendation support disclosure | Acceptance met 2026-09-17 |
| MS-027 | Analytics-only feedback | **Closed 2026-09-17** |
| MS-028 | Immediate source exclusion and deletion propagation | Acceptance met 2026-09-17 |

MS-027 closed on its original review: feedback is a bounded enum, unique and upserted per
owner/run/candidate, writable only through `record_recommendation_feedback` after ownership and
candidate-membership checks, and unreachable from `signature-v1` or `association-v1` SQL.

The other four were revised before their evidence was recorded:

- MS-024 — the only signature tests exercised `src/lib/signature.ts`, a TypeScript
  reimplementation with no caller that had already drifted from the SQL it mirrored. It was
  removed and all six SPEC 11.1 fixtures now assert against `public.player_game_signatures`.
- MS-025 — `recommend_characters` scored correctly but returned no contributing source
  Characters, and only the zero-support path was tested.
- MS-026 — zero support was an untyped empty list that only the React page interpreted, and
  `recommendation_runs` stored no lineage explaining what the player saw.
- MS-028 — live views already made hide and delete immediate, but nothing proved it; the nearest
  test invalidated a catalog row rather than changing visibility.

## Open follow-up

SPEC 13 describes "an optional structured reason **list**" for feedback; the schema stores a single
`reason_code text`. Judged non-blocking for MS-027 because the bounded-enum response and analytics
isolation both hold, but the column shape and the spec should be reconciled in a later ticket.
