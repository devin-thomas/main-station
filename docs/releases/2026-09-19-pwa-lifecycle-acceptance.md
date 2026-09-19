# MS-029 PWA lifecycle acceptance — 2026-09-19

Acceptance evidence for the PWA lifecycle and recovery ticket, recorded as required by
`tickets/README.md`. Produced by working the lifecycle under the `pwa-development` skill
(`devin-thomas/skills`, `pwa-development/SKILL.md`).

Evidence labels follow that skill: **verified** means a named build and browser produced
the observation; **untested** means the surface was not exercised here.

## Scope and target matrix

Mode: repair and validate an existing PWA. Manifest, icons, install affordance, and the
worker's cache strategy were already in place and unchanged in substance.

| Surface | Status |
| --- | --- |
| Desktop Chromium 141.0.7390.37, Playwright 1.62.1, Linux | verified |
| Deployed origin, browser-tab | verified |
| iPhone 16 Pro / WebKit | untested for lifecycle |
| Galaxy S21 Ultra / Chromium | untested for lifecycle |
| Installed surfaces on any platform | untested |

The existing smoke suite still covers WebKit and the two mobile viewports; the lifecycle
evidence below is desktop Chromium only, because the update, two-tab, and recovery cases
need a server whose worker bytes change mid-test. Installed-surface behaviour requires
physical devices and remains unobserved, so this release is not cross-platform accepted.

## Defect found and fixed

The two-tab case failed on the first run, which is why the ticket exists.

`src/sw.ts` calls `clientsClaim()`, so adopting an update changes the controller in every
open tab. `vite-plugin-pwa` only reloads the tab that accepted, and its `controlling`
handler is guarded on `event.isUpdate`. Measured with a per-tab load counter:

- before the fix: the tab that first registered the worker did not reload at all, while a
  second tab did. A document kept running against a newer worker — the exact hazard the
  skill's lifecycle reference warns about for `clientsClaim()`.

`usePwaLifecycle` now owns adoption. It watches `controllerchange`, treats the first
change on an uncontrolled page as the initial claim (so a first visit is not reloaded
under the visitor), and reloads once on every later change. A module-level latch keeps it
to one reload per tab.

- after the fix: both tabs go from one load to two. No third load appears in a 1.5 s
  settle window, so the accepting tab is not double-reloading through both paths.

## Files changed

| File | Decision |
| --- | --- |
| `src/features/pwa/usePwaLifecycle.ts` | Own update adoption; one guarded reload per tab on `controllerchange`. |
| `src/components/AppShell.tsx` | Update action reads `Reload now`, the label SPEC 15.2 names. |
| `src/features/draft/draftStore.ts` | Map quota refusal to `DraftStorageFullError`; a failed transaction leaves the stored draft intact. |
| `src/features/draft/DraftProvider.tsx` | Distinct copy for a full device, naming that earlier saves survive. |
| `recovery/sw.js` | New: same-URL no-fetch recovery worker. |
| `docs/pwa-recovery.md` | New: recovery and rollback procedure. |
| `tests/e2e/pwa-server.mjs` | New: build server with release and recovery controls. |
| `tests/e2e/pwa-lifecycle.spec.ts` | New: the eight runtime paths below. |
| `tests/draftStorage.test.ts` | New: quota mapping at unit level. |
| `eslint.config.ts` | Service-worker and Node globals for the two new non-bundle files. |

Cache strategy, manifest, icons, and install affordance were left as they were: navigation
is network-first with the precached shell as fallback, fingerprinted assets are cache-first,
and cross-origin art is not precached.

## Validation commands and results

```
npm run validate                      # lint, typecheck, verify:art, 38 unit tests,
                                      # lint:db, 136 pgTAP assertions, build - PASS
npx playwright test                   # 39 specs, desktop Chromium, local - PASS x2
PLAYWRIGHT_BASE_URL=https://mainstation.uppercut-labs.workers.dev \
  npx playwright test                 # 39 specs against the deployed origin - PASS
node scripts/audit-manifest.mjs --manifest dist/manifest.webmanifest --root dist
                                      # PASS, 0 errors, 0 warnings
node scripts/probe-release.mjs --url https://mainstation.uppercut-labs.workers.dev \
  --manifest .../manifest.webmanifest --worker .../sw.js
                                      # PASS, 8 resources, 0 errors, 0 warnings
```

The two helpers ship with the `pwa-development` skill and were run from the installed skill
directory. They check an operational baseline and HTTP metadata; neither proves
installability, worker lifecycle, or offline behaviour, which is what the suite below is for.

## Runtime evidence (verified, desktop Chromium 141.0.7390.37)

`tests/e2e/pwa-lifecycle.spec.ts` serves the production build from a local origin whose
worker bytes and recovery state are controllable, which is what makes update and recovery
observable rather than asserted. It runs against that origin even when
`PLAYWRIGHT_BASE_URL` points elsewhere, because the deployed origin cannot have its worker
swapped mid-test.

| Path | Observed |
| --- | --- |
| Fresh | First load registers, takes control, precaches the shell; `/index.html` is present and every cached entry is same-origin. One document load. |
| Returning | Second visit is controlled with no re-registration round; shell renders. |
| Offline | Offline reload serves the cached shell, the offline rail appears, and `/recommend` states it needs a connection. |
| Update | New worker waits and is announced. `Later` dismisses without adopting and the worker stays waiting. The announcement returns on the next visit. `Reload now` adopts it, waiting clears, and the load count goes 2 → 3 and stays there. |
| Two-tab | Accepting in one tab takes both tabs from one load to two, with no waiting worker left in either. |
| Quota/abort | A refused object-store write surfaces "no room left … Your last saved entries are unchanged" and adds no entry to the ledger. Unit tests cover `QuotaExceededError`, the legacy code 22 form, and pass-through of a non-quota abort. |
| Recovery | The no-fetch worker deployed at `/sw.js` takes control, removes every `workbox-precache*` and `mainstation*` cache, leaves an unrelated cache on the origin untouched, still serves the app online, and fails navigation offline — the absence of a fetch handler observed behaviourally. |
| Cache hygiene | After visiting `/`, `/games/uni2`, `/recommend`, `/settings`, and a public profile, no cached entry matches `supabase`, `/auth/v1/`, or `/rest/v1/`, and every entry is same-origin. |

## Deployment

Worker `mainstation` at `https://mainstation.uppercut-labs.workers.dev`, version
`6b57021b-c1c0-4259-8bf5-df70fcbf571f`, deployed through `npm run deploy` so the full
`validate` gate ran ahead of it. The deployed bundle was checked separately from local
output: it contains the `controllerchange` adoption path and the `Reload now` label.

## Known limits

- Installed-surface behaviour, launcher icon rendering, and install prompts are unobserved
  on every platform. Installation guidance in `/settings` is guidance, not evidence.
- WebKit and the mobile viewports are covered by the smoke suite but not by the lifecycle
  suite. Physical Safari offline reload remains unverified, as recorded in the README.
- Quota behaviour is verified by forcing the refusal, not by filling a real device.

## Rollback

`docs/pwa-recovery.md`. Deploy `recovery/sw.js` at `/sw.js` to retire a broken worker from
installed clients, then deploy the repaired worker at the same URL. IndexedDB and the
Supabase session are preserved.
