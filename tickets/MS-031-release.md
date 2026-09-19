# MS-031 — Supabase and Cloudflare release

**Depends on:** MS-030

Apply the reviewed migration/seed, configure Auth redirect URLs and Discord credentials, build, deploy the Worker Static Assets release, probe HTTP/PWA metadata, inspect live desktop/mobile UI, record rollback, and publish the evidence report.

**Acceptance:** target migration is current; email auth works and Discord works after provider setup; live routes, assets, MIME, CSP, manifest, worker, offline shell, and SPA fallback pass; previous deploy remains available for rollback.

## Status

**Released 2026-09-19** to `https://mainstation.uppercut-labs.workers.dev`, Worker version
`e8b16983-c179-4235-80a4-eda44fb1cfef`. Evidence:
`docs/releases/2026-09-19-public-release.md`.

| Acceptance item | State |
| --- | --- |
| Target migration current | verified — hosted head is `202609170001`, matching local |
| Auth redirect URLs configured | verified — site URL and `/auth/callback` allow-listed |
| Discord provider configured | verified — enabled, client id set, `authorize` returns the correct 302 |
| Live routes, assets, MIME | verified — all routes 200, correct types |
| Cache headers | verified — HTML/manifest/worker revalidate, hashed assets immutable |
| CSP and security headers | verified — present on every response, zero violations in a live browser |
| Manifest and worker | verified — helpers pass against build output and the deployed origin |
| Offline shell | verified — MS-029 lifecycle suite |
| SPA fallback | verified — unknown route renders the product 404; missing asset returns a real 404 |
| Live desktop and mobile rendering | verified — inspected at 1440 and 390 on the deployed origin |
| Previous deploy available for rollback | verified — three versions retained, procedure in `docs/release-rollback.md` |

Dark Reader was additionally upgraded from guidance to verified by running the real extension
against the deployed origin with a control page; MainStation's authored tokens are untouched.

## Open, and why

None of these is a code defect; each needs a person or a device.

1. **Email sign-in end to end.** Configuration and endpoint behaviour are verified and a magic
   link was sent to the project owner against the deployed callback. The click and resulting
   session are the owner's to confirm. Supabase's built-in SMTP is rate limited and aimed at
   project-team addresses, so custom SMTP is worth configuring before wider signup.
2. **Discord sign-in end to end.** The redirect contract is verified; completing a login needs
   a human Discord account.
3. **Installed-surface brand acceptance**, which SPEC 20 keeps open until the generated
   ordinary, maskable, Apple-touch, and favicon artwork is tested on each claimed physical
   surface. Carried from MS-029 and MS-030; no installed surface has been observed.
4. **WebKit**, unknown for the automated suites because the build environment has no WebKit
   binary. Chromium mobile presets are emulation, not Safari.
