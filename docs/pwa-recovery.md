# Service-worker recovery and rollback

A released service worker keeps control of every installed client until a worker at the
same URL replaces it. A broken worker therefore cannot be fixed by rolling back the app
bundle alone: clients already controlled by it may never fetch the new bundle. This is
the documented recovery path required by SPEC 15.2.

MainStation's worker URL is stable at `/sw.js`. Recovery replaces the bytes at that URL.

## When to use this

Use it when a released worker breaks navigation, serves a shell that cannot boot, caches
something it must not, or otherwise leaves clients stuck in a state a normal deploy will
not clear. If the app still boots and merely needs a code fix, ship an ordinary release
instead — every client picks it up through the normal waiting-worker flow.

## Recover

The recovery worker lives at `recovery/sw.js`. It installs and activates promptly, claims
all clients, deletes only MainStation's own caches, navigates open windows once, and
registers no fetch handler, so every request goes to the network while it is in control.

```bash
npm run build
cp recovery/sw.js dist/sw.js
npx wrangler deploy
```

`dist/` is build output and is not committed, so this copy affects only the artifact being
uploaded. Do not commit the recovery worker over `src/sw.ts`.

Clients recover on their next visit: they fetch `/sw.js`, see changed bytes, install the
recovery worker, and stop being served by the broken one.

## Return to the normal worker

Once the defect is fixed, deploy the repaired worker at the same URL:

```bash
npm run deploy
```

Clients controlled by the recovery worker install the repaired worker on their next visit.
Because the recovery worker has no fetch handler, they are already reaching the network,
so nothing else is needed to unstick them.

## What survives

Recovery deletes Cache Storage entries whose names start with `workbox-precache` or
`mainstation`, and nothing else. It does not touch IndexedDB, so account drafts in the
`mainstation-accounts` database survive, and it does not touch Supabase session storage,
so a signed-in member stays signed in.

`Clear-Site-Data: "storage"` would also clear IndexedDB and sign members out. It is
destructive and browser-dependent, and it is not part of this procedure. Use it only as an
explicitly communicated last resort, tested first on a disposable profile.

## Verify a recovery

Run the lifecycle evidence suite, which exercises this exact worker swap:

```bash
npx playwright test tests/e2e/pwa-lifecycle.spec.ts
```

The `recovery worker` case asserts that the no-fetch worker takes control, that
MainStation's caches are gone, that an unrelated cache on the origin is left alone, and
that the app still loads from the network afterwards.
