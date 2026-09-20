# MS-003 — Supabase schema, RLS, and RPC boundary

**Depends on:** MS-001

Create versioned migrations for profiles, catalog, complete Lineups, Character Picks, art provenance, recommendation audit/feedback, owner/public RPCs, database validation, grants, and RLS.

**Acceptance:** fresh migration succeeds; allow/deny tests cover anonymous, owner, cross-owner, curator, and feedback isolation; private child Picks never leak; only the publishable browser key is used by the client.

## Status

**Closed 2026-09-20.** Acceptance evidence:
`docs/releases/2026-09-20-foundation-acceptance.md`.

A fresh reset applies all migrations cleanly and 140 pgTAP assertions cover anonymous,
owner, cross-owner, catalog-write and feedback isolation, including proof that private child
Picks never leak and that an unknown Lineup is indistinguishable from a private one.

Recorded retrospectively: every claim was re-verified on 2026-09-20 against the shipped
system, and the record does not assert what was observed when the work was originally done.
Claims are labelled verified or attested accordingly.
