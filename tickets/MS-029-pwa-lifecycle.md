# MS-029 — PWA lifecycle and recovery

**Depends on:** MS-022–028

Exercise safe caching, stale/unavailable copy, waiting-worker update adoption, deferral, one-reload activation, multi-tab behavior, IndexedDB migration/failure, and a no-fetch recovery worker.

**Acceptance:** named runtime evidence covers fresh, returning, offline, update, quota/abort, two-tab, and recovery paths; personalized Supabase responses and mutations never enter Cache Storage.

## Status

**Closed 2026-09-19.** Acceptance evidence: `docs/releases/2026-09-19-pwa-lifecycle-acceptance.md`.

All seven named paths plus cache hygiene are covered by runtime observations in
`tests/e2e/pwa-lifecycle.spec.ts`, on desktop Chromium 141.0.7390.37, against the
production build and the deployed release.

Two gaps were closed rather than documented away:

- The two-tab path failed first time. `clientsClaim()` changes the controller in every
  tab, but only the accepting tab reloaded, leaving another document running against the
  newer worker. `usePwaLifecycle` now adopts the update in every tab with exactly one
  guarded reload each, measured with a per-tab load counter.
- No recovery worker existed, which SPEC 15.2 requires. `recovery/sw.js` and
  `docs/pwa-recovery.md` supply one, and the suite exercises the swap.

Quota refusal now reports a distinct, actionable error that names surviving work, and the
suite proves no Supabase response, auth call, mutation, or cross-origin request reaches
Cache Storage.

## Not accepted here

Installed surfaces, launcher icon rendering, and install prompts remain unobserved on
every platform, and the lifecycle suite runs on desktop Chromium only. Per SPEC 15.4,
installation guidance is not acceptance evidence. MS-030 owns the acceptance matrix that
names required device observations.
