# Character art audit: 2XKO, Marvel Tōkon, Avatar Legends, and Street Fighter 6

Retrieved: **2026-08-25**

## Scope and decision standard

This report audits the **29 character rows currently present in `supabase/seed.sql`** for four games: 15 for 2XKO, six for *Marvel Tōkon: Fighting Souls*, four for *Avatar Legends: The Fighting Game*, and four for *Street Fighter 6*. It does not propose additional roster rows.

Only first-party publisher, developer, game, and platform-publisher pages were used. A CDN URL is treated as first-party promotional material only when the official page itself maps the named character to that asset. Direct URL availability, a download button, attribution, and a transparent background are **not** treated as permission to republish.

Decision labels:

- **Conditional hold**: an affirmative policy may cover the use, but MainStation must first satisfy every stated condition. Do not ship the asset merely because the URL is available.
- **Blocked**: the located first-party terms do not grant this public website use, expressly exclude it, or require permission. Keep the character in `ART REVIEW` unless written permission or a separate applicable license is obtained.
- **Asset gap**: no first-party individual character cutout was found; the listed image is only the best official promotional fallback.

This is a provenance and permissions audit, not legal advice. Policies can change or be revoked.

## Disposition at a glance

| Game | Seed rows covered | Best first-party art located | Reuse finding for MainStation |
| --- | ---: | --- | --- |
| 2XKO | 15/15 | Official portrait card for every row; 11 PNG and four JPEG, all visually opaque | **Conditional hold (R1)**. Riot grants a revocable noncommercial community-project license, but MainStation's eligibility, original contribution, app/PWA treatment, trademark use, and required disclaimer still need confirmation. |
| Marvel Tōkon: Fighting Souls | 6/6 | Excellent official transparent character renders for all six | **Blocked (P1)**. PlayStation's applicable website terms prohibit public display, reuse in another website, and exploitation without express permission. |
| Avatar Legends: The Fighting Game | 4/4 | No official individual cutouts found. One Azula promotional screenshot and shared composite key art for Aang, Korra, and Zuko | **Blocked + asset gap (A1; Azula also P1)**. The official site says unauthorized use is prohibited, and the developer terms reserve rights and limit content to personal, noncommercial use. |
| Street Fighter 6 | 4/4 | Excellent official transparent character renders for all four | **Blocked (C1)**. Capcom's fan-content permission excludes processing or using its materials as-is without creative input. |

## 2XKO — 15 current seed rows

The [official 2XKO roster](https://2xko.riotgames.com/en-us/champions/) maps each champion to the asset below. Riot Games is the developer, publisher, rights-policy issuer, and asset host. PNG assets were inspected for alpha; despite the file extension, no transparent pixels were observed, so these should be treated as opaque portrait cards rather than cutouts.

| Seed slug | Character | Best official direct asset | Format / UI suitability | Publisher / creator | Official source page | Retrieved | Basis / disposition |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ahri` | Ahri | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/593043e42b15c4826f7e0fc2a0bea85a05cdd994-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/ahri/) | 2026-08-25 | R1 — **conditional hold** |
| `akali` | Akali | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/1705793c7046ee13bb9027b868a91e5b935095b6-472x630.jpg?accountingTag=2XKO) | JPEG, 472×630; opaque portrait card, lower resolution than peers | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/akali/) | 2026-08-25 | R1 — **conditional hold** |
| `blitzcrank` | Blitzcrank | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/5af8a16de4c87ea5bb8a3b3f945e90f3306a4cfe-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/blitzcrank/) | 2026-08-25 | R1 — **conditional hold** |
| `braum` | Braum | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/96bcb8cdcee7f3fd12b379c8517aa1f33504c371-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/braum/) | 2026-08-25 | R1 — **conditional hold** |
| `caitlyn` | Caitlyn | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7d7c3713add9fe798cc71ba66217a1a46d6634bc-780x1040.jpg?accountingTag=2XKO) | JPEG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/caitlyn/) | 2026-08-25 | R1 — **conditional hold** |
| `darius` | Darius | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/67e08591a957c9068e3b146976785fb8308d6cd4-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/darius/) | 2026-08-25 | R1 — **conditional hold** |
| `ekko` | Ekko | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f98dcc375555b36de58cc991c381c4fce641b636-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/ekko/) | 2026-08-25 | R1 — **conditional hold** |
| `illaoi` | Illaoi | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/12a5e9cea0ea7626b0d89e3740180f13341b5dc8-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/illaoi/) | 2026-08-25 | R1 — **conditional hold** |
| `jinx` | Jinx | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f0e8ed7da57962c1245dfca8c26a8a81ddab017d-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/jinx/) | 2026-08-25 | R1 — **conditional hold** |
| `senna` | Senna | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0606aa0ee6b494a762057c971c7bb642fe607bba-780x1040.jpg?accountingTag=2XKO) | JPEG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/senna/) | 2026-08-25 | R1 — **conditional hold** |
| `teemo` | Teemo | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0933542e8d4fc57628e7fe7dff9cd17d2ff457a4-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/teemo/) | 2026-08-25 | R1 — **conditional hold** |
| `thresh` | Thresh | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/2c9af0c83fd43c0a8f5258f75f8f197655971de9-780x1040.jpg?accountingTag=2XKO) | JPEG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/thresh/) | 2026-08-25 | R1 — **conditional hold** |
| `vi` | Vi | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/d69d95df23f8a7e5c951a1021f4f5b118fadaec3-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/vi/) | 2026-08-25 | R1 — **conditional hold** |
| `warwick` | Warwick | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/6aa9fb38660c1b63c37716c6f44739ba406b501f-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/warwick/) | 2026-08-25 | R1 — **conditional hold** |
| `yasuo` | Yasuo | [Direct official asset](https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7e9459768d4641533fdbfa1c0e84b6574d8e05ab-780x1040.png?accountingTag=2XKO) | PNG, 780×1040; opaque portrait card | Riot Games | [Roster](https://2xko.riotgames.com/en-us/champions/) · [Profile](https://2xko.riotgames.com/en-us/champions/yasuo/) | 2026-08-25 | R1 — **conditional hold** |

### R1 — Riot usage evidence

Riot's [Legal Jibber Jabber](https://www.riotgames.com/en/legal) grants a personal, nonexclusive, nonsublicensable, nontransferable, revocable, limited license to use and display Riot IP **strictly for noncommercial community use**, conditional on every rule in that policy and the linked Terms of Use. It also:

- requires a genuinely original community contribution rather than republishing existing work;
- restricts Riot logos and trademarks;
- prohibits unauthorized games and apps, with specific app-store language that makes MainStation's PWA/app characterization a material review point; and
- requires this conspicuous notice with the actual project title substituted: `[Project title] was created under Riot Games' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.`

The [2XKO Stream Kit](https://2xko.riotgames.com/en-us/news/announcements/2xko-stream-kit/) is a separate free resource for people streaming the game. Its stated scope is streaming, it contains only nine champion overlays, and it is **not** evidence that the 15 roster-page portraits are generally licensed for a website.

**Audit decision:** R1 is an affirmative but conditional candidate, not an accepted blanket license. Keep these rows on hold until the owner confirms that MainStation is a free noncommercial community project, that its PWA/web-app form is permitted, that it supplies sufficient original contribution, that no prohibited marks are used, and that the exact required notice is displayed. Riot may revoke the permission.

## Marvel Tōkon: Fighting Souls — six current seed rows

The [official PlayStation game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) and its [first-party character-selector code](https://www.playstation.com/content/dam/global_pdc/site-furniture/marvel-tokon-fighting-souls/character-selector/code/v81/character-selector.js) map each character to the transparent `big` render below. The images were fetched and their dimensions and alpha channels verified.

Sony Interactive Entertainment is the publisher and asset host; the game is a collaboration among PlayStation Studios, Arc System Works, and Marvel Games, with Arc System Works identified as the developer and Marvel as the underlying IP owner/licensor. No individual artist credit was published with these files.

| Seed slug | Character | Best official direct asset | Format / UI suitability | Publisher / creator | Official source page | Retrieved | Basis / disposition |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `magik` | Magik | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/magik-big-10-02-2026?$1600px--t$) | PNG response, 1600×1926, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |
| `spider-man` | Spider-Man | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/spider-man-big-20-11-2025?$1600px--t$) | PNG response, 1600×1925, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |
| `black-panther` | Black Panther | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/black-panther-big-21-04-2026?$1600px--t$) | PNG response, 1600×1925, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |
| `storm` | Storm | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/storm-big-20-11-2025?$1600px--t$) | PNG response, 1600×1926, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |
| `iron-man` | Iron Man | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/iron-man-big-16-02-2026?$1600px--t$) | PNG response, 1600×1925, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |
| `doctor-doom` | Doctor Doom | [Direct transparent render](https://gmedia.playstation.com/is/image/SIEPDC/dr-doom-big-20-11-2025?$1600px--t$) | PNG response, 1600×1835, transparent; excellent cutout | SIE / PlayStation (publisher, host); Arc System Works (developer); Marvel Games / Marvel (IP) | [Official game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) | 2026-08-25 | P1 — **blocked** |

### P1 — PlayStation usage evidence

The [PlayStation Website Terms of Use](https://www.playstation.com/en-us/legal/website-terms-of-use/) expressly apply to `playstation.com` and official sites for games published or operated by Sony Interactive Entertainment. They state that site content, including images, is owned by SIE, affiliates, licensors, or suppliers; permission is limited to normal browsing and personal, noncommercial use; and users do not have permission to distribute it, publicly display it, use it to create another website or database, or otherwise exploit it without express permission. The restriction applies even where the site lets a visitor download or save content.

**Audit decision:** the six renders are technically ideal but not cleared for MainStation. A public CDN path and a transparent-image parameter do not change P1. Written permission or a separate asset-specific license is required.

## Avatar Legends: The Fighting Game — four current seed rows

No first-party individual transparent render was located for any of these four seed characters on the [official game site](https://avatarfighters.com/) or the [PM Studios publisher page](https://www.pm-studios.com/games/avatar-legends-the-fighting-game). The best official fallbacks are therefore promotional composites, not production-ready character cutouts.

Gameplay Group International is the developer/creator; PM Studios is identified as publisher on its game page. Paramount's [2026 shareholder materials](https://ir.paramount.com/node/73246/html) describe Paramount Games as a publisher and identify *Avatar Legends: The Fighting Game* as its latest release, supporting the co-publisher attribution used below. Viacom International/Paramount owns the Avatar character IP. Where an asset is hosted by PlayStation Blog, PlayStation is identified only as the promotional host, not as the game's publisher.

| Seed slug | Character | Best official direct asset | Format / UI suitability | Publisher / creator | Official source page | Retrieved | Basis / disposition |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `azula` | Azula | [Direct official promotional screenshot](https://live.staticflickr.com/65535/55168531880_df00c7e87a_k.jpg) | JPEG, 1920×1080; Azula is prominent but the image is a full combat screenshot, not a transparent cutout | Gameplay Group International (developer); PM Studios + Paramount Games (publishers); Viacom/Paramount (IP); PlayStation Blog (host) | [Official PlayStation Blog feature](https://blog.playstation.com/2026/03/30/avatar-legends-the-fighting-game-elemental-bending-breakdown/) | 2026-08-25 | A1 + P1 — **blocked; asset gap** |
| `aang` | Aang | [Direct official publisher key art](https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg) | JPEG, 2560×1707; Aang appears in a six-character composite, not an individual cutout | Gameplay Group International (developer); PM Studios + Paramount Games (publishers); Viacom/Paramount (IP) | [PM Studios game page](https://www.pm-studios.com/games/avatar-legends-the-fighting-game) | 2026-08-25 | A1 — **blocked; asset gap** |
| `korra` | Korra | [Direct official publisher key art](https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg) | JPEG, 2560×1707; Korra appears in a six-character composite, not an individual cutout | Gameplay Group International (developer); PM Studios + Paramount Games (publishers); Viacom/Paramount (IP) | [PM Studios game page](https://www.pm-studios.com/games/avatar-legends-the-fighting-game) | 2026-08-25 | A1 — **blocked; asset gap** |
| `zuko` | Zuko | [Direct official publisher key art](https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg) | JPEG, 2560×1707; Zuko appears in a six-character composite, not an individual cutout | Gameplay Group International (developer); PM Studios + Paramount Games (publishers); Viacom/Paramount (IP) | [PM Studios game page](https://www.pm-studios.com/games/avatar-legends-the-fighting-game) | 2026-08-25 | A1 — **blocked; asset gap** |

### A1 — Avatar / Gameplay Group usage evidence

The [official game-site footer](https://avatarfighters.com/) says its content and intellectual property belong to Gameplay Group International or their respective owners and that unauthorized use is strictly prohibited. It separately reserves PM Studios' rights and identifies Viacom International's rights in the Avatar titles, logos, and characters. The site links directly to the [Gameplay Group Terms of Service](https://thegameplaygroup.com/terms-of-service), which state that game content is licensed only on a limited, nonexclusive, nontransferable, nonsublicensable, revocable basis for personal, noncommercial use, with all ungranted rights reserved to the company and its licensors.

The Azula screenshot is also subject to P1 because the official source and download host are part of PlayStation's promotional page. The article's “download this image” control is a technical convenience, not permission to republish.

**Audit decision:** there is neither a suitable official individual cutout nor an affirmative public-website reuse license for these four rows. Do not crop the composites into character art or mirror the screenshot without permission; attribution would not cure the missing grant.

## Street Fighter 6 — four current seed rows

Each official character profile loads the transparent PNG below. CAPCOM CO., LTD. is the developer, publisher, rights holder identified by the official title site, and asset host. Dimensions and alpha channels were verified from the image responses.

| Seed slug | Character | Best official direct asset | Format / UI suitability | Publisher / creator | Official source page | Retrieved | Basis / disposition |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `ken` | Ken | [Direct transparent render](https://www.streetfighter.com/6/assets/images/character/ken/ken.png) | PNG, 1281×1464, transparent; excellent cutout | CAPCOM CO., LTD. | [Official profile](https://www.streetfighter.com/6/en-us/character/ken) | 2026-08-25 | C1 — **blocked** |
| `chun-li` | Chun-Li | [Direct transparent render](https://www.streetfighter.com/6/assets/images/character/chunli/chunli.png) | PNG, 1030×1645, transparent; excellent cutout | CAPCOM CO., LTD. | [Official profile](https://www.streetfighter.com/6/en-us/character/chunli) | 2026-08-25 | C1 — **blocked** |
| `akuma` | Akuma | [Direct transparent render](https://www.streetfighter.com/6/assets/images/character/gouki_akuma/gouki_akuma.png) | PNG, 1295×1578, transparent; excellent cutout | CAPCOM CO., LTD. | [Official profile](https://www.streetfighter.com/6/en-us/character/gouki_akuma) | 2026-08-25 | C1 — **blocked** |
| `juri` | Juri | [Direct transparent render](https://www.streetfighter.com/6/assets/images/character/juri/juri.png) | PNG, 1322×1155, transparent; excellent cutout | CAPCOM CO., LTD. | [Official profile](https://www.streetfighter.com/6/en-us/character/juri) | 2026-08-25 | C1 — **blocked** |

### C1 — Capcom usage evidence

Capcom's [Fan Content Guidelines](https://www.capcom-games.com/en/fan-content-guidelines/) permit qualifying noncommercial **derivative works** that add the user's own creativity, but expressly exclude processing or using Capcom materials as-is or without creative input from the permissions granted by those guidelines. The guidelines also exclude Capcom logos and game-title logos, apply only to Capcom-owned IP, prohibit misleadingly official presentation, and remain revocable.

The [Capcom USA Terms of Use](https://www.capcomusa.com/terms/) provide useful corroboration, although their stated scope is Capcom USA and other sites that link to those terms: they permit browsing and personal noncommercial use but withhold permission to publicly display site content, use it to create another website, or publish/exploit it without express permission.

**Audit decision:** placing an official render unchanged into MainStation is the exact “materials as is” scenario that the global fan-content permission does not cover. These renders need express permission or a separate applicable asset license. They are also protected against casual hotlinking: during verification, the direct URLs returned HTTP 403 without the matching official character-page referrer. Even if permission is obtained, mirror approved files to project-controlled storage rather than depending on the publisher CDN.

## Gaps, uncertainties, and implementation guardrails

- **No row is unconditionally cleared by this audit.** R1 is conditional and requires a product-level compliance decision; P1, A1, and C1 are blocked absent another grant or written permission.
- **Attribution is not a license.** Publisher/creator labels in this report document provenance only. They do not convert a restricted asset into a reusable one.
- **Do not hotlink publisher CDNs.** URL stability is not promised, Capcom currently enforces referrer-dependent access, and every owner can change or remove an asset. Only copy an asset into MainStation after the relevant permission gate is satisfied.
- **2XKO transparency gap:** the official roster's PNG files are opaque portrait compositions, not transparent cutouts. The Akali file is also only 472×630.
- **Avatar asset gap:** no first-party per-character transparent artwork was found for Azula, Aang, Korra, or Zuko. The three repeated key-art links are deliberately the same composite, not a claim of individual artwork.
- **Roster drift is outside this task:** the official Marvel page now advertises 20 launch characters while the seed contains six, and the PM Studios Avatar page advertises 12 playable fighters while the seed contains four. Street Fighter 6's official roster is also broader than the four audited seed rows. This report maps all current seed rows, not every currently announced fighter.
- **Marvel creator granularity:** the official page identifies the collaborating companies but does not credit the individual artist responsible for these renders. Do not invent an artist attribution.
- **Policy freshness:** all URLs and policy text were checked on 2026-08-25. Preserve the retrieval date in any future provenance record and re-check the controlling terms immediately before release.

## Recommended seed disposition

| Usage code | What may be recorded now | What must not be recorded yet |
| --- | --- | --- |
| R1 | Publisher, source page, direct candidate URL, retrieval date, and `conditional review` status | Do not label “licensed” or ship the art until every Riot condition and the required notice are confirmed. |
| P1 | Publisher/creator provenance, candidate URL, retrieval date, and `permission required` | Do not publish, mirror, crop, or mark reusable without express permission. |
| A1 | Developer/publisher/IP-owner provenance, fallback promotional URL, retrieval date, `asset gap`, and `permission required` | Do not treat personal noncommercial access or attribution as public-display permission. |
| C1 | Capcom provenance, candidate URL, retrieval date, and `permission required` | Do not treat fan-derivative-work permission as permission to reuse official renders unchanged. |
