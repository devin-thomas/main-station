# MainStation Decision Record

## ADR-001 - Scope the product to fighting-game identity and discovery

**Status:** Accepted

**Decision:** MainStation is an FGC-focused product in which players select mains across many fighting games and use that history to understand their preferences and discover characters in another game.

**Rationale:** This is the explicit product direction and the founder's real cross-game profile supplies the first concrete example.

**Consequences:** The domain must treat games, versions, characters, teams, and player-character relationships as first-class concepts. Generic competitive-game coverage is not required.

## ADR-002 - Position around a multi-main identity graph

**Status:** Superseded

**Decision:** Make a persistent, shareable history of several actual mains the core product. Recommendations are derived from that history rather than centered on a one-source-character translator or a generic quiz.

**Rationale:** WhichMain already implements single-main translation and reproduced two expected mappings. Its visible product leaves a plausible gap around aggregated actual-main history, public FGC identity, legacy depth, and provenance.

**Consequences:** The first useful release must prove both profile value and multi-signal recommendations. A generic quiz or single-main translator is insufficient differentiation. This decision awaits discovery-round confirmation.

## ADR-003 - Treat character knowledge as versioned, explainable assertions

**Status:** Superseded

**Decision:** Store version-scoped trait assertions with authorship/provenance, confidence, and disagreement; derive recommendation explanations from those assertions.

**Rationale:** Cross-game mappings are subjective, patches and sequels change characters, and confident-looking ontology errors can erode FGC trust.

**Consequences:** ADR-012 supersedes this proposed authored-assertion approach for the initial recommendation model.

## ADR-004 - Make the public multi-main profile the primary product

**Status:** Accepted

**Decision:** MainStation centers a shareable history of several actual mains, and recommendations are derived from the full weighted profile.

**Rationale:** This creates identity and repeat value beyond a one-time translator and distinguishes MainStation from WhichMain's visible single-source flow.

**Consequences:** Profile creation must be compelling without a pending game purchase. ADR-012 supersedes only the per-selection-reason scoring clause; the public multi-main profile remains the accepted product center. This accepts and resolves the proposal in ADR-002.

## ADR-005 - Use curated community contribution governance

**Status:** Superseded

**Decision:** The founder seeds character knowledge, trusted game reviewers approve or reject changes, and the wider community can propose corrections.

**Rationale:** Open FGC input improves coverage and catches mistakes, while reviewer approval protects the catalog from popularity contests, vandalism, and confident but shallow mappings.

**Consequences:** This entry used "contribution" to mean edits to authored character knowledge. The user clarified that player contribution means account profile data entering the recommendation engine. ADR-009 supersedes this entry; authored-character-knowledge governance remains unresolved.

## ADR-006 - Launch with a 13-game founding catalog

**Status:** Accepted

**Decision:** The founding catalog covers 2XKO, Marvel Tokon, MvC2, UMVC3, UNI2, Avatar Legends, Melee, Guilty Gear Plus R, Vampire Savior, SF6, MK1, Tekken 8, and Guilty Gear Strive.

**Rationale:** The original six games prove the supplied recommendation scenario and legacy differentiation. The seven additions provide active or established communities that can supply representative profile data and knowledgeable character reviewers.

**Consequences:** Initial data work must be planned as 13 game-specific coverage tracks. Additional games are deferred to named release waves so launch depth and trust are not sacrificed for an unbounded catalog.

## ADR-007 - Represent player choices as valid plural Lineups

**Status:** Accepted

**Decision:** Each Game Version has plural Main and Secondary Lineup lists. Each Lineup is Active or Retired and must match the complete Selection Schema for that game before it can be saved.

**Rationale:** The player, not MainStation, decides how many characters or teams genuinely qualify as mains. Fighting games also impose different selectable shapes: solo characters, ordered teams, assists, fuses, and other required loadout choices.

**Consequences:** There are no Pocket or Learning categories. A solo Lineup has one Character Pick; a forced-team Lineup contains the exact required characters, order, and options. The model must support multiple Lineups sharing a Character.

## ADR-008 - Separate character identity from lower-weight configuration signals

**Status:** Accepted

**Decision:** Recommendation data primarily derives from the underlying characters in included Lineups. Team order, assist type, fuse-like choices, and other configuration details contribute lower-weight signals.

**Rationale:** Character preference is the strongest cross-game signal, while game-specific configuration still contains useful but less portable information.

**Consequences:** ADR-013 supersedes the earlier per-Character-Pick exclusion control. Privacy and recommendation exclusion apply to a complete Lineup; underlying Character identity still leads the eligible Lineup's recommendation weight.

## ADR-009 - Define player contribution as eligible account profile data

**Status:** Accepted

**Decision:** Players with accounts can contribute their eligible profile Lineups to the recommendation engine. This is distinct from proposing edits to character traits or mappings.

**Rationale:** The product's network value comes from authentic cross-game main histories. The earlier use of "community contribution" incorrectly conflated behavioral/profile data with editorial catalog governance.

**Consequences:** Consent defaults, aggregation rules, anonymization, deletion propagation, and authored-knowledge governance still require decisions. This supersedes ADR-005.

## ADR-010 - Keep MainStation free and launch on zero-cost infrastructure

**Status:** Accepted

**Decision:** MainStation is free for all players and should launch without operating spend, using free tiers and available student resources. Advertising may be considered only if exceptional popularity creates material support costs.

**Rationale:** The project is intended as an accessible FGC community product, not a premium funnel. Cost should grow only after demonstrated usage.

**Consequences:** Premium features and subscriptions are out of scope. Architecture must respect free-tier limits, avoid premature paid dependencies, and surface scaling thresholds before costs occur.

## ADR-011 - Allow private guest drafts and explicit publication

**Status:** Superseded

**Decision:** Visitors can build a private profile draft without an account. Authentication is required to persist it across devices, publish it, or contribute eligible profile data. Publishing is always explicit.

**Rationale:** This minimizes onboarding friction while preserving consent around public identity and contributed data.

**Consequences:** ADR-013 preserves guest drafts but supersedes explicit publication after registration: registered profiles are public by definition.

## ADR-012 - Learn launch recommendations only from registered profile patterns

**Status:** Accepted

**Decision:** Initial recommendations derive from eligible registered profile data and statistical associations only. Founder-authored character mappings, LLM-derived character analysis, and free-text explanations do not affect recommendation scores.

**Rationale:** This avoids encoding the founder's personal taste as ground truth and accepts weaker cold-start results until the community supplies enough authentic cross-game histories.

**Consequences:** ADR-003 and the per-selection-reason scoring portion of ADR-004 are superseded. The product must expose limited support honestly and cannot manufacture confident recommendations when samples are insufficient.

## ADR-013 - Make registered profiles public and bind privacy to data exclusion

**Status:** Accepted

**Decision:** Every registered Player Profile is public. A player can make a complete Lineup private, which also excludes it from their recommendation inputs and aggregate recommendation data. Privacy is available without shame, obstruction, or monetization, but private play history is treated as absent from MainStation's public community graph.

**Rationale:** Public contribution is the product's social and statistical center. One coherent visibility rule is easier to understand than separate publishing, contribution, and recommendation toggles.

**Consequences:** ADR-011 is superseded after the guest-draft stage. The interface needs clear consequences for making a Character or Team private, and deletion/statistical propagation rules remain to be decided.

## ADR-014 - Normalize each player's repeated character usage

**Status:** Accepted

**Decision:** Derive a normalized Player-Game Signature from every Player's eligible Characters and Teams. Repeated appearances increase a Character's share, while Main or Secondary and Active or Retired state modify the distribution. Preserve raw Teams and options separately from derived weights.

**Rationale:** Repetition is meaningful, but raw row counts would allow prolific players to dominate aggregate recommendations. Normalization lets one-character specialists, multi-main players, and repeated-team users contribute comparably while retaining distinct signals.

**Consequences:** Exact coefficients are not yet fixed. Weighting must be versioned, reproducible, and testable against fixtures such as solo Ken, Ken/Akuma, Ken/Sagat, and repeated Ekko teams.

## ADR-015 - Ship a landing page for every character

**Status:** Accepted

**Decision:** Every Character in the founding catalog has a small public Character Landing Page from the first release.

**Rationale:** Characters are the stable public nodes connecting profiles, games, statistics, and future community knowledge.

**Consequences:** The page route and identity shell are launch scope. Its remaining minimum content must be resolved before specification.

## ADR-016 - Measure participation and recommendation credibility together

**Status:** Accepted

**Decision:** First-release success combines public profile participation and coverage with positive recommendation feedback and profile sharing. Post-launch game priority follows observed community uptake as well as founder interest.

**Rationale:** Profile data creates the engine, but account totals alone do not prove that its recommendations are credible or useful.

**Consequences:** Analytics must distinguish registrations, valid profiles, registered players by Game, sharing, recommendation support, and "would try this" feedback without treating catalog breadth alone as success.

## ADR-017 - Give each player one normalized contribution unit per game

**Status:** Accepted

**Decision:** Each Player contributes one fixed unit per Game across all public, eligible Main and Secondary Lineups, Active and Retired. Repetition, category, and lifecycle distribute that unit among Characters.

**Rationale:** This matches the supplied Ken and Ekko examples while preventing either Secondary lists or prolific Team savers from creating extra aggregate voting power.

**Consequences:** The exact coefficient formula remains versioned statistical policy, but every derived Player-Game Signature must normalize to the same total contribution.

## ADR-018 - Rank weak supported results without inventing cold-start evidence

**Status:** Accepted

**Decision:** A recommendation with nonzero observed profile support may be ranked if its support is visibly disclosed. A target with zero supporting associations shows a not-enough-data state and receives no popularity or authored fallback.

**Rationale:** The product accepts early weak recommendations as the honest cost of learning only from registered profile data.

**Consequences:** Recommendation responses must include support metadata and distinguish weak evidence from no evidence.

## ADR-019 - Exclude private play from registered-player statistics

**Status:** Accepted

**Decision:** A private Character or Team does not count toward a Game's Registered Player Count.

**Rationale:** Privacy already makes the entry absent from public identity and recommendation contribution; counting it would create a contradictory partial contribution.

**Consequences:** The count derives only from Players with at least one public, eligible, valid Main or Secondary Lineup in that Game. Removal timing remains undecided.

## ADR-020 - Make every character page statistically useful and source-aware

**Status:** Accepted

**Decision:** Every Character Landing Page launches with Character and Game identity, public usage count, Main/Secondary and Active/Retired breakdown, percentage of the Game's Registered Players, links to public profiles using the Character, and a sourced one-sentence gameplay summary.

**Rationale:** This makes Character pages useful before future comments exist and grounds the short description in established FGC knowledge instead of casual invention.

**Consequences:** Every summary stores its source, revision or retrieval time, reuse mode, and license or permission evidence. Verbatim reuse requires an explicit license or direct permission and must satisfy attribution/share-alike terms; otherwise MainStation publishes an attributed factual paraphrase.

## ADR-021 - Fully propagate hiding and deletion within 24 hours

**Status:** Accepted

**Decision:** Hide or delete the source profile data immediately and remove its influence from every served current count and recommendation, plus invalidate affected historical statistical snapshots, no later than 24 hours after the request.

**Rationale:** A private or deleted Character or Team must become absent from MainStation's public identity and community graph rather than linger in anonymous aggregates.

**Consequences:** Current queries must filter directly from eligible source data or use invalidatable derived state. Launch avoids historical statistical snapshots unless needed. Any future cache or snapshot records require lineage, invalidation state, and a daily-or-faster cleanup path.

## ADR-022 - Keep recommendation feedback analytics-only at launch

**Status:** Accepted

**Decision:** Recommendation feedback measures perceived quality but does not modify launch rankings. Eligible registered Character and Team usage remains the only learning signal.

**Rationale:** "Would try" is intent rather than demonstrated affinity, and early feedback volume may be sparse or strategically noisy.

**Consequences:** Feedback storage and analytics are isolated from scoring inputs. Training on feedback requires a later evaluation and accepted model change based on observed data.

## ADR-023 - Lead with attributed official character art

**Status:** Accepted

**Decision:** Character pages primarily use attributed official promotional art even when no explicit blanket reuse permission is published. When suitable official art is unavailable or must be removed, MainStation falls back to licensed, moderated community submissions.

**Rationale:** Recognizable Character imagery is important to player excitement and the usefulness of a discovery product. Community art is valuable but creates sourcing and moderation overhead that should not be the primary launch dependency.

**Consequences:** Attribution does not eliminate copyright risk. Every art record needs source, publisher or creator, retrieval time, usage basis, review state, and a fast disable/replace path. Character routes must remain useful while an image is unavailable or under review.

## ADR-024 - Use Cloudflare plus Supabase for the zero-cost boundary

**Status:** Accepted

**Decision:** Host a React TypeScript/TSX client with Cloudflare Workers Static Assets and use Supabase Postgres/Auth for relational data, Row Level Security, Discord sign-in, and email sign-in.

**Rationale:** MainStation's normalized profiles, versioned selections, public aggregates, and recommendation associations fit a relational model. Managed Auth and Postgres reduce authentication and persistence implementation overhead while Cloudflare provides an inexpensive global web boundary.

**Consequences:** Registered data is server-authoritative in Supabase. The browser receives only a public publishable key; privileged credentials remain server-side. Auth redirect URLs must include local development and the active Cloudflare origin. Free-tier thresholds and project availability must be monitored before they become user-facing failures.

## ADR-025 - Ship a dark installable PWA under Uppercut Labs

**Status:** Accepted

**Decision:** Deliver MainStation as an installable, dark-by-default web application using Vite, React, and TypeScript/TSX. Credit Uppercut Labs as the developer and use its supplied logo; omit personal names and social handles. Use a typographic MainStation wordmark until the app logo is supplied.

**Rationale:** A PWA preserves frictionless browser access while supporting an app-like home-screen identity across the platforms used by the FGC. A deliberate dark palette fits the product and avoids Dark Reader fighting a light theme.

**Consequences:** Browser-tab behavior remains the fallback when installation is unavailable. Manifest identity, service-worker updates, offline behavior, local drafts, Dark Reader handling, responsive composition, and installed-surface verification are explicit release gates rather than assumptions inferred from a build.

## ADR-026 - Adopt the supplied MainStation product mark without changing app identity

**Status:** Accepted

**Decision:** Use the exact supplied MainStation logo as the canonical product mark, tracked at `assets/brand/mainstation-logo.png` with SHA-256 `7BCACF1A848FC405483844588E0790DB64C6CD76E8BCC2326C00C1C63C55D732`. Runtime, favicon, ordinary launcher, Apple-touch, and maskable outputs may resize the source or center it within an opaque safe zone, but must not redraw it. The manifest `id`, `start_url`, and `scope` remain `/`. Uppercut Labs remains the separate developer identity.

**Rationale:** The supplied neon-grid mark gives MainStation a recognizable app identity while preserving the subdued station-board interface around it. A single tracked source and deterministic derivatives prevent provisional marks or platform-specific redraws from drifting into competing identities.

**Consequences:** The typographic product name remains beside the mark where small-image legibility is weak. Generated icon files are release artifacts derived by `npm run generate:icons`. Physical Android, Windows, iOS/iPadOS, and macOS installed-surface acceptance remains open until each claimed surface is tested; supplying the artwork alone does not close that gate.
