# MainStation delivery tickets

Tickets are ordered by dependency. The launch is intentionally split into foundation, game-specific catalog, product, data-lifecycle, PWA, and release gates so green frontend work cannot conceal incomplete catalog, RLS, rights, or installed-surface acceptance.

| Range | Workstream |
| --- | --- |
| MS-001–005 | Runtime, visual system, Supabase boundary, catalog contract, PWA shell |
| MS-006–018 | One auditable catalog/selection/art track per founding Game Version |
| MS-019–023 | Sign-in before creation, account editor, profiles, public Games and Characters |
| MS-024–028 | Statistical policy, recommendations, feedback, deletion propagation |
| MS-029–031 | PWA lifecycle, acceptance matrix, Cloudflare/Supabase release |

See `SPEC.md` for the governing implementation contract. Each numbered ticket must record acceptance evidence before it is closed.

ADR-028 supersedes the original guest-draft scope. Current acceptance requires authentication before any creation or editing; historical release evidence does not validate the replacement account workflow.
