# Supabase release boundary

Target project: `bqfzzrasfunysseoogcg`.

The hosted project has the initial source-of-truth schema plus the public data-product, private policy-helper, complete UNI2 and 2XKO catalogs, 2XKO schema refinement, and complete Character-art migrations applied. Together they provide owner/public RLS, child-Pick privacy inheritance, normalized signatures, atomic guest-draft claim/merge/registered save, registered export, account deletion, live public statistics, immutable recommendation runs, constrained feedback, and a disableable provenance record for every published Character image. Current statistics derive from eligible source rows so hides and deletes disappear immediately without waiting for a materialized refresh.

The hosted catalog contains 13 active Game Versions, 410 Character records, 90 active primary art records, and zero Profile or Lineup rows. The art ledger contains 28 express fan-kit, 4 conditional fan-kit, 15 conditional community-policy, and 43 ADR-023 publisher-promotional records. All 13 game catalogs are source-checked for selection coverage; art rights review remains independent of roster completeness.

## Local reproduction

```powershell
npx supabase start
npx supabase db reset --local
npm run test:db
npm run lint:db
npx supabase stop
```

The release gate is a fresh reset, all 98 pgTAP assertions, and a clean database lint.

## Hosted Auth configuration

The production Site URL is `https://mainstation-preview.uppercut-labs.workers.dev`, and `https://mainstation-preview.uppercut-labs.workers.dev/auth/callback` is allowlisted. Add `http://127.0.0.1:4173/auth/callback` only when testing local sign-in.

The Discord provider is enabled with callback `https://bqfzzrasfunysseoogcg.supabase.co/auth/v1/callback`. Live acceptance passed on 2026-08-25: Supabase completed the provider callback with HTTP `302`, exchanged the PKCE authorization code at `/token` with HTTP `200`, and created one Discord identity without creating a public profile. A non-empty guest draft is explicitly merged, discarded, or retained before auth; its claim or merge occurs only after the session is confirmed.

Keep the Discord secret, service-role key, database password, and access tokens out of all `VITE_` variables and source files.

## Advisor review

Supabase reports deliberate security-definer warnings for the authenticated RPC boundaries:

- `claim_profile_draft`, `merge_my_guest_draft`, `save_my_profile_draft`, `delete_my_account`, `get_my_profile_draft`, `run_my_recommendations`, and `record_recommendation_feedback` intentionally execute as the signed-in owner. They bind work to `auth.uid()`, use an empty `search_path`, validate bounded payloads, and retain no anonymous execute grant. See [lint 0029](https://supabase.com/docs/guides/database/database-linter?lint=0029_authenticated_security_definer_function_executable).
- `mainstation_policy.lineup_is_publishable` lives outside the exposed `public` API schema. RLS and security-invoker public views use it to recompute eligibility; private and unknown UUIDs return the same `false` result.

The leaked-password-protection warning is currently non-applicable because MainStation enables Discord OAuth and email magic links, not password authentication. Enable the protection before exposing password sign-in; see [Supabase password security](https://supabase.com/docs/guides/auth/password-security#password-strength-and-leaked-password-protection).

Fresh-database performance notices mark foreign-key and derived-query indexes as unused because there are no user rows yet. Keep them until real query statistics justify removal; see [lint 0005](https://supabase.com/docs/guides/database/database-linter?lint=0005_unused_index).

The catalog still requires the scheduled 24-hour official-source diff process and human approval before roster or art changes are published.
