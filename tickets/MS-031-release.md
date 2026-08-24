# MS-031 — Supabase and Cloudflare release

**Depends on:** MS-030

Apply the reviewed migration/seed, configure Auth redirect URLs and Discord credentials, build, deploy the Worker Static Assets release, probe HTTP/PWA metadata, inspect live desktop/mobile UI, record rollback, and publish the evidence report.

**Acceptance:** target migration is current; email auth works and Discord works after provider setup; live routes, assets, MIME, CSP, manifest, worker, offline shell, and SPA fallback pass; previous deploy remains available for rollback.
