# Sign-in-first creation release - 2026-09-04

Current production origin: https://mainstation.uppercut-labs.workers.dev

The preview Worker used for the original verification was retired on 2026-09-08.

Runtime commit: `fbd90d2e6ef54cae7e514ab45c35ef611ae778cb` on `main`.
Cloudflare Worker version: `d33e8609-9c0c-46fc-bc91-4ae8c97dff3d`.
Runtime assets: `index-Dw45lQII.js`, `index-dnOfgF21.css`.
Supabase project: `bqfzzrasfunysseoogcg`; migration `202609040001_authenticated_creation` applied.

## Delivered scope

- ADR-028 replaces anonymous creation with sign-in before profile setup, character selection, or editing. Public browsing remains available.
- Direct builder links wait for authentication and account loading, then redirect signed-out visitors to sign-in with a safe return destination. Missing configuration and failed account reads never open an empty editor.
- Guest merge/discard choices, transition storage, callback transfer logic, recovery-copy controls, and the guest merge RPC are removed. Historical migrations and release evidence remain labeled as history.
- Unsaved changes use a separate `mainstation-accounts` IndexedDB database keyed by authenticated user ID. The old anonymous database is neither read nor deleted.
- Account changes remount forms and editor state. Late responses cannot populate another account; local writes are serialized, and storage failures preserve the last committed state. Sign-out and token expiry close the editor; successful token refresh keeps the session active.
- Private requests check the expected owner and capture that session's authorization header. Explicit online saves reload the canonical server result. Save success followed by local failure is reported accurately; exports finishing after sign-out do not download.
- The supplied Uppercut Labs logo keeps its full square image with no circular CSS crop.

## Verification

- `npm run deploy` passed ESLint, TypeScript, 32 unit tests, all 90 artwork SHA-256 checks, production build, and Cloudflare deployment.
- All 81 distinct browser cases passed against the deployed runtime across desktop Chromium and both configured phone targets. The first run passed 79; an initial-navigation connection reset passed on retry, and a geometry check passed after waiting for web fonts. The affected geometry case was rerun successfully on all three targets. Coverage includes all 13 selection schemas, edit/privacy/reorder/remove, direct signed-out creation gates, callback success/failure and safe return paths, failed account loading, old anonymous-state exclusion, explicit cloud create/save, sign-out/account switching, and offline behavior.
- Clean live sign-in screens were captured without authentication mocks or blocked service workers on both phones. Direct `/build` visits reached `/settings?next=%2Fbuild` with no editor or overflow. Both full square logos passed visual review and measured 42 x 42 CSS pixels with zero border radius. Ignored screenshots: `output/playwright/<project>/deployed-sign-in.png` and `deployed-logo.png`.
- All 127 deployed files matched the local build by SHA-256. HTML cache policy, security headers, and a missing-script 404 with `no-store` passed. Detailed ignored evidence: `output/authenticated-release-assets.json`.
- Hosted database validation passed 78 targeted schema, auth, RLS, creation, save, private reload, idempotency, and payload-validation assertions. The validation transaction rolled back; no fixture users or temporary validation objects remain. The subsequent migration deployment and hosted schema lint passed, and all 12 migration versions match.
- Live database checks confirm the guest merge function is absent, anonymous creation is denied, and authenticated creation remains granted.

## Verification boundaries

Authentication browser cases use mocked Supabase sessions and API responses; they do not establish a new live Discord or email-provider login. Service workers are blocked in those fixtures to keep all simulated credentials and writes intercepted. Separate tests use the real service worker with anonymous browsing and creation gates. Authenticated offline editing is tested locally, with reload persistence after reconnecting.

The complete 107-assertion local database suite could not run because Docker Desktop failed to start on an inaccessible stale socket. The 78 hosted checks ran inside a rollback transaction; later full-suite recommendation/revalidation cases were not rerun. The SQL validation script is retained only under ignored `output/auth-gate-db-rollback.sql`.

Phone targets are iPhone 16 Pro WebKit at 402 x 874 CSS pixels/DPR 3 and Galaxy S21 Ultra Chromium at 384 x 854/DPR 3.75. Windows WebKit cannot reload the offline service-worker fixture, so its real-worker case verifies offline in-app navigation and the creation gate. Physical Safari, installed-PWA, and device-toolbar acceptance remain separate.

Existing build notices for bundle size and the PWA plugin's deprecated option remain. Supabase's documented [session events](https://supabase.com/docs/reference/javascript/auth-onauthstatechange) and [per-request authorization headers](https://supabase.com/docs/reference/javascript/using-modifiers-setheader) informed the account-boundary implementation.
