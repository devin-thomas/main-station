# MS-031 Supabase and Cloudflare release — 2026-09-19

Release evidence for the first authorized public release, recorded as required by
`tickets/README.md` and SPEC 18.

## Release identity

| Field | Value |
| --- | --- |
| Origin | `https://mainstation.uppercut-labs.workers.dev` (generic `workers.dev`, per SPEC 18) |
| Worker version | `e01883cf-8268-4aa3-875a-3eb2083e0170` |
| Supabase project | `bqfzzrasfunysseoogcg` (`mainstation`, us-east-1, Postgres 17.6.1.155) |
| Migration head | `202609170001_recommendation_support_disclosure` |
| Verified from | Chromium 141.0.7390.37, Playwright 1.62.1, Linux 6.18 x86_64 |

Deployed bytes were checked against the committed source rather than assumed: a fresh build
of `main` reproduces the asset hashes the live HTML references.

## Acceptance

### Target migration is current — verified

Hosted `supabase_migrations.schema_migrations` ends at `202609170001`, matching the local
migration set exactly. Details in `docs/releases/2026-09-17-data-products-acceptance.md`.

### Auth configuration — verified

Read back from the project's auth config:

| Setting | Value |
| --- | --- |
| `site_url` | `https://mainstation.uppercut-labs.workers.dev` |
| `uri_allow_list` | `https://mainstation.uppercut-labs.workers.dev/auth/callback` |
| `external_email_enabled` | true |
| `external_discord_enabled` | true, client id set |
| `disable_signup` | false |
| `mailer_autoconfirm` | false |

**Discord provider wiring — verified.** `GET /auth/v1/authorize?provider=discord` returns
`302` to `https://discord.com/api/oauth2/authorize` carrying client id
`1541785305583984703` and the project's callback as `redirect_uri`. This proves the provider
is configured and the redirect contract is correct; it does not prove a completed login,
which needs a human with a Discord account.

**Email delivery and verification — verified.** `POST /auth/v1/otp` rejects a malformed
address with `400` and accepts a valid one with `200`. A confirmation email was delivered to
the project owner, the link was opened, and the server side completed: `auth.users` shows the
account created at 10:54:17, `email_confirmed_at` set, and `last_sign_in_at` at 10:55:28. So
delivery, the verify endpoint, and session issuance all work on the deployed origin.

**Browser session handoff — not completed in that test, by construction.** The request was
made with `curl`, which sends no PKCE code challenge and leaves no code verifier in any
browser. The app runs `flowType: 'pkce'` with `detectSessionInUrl: false`, so the callback had
no `code` to exchange and correctly refused rather than signing anyone in. Completing the
browser round trip requires requesting the link from the app UI and opening it in that same
browser; see Open items.

### Live routes, assets, MIME, cache, CSP — verified

Every route returns `200` with `text/html` and `public, max-age=0, must-revalidate`:
`/`, `/build`, `/recommend`, `/settings`, `/games/uni2`,
`/games/uni2/characters/hyde`, `/p/station-zero`, and an unknown route.

| Resource | Status | Type | Cache-Control |
| --- | --- | --- | --- |
| `/manifest.webmanifest` | 200 | `application/manifest+json` | `max-age=0, must-revalidate` |
| `/sw.js` | 200 | `text/javascript` | `max-age=0, must-revalidate` |
| `/favicon.png`, `/icons/icon-192.png`, `/icons/icon-maskable-512.png`, `/icons/apple-touch-icon.png` | 200 | `image/png` | `max-age=3600` |
| `/assets/index-B9U0A9es.js` | 200 | `text/javascript` | `max-age=31536000, immutable` |
| `/assets/index-T0CpU-VI.css` | 200 | `text/css` | `max-age=31536000, immutable` |

HTML, manifest, and worker revalidate; content-hashed assets are immutable, exactly as
SPEC 18 requires.

Security headers on every response: `Content-Security-Policy` (default-src `'self'`, with
connect-src limited to the project's Supabase origins over https and wss, `object-src 'none'`,
`frame-ancestors 'none'`, `upgrade-insecure-requests`), `Permissions-Policy`,
`Referrer-Policy: strict-origin-when-cross-origin`, `X-Content-Type-Options: nosniff`, and
`X-Frame-Options: DENY`.

**Zero CSP violations, console errors, page errors, or failed requests** across five live
page loads at desktop and mobile widths.

### SPA fallback — verified

An unknown route returns `200 text/html` and renders the product 404 state rather than a
server error page. A path that looks like an asset but does not exist returns a real `404`
with `no-store`, so a missing file cannot be mistaken for the app shell.

### Offline shell and worker — verified

Covered by `tests/e2e/pwa-lifecycle.spec.ts`: fresh, returning, offline navigation, waiting
update with deferral and one-reload adoption, two tabs, quota refusal, recovery worker, and
the assertion that no Supabase response or mutation enters Cache Storage. See
`docs/releases/2026-09-19-pwa-lifecycle-acceptance.md`.

### Live desktop and mobile rendering — verified

Inspected on the deployed origin at 1440×900 and 390×844: home, character, game, and
settings. Layout, typography, and imagery render as authored with no console noise.

### Dark Reader — verified (upgraded from guidance)

SPEC 19.4 asks that authored appearance not materially change under Dark Reader. This was
recorded as *guidance* in MS-030 because shipped markup is not a run of the extension. It has
now been run for real: Dark Reader 4.9.132 loaded as an unpacked extension in Chromium 141.

| Page | Dark Reader style tags injected | body background | body text |
| --- | --- | --- | --- |
| Control page with no lock | 9 | authored `#ffffff` → `rgb(24,26,27)` | `rgb(221,218,214)` |
| MainStation (`darkreader-lock`) | 0 | `rgb(9,11,12)` — authored `--canvas` | `rgb(242,238,223)` — authored `--text` |

The control proves the extension was active; MainStation's computed colours are the authored
tokens exactly, with nothing injected. A 19% pixel delta between the headless and headful
captures was traced to the scrollbar present in the headful window, not to restyling.

### Rollback — verified available

Three prior Worker versions are retained and selectable:
`a9cd4de8-88c4-4b2a-98d2-14903b85b7a0` (2026-09-17),
`6b57021b-c1c0-4259-8bf5-df70fcbf571f` and `e8b16983-c179-4235-80a4-eda44fb1cfef` (2026-09-19),
and the current `e01883cf-8268-4aa3-875a-3eb2083e0170`. Procedure, including why a Worker rollback alone is
safe against the current additive migration and why recovery never begins by clearing user
storage, is in `docs/release-rollback.md`. Service-worker recovery is in
`docs/pwa-recovery.md`.

## Gates

```
npm run validate         # lint, typecheck, verify:art, 44 unit tests, lint:db,
                         # 136 pgTAP assertions, build - PASS
npx playwright test      # 109 specs, local preview - PASS
PLAYWRIGHT_BASE_URL=<deployed> npx playwright test   # 109 specs, deployed - PASS
node <skill>/scripts/audit-manifest.mjs   # PASS, 0 errors, 0 warnings
node <skill>/scripts/probe-release.mjs    # PASS, 8 resources, 0 errors, 0 warnings
```

## Open items

These are the only acceptance items not closed here, and none is a code defect.

1. **Custom SMTP is required before public email sign-in.** This is the one item that blocks
   real users, and it is a provider limit rather than a defect:
   - `rate_limit_email_sent` is **2 per hour for the whole project** on the built-in provider.
   - Template and subject customisation is refused outright: *"Email template modification is
     not available for free tier projects using the default email provider."* So the email
     arrives as a generic "Confirm your email address" from `noreply@mail.app.supabase.io`
     with nothing identifying MainStation, and that cannot be fixed by configuration.
   - `smtp_sender_name` is likewise refused without custom SMTP.

   Configuring an SMTP provider lifts all three at once. **Deferred 2026-09-19:** a Resend
   account exists but has no verified sending domain, and Resend's fallback sender only
   delivers to the account holder, so it would leave public sign-in equally restricted.
   `docs/email-sender-setup.md` holds the runbook and the branded templates, ready to apply
   once a domain is verified. Until then email sign-in works but is not fit for public
   traffic, and **Discord is the sign-in path that is.**
2. **Browser round trip for email sign-in.** Request a link from the deployed app's own
   sign-in form and open it in that same browser. The server side is verified; this proves the
   PKCE exchange in a real browser.
3. **Discord sign-in end to end.** The redirect contract is verified; completing a login needs
   a human Discord account.
4. **Installed-surface brand acceptance.** Per SPEC 20 this stays open until the generated
   ordinary, maskable, Apple-touch, and favicon artwork is tested on each claimed physical
   surface. No installed surface has been observed on any platform.
5. **WebKit.** Unknown for the automated suites; the container has no WebKit build, and
   Chromium mobile presets are emulation, not Safari.

## Release risks carried forward

Unchanged from SPEC 21: promotional art without an explicit reuse license may draw takedown
requests and per-asset disable/replace remains mandatory; roster and Selection Schema accuracy
is a content gate that a green build does not imply; sparse profiles will legitimately yield
many no-data recommendation results; free-tier limits need monitoring and no automatic
spending is enabled; and the MainStation name and domain are not formally cleared.
