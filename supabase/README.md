# Supabase release boundary

Target project: `bqfzzrasfunysseoogcg`.

Hosted migration `20260824224033_initial_mainstation` is applied. It creates the source-of-truth schema, owner/public RLS, child-Pick privacy inheritance, normalized signatures, profile-only association recommendations, atomic guest-draft claim/registered save, export, and account deletion. Current statistics derive from eligible source rows so hides and deletes disappear immediately without waiting for a materialized refresh.

The applied preview seed contains 13 active Game Versions, 55 Character records, one approved UNI2 art record, and zero user rows at release. These are launch fixtures, not a claim that all 13 rosters are complete.

## Local reproduction

```powershell
npx supabase start
npx supabase db reset --local
npm run test:db
npm run lint:db
npx supabase stop
```

The release gate is a fresh reset, all 86 pgTAP assertions, and a clean database lint.

## Dashboard actions still required

1. Set Site URL to `https://mainstation-preview.uppercut-labs.workers.dev`.
2. Add `https://mainstation-preview.uppercut-labs.workers.dev/auth/callback` to Auth redirect URLs. Add `http://127.0.0.1:4173/auth/callback` only when testing local sign-in.
3. Add the Discord Client ID and Client Secret in the Supabase Dashboard. The Discord provider callback is `https://bqfzzrasfunysseoogcg.supabase.co/auth/v1/callback`.
4. Keep the Discord secret, service-role key, database password, and access tokens out of all `VITE_` variables and source files.

## Advisor review

Supabase reports the following deliberate security-definer warnings:

- `lineup_is_publishable` is callable by browser roles because RLS uses it to recompute public eligibility. It returns the same `false` result for private and unknown UUIDs and has dedicated regression coverage. See [lint 0028](https://supabase.com/docs/guides/database/database-linter?lint=0028_anon_security_definer_function_executable).
- `claim_profile_draft`, `save_my_profile_draft`, and `delete_my_account` are authenticated RPC boundaries. They bind work to `auth.uid()`, use empty `search_path`, validate bounded payloads, serialize per owner, and retain no anonymous execute grant. See [lint 0029](https://supabase.com/docs/guides/database/database-linter?lint=0029_authenticated_security_definer_function_executable).

Fresh-database performance notices mark foreign-key and derived-query indexes as unused because there are no user rows yet. Keep them until real query statistics justify removal; see [lint 0005](https://supabase.com/docs/guides/database/database-linter?lint=0005_unused_index).

The catalog still requires the scheduled 24-hour official-source diff process and human approval before roster or art changes are published.
