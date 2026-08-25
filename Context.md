# MainStation Context

**Discovery status:** Closed  
**Last updated:** 2026-08-24  
**Research:** [Preliminary market research](MAINSTATION-PRELIMINARY-RESEARCH.md)
**Figma:** [MainStation Discovery v0.1](https://www.figma.com/design/rK5L5uAPFSBM7yqC0GdxYh?node-id=3-2)

The Figma file is the living visual discovery surface. Its current Core Experience section contains an initial desktop Profile Builder, a profile-pattern Recommendation view, a stored-to-derived statistical model, and the accepted Character Landing Page content. These are decision-testing wireframes, not a finalized design system or implementation acceptance contract.

## Product intent

MainStation is an FGC-native place for players to record the characters and teams that define them across fighting games, understand the patterns behind those choices, and get credible starting-character recommendations when trying another game.

The supplied example profile is:

- 2XKO: Ekko and Ahri
- Marvel Tokon: Magik, Spider-Man, and Black Panther
- MvC2: Storm

Expected recommendations include Zero in UMVC3, Hyde in Under Night In-Birth II, and Azula in Avatar Legends. These examples are candidate acceptance fixtures for the eventual recommendation model, not proof that one simple archetype explains the player's taste.

## Research conclusion

The single-main recommendation problem is already implemented. WhichMain translates one known character into ranked candidates in another game, and on 2026-08-24 it independently returned Ahri to Hyde and Ekko to Azula. Its public catalog does not include UMVC3 or MvC2, and its logged-out product does not visibly aggregate several deliberately selected mains into a public FGC identity. Account-only Passport behavior remains unverified.

MainStation is therefore a conditional go only if the center of gravity is a multi-main identity and taste graph. It should not present itself as the first cross-game main translator or compete primarily through a generic quiz.

## First product loop

1. A player records one or more Main or Secondary Characters or Teams for a game, including the complete game-specific selection shape and Active or Retired state.
2. MainStation produces a public profile and a statistically derived taste readout from the player's eligible history.
3. The player chooses a game they may want to try.
4. MainStation ranks candidates from the whole weighted history and shows which observed profile associations and sample support contributed.
5. The player rates the suggestions and can identify why a result was right or wrong.

This loop is accepted as the product center. It deliberately prioritizes repeatable identity value over a one-time quiz result.

## Product principles

- FGC depth over generic competitive-game breadth.
- Several real mains over one source-character translation.
- Main and Secondary are plural player-defined categories, not ranks imposed by MainStation.
- A saved Lineup must be a valid selectable configuration for its Game Version.
- Version-scoped characters; for example, MvC2 Storm is not a generic Storm record.
- Sample support, provenance, confidence, and honest uncertainty over false precision.
- Observed cross-game profile patterns drive launch recommendations; founder-authored equivalences, LLM-generated character analysis, and free-text explanations do not.
- Underlying character identity carries most recommendation weight; team order, assist/fuse choices, and similar configuration details are secondary signals.
- Players can keep a complete Character or Team private; partial hiding inside a Team is not supported.
- Legacy and niche games are first-class rather than an afterthought.
- Small samples and weak statistical support are shown honestly rather than hidden behind authored certainty.
- Character imagery is part of the launch experience, with per-asset provenance and a fast removal path.
- The browser experience remains useful without installation; the installable PWA is a first-class presentation of the same product.

## Founding game catalog

The first release will cover these 13 games deeply enough to support profiles, contribution, and explainable cross-game recommendations:

- 2XKO
- Marvel Tokon: Fighting Souls
- Marvel vs. Capcom 2
- Ultimate Marvel vs. Capcom 3
- Under Night In-Birth II Sys:Celes
- Avatar Legends: The Fighting Game
- Super Smash Bros. Melee
- Guilty Gear XX Accent Core Plus R
- Vampire Savior
- Street Fighter 6
- Mortal Kombat 1
- Tekken 8
- Guilty Gear Strive

This catalog preserves the six-game validation path from the founder's supplied profile while adding established scenes that can supply strong profile data and knowledgeable character reviewers. More games will be added through named later release waves rather than weakening the founding catalog.

## Initial domain model

- **Player Profile:** a player's FGC identity. A guest can build a private local draft, but every registered Player Profile is public.
- **Guest Draft:** anonymous, device-local editable state. It is not a server profile and remains the visitor's draft until they explicitly choose how it should relate to an account before sign-in.
- **Draft Merge:** the authenticated, transactional union of a guest draft and an existing registered profile. The registered profile owns display name, handle, and bio; guest Lineups are added without replacing registered Lineups, while semantic exact duplicates are retained once.
- **Game Version:** a specific game, release, revision, or materially different ruleset.
- **Character:** a playable character scoped to a Game Version.
- **Selection Schema:** the Game Version's rules for a valid selectable configuration: roster size, order significance, slots, and required character or team options.
- **Lineup:** one complete valid configuration in a player's Main or Secondary list for a Game Version. A solo game's Lineup contains one Character Pick; a forced-team game's Lineup contains the exact required team shape.
- **Character Pick:** one version-scoped Character inside a Lineup, including required position, assist type, fuse-like choice, or other game-specific option.
- **Lineup Category:** Main or Secondary. Both are unbounded lists chosen by the player rather than inferred from list position or character count.
- **Lifecycle Classifier:** Active or Retired, applied independently to a Main or Secondary Lineup.
- **Visibility and Eligibility:** one stored Lineup-level choice. A private Lineup is absent from the public profile and excluded from personal recommendation inputs and aggregate recommendation data.
- **Player-Game Signature:** a normalized derived distribution of one player's eligible character weights within one Game Version. Repeated appearances increase a Character's share; Main or Secondary and Active or Retired state modify it; the shares sum to a fixed total so prolific players do not overwhelm ordinary players.
- **Registered Player Count:** a derived Game statistic counting unique Players with at least one public, eligible, valid Main or Secondary Lineup, whether Active or Retired. Private Lineups do not qualify.
- **Taste Profile:** a derived summary of the Player's normalized, eligible character history across games.
- **Recommendation:** a statistically derived candidate in a target Game Version based on associations across contributed Player-Game Signatures, with sample support and feedback.
- **Character Landing Page:** a public page for every launch Character containing identity, Game, public usage count, Main/Secondary and Active/Retired breakdown, percentage of the Game's Registered Players, links to public profiles using the Character, and a sourced one-sentence gameplay summary.
- **Character Summary:** a version-scoped one-sentence gameplay description with source URL, source name, source revision or retrieval time, reuse mode, and license or permission evidence. It may be copied verbatim only when reuse is explicitly licensed or permitted; otherwise MainStation writes a factual paraphrase and still attributes the source.
- **Character Art Asset:** one version-scoped promotional or community image with source URL, creator or publisher, retrieval time, usage basis, review status, and optional replacement or takedown time. Official promotional art with visible attribution is preferred; a licensed community submission is the fallback when suitable official art is unavailable.

Stored state should include accounts, public profiles, Selection Schemas, versioned characters, valid Lineups, Character Picks, category, lifecycle, visibility/eligibility, required game-specific options, Character Summaries and Art Assets with provenance, and recommendation feedback. Registered Player Counts, Player-Game Signatures, taste summaries, association scores, sample support, and recommendations are derived unless a later performance decision explicitly introduces versioned statistical snapshots or caching.

Each Player receives one fixed contribution unit per Game across all public, eligible Main and Secondary Lineups, Active and Retired. The intended weighting behavior has four fixtures without yet fixing coefficients: a Player with only Ken concentrates their SF6 signature on Ken; equal Active Mains Ken and Akuma split influence evenly when no other modifier differs; Active Main Ken outweighs Active Secondary Sagat; and repeated Ekko appearances across several 2XKO Teams make Ekko dominant while unique partners retain smaller shares modified by category and lifecycle. Raw appearances remain queryable separately from the normalized signature.

## Character summary sourcing

MainStation prefers faithful reuse with attribution over unnecessary rewriting, but copying is conditional on reuse rights. Source attribution does not replace a license or permission.

- SmashWiki explicitly licenses its text under CC BY-SA 4.0 or compatible terms, so compatible copied summaries must preserve attribution and the applicable share-alike notice: [SmashWiki copyrights](https://www.ssbwiki.com/SmashWiki:Copyrights).
- Dustloop, SuperCombo Wiki, and Mizuumi currently expose no blanket reuse license in their MediaWiki rights metadata. SuperCombo's published terms require uploaders to hold rights but do not grant downstream reuse: [SuperCombo Terms of Use](https://supercombo.gg/terms/).
- For a source without a clear reuse grant, MainStation stores an attributed factual paraphrase or obtains direct permission before using verbatim text.
- Summary provenance is stored per Game Version so a source revision, patch, or permission change can be audited and updated.

## Character art sourcing

MainStation treats proper Character imagery as important to discovery and profile appeal. The launch policy is:

- Prefer publisher-provided promotional art and show a direct source link and publisher attribution on the Character page.
- When suitable official art is unavailable or must be removed, accept a licensed community submission with creator attribution and moderation evidence.
- Store one auditable provenance record per image, including source URL, retrieval time, usage basis, review status, and takedown or replacement state.
- Never imply that attribution itself grants a license. The accepted official-art policy carries release risk and therefore requires a fast per-asset disable/replace path.
- If neither an official image nor an approved community submission is available, keep the Character route usable with an intentional typographic treatment until imagery is cleared.

## Removal and feedback behavior

- Hiding a Character or Team removes it from the public profile and all new recommendation, count, and aggregate queries immediately.
- Account deletion removes the Player's profile data and contribution source rows. Any cached or materialized current statistics must stop serving the deleted influence no later than 24 hours after the request.
- Any historical statistical snapshot that contains affected contribution data is invalidated and no longer served no later than 24 hours after the hide or deletion request. The launch architecture avoids stored statistical snapshots unless they become necessary.
- Recommendation feedback is analytics-only at launch. "Would try," "Not for me," and related responses measure quality but never modify ranking inputs or association weights.
- Registered public Character and Team usage remains the only launch learning signal. Feedback may train scoring later only through a separately evaluated and accepted decision.

## Launch platform and client contract

- The application is a React TypeScript/TSX PWA built and bundled with Vite.
- Cloudflare Workers Static Assets hosts the browser application on a generic `workers.dev` origin until a domain is selected.
- Supabase supplies Postgres and Auth. Launch authentication offers Discord and email; the project enforces ownership and public/private data rules with database grants and Row Level Security.
- Supabase is the authority for registered account data. A guest draft is local IndexedDB state until the player explicitly chooses, before sign-in, to merge it into an account or discard it after a successful sign-in.
- Registered edits require connectivity at launch. Offline mode preserves the shell, public data already available to the current client where safe, and the guest draft; it does not pretend an account mutation succeeded.
- The app is dark by default, declares a dark color scheme, and prevents Dark Reader from re-transforming the authored palette. It supports current and immediately prior stable browser generations for Chrome, Edge, Firefox, and Safari in a browser tab, with installed-surface acceptance tracked separately for Android Chrome, Windows Edge, iOS/iPadOS Safari, and macOS Safari.
- Uppercut Labs is the sole developer credit at launch. Personal names and social handles are absent. The supplied Uppercut Labs and MainStation logos are canonical. The product mark may be resized or safely padded for runtime and launcher surfaces, but not redrawn; the MainStation header keeps its typographic name beside the mark for legibility.

## Ubiquitous language

- **Main:** a player-declared category containing any number of Characters or Teams for a game. MainStation never demotes a player's fourth Main to Secondary.
- **Secondary:** a separate player-declared category containing any number of Characters or Teams; it is not inferred from usage or list position.
- **Retired:** a lifecycle classifier that can modify either a Main or Secondary Character or Team without erasing it from profile history.
- **Lineup:** an internal umbrella term for a complete valid selection. The interface says Character for solo games and Team for team games; it never asks a player to manage a "Lineup."
- **Character Pick:** one character and its required slot/loadout choices inside a Lineup.
- **Selection Schema:** the rules that determine whether a Lineup can be saved as valid for a specific Game Version.
- **Game Version:** the exact game/revision context that gives a character their mechanics.
- **Player-Game Signature:** a normalized character-weight vector derived from one player's eligible Main and Secondary Characters or Teams in one Game Version.
- **Taste Profile:** the derived pattern across eligible Player-Game Signatures.
- **Recommendation Support:** the contributed player count and observed profile associations supporting a suggested Character; it is not an authored trait explanation.
- **Profile Data Contribution:** the public, eligible Character or Team data from a registered profile used to improve aggregate recommendations.
- **Guest Draft:** a browser-local, anonymous draft. It has no public URL, server identity, or cross-device availability.
- **Sign-in Draft Decision:** the explicit pre-auth choice to merge a non-empty Guest Draft, discard it after successful authentication, or cancel and continue editing.
- **Draft Merge:** a server-authoritative union used after sign-in with an existing profile. Account identity wins; registered Lineups remain; a guest Lineup is added unless an equivalent Lineup already exists.

## Known risks

- WhichMain is live, close to the original recommendation pitch, and expanding quickly.
- Sparse and uneven community data may produce weak or unavailable recommendations at launch.
- Players choose mains for different, sometimes contradictory reasons.
- Cross-game equivalence is lossy because system mechanics change how an archetype feels.
- Public profile aggregation creates privacy, deletion, sampling-bias, and statistical-quality concerns.
- Character art, marks, public profiles, privacy, deletion, and possible minor users require deliberate policy.
- The MainStation name and domains have not received formal clearance.

## Accepted launch contract

- The public main-history profile is the primary promise; recommendations are one payoff of that identity.
- The founding catalog contains the 13 named games above and must retain deep, version-aware coverage.
- Visitors can build a private draft without an account. Before sign-in from a non-empty guest draft, they choose to merge it, discard it after successful authentication, or cancel and continue editing. Merging creates a public registered profile when none exists; with an existing profile, it preserves account identity and Lineups while adding non-duplicate guest Lineups. Only complete Characters or Teams explicitly kept private remain unpublished and ineligible.
- Every game exposes plural Main and Secondary Character or Team lists only. Either category can contain Active or Retired entries; there are no Pocket or Learning categories. Lineup remains internal terminology only.
- A Lineup must match its Game Version's complete Selection Schema before it can be saved.
- Forced-team games preserve roster size, order, and required choices. Examples include four ordered characters in Marvel Tokon, Point and Assist plus the applicable Fuse in 2XKO, character-specific assist types in MvC2 and UMVC3, and Avatar's one fighter plus one fighter-specific support selection.
- Recommendation calculations primarily use underlying characters. Order, assists, fuses, and similar configuration choices remain lower-weight signals.
- Registered profiles are public. A player may keep a complete Character or Team private; doing so removes it from their public profile, personal recommendation inputs, and contributed aggregate data. The ordinary flow foregrounds public participation without shaming, obstructing, or monetizing privacy.
- MainStation is fully free. Launch infrastructure must use no-cost tiers or available student resources. Advertising is only a later operating-cost contingency if exceptional popularity makes continued free operation expensive.
- Launch recommendations learn only from eligible registered profile data. They do not use founder-authored mappings, LLM-derived character recommendations, or players' free-text explanations.
- Each Player contributes a normalized distribution within a Game Version. Repeated Character usage increases weight while category and lifecycle modify it; the exact formula remains a statistical design decision.
- The normalized contribution budget is one unit per Player per Game across all eligible Main, Secondary, Active, and Retired entries.
- A weak but nonzero data-derived recommendation may be ranked if its Player/sample support is displayed prominently. Zero supporting associations produce an explicit not-enough-data state rather than a fabricated result or popularity fallback.
- Private Characters and Teams do not count toward a Game's Registered Player Count.
- Every Character has a public landing page containing the accepted identity, public-usage statistics, public-profile links, and sourced one-sentence summary.
- Game-level Registered Player Count and recommendation support are derived from unique contributing Players rather than raw Character or Team row counts.
- Initial success combines profile participation with recommendation credibility: registrations, valid-profile completion, sharing, coverage by game, and positive "would try this" feedback. Community uptake can change game prioritization after launch.
- Hide and delete operations fully propagate through served profile and statistical results within 24 hours, including invalidation of affected historical snapshots.
- Recommendation feedback is analytics-only; it does not train launch scoring.
- Character pages primarily use attributed official promotional art, fall back to licensed moderated community submissions when necessary, and retain a usable non-image state for takedowns or gaps.
- The zero-cost platform boundary is Cloudflare Workers Static Assets plus Supabase Postgres/Auth with Discord and email sign-in.
- The client is an installable, dark-by-default TypeScript/TSX PWA branded as developed by Uppercut Labs.

## Discovery closure

The consequential product, data-lifecycle, asset, platform, and PWA decisions required for specification are accepted. Remaining parameters are implementation or statistical-policy choices that can be versioned without reopening product discovery.

## Versioned implementation parameters

- Exact Main/Secondary and Active/Retired coefficients, association formula, and displayed support labels.
- The initial approved official-art inventory and any later community submissions, tracked per asset rather than as a hidden blanket grant.
- A future custom domain and physical installed-surface acceptance for the supplied MainStation logo derivatives.
- Entire-game recommendations remain deferred in `Ideas.md`; launch recommendations target a Character in a player-selected Game Version.
