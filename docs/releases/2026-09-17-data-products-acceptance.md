# MS-024–028 data-product acceptance — 2026-09-17

Acceptance evidence for the statistical policy and data-lifecycle tickets, recorded as required by
`tickets/README.md`. Verified against a local Supabase stack (CLI 2.117.0, Postgres 17) with every
migration applied from empty, not against the hosted project.

Migration added: `202609170001_recommendation_support_disclosure`. It is additive — it replaces two
functions and adds two comments. No table, column, policy, or grant changed.

## Commands

```
npx supabase start
npx supabase db reset
npm run test:db      # 136 assertions across 2 files
npm run lint:db      # no schema errors
npm test             # 34 unit tests
npm run lint && npm run typecheck && npm run build
npx playwright test  # 31 specs, desktop Chromium
```

`npm run validate` now includes `validate:db`, so the pgTAP gate runs before `npm run deploy`
instead of beside it. That gate requires Docker and a running local stack.

## Ticket evidence

### MS-024 — Player-Game Signatures

All six SPEC 11.1 fixtures assert against `public.player_game_signatures`, the view the product
actually reads, in `supabase/tests/signature_and_propagation.test.sql`:

- a solo public Active Main carries raw and normalized weight `1.0` and returns `signature-v1`;
- equal public Active Mains split `0.5`/`0.5`;
- Main `1.0` outweighs Secondary `0.65`, and Retired halves an appearance to `0.5`;
- repeated Team appearances make one Character dominant (`0.5`) while unique partners stay nonzero
  (`0.25` each);
- adding a further valid Team leaves the Game total at exactly one unit while raw weight keeps
  accumulating;
- a private Lineup produces no signature row at all.

One assertion covers the whole view: no `(profile, game)` group deviates from `1.0` by more than
`1e-9`.

`src/lib/signature.ts` and `tests/signature.test.ts` were deleted. The module had no caller
anywhere in `src/`, so the only signature tests in the repo were exercising dead code, and it had
already drifted from the SQL by omitting the completeness and publishability filters.

### MS-025 — Cross-game associations

`recommend_characters` now returns a `contributions` array per candidate: the strongest observed
source Characters, each with its own contribution and distinct-Player support, capped at five and
ordered by contribution. This satisfies the SPEC 11.2 requirement that was previously unmet.

The fixture population gives Target Ace rank 1 with support 2 and score `1.606061`, and Target Nova
rank 2 with support 1 and score `0.393939`. Both scores and ranks are asserted exactly, alongside
the rank-1 candidate's single contributing source (`ken`, from `sig-solo`, support 2).

Scoring still reads only eligible public signatures. Assertions confirm that neither
`recommend_characters` nor `run_my_recommendations` mentions `recommendation_feedback`.

### MS-026 — Support disclosure

`run_my_recommendations` returns an explicit `state` of `ok` or `not_enough_data`. Zero support is
now a named contract rather than an empty array that only the React page could interpret; the
stored audit run carries each candidate's contributions, so a run can explain what the player saw.

The client rejects a run whose `state` contradicts its candidate list, rejects an unknown state
rather than guessing, and rejects a candidate that arrives without its contributing associations
(`tests/recommendations.test.ts`). `/recommend` renders each candidate's contributing Characters
with their shared-player counts, and `tests/e2e/recommendations.spec.ts` covers both the
not-enough-data state (with its contribution invitation and no ranked fallback) and a
single-player supported result labelled "1 player", including that submitting feedback re-ranks
nothing and triggers no second scoring run.

### MS-027 — Analytics-only feedback (closed)

Closed on the original review with no code change. `feedback_response` is a bounded enum, the
record is unique per owner/run/candidate and upserted on resubmission, direct `insert`/`update` is
revoked from `authenticated` so writes must pass `record_recommendation_feedback`, and that
function verifies both run ownership and that the candidate appeared in that run. No scoring view
or function reads the table.

See the open follow-up in `tickets/MS-024-028-data-products.md` about `reason_code` versus the
structured reason list in SPEC 13.

### MS-028 — Hide, delete, and propagation

Proven in SQL rather than inferred. Hiding a public Lineup removes it, on the next read, from
`public_lineups`, `player_game_signatures`, and `public_profile_mainline`; drops
`character_usage_stats.public_player_count` from 2 to 1; and cuts that candidate's recommendation
support from 2 to 1 on the very next run. Deleting a Lineup removes its Character from served
signatures and stops it supporting its candidate.

The 24-hour clause is vacuous by construction and now asserted as such: `pg_matviews` contains no
materialized view in `public`, so there is no cache or historical snapshot that could outlive a
hide or delete. That assertion fails the moment one is introduced without the lineage and
invalidation design SPEC 14 requires.

## Note on privacy in the derived stack

`run_my_recommendations` is `SECURITY DEFINER`, so the `security_invoker` views beneath it run as
the migration owner and RLS on `public.lineups` does not apply. Privacy therefore rests entirely on
the `visibility = 'public' and is_complete and lineup_is_publishable(...)` predicate inside
`public_lineups`. That is correct today and the propagation tests above lock the behavior down, but
the dependency was undocumented; a comment on the view now states it explicitly.
