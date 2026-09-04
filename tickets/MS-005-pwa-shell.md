# MS-005 — PWA shell and account editing storage

**Depends on:** MS-001, MS-002, MS-004

Create stable manifest identity, supplied icon set, prompt-based worker updates, safe offline shell, versioned account-isolated IndexedDB editing state, install guidance, and explicit unavailable-online states. ADR-028 requires authentication before editing.

**Acceptance:** manifest/icon audit passes; first/return/offline/update flows are exercised; local unsaved edits survive reload only for their confirmed authenticated owner; signed-out offline use remains browse-only; registered mutations are never silently queued; browser use remains complete without installation.
