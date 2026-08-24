# MainStation preliminary market research

**Research date:** 2026-08-24  
**Question:** Does a product already let fighting-game players record mains across games and use that history to recommend characters in another game? If so, why is it not widely known, and is MainStation still worth building?

## Executive answer

**The recommendation core already exists.** [WhichMain](https://whichmain.com/) is a direct competitor, not merely an adjacent quiz. Its [Main Translator](https://whichmain.com/cross) starts with a character a player already mains, selects a destination game, and ranks that roster by shared playstyle traits and role alignment. It also offers per-game quizzes, playstyle tags, character comparisons, and secondary/counterpick suggestions.

The overlap is unusually concrete: on 2026-08-24, WhichMain independently produced two of the expected examples from the brief:

- [Ahri in 2XKO -> Hyde in Under Night In-Birth II](https://whichmain.com/uni2/similar-characters/2xko/ahri): Hyde was the closest match.
- [Ekko in 2XKO -> Azula in Avatar Legends](https://whichmain.com/avatar-legends/similar-characters/2xko/ekko): Azula was the closest match, with the page reporting a 43% match.

It cannot reproduce the Zero example because its current public game list does not include UMVC3 or MvC2. More importantly, its public translator visibly accepts **one source character at a time**. I found no public, logged-out evidence that it learns from a deliberately curated history such as Ekko + Ahri + Magik + Spider-Man + Black Panther + Storm and turns that collection into a persistent, public FGC identity. WhichMain's quiz can save results to a feature called "Passport," and it has accounts, so account-only capabilities remain an uncertainty rather than a confirmed absence.

**Recommendation: a conditional go, with a repositioning.** Do not lead with "translate one main into another game" or claim to be the first cross-game character recommender. Lead with **the FGC-native profile and taste graph**: a person's actual mains and teams across versions of many games; the reasons they chose each; explainable recommendations synthesized from multiple observations; legacy/niche coverage; and a shareable identity that other players can recognize, debate, and improve.

WhichMain validates both the question and demand. It also means a generic quiz or single-character translator would enter as a follower.

## What is already implemented

### 1. WhichMain — direct competitor

[WhichMain](https://whichmain.com/) says it covers 27 games, 1,315 characters, 999 playstyle traits, and 11,486 trait assignments on its [About page](https://whichmain.com/about) as observed on 2026-08-24. Counts on the live homepage changed during research, so they should be treated as first-party live counters, not independently audited figures.

Its product surface includes:

- A [cross-game translator](https://whichmain.com/cross): choose one source game, one source character, and one destination game; shared playstyle traits rank the results and role alignment breaks close calls.
- A [12-question, all-games quiz](https://whichmain.com/quiz): answers map to aggression, mobility, range, support, and other traits, then produce an archetype and a recommended main in each selected game.
- Per-game recommendation hubs. For example, its [UNI2 page](https://whichmain.com/uni2) offers a quiz, incoming cross-game translation, roster browsing, character comparison, playstyle tags, an archetype quiz, and a secondary finder.
- A [secondary/counterpick tool](https://whichmain.com/uni2/secondary) that uses character traits and counterplay interactions while explicitly declining to replace patch-specific matchup data.
- Accounts, premium filters, and a quiz action labeled "Save to my Passport." Publicly indexed pages do not establish whether Passport is a public profile, whether users can manually record multiple actual mains, or whether recommendations aggregate those mains. This is an **open competitor-research item**, not a safe differentiation claim.

#### Method and quality signals

The creator says every character is manually tagged from direct play, not scraped or AI-generated, using one shared vocabulary across games ([WhichMain About](https://whichmain.com/about)). Cross-game matching uses trait groups and roles because different games use different terminology. This is essentially the same ontology problem MainStation would need to solve.

The creator also states the current limitation plainly in an approximately six-day-old r/Fighters introduction visible on 2026-08-24: broad roles and playstyle tags are decent for overall gameplan but weaker for details such as exact range archetypes ([creator post](https://www.reddit.com/r/Fighters/comments/1vhjd5l/community_tool_a_cross_game_main_translator_would/)). In the same thread, a Virtua Fighter-to-Street Fighter mismatch exposed an incorrectly connected trait group; the creator corrected it after a user report. This is useful weak evidence that community review improves the system, but also that ontology wiring errors can produce confident-looking bad matches.

#### Coverage relative to the proposed example

The public list includes 2XKO, Avatar Legends, Brawlhalla, DBFZ, Fatal Fury: City of the Wolves, GBVSR, Guilty Gear Strive, Marvel Tokon, MK1, Soulcalibur VI, SF6, Smash Ultimate, Tekken 8, UNI2, and VF5 R.E.V.O., plus several shooters, MOBAs, and battle royale games ([WhichMain home](https://whichmain.com/)).

It does **not** list UMVC3, MvC2, KOF XV, Skullgirls, BBCF, Melty Blood: Type Lumina, Killer Instinct, Samurai Shodown, or many older revisions as of the research date. The absence is based on the site's public game list, not a claim that the creator will not add them.

### 2. Tokon Teams — the inspiration, but adjacent rather than direct

[Tokon Teams](https://tokonteams.com/) is scoped to Marvel Tokon. It is a strong reference for selection UX and transparent community evidence, not a cross-game profile product.

It lets a player assemble an ordered four-character team and explains the Point, Shooter, Vertical, and Assault slots. Its [team search](https://tokonteams.com/teams/) exposes submitted teams and filters by slot. Character pages show where a character is played, frequent callers/callees, popular teams, and pairing lift. Its [Vibranium+ report](https://tokonteams.com/report/) documents that ladder teams are manually collected snapshots and distinguishes them from user submissions. The report observed on 2026-08-24 described 8,911 ranked-ladder teams as of 2026-08-23.

Tokon Teams demonstrates three useful patterns:

1. Selecting characters is itself a satisfying shareable interaction.
2. Players value "what do real players run?" alongside authored character descriptions.
3. Provenance, sample size, rank boundary, and thin-data warnings make community statistics more credible.

It does not record a player's mains across games or use one game to recommend a character in another.

### 3. FindMyMain — adjacent cross-game identity outside the FGC

[FindMyMain](https://findmymain.com/) advertises six game-specific quizzes, a "Gaming Playstyle Identity," profiles, history, a leaderboard, and community chat. The indexed homepage lists League of Legends, Deadlock, Overwatch, Valorant, Rainbow Six Siege, and Marvel Rivals—no fighting games as of 2026-08-24.

This is not a direct FGC competitor, but it validates that quiz + persistent identity + history + community is an understandable consumer bundle. It also means the broader "main identity across competitive games" category is not empty.

### 4. Single-game main finders and official onboarding

Single-game tools are common and fragmented:

- Capcom has a live official [Street Fighter 6 recommended fighter and control-type quiz](https://www.streetfighter.com/6/contents/characterquiz/en/).
- An independent [Tekken 8 character finder](https://tekken-8-character-finder.vercel.app/) offers beginner and second-main routes. Its creator describes appearance, personality, fighting style, difficulty, and second-main similarity/difference/vibe paths in a [March 2026 r/Tekken post](https://www.reddit.com/r/Tekken/comments/1riu6hz/i_made_a_tekken_8_character_finder_quiz_main/).
- WhichMain itself supplies ten-question per-game quizzes and same-game secondary recommendations.

These solve "who should I try in this roster?" but generally do not create an FGC-wide identity from actual historical mains.

### 5. Databases, stats, and player records

Several mature products own pieces of the data surface without doing taste-based cross-game recommendations:

- [DashFight's roster index](https://dashfight.com/characters/roster) covers many current fighting games and links characters, rankings, tournaments, and editorial content.
- [Liquipedia Fighting Games](https://liquipedia.net/fighters/Main_Page) records games, tournaments, notable players, and competitive history. A profile such as [GO1](https://liquipedia.net/fighters/GO1) shows multi-game history, but this is an editorial record of a notable competitor, not a self-authored profile or recommender for any player.
- [Shoryu](https://shoryu.site/about) tracks SF6 player rankings, match history, character stats, tournaments, and a player's main from CFN data, but remains single-game.
- [Combopedia](https://combopedia.com/fighting-game-moves) searches moves across many fighting games and can filter by game, move archetype, or notation. It is marked under heavy construction and is a move database, not a taste model.

These products could be research inputs or link partners, but none observed combines an ordinary player's self-declared multi-game main history with cross-game recommendations.

### 6. Social identity and manual substitutes

- [FGC.Network](https://join.fgc.network/) is an FGC-specific federated social network with posts, media, follows, polls, and user-controlled feeds. Its public product page does not describe structured game/main fields or recommendations.
- Tier-list templates and social posts are an existing manual behavior: players arrange "my mains across fighting games" collages and ask others what the pattern says. This is **weak community evidence**, not market sizing; see the older [r/Fighters main-analysis thread](https://www.reddit.com/r/Fighters/comments/15r0qt6/i_put_all_my_mains_from_across_every_fg_ive_ever/) and a [TierMaker mains template](https://tierlists.com/create/my-fighting-game-mains).
- Repeated Reddit questions ask some version of "I main X in game A; who should I play in game B?" An older discussion also cautions that the same nominal playstyle can feel different under another game's system ([community counterpoint](https://www.reddit.com/r/Fighters/comments/nbqzzi/try_the_entire_roster_you_might_like_different/)). These threads show a recurring question and a quality hazard, but are anecdotal and platform-biased.

## Feature comparison

| Product | Multi-game catalog | Input from an actual known main | Aggregates several actual mains | Persistent/shareable player identity | Cross-game character recommendations | Community or observed-play evidence | Legacy FGC depth |
|---|---:|---:|---:|---:|---:|---:|---:|
| **MainStation, proposed** | Intended | Yes | **Core proposal** | **Core proposal** | Yes | Intended human/FGC grounding | Intended |
| [WhichMain](https://whichmain.com/) | Yes, 27 competitive games claimed | Yes, one visible source character | **Not publicly verified** | Passport/account exists; exact public profile behavior unverified | **Yes; direct** | Manual solo tagging; corrections accepted | Limited current/selected catalog |
| [Tokon Teams](https://tokonteams.com/) | No; Marvel Tokon only | Team picks inside Tokon | Four-person Tokon team only | Shareable team, not cross-game identity | No | User submissions + manually sampled ladder data | No |
| [FindMyMain](https://findmymain.com/) | Six non-FGC competitive games | Quiz-based | Cross-game identity advertised; actual-main aggregation not verified | Profile/history/community advertised | Per-game quiz recommendations | Method not evaluated here | None |
| Official/single-game quizzes | Usually one game | Usually preference answers | No | Usually a result card at most | No cross-game layer | Publisher or individual author | One current title |
| DashFight / Liquipedia / Shoryu / Combopedia | Broad to single-game | Stats, editorial profiles, or moves | No consumer taste aggregation | Competitive records in some products | No | Observed results, game data, or editorial data | Medium to strong, depending on product |
| FGC.Network / TierMaker | User-created across games | Manual free-form content | Manual display only | Yes, social post/profile or image | No | Human conversation only | User-dependent |

## Why an FGC-embedded person may not have heard of the direct competitor

The evidence supports a distribution/newness explanation more than a demand-failure explanation.

1. **The FGC-facing launch is extremely recent.** The r/Fighters cross-game translator introduction displayed as six days old on 2026-08-24 ([post](https://www.reddit.com/r/Fighters/comments/1vhjd5l/community_tool_a_cross_game_main_translator_would/)). However, WhichMain's network predates that post: an SF6 privacy page says it was last updated in April 2026, and its migration report covers July 25 through August 24. The safe conclusion is that the consolidated FGC translator was only recently promoted there—not that the entire codebase was created six days ago.

2. **Its measured audience is dominated by non-FGC routes.** WhichMain's own [30-day migration report](https://whichmain.com/report/main-migration) claims 2,808 players and 8,076 character lookups. The busiest routes start with League of Legends, Overwatch, Marvel Rivals, Deadlock, Dota, and Valorant. FGC-origin "players shopping" counts are much smaller: Guilty Gear Strive 120, SF6 89, DBFZ 73, Tekken 8 70, GBVSR 67, and Marvel Tokon 62. These are first-party analytics with a disclosed salted-IP methodology, not independent traffic measurement.

3. **The brand has been fragmented across recommender microsites.** WhichMain links a network including lolrecommender.com, valorantrecommender.com, dotarecommender.com, rivalsrecommender.com, deadlockrecommender.com, owrecommender.com, and tokonrecommender.com. **Inference:** that architecture can build search traffic for individual games without making "WhichMain" a recognized FGC institution.

4. **The product language is broad competitive gaming, not visibly FGC-first.** Its shared catalog mixes fighters with MOBAs, shooters, battle royale games, and Monster Hunter. **Inference:** FGC players may encounter game-specific wikis, Discords, matchup sites, and social recommendations before a general competitive-game recommender.

5. **Character-fit advice is credibility-sensitive.** The creator's own launch thread immediately generated detailed objections about mappings and revealed one trait-group error. **Inference:** a recommender can be useful without becoming culturally authoritative; trust is earned match by match and game community by game community.

No independent awareness study was found. Claims about why people have not heard of the product are therefore reasoned inferences from launch timing, first-party traffic composition, brand architecture, and community response—not proven causal findings.

## The remaining market gap

### Defensible gap

MainStation can still occupy a coherent space if it treats recommendations as one payoff of a richer artifact:

- **Actual-main history:** primary, secondary, pocket, retired, learning, and team-slot choices rather than only a preference quiz.
- **Multi-signal synthesis:** infer from several mains across several games, with user-controlled weights and explicit reasons such as movement, pressure, execution feel, aesthetics, story, loyalty, or team utility.
- **Version-aware identity:** Storm in MvC2 is not interchangeable with every other Storm; a character record should be game/revision scoped.
- **FGC-native axes:** neutral preference, pressure structure, defense, movement, setplay, resource appetite, execution/motion tolerance, volatility, team role, assist dependence, and system preference. Generic "rushdown/zoner" labels are not enough.
- **Legacy and niche coverage:** MvC2 and UMVC3 are directly material to the proposed example and absent from WhichMain's current list. A catalog that treats older community-staple revisions as first-class is a real wedge.
- **Explainable paths:** "Ahri contributes mobile poke and playmaking; Ekko contributes movement, deception, and setup; together those signals point toward..." is more useful than a percentage alone.
- **Public identity and social discovery:** a clean URL/card showing a person's station of mains; nearby players with similar patterns; consensual "what your mains say" discussion; and shareable new-game recommendations.
- **Community correction with provenance:** separate authored tags, community votes, observed pick data, and disputed labels. Show confidence, evidence count, version, and disagreement instead of laundering opinion into a precise score.
- **Game discovery as well as character discovery:** recommend which fighting game or subgenre may fit a player, not only who to pick after the destination game is already chosen.

### Gap that is not defensible by itself

The following are already offered by WhichMain and should not be the headline moat:

- one character in game A -> ranked characters in game B;
- a broad playstyle-tag ontology;
- a questionnaire that returns a main in many games;
- same-game similar-character browsing;
- character comparison, trait filters, and secondary suggestions;
- account saving or a passport concept in some form.

## Risks

1. **Direct competition is live and moving quickly.** WhichMain already covers most current headline fighters and exactly matched two examples in the brief. A coverage race against a working solo catalog is a poor starting strategy.
2. **Taste is multi-causal.** Players may choose one main for mechanics, another for visual design, another for character loyalty, and another because their team needs an assist. Averaging names without capturing "why" can make the model worse than a human conversation.
3. **Cross-game equivalence is lossy.** Movement, defensive systems, team structure, input systems, and match pace change what the same archetype feels like. Recommendations must be framed as starting hypotheses, not truth.
4. **Version drift is both balance and identity drift.** Patches can change a kit, while sequels can radically change a returning character. Game, version, platform/revision where relevant, and observation date belong in the data model.
5. **Ontology maintenance is the real workload.** Hundreds of characters across many games require informed tagging, review, and updates. "A ton of games" is an operations commitment, not a launch feature.
6. **Cold start and selection bias.** Community data will initially overrepresent current releases, highly engaged players, popular characters, English-speaking scenes, and whichever communities the founder can reach.
7. **FGC trust is easy to lose.** Precise scores backed by opaque or shallow tags will be challenged. Disagreement, confidence, and evidence need first-class UI.
8. **Art, logos, names, and user data need deliberate policy.** Character artwork and game marks are owned by publishers. Public profiles introduce moderation, impersonation, deletion, privacy, and potentially age-related concerns. This report is not legal advice; asset and trademark plans need review before a public launch.
9. **The name needs formal clearance.** A web search found unrelated products using "MainStation/Main Station," including an A/V product and a discontinued model-railroad app, but no FGC product collision. That is not domain, corporate-name, or trademark clearance.

## Recommended product decision

### Go, if the product thesis becomes

> **MainStation is where fighting-game players record the characters that define them, understand the pattern across games, and find a credible starting point in the next one.**

The recommended first wedge is not a 30-game quiz. It is a compelling profile and multi-main inference loop across a deliberately chosen FGC set:

1. Let a user add actual mains/teams with status, version, and "why I play them."
2. Generate a shareable MainStation card and a human-readable taste profile.
3. Choose a target game and rank candidates from the whole weighted history, explaining which prior mains contributed which signals.
4. Let the user mark a suggestion as accurate, interesting-but-wrong, or wrong and say why.
5. Publish the recommendation's source tags, version, confidence, and community disagreement.
6. Start with a connected cluster that demonstrates the thesis and includes at least one gap competitor coverage misses—for example MvC2 and UMVC3 alongside 2XKO, Marvel Tokon, UNI2, and Avatar Legends—then expand through named release waves.

This wedge uses the founder's authentic FGC integration where it matters: initial ontology, nuance, recruitment of trusted reviewers, and distribution through real game communities. It avoids pretending personal authority can manually scale forever; contributor governance and provenance should be designed early.

### Do not proceed as

- "WhichMain, but with another name";
- an opaque AI chat box that invents comparisons;
- a broad static roster database;
- a promise to cover every fighter before the profile loop is proven;
- a recommendation engine that hides disagreement behind false numeric certainty.

## What should be validated before committing to a full build

1. Create 10-20 hand-authored multi-main profiles from real FGC players and compare MainStation-style aggregate recommendations against WhichMain's single-source results and ordinary human recommendations.
2. Interview the WhichMain creator or inspect an authenticated account, if appropriate, to resolve Passport/public-profile/multi-main capabilities before treating them as whitespace.
3. Test whether players value the public identity artifact even when they are not currently shopping for a new game; this determines retention beyond a one-time quiz.
4. Define a versioned character ontology on paper and tag the example cluster. Measure reviewer disagreement before building a scoring system.
5. Secure a practical asset policy and check the MainStation name/domain/trademark landscape through authoritative channels.

## Conclusion

The original observation is good enough that another builder arrived at nearly the same product and the same Ahri -> Hyde and Ekko -> Azula mappings. That is validation, not a reason to ignore the competitor.

MainStation remains reasonable only if its center of gravity is **identity built from many real mains**, not **translation from one character**. The strongest opportunity is an FGC-native, version-aware, explainable, social taste graph with legacy depth. The largest execution risk is not the web app; it is maintaining trusted character knowledge at scale while WhichMain keeps expanding.

---

## Source quality notes

- Product capabilities and counts are primarily from the products' own live pages, which are the strongest sources for what they claim to do but not independent proof of accuracy or adoption.
- WhichMain traffic figures are first-party and method-disclosed; no independent analytics were available.
- Reddit was used only for creator statements, visible community reactions, and evidence of recurring questions. It is explicitly weak evidence for market size or representative opinion.
- Search was English-language and web-indexed. Private Discord bots, closed communities, unindexed mobile apps, and account-only features may have been missed.
