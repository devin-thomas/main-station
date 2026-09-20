# MS-005 — PWA shell and account editing storage

**Depends on:** MS-001, MS-002, MS-004

Create stable manifest identity, supplied icon set, prompt-based worker updates, safe offline shell, versioned account-isolated IndexedDB editing state, install guidance, and explicit unavailable-online states. ADR-028 requires authentication before editing.

**Acceptance:** manifest/icon audit passes; first/return/offline/update flows are exercised; local unsaved edits survive reload only for their confirmed authenticated owner; signed-out offline use remains browse-only; registered mutations are never silently queued; browser use remains complete without installation.

## Status

**Closed 2026-09-20.** Acceptance evidence:
`docs/releases/2026-09-20-foundation-acceptance.md`.

The manifest audit and deployed release probe pass; fresh, returning, offline, waiting
update, deferral, one-reload adoption, two-tab, quota and recovery paths are all exercised;
account drafts are isolated per authenticated owner and no offline mutation queue exists.

Recorded retrospectively: every claim was re-verified on 2026-09-20 against the shipped
system, and the record does not assert what was observed when the work was originally done.
Claims are labelled verified or attested accordingly.
