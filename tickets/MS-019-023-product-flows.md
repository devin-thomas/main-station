# MS-019–023 — Authenticated builder and public identity

**Depends on:** MS-003–018 as applicable

Deliver Discord/email auth before profile setup or any Character/Team creation, the authenticated builder and registered editor, explicit atomic online create/save, public Mainline profiles, Game routes, and imagery-led Character Dossiers. ADR-028 removes guest creation, merge/discard sign-in decisions, and guest recovery from scope.

**Acceptance:** every selection shape validates; signed-out and loading-auth direct builder visits expose no editable controls or anonymous storage writes; failed auth never starts an editor; callbacks only confirm the session and return safely; local edits are isolated by authenticated account; sign-out, session loss, and account switching hide prior-owner state; legacy anonymous state is ignored without deletion; create/save are explicit, owner-only, idempotent, and preserve unsaved work on failure; public/private and Active/Retired behavior is consistent; art failure retains a complete typographic route; source and support details remain adjacent to claims.

## Status

**Closed 2026-09-20.** Acceptance evidence:
`docs/releases/2026-09-20-foundation-acceptance.md`.

Every acceptance clause is mapped to a named executing test in the 109-spec Playwright
suite, which passes against both the local preview and the deployed origin. Auth flows run
against a mocked Supabase origin and are labelled simulated evidence; the live email round
trip is recorded separately in the 2026-09-19 release evidence.

Recorded retrospectively: every claim was re-verified on 2026-09-20 against the shipped
system, and the record does not assert what was observed when the work was originally done.
Claims are labelled verified or attested accordingly.
