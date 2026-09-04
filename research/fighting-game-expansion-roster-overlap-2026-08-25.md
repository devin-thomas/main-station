# Fighting-game expansion: roster-overlap research

Research cutoff: 2026-08-25. This is a data-collection report, not an implementation plan.

## Result

MainStation currently contains 13 verified game versions and 410 character rows. The smallest possible character-data delta is **zero new canonical character identities**. Seventeen released fighting-game versions meet that condition under the boundaries below. The practical cost is still not zero: each added game needs version metadata, one game-specific character row per selectable fighter, selection-schema work, and a new source/art review. "0" only means that every fighter already has a matching canonical identity somewhere in the current catalog.

| Additional canonical identities | Candidate version | Current-catalog coverage / required additions | Version boundary and source quality |
| ---: | --- | --- | --- |
| 0 | Super Smash Bros. (Nintendo 64) | All 12 fighters are in `melee`: Mario, Luigi, Donkey Kong, Link, Samus, Yoshi, Kirby, Fox, Pikachu, Jigglypuff, Ness, Captain Falcon. | Nintendo’s product page identifies it as the original tournament fighter and names the twelve fighters. [Nintendo](https://www.nintendo.com/en-gb/Games/Nintendo-64/Super-Smash-Bros-269756.html) |
| 0 | Street Fighter II: The World Warrior | Eight normal selectable fighters: Ryu, Ken, Chun-Li, E. Honda, Blanka, Guile, Zangief, Dhalsim. The four Shadaloo bosses are not selectable in this version. | Capcom’s current classic-game page identifies this exact 1991/1992 fighting-game version. [Capcom Town](https://captown.capcom.com/en/classic_games/23) |
| 0 | Guilty Gear (1998) | The ten playable identities are all in `ggxxacpr` (Sol through Justice). | Arcade/console release and boss/unlock rules must be frozen before seeding; identity overlap is complete. Arc System Works establishes +R’s 25-character superset. [Arc System Works](https://www.arcsystemworks.com/game/guilty-gear-xx-accent-core-plus-r/) |
| 0 | Guilty Gear X | Its standard plus console-unlock cast is wholly contained in `ggxxacpr`. | Treat Justice as a separately selectable identity only for the applicable console boundary; still no new identity. [Arc System Works +R roster context](https://www.arcsystemworks.com/game/guilty-gear-xx-accent-core-plus-r/) |
| 0 | Guilty Gear XX #Reload | Its 20 standard selectable characters are a subset of `ggxxacpr`. | Do not silently include Accent Core additions (A.B.A, Order-Sol, Kliff, Justice). [Arc System Works +R roster context](https://www.arcsystemworks.com/game/guilty-gear-xx-accent-core-plus-r/) |
| 0 | Guilty Gear Xrd -SIGN- | Its roster is covered by `ggxxacpr` plus `ggst` (including Ramlethal, Bedman?, Sin, and Elphelt where applicable). | Arcade and later console additions have different counts; select one release before row generation. [Arc System Works REV 2 page](https://www.arcsystemworks.com/game/guilty-gear-xrd-rev-2/) establishes the immediately following version/series boundary. |
| 0 | UNDER NIGHT IN-BIRTH (original) | All original UNI fighters occur in `uni2`. | Exact arcade/home release must be recorded, but all are legacy UNI identities. [Official UNI2 character site](https://www.arcsystemworks.jp/uni2celes/en/character/) |
| 0 | UNDER NIGHT IN-BIRTH Exe:Late | All fighters occur in `uni2`. | Official character-manual pages substantiate individual legacy fighters, e.g. [Hyde](https://www.arcsystemworks.jp/unist/manual-ps4/character/hyde.html) and [Eltnum](https://www.arcsystemworks.jp/unist/manual-ps4/character/eltnum.html). |
| 0 | UNDER NIGHT IN-BIRTH Exe:Late[st] | All 20 standard fighters occur in `uni2`. | Do not fold in later CLR-only Londrekia unless the selected game is CLR. [Official Exe:Late[st] manual](https://www.arcsystemworks.jp/unist/manual-ps4/character/akatsuki.html) |
| 0 | UNDER NIGHT IN-BIRTH Exe:Late[cl-r] | All 21 fighters occur in `uni2`, including Londrekia. | This is the cleanest legacy-UNI selection if a full legacy release is desired. [Official UNI2 character site](https://www.arcsystemworks.jp/uni2celes/en/character/) |
| 0 | X-Men: Children of the Atom | Every standard selectable X-Men fighter is already represented by `mvc2` (including the game’s non-regular selectable/secret fighters when modeled as fighters). | Included as a distinct game in Capcom’s official MVC Fighting Collection manual. [Capcom manual](https://game.capcom.com/manual/MVCFC/en/switch/top) |
| 0 | Marvel Super Heroes | Every selectable Marvel fighter is in `mvc2`/`umvc3`/`marvel-tokon`. | Keep Doom/Thanos boss handling version-specific rather than automatically treating CPU-only material as a roster entry. [Capcom manual](https://game.capcom.com/manual/MVCFC/en/switch/top) |
| 0 | X-Men vs. Street Fighter | Standard selectable roster is fully covered by `mvc2`. | Officially included in the current Capcom collection/manual. [Capcom manual](https://game.capcom.com/manual/MVCFC/en/switch/top) |
| 0 | Marvel Super Heroes vs. Street Fighter | Standard selectable roster is fully covered by `mvc2`. | Official manual has the game-specific boundary. [Capcom manual](https://game.capcom.com/manual/MVCFC/en/switch/page/5/1) |
| 0 | Marvel vs. Capcom: Clash of Super Heroes | Standard international roster is fully covered by `mvc2`/`umvc3`. | **Regional exception:** Japanese arcade/console material with Norimaro requires one additional identity; do not label that version zero-delta. [Capcom manual](https://game.capcom.com/manual/MVCFC/en/switch/top) |
| 0 | Mortal Kombat (1992) | Seven normal selectable fighters are all current MK1 main-fighter or Kameo identities. | Excludes hidden Reptile and Shang Tsung/Goro CPU-boss rules unless a documented selectable port is chosen. MK1’s official roster confirms the current identity pool. [MK1 roster](https://www.mortalkombat.com/en-ca/roster) |
| 0 | Mortal Kombat II | Twelve normal selectable fighters are all current MK1 main-fighter or Kameo identities. | Excludes Kintaro/Shao Kahn CPU bosses; a port-specific hidden-character policy remains necessary. [MK1 FAQ](https://www.mortalkombat.com/en-us/faq) |

## Lowest non-zero additions

These are the next smallest deltas after the zero-new-identity set. Counts are **identity** counts, not a promise that a current character row can be copied unchanged across games.

| Additional identities | Candidate version | New identity/identities | Evidence and caveat |
| ---: | --- | --- | --- |
| 1 | Darkstalkers: The Night Warriors | Huitzil / Phobos | The rest of its standard roster is present through `vampire-savior`; Capcom lists this exact game in Fighting Collection. [Capcom](https://us-store.captown.capcom.com/products/600227-us) |
| 1 | Guilty Gear Isuka | Leopaldon | Steam’s publisher listing says the #Reload cast returns and identifies A.B.A, Robo-Ky Mk. II, and new Gear Leopaldon. A.B.A/Robo-Ky already exist; Leopaldon does not. Its four-player/brawler mode should be explicitly supported by the catalog schema. [Steam / Arc System Works](https://store.steampowered.com/app/267900/) |
| 2 | Street Fighter II': Champion Edition | Balrog and Vega | The original eight are already covered; the four bosses become playable, of whom M. Bison and Sagat are current but Balrog/Vega are absent. Use the non-regional international names/identities consistently. [Capcom SFII context](https://captown.capcom.com/en/classic_games/23) |
| 2 | Super Gem Fighter Mini Mix | Ibuki and Tessa | The remaining selectable fighters are represented by the current Street Fighter, Darkstalkers, and Mega Man/UMVC3 pools. Capcom includes it in Fighting Collection. [Capcom](https://us-store.captown.capcom.com/products/600227-us) |
| 3 | Guilty Gear Xrd REV 2 | Answer, Raven, Kum Haehyun | All other REV 2 fighters are current GG identities; official page says 25 fighters and identifies Baiken/Answer as the new REV 2 characters. [Arc System Works](https://www.arcsystemworks.com/game/guilty-gear-xrd-rev-2/) |
| 3 | Mortal Kombat 3 | Kabal, Nightwolf, Sheeva | Standard MK3 roster is otherwise covered by MK1 fighter/Kameo identities. Smoke form and boss/hidden rules vary by version and must not be collapsed into this count without a stated policy. [MK1 roster](https://www.mortalkombat.com/en-ca/roster) |
| 3 | Night Warriors: Darkstalkers’ Revenge | Donovan, Huitzil / Phobos, Pyron | Other standard selectable identities are already in `vampire-savior`; Capcom lists this exact version in Fighting Collection. [Capcom](https://us-store.captown.capcom.com/products/600227-us) |
| 3 | Vampire Savior 2: The Lord of Vampire | Donovan, Huitzil / Phobos, Pyron | Same three legacy characters absent from MainStation; Japanese-version-only collection entry, so region must be encoded. [Capcom](https://us-store.captown.capcom.com/products/600227-us) |
| 4 | Super Street Fighter II: The New Challengers | Balrog, Vega, Fei Long, T. Hawk | Cammy and Dee Jay already exist; Capcom confirms the version adds four new characters. [Capcom Town](https://captown.capcom.com/en/classic_games/30) |

## Related series and why they are not low-delta additions

| Existing catalog anchor | Eligible related fighting-game families checked | Finding |
| --- | --- | --- |
| Marvel / Capcom | Marvel vs. Capcom Infinite, Tatsunoko vs. Capcom, Capcom vs. SNK, Street Fighter Alpha/III/IV/V, Street Fighter X Tekken, Capcom Fighting Evolution | They share many catalog characters but introduce materially larger new casts. MVCI is the nearest of these, but its complete/DLC roster still adds multiple new identities (Captain Marvel, Ultron, Mega Man X, Winter Soldier, Sigma, Black Widow, Monster Hunter); do not present it as near-zero. |
| Darkstalkers | Vampire Hunter 2, Cyberbots, Red Earth | Vampire Hunter 2 has the same three missing Darkstalkers identities above; Cyberbots/Red Earth mostly require new casts. The Capcom collection is a first-party title/version inventory. [Capcom](https://us-store.captown.capcom.com/products/600227-us) |
| Guilty Gear | Revelator, Overture, Judgment | Revelator sits between SIGN and REV 2 but still includes the three missing identities once its final roster is selected. Overture/Judgment are not conventional roster fighting-game fits and should not be added merely for franchise overlap. |
| UNI2 | BlazBlue Cross Tag Battle, Akatsuki Blitzkampf | They share UNI fighters (and Akatsuki/Eltnum) but are crossover games with much larger otherwise-new rosters. |
| Smash / Nintendo | Brawl, Smash for 3DS/Wii U, Ultimate | They retain Melee fighters, but their expanded casts make the new-character burden much larger; Ultimate also has complicated third-party licensed identities. Nintendo explicitly documents third-party DLC such as Kazuya and Terry. [Nintendo DLC page](https://smashbros.nintendo.com/buy/dlc/) |
| Mortal Kombat | UMK3/Trilogy, MK4 through MK11, MK vs. DC, Injustice | All have overlap, but after MK3 they add enough legacy/guest identities that a title-by-title extraction is needed before claiming a small delta. MK1’s guest-heavy roster itself shows why identity overlap is not a rights or implementation shortcut. [MK1 FAQ](https://www.mortalkombat.com/en-us/faq) |
| Tekken 8 | Tekken 1-7, Tag Tournament 1/2, Soulcalibur (Yoshimitsu) | Tekken games reuse many Tekken 8 fighters, but no checked version beats the low-delta table after accounting for missing legacy characters and form/Jack model distinctions. Soulcalibur shares Yoshimitsu but has an otherwise new roster. |
| Avatar Legends | Nickelodeon All-Star Brawl 1/2 | Avatar fighters overlap, but these are much broader licensed crossover rosters. Treat them as a separate licensing/source project, not an economical roster extension. |
| 2XKO | League of Legends crossover appearances | No separate released conventional fighting-game candidate with a complete playable roster was found that reuses 2XKO champions without a much larger third-party cast; cosmetic crossovers are excluded. |

## Method and boundaries

1. Baseline is the checked roster arrays in [`src/data/completeRosters.ts`](../src/data/completeRosters.ts) and the source-backed audit in [`character-roster-completeness-2026-08-25.md`](character-roster-completeness-2026-08-25.md). This report compares canonical identities, normalizing clear display variants such as `Dizzy`/`Queen Dizzy` and MK1 fighter/Kameo roles.
2. A candidate is a released, combat-focused game/version with selectable fighters. Compilations are evidence for included versions, not separate catalog entries; beat-'em-ups, puzzle games, cosmetic skins, assist-only characters, CPU-only bosses, and announced/unreleased fighters are excluded unless the exact selected version makes them selectable.
3. Counts intentionally do not merge materially different identities (for example Mega Man and Mega Man X, or Huitzil and Phobos only where the game uses that one character). They also do not treat a guest character as automatically reusable merely because MainStation already records it elsewhere.
4. For old arcade titles, publisher pages frequently prove the game/version but expose the roster as images or an in-game manual instead of a machine-readable index. The delta is therefore a manually transcribed, version-bounded data claim cross-checked against the existing completeness report; a seed migration should re-check each final selected platform/region.

## Licensed-character and provenance caveat

Roster overlap is **not** a content-rights conclusion. Marvel, Nintendo, Avatar, guest-MK, SNK, and third-party Smash characters each need source, attribution, art, and usage review for the new game row even when the identity already exists in MainStation. Likewise, adding a character as a MK1 Kameo does not establish that it may be modeled as a full fighter without a game-specific source and role decision.

## Recommended data handoff

The strongest data-first expansion batch is the zero-delta set, but it should be split by selection-schema family rather than entered as one undifferentiated import: solo fighters (SFII, most GG/UNI/MK), 1v1 Marvel titles, and platform fighters (SSB64). The source pages above establish the official title/version boundaries; final import work should capture a per-game roster transcript, region/platform choice, boss/hidden-character policy, and rights review.
