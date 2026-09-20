# Release rollback

MainStation ships as a Cloudflare Worker with Static Assets plus a Supabase project. The two
roll back differently, and the order matters. This is the procedure SPEC 18 requires.

## Decide what actually broke

| Symptom | Roll back |
| --- | --- |
| Bad UI, broken route, bad headers | The Worker version. Start here. |
| Clients stuck on a broken service worker | `docs/pwa-recovery.md` first, then the Worker. |
| Wrong or missing data, failing RPC | The database. See below; it is not a version revert. |

Never begin a rollback by clearing user storage. Account drafts live in the
`mainstation-accounts` IndexedDB database and the signed-in session lives in Supabase's own
storage; neither is release state, and destroying them turns a display bug into data loss.

## Roll back the Worker

Each deploy creates a version and Cloudflare retains the previous ones, along with the
content-hashed assets that version served, so a rolled-back build still finds its own
`/assets/index-<hash>.js`. Old clients holding a cached HTML shell keep resolving.

```bash
npx wrangler deployments list        # find the last good version id
npx wrangler rollback <version-id> --message "why"   # version id is positional
```

Then confirm the live origin actually changed:

```bash
curl -sI https://mainstation.uppercut-labs.workers.dev/ | grep -i content-security-policy
node <pwa-development-skill>/scripts/probe-release.mjs --url https://mainstation.uppercut-labs.workers.dev
```

Versions retained at the time of writing, newest last:

| Version | Deployed | Note |
| --- | --- | --- |
| `a9cd4de8-88c4-4b2a-98d2-14903b85b7a0` | 2026-09-17 | MS-024–028 data products |
| `6b57021b-c1c0-4259-8bf5-df70fcbf571f` | 2026-09-19 | MS-029 PWA lifecycle |
| `e8b16983-c179-4235-80a4-eda44fb1cfef` | 2026-09-19 | MS-030 surface acceptance |
| `e01883cf-8268-4aa3-875a-3eb2083e0170` | 2026-09-19 | MS-031 release, cross-browser sign-in message |
| `c8a59030-c253-4c2a-b83f-545701fc510e` | 2026-09-20 | Feedback reason list, regenerated types |

A Worker rollback does not touch `/sw.js` behaviour beyond serving the older bytes. If the
defect is in the service worker itself, run the recovery worker in `docs/pwa-recovery.md`
first, because clients controlled by a broken worker may never fetch the rolled-back build.

## Roll back the database

Migrations are forward-only. There is no down migration, and reverting one by hand risks
dropping data that the newer build wrote.

A Worker rollback alone is safe against the two most recent migrations, and neither needs a
database change to accompany it.

`202609200001_feedback_reason_list` replaces `recommendation_feedback.reason_code` with a
bounded `reason_codes text[]` and changes the `record_recommendation_feedback` signature to
match. It ran against zero feedback rows. An older client calling that RPC with three named
arguments still resolves, because the reason list carries a default.

`202609170001_recommendation_support_disclosure` is additive: it replaces two functions and
adds two comments, with no table, column, policy, or grant changed. An older client reads only
the keys it knows and ignores the `state` and `contributions` fields the newer functions
return.

If a future migration is not backward compatible, roll the Worker back first, then write a
new forward migration that restores the needed behaviour. Record both in
`docs/releases/`.

The database connection is not reachable from a cloud session — only HTTPS egress is
permitted — so hosted SQL goes through the Supabase Management API query endpoint rather
than `supabase db push`. See `docs/releases/2026-09-17-data-products-acceptance.md`.

## After any rollback

1. Re-run the release probe and confirm status, MIME, cache headers, and CSP.
2. Load the live origin in a browser and confirm no console or CSP errors.
3. Record what was rolled back, to which version, and why, in `docs/releases/`.
