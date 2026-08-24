# MS-003 — Supabase schema, RLS, and RPC boundary

**Depends on:** MS-001

Create versioned migrations for profiles, catalog, complete Lineups, Character Picks, art provenance, recommendation audit/feedback, owner/public RPCs, database validation, grants, and RLS.

**Acceptance:** fresh migration succeeds; allow/deny tests cover anonymous, owner, cross-owner, curator, and feedback isolation; private child Picks never leak; only the publishable browser key is used by the client.
