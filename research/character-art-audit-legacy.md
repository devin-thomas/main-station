# Character Art Audit: MVC2, UMVC3, Melee, Vampire Savior, and MK1

Audit date: 2026-08-25<br>
Seed inspected: `supabase/seed.sql` in the current MainStation workspace<br>
Scope: the 21 character rows currently seeded for `mvc2`, `umvc3`, `melee`, `vampire-savior`, and `mk1`<br>
Research boundary: primary/first-party publisher, developer, and official game sites only

## Result

- All 21 current seed rows were audited.
- Sixteen rows have a live, version-matched, first-party direct character-art asset: MVC2 (4), UMVC3 (3), Vampire Savior (4), and MK1 (5).
- Five rows lack a version-matched first-party direct asset: UMVC3 Doctor Doom and all four Melee rows. This report supplies transparent, first-party cross-version candidates, but they should remain art-review items rather than being represented as exact game art.
- Every direct candidate below returned HTTP 200 on 2026-08-25. All have usable transparency. The Smash URLs end in `.png`, although the server can content-negotiate WebP to a modern browser.
- No publisher source reviewed gives an unambiguous blanket grant to copy the unmodified art into a public web app. The MK1 Kommunity Kit is the strongest distribution signal, and the UMVC3 post explicitly invites fan-created work, but neither clearly grants this specific as-is app use.
- MainStation's internal official-promotional-art decision in [`ADR.md`](../ADR.md) and [`Context.md`](../Context.md) can be the project's accepted risk basis. It is not permission from a rights holder. The current database constraint only accepts `express-fan-kit`, `conditional-fan-kit`, `written-permission`, or `community-licensed`; none honestly describes ordinary official promotional art without an express reuse grant.

This is a provenance and terms audit, not legal advice or a rights clearance.

## Exact retrieval manifest

These hashes identify the exact bytes checked on 2026-08-25, not a visually equivalent conversion. Retrieval used `Accept-Encoding: identity`, a current browser user agent, the official source page as `Referer`, and the explicit media `Accept` value shown below. Melee and UMVC3 Doctor Doom remain cross-version fallbacks despite having exact candidate hashes.

| Seed row | Direct candidate URL | Exact representation | Bytes | Dimensions / alpha | SHA-256 |
| --- | --- | --- | ---: | --- | --- |
| `mvc2/storm` | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/storm.png> | `image/png` | 1,211,214 | 1280x1162; alpha | `sha256:ccb6b88438a76bc7d61831a3171fa8cd14eec18c006d5f73f555c94e8e13ade6` |
| `mvc2/magneto` | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/magneto.png> | `image/png` | 1,352,571 | 1280x1162; alpha | `sha256:419c3f9d88276fd2d65c10f21f4b930f80e871cba719d55b3e522370f73e58c2` |
| `mvc2/sentinel` | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/sentinel.png> | `image/png` | 1,350,477 | 1280x1162; alpha | `sha256:693e4b48a209f9656dbf37ba970c4c242d84d4d985f93de00ffe72b6f7d99c2a` |
| `mvc2/cable` | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/cable.png> | `image/png` | 818,617 | 1280x1162; alpha | `sha256:c76a8626ac3e2908044ed3688d91459d7cadb54f5db5b54a6d8b96e27d94ce54` |
| `umvc3/zero` | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/2f7319c0e9932a47d0e9db7ef453ec4f.png> | `image/png` | 6,791,915 | 5312x5315; alpha | `sha256:66f595785490a5e6cadb6e05607b26bc8b1ef0fb9d718c21b0de789d5ee73b7e` |
| `umvc3/vergil` | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/b910a3cc3952012c7111b152af718e2f.png> | `image/png` | 6,833,581 | 5079x5079; alpha | `sha256:4dfdd583f5462e8db772896c825170bf4c2fc1d39a54aea376dd0cc2f63477c3` |
| `umvc3/doom` (MVC2 fallback) | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/doctor_doom.png> | `image/png` | 1,220,369 | 1280x1162; alpha | `sha256:2867aaa52ef1094fbdfd24d961fd6e904182e2631a71591fb30f75029420b5a2` |
| `umvc3/dante` | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/893d1dc95c1896f2177e84bea51dad7d.png> | `image/png` | 5,007,975 | 4252x5433; alpha | `sha256:6641ca935f62229c8e1f416315711ff606366ebbab375882b4869b0b18e4cb95` |
| `melee/fox` (Ultimate fallback) | <https://www.smashbros.com/assets_v2/img/fighter/fox/main.png> | `image/png`; strict `Accept: image/png` | 1,764,850 | 1374x1537; alpha | `sha256:67db02396021221a109fff6b83940b5879705a77e07cb2740d90b50fb00add82` |
| `melee/marth` (Ultimate fallback) | <https://www.smashbros.com/assets_v2/img/fighter/marth/main.png> | `image/png`; strict `Accept: image/png` | 1,947,557 | 1676x1749; alpha | `sha256:0437c89299459e11811e76e3b322a851d00619e93c5b55c9437ace13dfb3b1a4` |
| `melee/falco` (Ultimate fallback) | <https://www.smashbros.com/assets_v2/img/fighter/falco/main.png> | `image/png`; strict `Accept: image/png` | 1,760,253 | 1374x1672; alpha | `sha256:a616cc0cba78d999dec0eb1d43dee61117dd5e9decae0ed2a8a5e47262505d03` |
| `melee/sheik` (Ultimate fallback) | <https://www.smashbros.com/assets_v2/img/fighter/sheik/main.png> | `image/png`; strict `Accept: image/png` | 2,145,415 | 1604x1873; alpha | `sha256:1bc2bbceb4a1caacd3944c5d556243a401cc587b2b00bf7c672e7c4642ca941e` |
| `vampire-savior/morrigan` | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/9-e.png> | `image/png` | 89,343 | 1200x946; palette alpha | `sha256:953ea42cbc7b84d930ec056985768ef4c0bced4f90a6373dc6ec852cdd6d80d9` |
| `vampire-savior/jedah` | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/0-e.png> | `image/png` | 104,750 | 1200x948; palette alpha | `sha256:64b1f9913b9ac101d1e2643147adada5b786826a1bb3f3610b60d09d60e69373` |
| `vampire-savior/bulleta` | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/1-e.png> | `image/png` | 82,307 | 1200x894; palette alpha | `sha256:a1cdaee20de0e86fc7c9697ceae141fb45de5f4369ebc916c11529ef04b2cb78` |
| `vampire-savior/q-bee` | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/3-e.png> | `image/png` | 84,530 | 1200x956; palette alpha | `sha256:78bdb1a0805b0031cb3a1f18644da2bd92a8d467f5c420e42d22181d93247b79` |
| `mk1/scorpion` | <https://cdn-mk1.mortalkombat.com/roster/scorpion/hero.webp> | `image/webp` | 88,340 | 1280x1280; alpha | `sha256:dd4235ccd1b35ab31986473ab94ffb45e79c657a570780ab13f7708466e756cc` |
| `mk1/sub-zero` | <https://cdn-mk1.mortalkombat.com/roster/sub-zero/hero.webp> | `image/webp` | 106,850 | 1280x1280; alpha | `sha256:876ce25cd0bc55849f48dd2c96ff8053fa778a20a9ff1f4a3d55d7018af84cff` |
| `mk1/mileena` | <https://cdn-mk1.mortalkombat.com/roster/mileena/hero.webp> | `image/webp` | 99,984 | 1280x1280; alpha | `sha256:25f601067356c7b1fff6fddcdf68f1550364a07a7565cde68ae82cbd069e9fce` |
| `mk1/sonya` | <https://cdn-mk1.mortalkombat.com/roster/kameos/sonya.webp> | `image/webp` | 18,364 | 480x520; alpha | `sha256:ad51c7cb6e3929558eb60c8b885582695b4922f34683a8299108104789abfd9b` |
| `mk1/kano` | <https://cdn-mk1.mortalkombat.com/roster/kameos/kano.webp> | `image/webp` | 23,172 | 480x520; alpha | `sha256:b3876a74989be498442d16bd366282a754b93f67924879a3f28db13881241034` |

### Retrieval and hotlink behavior

- `www.capcom-games.com` MVC Fighting Collection and Capcom Fighting Collection asset paths are user-agent sensitive: a default Python `requests` user agent returned HTTP 403, while a current browser user agent returned HTTP 200 both with and without a `Referer`. No strict referrer requirement was observed, but use the matching official page as the retrieval referrer and localize rather than depending on hotlinks.
- `cdn.capcom-unity.com`, `www.smashbros.com`, and `cdn-mk1.mortalkombat.com` returned the tested assets without a referrer. This is an availability observation, not authorization to hotlink.
- `www.smashbros.com` performs content negotiation. A broad modern browser `Accept` header returned a smaller WebP body even though the URL ends in `.png`; `Accept: image/png` returned the PNG bytes and hashes recorded above. Verify the response MIME type before assigning a file extension or hash.
- Upstream availability and byte identity can change without notice. Production should use reviewed local copies and retain these first-party URLs only as provenance.

## Evidence classes

| Code | First-party evidence | What it supports | What it does not support |
| --- | --- | --- | --- |
| `CAPCOM-MVC` | [Official MVC2 collection page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2), [Capcom site terms](https://www.capcom-games.com/en/terms/), and [Capcom fan-content guidelines](https://www.capcom-games.com/en/fan-content-guidelines/) | The files are official promotional character art served by Capcom. The page carries the Marvel rights notice. | The terms reserve reuse rights. The fan-content guidelines exclude third-party IP and say unchanged/as-is materials are not covered derivative works. That is especially material for these four Marvel characters. No express app-reuse grant was found. |
| `CAPCOM-UMVC3` | [Official Capcom News high-resolution art post](https://news.capcomusa.com/mikeeb13/blog/2012/01/03/new_ultimate_marvel_vs._capcom_3_-_high-res_character_art), [Capcom USA terms](https://www.capcomusa.com/terms/), and [Capcom fan-content guidelines](https://www.capcom-games.com/en/fan-content-guidelines/) | The post identifies the linked images as high-resolution UMVC3 character art and invites fan-created art, custom sticks, and wallpapers. | The invitation is informal and directed at fan creations. Current Capcom USA terms limit site content to browsing/personal noncommercial use and specifically withhold public display and use to create a website. Current fan guidelines do not cover unchanged asset reuse and exclude third-party IP. No express app-reuse grant was found. |
| `CAPCOM-VSAV` | [Official Vampire Savior collection page](https://www.capcom-games.com/cfc/en-us/title/vampire-s.html), [Capcom site terms](https://www.capcom-games.com/en/terms/), and [Capcom fan-content guidelines](https://www.capcom-games.com/en/fan-content-guidelines/) | The files are version-matched promotional art served from Capcom's official title page. | Capcom's terms reserve copying, adaptation, distribution, public transmission, and republication absent permission. The fan-content guidelines do not authorize unchanged asset reuse. No express app-reuse grant was found. |
| `NINTENDO-SMASH` | Individual [official Super Smash Bros. Ultimate fighter pages](https://www.smashbros.com/en_US/fighter/index.html), [Nintendo terms](https://www.nintendo.com/us/terms-of-use/ncl/), and [Nintendo Game Content Guidelines](https://www.nintendo.co.jp/networkservice_guideline/en/index.html) | The candidate renders are first-party Nintendo promotional assets with transparent backgrounds. | They are Ultimate renders, not Melee renders. Nintendo's site license is personal-use only and excludes distribution/public display. The Game Content Guidelines address creator-posted gameplay, screenshots, and promotional materials on sharing platforms, not an app's copied art catalog. No express app-reuse grant was found. |
| `WB-MK1` | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster), its officially linked [Esports Kommunity Kit](https://drive.google.com/file/d/1H5mzLqwYpyhhnsBvUVteQy8srn-wgz8R/view?usp=sharing), and [Warner Bros. terms](https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html) | The roster CDN files are official. The official site distributes a community/esports archive containing NRS-character PNGs and a 2024 brand style guide, which is a stronger intended-community-use signal than an ordinary page scrape. | The archive and style guide contain usage instructions but no stand-alone copyright license or clear grant for an unrelated public app. Warner Bros. terms limit service/content use to personal noncommercial use and reserve copying, publication, database use, and display. Treat any `conditional-fan-kit` classification as review-dependent, not automatic permission. |

## Marvel vs. Capcom 2

Official source page: <https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2><br>
Publisher/creator record: Capcom is the official host/publisher; Marvel owns the relevant characters; the individual asset artist is not credited. The page displays `Copyright 2025 MARVEL`.

| Seed row | Best direct asset URL | Technical check | Source page | Publisher / creator | Basis and disposition | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| `mvc2/storm` - Storm (`fighter`) | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/storm.png> | PNG, 1280x1162, alpha, HTTP 200 | [Official MVC2 page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2) | Capcom official asset host; Marvel character; artist uncredited | `CAPCOM-MVC`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |
| `mvc2/magneto` - Magneto (`fighter`) | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/magneto.png> | PNG, 1280x1162, alpha, HTTP 200 | [Official MVC2 page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2) | Capcom official asset host; Marvel character; artist uncredited | `CAPCOM-MVC`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |
| `mvc2/sentinel` - Sentinel (`fighter`) | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/sentinel.png> | PNG, 1280x1162, alpha, HTTP 200 | [Official MVC2 page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2) | Capcom official asset host; Marvel character; artist uncredited | `CAPCOM-MVC`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |
| `mvc2/cable` - Cable (`fighter`) | <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/cable.png> | PNG, 1280x1162, alpha, HTTP 200 | [Official MVC2 page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2) | Capcom official asset host; Marvel character; artist uncredited | `CAPCOM-MVC`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |

Notes:

- The assets are precisely tied to the collection's MVC2 title section and are the best technical candidates in this group.
- Capcom's fan-content policy expressly excludes third-party IP. Because all four rows are Marvel characters, that policy cannot be used as reuse permission for these assets.
- Suggested provenance credit is `Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights; individual artist uncredited.` Preserve the page's Marvel copyright notice in the full provenance record.

## Ultimate Marvel vs. Capcom 3

Primary source page: <https://news.capcomusa.com/mikeeb13/blog/2012/01/03/new_ultimate_marvel_vs._capcom_3_-_high-res_character_art><br>
Publisher/creator record: Capcom and the UMVC3 development team; the post says the development team recreated the full character-art set; individual artists are not credited.

| Seed row | Best direct asset URL | Technical check | Source page | Publisher / creator | Basis and disposition | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| `umvc3/zero` - Zero (`fighter`) | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/2f7319c0e9932a47d0e9db7ef453ec4f.png> | PNG, 5312x5315, alpha, HTTP 200 | [Capcom high-resolution art post](https://news.capcomusa.com/mikeeb13/blog/2012/01/03/new_ultimate_marvel_vs._capcom_3_-_high-res_character_art) | Capcom / UMVC3 development team; artist uncredited | `CAPCOM-UMVC3`; exact official promotional art and informal fan-creation invitation; no express as-is app reuse; art review required | 2026-08-25 |
| `umvc3/vergil` - Vergil (`fighter`) | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/b910a3cc3952012c7111b152af718e2f.png> | PNG, 5079x5079, alpha, HTTP 200 | [Capcom high-resolution art post](https://news.capcomusa.com/mikeeb13/blog/2012/01/03/new_ultimate_marvel_vs._capcom_3_-_high-res_character_art) | Capcom / UMVC3 development team; artist uncredited | `CAPCOM-UMVC3`; exact official promotional art and informal fan-creation invitation; no express as-is app reuse; art review required | 2026-08-25 |
| `umvc3/doom` - Doctor Doom (`fighter`) | No live version-matched direct asset found. Best transparent first-party fallback: <https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/doctor_doom.png> | Fallback PNG, 1280x1162, alpha, HTTP 200 | [Fallback is from the official MVC2 collection page](https://www.capcom-games.com/marvel-vs-capcom-fc/en-us/title/marvel-vs-capcom2), not UMVC3 | Capcom official asset host; Marvel character; artist uncredited | **Gap.** Cross-version MVC2 art, `CAPCOM-MVC`; not suitable as a version-exact UMVC3 approval; keep typographic fallback or explicit cross-version review | 2026-08-25 |
| `umvc3/dante` - Dante (`fighter`) | <https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/893d1dc95c1896f2177e84bea51dad7d.png> | PNG, 4252x5433, alpha, HTTP 200 | [Capcom high-resolution art post](https://news.capcomusa.com/mikeeb13/blog/2012/01/03/new_ultimate_marvel_vs._capcom_3_-_high-res_character_art) | Capcom / UMVC3 development team; artist uncredited | `CAPCOM-UMVC3`; exact official promotional art and informal fan-creation invitation; no express as-is app reuse; art review required | 2026-08-25 |

Doctor Doom gap details:

- The official post says all 51 character files were available and mentions a Doctor Doom wallpaper, but its full-set download points to the now-unavailable Megaupload service.
- The surviving, individually labeled first-party CDN links on the current post cover the Capcom-side characters, including Zero, Vergil, and Dante. A current individually linked UMVC3 Doctor Doom asset was not found.
- The official [UMVC3 manual landing page](https://www.capcom.com/manuals/umvc3/) confirms the game/version and roster context but does not expose a standalone Doctor Doom render.

## Super Smash Bros. Melee

Version references: [Nintendo's original Japanese GameCube page](https://www.nintendo.co.jp/ngc/galj/) and [Nintendo's Melee product page](https://www.nintendo.com/en-gb/Games/Nintendo-GameCube/Super-Smash-Bros-Melee-268951.html).<br>
Publisher/creator record for the candidate assets: Nintendo official Super Smash Bros. site; individual render artists are not credited.

No current, version-matched, standalone transparent first-party render was found for any of the four seeded Melee characters. The candidates below are high-quality official **Super Smash Bros. Ultimate** renders and therefore cross-version fallbacks.

| Seed row | Best first-party fallback URL | Technical check | Actual source page | Publisher / creator | Basis and disposition | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| `melee/fox` - Fox (`fighter`) | <https://www.smashbros.com/assets_v2/img/fighter/fox/main.png> | Transparent image, 1374x1537, HTTP 200; `.png` endpoint may negotiate WebP | [Official Ultimate Fox page](https://www.smashbros.com/en_US/fighter/07.html) | Nintendo official site; artist uncredited | **Gap.** `NINTENDO-SMASH`; cross-version Ultimate art; no express app reuse; keep typographic fallback or explicit cross-version review | 2026-08-25 |
| `melee/marth` - Marth (`fighter`) | <https://www.smashbros.com/assets_v2/img/fighter/marth/main.png> | Transparent image, 1676x1749, HTTP 200; `.png` endpoint may negotiate WebP | [Official Ultimate Marth page](https://www.smashbros.com/en_US/fighter/21.html) | Nintendo official site; artist uncredited | **Gap.** `NINTENDO-SMASH`; cross-version Ultimate art; no express app reuse; keep typographic fallback or explicit cross-version review | 2026-08-25 |
| `melee/falco` - Falco (`fighter`) | <https://www.smashbros.com/assets_v2/img/fighter/falco/main.png> | Transparent image, 1374x1672, HTTP 200; `.png` endpoint may negotiate WebP | [Official Ultimate Falco page](https://www.smashbros.com/en_US/fighter/20.html) | Nintendo official site; artist uncredited | **Gap.** `NINTENDO-SMASH`; cross-version Ultimate art; no express app reuse; keep typographic fallback or explicit cross-version review | 2026-08-25 |
| `melee/sheik` - Sheik (`fighter`) | <https://www.smashbros.com/assets_v2/img/fighter/sheik/main.png> | Transparent image, 1604x1873, HTTP 200; `.png` endpoint may negotiate WebP | [Official Ultimate Sheik page](https://www.smashbros.com/en_US/fighter/16.html) | Nintendo official site; artist uncredited | **Gap.** `NINTENDO-SMASH`; cross-version Ultimate art; no express app reuse; keep typographic fallback or explicit cross-version review | 2026-08-25 |

Notes:

- The original Melee site remains a useful first-party version reference, but its currently reachable pages do not expose a complete standalone character-art set for these four rows.
- Nintendo's older Brawl site also has official per-character JPEGs, but those are still cross-version and technically inferior to the transparent Ultimate candidates, so they are not recommended as the primary fallback.
- Do not describe the Ultimate render as "Melee art" in provenance or UI metadata.

## Vampire Savior

Correct official source page: <https://www.capcom-games.com/cfc/en-us/title/vampire-s.html><br>
Publisher/creator record: Capcom; individual asset artists are not credited.

| Seed row | Best direct asset URL | Technical check | Source page | Publisher / creator | Basis and disposition | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| `vampire-savior/morrigan` - Morrigan (`fighter`) | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/9-e.png> | PNG, 1200x946, palette transparency, HTTP 200 | [Official Vampire Savior page](https://www.capcom-games.com/cfc/en-us/title/vampire-s.html) | Capcom; artist uncredited | `CAPCOM-VSAV`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |
| `vampire-savior/jedah` - Jedah (`fighter`) | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/0-e.png> | PNG, 1200x948, palette transparency, HTTP 200 | [Official Vampire Savior page](https://www.capcom-games.com/cfc/en-us/title/vampire-s.html) | Capcom; artist uncredited | `CAPCOM-VSAV`; exact official promotional art; source labels him "Jedah Dohma"; no express app reuse; art review required | 2026-08-25 |
| `vampire-savior/bulleta` - Bulleta (`fighter`) | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/1-e.png> | PNG, 1200x894, palette transparency, HTTP 200 | [Official Vampire Savior page](https://www.capcom-games.com/cfc/en-us/title/vampire-s.html) | Capcom; artist uncredited | `CAPCOM-VSAV`; exact official promotional art; alias review required because this English page labels her "Baby Bonnie Hood"; no express app reuse | 2026-08-25 |
| `vampire-savior/q-bee` - Q-Bee (`fighter`) | <https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/3-e.png> | PNG, 1200x956, palette transparency, HTTP 200 | [Official Vampire Savior page](https://www.capcom-games.com/cfc/en-us/title/vampire-s.html) | Capcom; artist uncredited | `CAPCOM-VSAV`; exact official promotional art; no express app reuse; art review required | 2026-08-25 |

Notes:

- The source URL currently stored on the seeded game row, `https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html`, returns Capcom's 404 page. The version-matched live page is the `vampire-s.html` URL used above.
- Preserve `Bulleta` as the seeded identifier if that is MainStation's version convention, but record `Baby Bonnie Hood` as the official English-page alias so the asset mapping is auditable.

## Mortal Kombat 1

Official source page: <https://www.mortalkombat.com/en-us/roster><br>
Publisher/creator record: Warner Bros. Games / Warner Bros. Entertainment; developed by NetherRealm Studios; individual asset artists are not credited. The roster footer states that MK1 software, characters, and related elements are Warner Bros. property and identifies NetherRealm as developer.

| Seed row | Best direct asset URL | Technical check | Source page | Publisher / creator | Basis and disposition | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| `mk1/scorpion` - Scorpion (`fighter`) | <https://cdn-mk1.mortalkombat.com/roster/scorpion/hero.webp> | WebP, 1280x1280, alpha, HTTP 200 | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster) | Warner Bros. Games / NetherRealm Studios; artist uncredited | `WB-MK1`; exact official promotional art; Kommunity Kit is conditional supporting evidence, not an express app license; art review required | 2026-08-25 |
| `mk1/sub-zero` - Sub-Zero (`fighter`) | <https://cdn-mk1.mortalkombat.com/roster/sub-zero/hero.webp> | WebP, 1280x1280, alpha, HTTP 200 | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster) | Warner Bros. Games / NetherRealm Studios; artist uncredited | `WB-MK1`; exact official promotional art; Kommunity Kit is conditional supporting evidence, not an express app license; art review required | 2026-08-25 |
| `mk1/mileena` - Mileena (`fighter`) | <https://cdn-mk1.mortalkombat.com/roster/mileena/hero.webp> | WebP, 1280x1280, alpha, HTTP 200 | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster) | Warner Bros. Games / NetherRealm Studios; artist uncredited | `WB-MK1`; exact official promotional art; Kommunity Kit is conditional supporting evidence, not an express app license; art review required | 2026-08-25 |
| `mk1/sonya` - Sonya (`kameo`) | <https://cdn-mk1.mortalkombat.com/roster/kameos/sonya.webp> | WebP, 480x520, alpha, HTTP 200 | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster) | Warner Bros. Games / NetherRealm Studios; artist uncredited | `WB-MK1`; exact official Kameo promotional art; Kommunity Kit is conditional supporting evidence, not an express app license; art review required | 2026-08-25 |
| `mk1/kano` - Kano (`kameo`) | <https://cdn-mk1.mortalkombat.com/roster/kameos/kano.webp> | WebP, 480x520, alpha, HTTP 200 | [Official MK1 roster](https://www.mortalkombat.com/en-us/roster) | Warner Bros. Games / NetherRealm Studios; artist uncredited | `WB-MK1`; exact official Kameo promotional art; Kommunity Kit is conditional supporting evidence, not an express app license; art review required | 2026-08-25 |

### Kommunity Kit evidence

The official MK1 site's navigation links the Google Drive file as `KOMMUNITY KIT`. The file is named `Esports Kommunity Kit.zip` and was 4,018,869,159 bytes when inspected. Its 340-entry archive manifest includes a 35-page `Brand Guidelines.pdf` and these higher-resolution transparent PNG alternatives:

- `Character PNGS (NRS Characters ONLY)/Base Kharacters/Scorpion/K1_ScorpionRender_Hero-pose.png`
- `Character PNGS (NRS Characters ONLY)/Base Kharacters/Sub Zero/K1_SubZeroRenders_Hero-pose.png`
- `Character PNGS (NRS Characters ONLY)/Base Kharacters/Mileena/K1_MileenaRender_Hero-pose.png`
- `Character PNGS (NRS Characters ONLY)/Kameo/Kameo_SonyaRender.png`
- `Character PNGS (NRS Characters ONLY)/Kameo/Kameo_KanoRender.png`

The archive does not provide stable per-file public URLs, so the roster CDN files are the best direct-URL candidates. The style guide describes required treatments, prohibited logo modifications, crop requirements, and elements that need brand approval. It does not contain a general copyright license or a clear grant to reuse the character files in MainStation. The archive's official distribution and community/esports naming can support a `conditional-fan-kit` review, but should not be recorded as express permission.

## Gaps and implementation cautions

1. **External reuse permission remains unresolved for all 21 rows.** Official hosting and attribution establish provenance, not permission. If MainStation proceeds under ADR-023, record that as an internal accepted-risk decision with takedown controls; do not describe it as publisher approval.
2. **The current reuse-mode constraint cannot represent the ordinary official-promotional case.** Do not force these records into `express-fan-kit`, `written-permission`, or `community-licensed`. Either add a truthful reviewed-risk mode through a separate product/schema decision or leave the art unapproved.
3. **Melee has four version-identity gaps.** The transparent candidates are Ultimate renders. Prefer the typographic fallback until cross-version art is explicitly accepted or a first-party Melee render with adequate reuse evidence is found.
4. **UMVC3 Doctor Doom has one version-identity gap.** The supplied fallback is MVC2 collection art. It should not silently inherit UMVC3 provenance.
5. **Vampire Savior has a stale game-source URL and one alias discrepancy.** Use the live `vampire-s.html` page and record `Bulleta` / `Baby Bonnie Hood` together.
6. **Avoid production hotlinking.** If a reviewed candidate is accepted, localize it, retain its original source URL and retrieval date, hash the exact bytes, keep the full rights/terms evidence, and preserve the typographic fallback for takedown or upstream failure.

## Recommended review state

| Group | Technical/art fit | Rights evidence | Honest current disposition |
| --- | --- | --- | --- |
| MVC2 four | Version-exact, transparent | Official promotional provenance; Marvel third-party exclusion; no app grant | `art review`; usable only under the project's explicit official-promo risk decision |
| UMVC3 Zero, Vergil, Dante | Version-exact, high-resolution, transparent | Official art post plus informal fan-creation invitation; current terms still withhold as-is web reuse | `art review`; stronger promotional signal, not express permission |
| UMVC3 Doctor Doom | Transparent first-party fallback, but MVC2 version | No version-matched direct asset; Marvel third-party exclusion | Keep fallback/review; do not approve as exact UMVC3 art |
| Melee four | High-quality transparent first-party fallback, but Ultimate version | Nintendo terms restrict public display; content guidelines do not cover an app art catalog | Keep fallback/review; do not approve as exact Melee art |
| Vampire Savior four | Version-exact, transparent | Official promotional provenance; no app grant | `art review`; usable only under the project's explicit official-promo risk decision |
| MK1 five | Version-exact, transparent | Official roster plus officially distributed community/esports kit; no clear app grant | `conditional-fan-kit` candidate only after scope review; otherwise `art review` |
