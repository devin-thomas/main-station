# Character Art Audit: Arc System Works and Bandai Namco Seed Slice

Audit date and asset retrieval date: **2026-08-25**

## Scope and decision rule

This is a research-only audit of the Character rows currently present in `supabase/seed.sql` for:

- `ggxxacpr`: Sol Badguy, Ky Kiske, Testament, and Zappa
- `ggst`: Sol Badguy, Ramlethal Valentine, Nagoriyuki, and Bridget
- `tekken-8`: Jin Kazama, Reina, King, and Lili
- `uni2`: confirmation of the existing 28-file implementation only

It is not a full-roster audit for the three preview catalogs. All findings use first-party publisher pages, first-party-hosted assets, and first-party terms. A reachable official image is not, by itself, permission to copy or publicly display it. Attribution is also not a license.

The decision labels used below are:

- **Conditional fan-kit candidate**: an express license exists, but MainStation must satisfy the license's operator and non-commercial conditions before approval.
- **Discovery only - no reuse basis**: the official file is useful as an identity/source reference, but the located terms do not permit MainStation to copy or publicly display it.
- **Confirmed existing**: the already-integrated UNI2 file remains covered by its dedicated fan-kit terms and passed the repository hash verifier.

## Result

| Game | Seed rows audited | Official art located | Rights result | Implementation disposition |
| --- | ---: | ---: | --- | --- |
| Guilty Gear XX Accent Core Plus R | 4 | 4 transparent PNGs | No accepted reuse basis; Arc's current general guideline prohibits direct use of official visuals | Keep `ART REVIEW`; do not ingest |
| Guilty Gear -Strive- | 4 | 4 dedicated fan-kit PNGs | Express but conditional non-commercial fan-kit license | Eligible only after confirming MainStation is operated by an individual or unincorporated organization and remains non-commercial; then comply with notice and processing terms |
| Tekken 8 | 4 | 4 transparent official assets | No accepted reuse basis; BNEA terms reserve rights and prohibit copying/distribution beyond personal non-commercial use | Keep `ART REVIEW`; do not ingest |
| Under Night In-Birth II Sys:Celes | 28 | 28 existing files | Existing express fan-kit basis confirmed | Preserve exactly as implemented; no replacement |

The actionable set is therefore **4 conditional GGST files**, **8 blocked-but-identified official files**, and **28 already-approved UNI2 files**.

## Rights evidence

### GGST dedicated fan kit

The official [GUILTY GEAR -STRIVE- Fan Kit](https://www.guiltygear.com/ggst/en/fankit/) is the source page and license page for all four recommended GGST files. It expressly defines the kit as including character illustrations and grants free use only when the user is an **individual or unincorporated organization** acting for **non-commercial purposes**. It gives personal websites/blogs and non-profit fan-event websites as examples. It requires a visible `© ARC SYSTEM WORKS` notice, allows minor trimming/resizing that does not compromise the material, and allows unchanged non-commercial redistribution under its stated conditions. Commercial use is prohibited, and Arc may revoke the license or request removal.

This dedicated grant is materially different from ordinary promotional-page availability. Record it as a conditional fan-kit basis, not as attribution-only use. Before approval, the operator must affirm both eligibility conditions:

1. MainStation/Uppercut Labs is an individual or unincorporated organization for this use.
2. The site and the art usage are non-commercial, with no direct or indirect monetary benefit from the kit.

If either condition is false or uncertain, written permission is required and the art must remain under review.

### Plus R general Arc guideline

The official [Guilty Gear XX Accent Core Plus R Switch page](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/) exposes transparent character-compositor PNGs and identifies the publisher/developer as Arc System Works. However, no Plus R-specific fan kit or other affirmative art license was located in this bounded first-party review.

The current [Arc System Works Fan Content Guidelines](https://www.arcsystemworks.jp/portal/fancontent/en/) expressly prohibit directly using official illustrations, official visuals, in-game content/data, and other official materials in derivative works, and prohibit unaltered or minimally creative reproductions. The page's `© ARC SYSTEM WORKS` notice establishes ownership; it does not grant reuse. The four files below are therefore discovery-only candidates and must not be copied into MainStation or hotlinked for display without separate written permission.

### Tekken/Bandai Namco terms

Each selected Tekken file is an official asset referenced by the corresponding first-party `tekken.com` fighter page and served by Bandai Namco's GraphAssets tenant. The fighter pages identify `TEKKEN™8 & ©Bandai Namco Entertainment Inc.` and state that rights are reserved. No Tekken 8 character-art fan kit or press-use license applicable to MainStation was located in this bounded first-party review.

The `tekken.com` footer links to the [Bandai Namco Entertainment America Terms of Service](https://www.bandainamcoent.com/legal/terms). Section 3 reserves all ungranted rights, grants only a revocable personal/non-commercial access-and-use license, and prohibits distributing or copying the Online Services absent a separate written agreement. A page button labeled "Download," a CMS URL, or the ability to retrieve the file is not a public-display license. These assets remain discovery-only.

### Existing UNI2 fan kit

The official [UNI2 roster](https://www.arcsystemworks.jp/uni2celes/en/character/) currently enumerates the same 28 playable fighters present in the seed. The dedicated [UNI2 Fan Kit terms](https://www.arcsystemworks.jp/uni2celes/en/fankit/) allow website use and unmodified duplication/redistribution, require a clearly readable `© FRENCH-BREAD / ARC SYSTEM WORKS` notice and at least one clear link to the official UNI2 site, prohibit reputation-damaging modifications, and prohibit use of the materials to gain financial profit through sales.

The existing implementation already records that source, terms URL, notice, hashes, and an `express-fan-kit` basis. This audit does not broaden those terms or authorize monetized use.

## Complete mapping of the 12 non-UNI2 seed rows

All twelve direct assets returned HTTP 200 on 2026-08-25. `RGBA` and `alpha` below were verified from the retrieved file, not inferred from the extension.

| Game / current seed row | Best official direct asset | Observed asset facts | Publisher / creator | First-party source page | Usage basis and terms evidence | Retrieved |
| --- | --- | --- | --- | --- | --- | --- |
| +R `sol` - Sol Badguy | [`img_15.png`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_15.png) | PNG, 1920x621, RGBA; SHA-256 `df54c4c9296de3bdcc0c8d978d6a8351dc44aa86ec2233c3b5a3e8585ffd3cd9` | Arc System Works Co., Ltd.; no individual artist credited | [Official +R page, `character_15`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/#character_15) | **Discovery only - no reuse basis.** [Current Arc guideline](https://www.arcsystemworks.jp/portal/fancontent/en/) prohibits direct use of official visuals and unaltered reproductions. | 2026-08-25 |
| +R `ky` - Ky Kiske | [`img_07.png`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_07.png) | PNG, 1920x621, RGBA; SHA-256 `0ddd478928d6e92eb516eae273a439b2fa80ddad4dcf4531dc4f3a628e5448fc` | Arc System Works Co., Ltd.; no individual artist credited | [Official +R page, `character_07`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/#character_07) | **Discovery only - no reuse basis.** Same Arc guideline restriction. | 2026-08-25 |
| +R `testament` - Testament | [`img_18.png`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_18.png) | PNG, 1920x621, RGBA; SHA-256 `8694ae2f59904d619ed97b649406cbfd76871dd28493718e88ab6a57ce755ff2` | Arc System Works Co., Ltd.; no individual artist credited | [Official +R page, `character_18`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/#character_18) | **Discovery only - no reuse basis.** Same Arc guideline restriction. | 2026-08-25 |
| +R `zappa` - Zappa | [`img_09.png`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_09.png) | PNG, 1920x621, RGBA; SHA-256 `bc0b04ed27aad92bc2b940f00dcfb354ead3971c1ada92e67dd0fdc2ffcb73ae` | Arc System Works Co., Ltd.; no individual artist credited | [Official +R page, `character_09`](https://www.arcsystemworks.jp/switch/gg20th/acpr/en/#character_09) | **Discovery only - no reuse basis.** Same Arc guideline restriction. | 2026-08-25 |
| GGST `sol` - Sol Badguy | [`chara01_sol.png`](https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara01_sol.png) | Fan-kit PNG, 1600x1600, RGBA; SHA-256 `7fd6a1a4cc85e7196d3ca68df3e248b92df4abd84601b8292274ed3020677477` | Arc System Works Co., Ltd., fan-kit rights holder; no individual artist credited | [Official GGST Fan Kit](https://www.guiltygear.com/ggst/en/fankit/) | **Conditional fan-kit candidate.** Individual/unincorporated + non-commercial only; visible `© ARC SYSTEM WORKS`; only compliant minor processing. | 2026-08-25 |
| GGST `ramlethal` - Ramlethal Valentine | [`chara10_ram.png`](https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara10_ram.png) | Fan-kit PNG, 1600x1600, RGBA; SHA-256 `1033fb5a445a2d774091d10c26e3a7360036fb9aad94e3f3aefc4db853356806` | Arc System Works Co., Ltd., fan-kit rights holder; no individual artist credited | [Official GGST Fan Kit](https://www.guiltygear.com/ggst/en/fankit/) | **Conditional fan-kit candidate.** Same GGST fan-kit conditions. | 2026-08-25 |
| GGST `nagoriyuki` - Nagoriyuki | [`chara12_nag.png`](https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara12_nag.png) | Fan-kit PNG, 1600x1600, RGBA; SHA-256 `e856f37d4379827d0edf3d1b66dd3a559d48753969969071c4c97dbc3537f973` | Arc System Works Co., Ltd., fan-kit rights holder; no individual artist credited | [Official GGST Fan Kit](https://www.guiltygear.com/ggst/en/fankit/) | **Conditional fan-kit candidate.** Same GGST fan-kit conditions. | 2026-08-25 |
| GGST `bridget` - Bridget | [`chara21_bgt.png`](https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/chara21_bgt.png) | Fan-kit PNG, 1600x1600, RGBA; SHA-256 `e9d2043da468825cda117f0eac9db930a43ec7b547e0e041a29f0660d14311da` | Arc System Works Co., Ltd., fan-kit rights holder; no individual artist credited | [Official GGST Fan Kit](https://www.guiltygear.com/ggst/en/fankit/) | **Conditional fan-kit candidate.** Same GGST fan-kit conditions. | 2026-08-25 |
| Tekken 8 `jin` - Jin Kazama | [`jin-kazama-character-wall-art-lrg.webp`](https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/CSlAd5qETdKPCZ06jH88) | WebP, 1918x2850, alpha; SHA-256 `112a0e87360839ecc7ba2c97ff5b05f7eacb4388166be5873aa61173145d7bba` | Bandai Namco Entertainment Inc.; no individual artist credited | [Official Jin fighter page](https://tekken.com/fighters/jin-kazama) | **Discovery only - no reuse basis.** [BNEA Terms §3](https://www.bandainamcoent.com/legal/terms) reserve rights and prohibit copying/distribution beyond the limited personal-use license. | 2026-08-25 |
| Tekken 8 `reina` - Reina | [`reina-select.png`](https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/VkSV6lkgSqeDOm5L0msl) | PNG, 454x668, RGBA; SHA-256 `0765abe121daa88f60a3a6d1a1b3c85131a60f3ce7c64fd0ed8e0d4f38133ffc` | Bandai Namco Entertainment Inc.; no individual artist credited | [Official Reina fighter page](https://tekken.com/fighters/reina) | **Discovery only - no reuse basis.** Same BNEA Terms restriction. | 2026-08-25 |
| Tekken 8 `king` - King | [`king-character-wall-art-lrg.webp`](https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/ESDBWWFCTiWikbaNUkLm) | WebP, 2500x2938, alpha; SHA-256 `4d19461384934edc9ffef3ad6e83365815c97982e6f0b223e174436de1b126d0` | Bandai Namco Entertainment Inc.; no individual artist credited | [Official King fighter page](https://tekken.com/fighters/king) | **Discovery only - no reuse basis.** Same BNEA Terms restriction. | 2026-08-25 |
| Tekken 8 `lili` - Lili | [`T8-Lili-Character@1x.png`](https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/pQi3O39ATPipjt8KqWgz) | PNG, 598x799, RGBA; SHA-256 `155d22e8f6de4f6e4bb1a0426abe0f16c86abe154298b6fd3e42fd9533222088` | Bandai Namco Entertainment Inc.; no individual artist credited | [Official Lili fighter page](https://tekken.com/fighters/lili) | **Discovery only - no reuse basis.** Same BNEA Terms restriction. | 2026-08-25 |

### Why these files were selected

- The GGST files are the explicit full-character downloads listed by the licensed fan-kit page, rather than visually similar promotional-page files.
- The +R page maps `img_07`, `img_09`, `img_15`, and `img_18` to Ky, Zappa, Sol, and Testament respectively through the same numbered character entries. The 2x PNGs are the largest first-party transparent variants found.
- Jin and King use the larger alpha-bearing wall-art WebPs rather than the much smaller 454px fighter-select WebPs.
- Reina and Lili use the official transparent PNG variants to honor the PNG preference. Reina also has a larger 928x1771 alpha WebP (`fighter-reina-cropped.webp`), but it was not preferred over the PNG. This does not affect the rights result: neither variant is approved for reuse.

## UNI2 28-file coverage confirmation

The official roster has exactly these 28 playable characters, and each has one current seed row, one approved art record, and one local PNG. `npm run verify:art` completed with: `Verified 28 Character art assets against their recorded SHA-256 values.` There are 28 unique `public/art/uni2-*.png` files and 28 unique `/art/uni2-*.png` seed paths.

| Character | Existing local path | Existing first-party fan-kit source | Recorded SHA-256 |
| --- | --- | --- | --- |
| Hyde | `/art/uni2-hyde.png` | [`csel_noef_000Hyde.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_000Hyde.png) | `sha256:6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4` |
| Linne | `/art/uni2-linne.png` | [`csel_noef_001Linne.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_001Linne.png) | `sha256:c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7` |
| Waldstein | `/art/uni2-waldstein.png` | [`csel_noef_002Waldstein.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_002Waldstein.png) | `sha256:fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18` |
| Carmine | `/art/uni2-carmine.png` | [`csel_noef_003Carmine.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_003Carmine.png) | `sha256:532eac2560010c3d30a78e10517b7b4a142e1b2b5339f1ae82523fe2477fb87b` |
| Orie | `/art/uni2-orie.png` | [`csel_noef_004Orie.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_004Orie.png) | `sha256:d034e2e20297dd150d69b2337cb9beb130a56e2503ea0be74ec3d07d55d9f9e3` |
| Gordeau | `/art/uni2-gordeau.png` | [`csel_noef_005Gordeau.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_005Gordeau.png) | `sha256:7e4f743ab31a913642633d0331c8e275e6c17540ef16d00545616315fbe1b1b1` |
| Merkava | `/art/uni2-merkava.png` | [`csel_noef_006Merkava.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_006Merkava.png) | `sha256:dcf8c5f5c85d31d357288aab1876f6111c14fe7801840d6bb60a064d4ba65512` |
| Vatista | `/art/uni2-vatista.png` | [`csel_noef_007Vatista.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_007Vatista.png) | `sha256:c5bd16037b77842456c7406d9686ba4efd6f8f116ebf6ddda03cab1809e161d4` |
| Seth | `/art/uni2-seth.png` | [`csel_noef_008Seth.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_008Seth.png) | `sha256:d764d96b9ddf29d57b0f3430db98d0eab446010cbaa96a723ff75ffc961cc0b5` |
| Yuzuriha | `/art/uni2-yuzuriha.png` | [`csel_noef_009Yuzuriha.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_009Yuzuriha.png) | `sha256:cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c` |
| Hilda | `/art/uni2-hilda.png` | [`csel_noef_010Hilda.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_010Hilda.png) | `sha256:f4b26461883d7655697c8e8920d11134b06db267ce6eaa333a04cf32e689df86` |
| Chaos | `/art/uni2-chaos.png` | [`csel_noef_015Chaos.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_015Chaos.png) | `sha256:fb2cf6eb6b6e81650b5d25828f24f888d6cc2f7755537120c1b20186f3faf78b` |
| Nanase | `/art/uni2-nanase.png` | [`csel_noef_012Nanase.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_012Nanase.png) | `sha256:dd7f0a9408971650777e665972dc2ccd06fbbaa346695c10559061b35e6b1566` |
| Byakuya | `/art/uni2-byakuya.png` | [`csel_noef_013Byakuya.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_013Byakuya.png) | `sha256:2eb71cb253c9d2682ef38fa6af7eeddd200eac5cf013a21711ab60772b90dac2` |
| Phonon | `/art/uni2-phonon.png` | [`csel_noef_024phonon.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_024phonon.png) | `sha256:60b21d7571dc0bcf5626e73c9b419bd822fec88658f48a26f5182074176399ca` |
| Mika | `/art/uni2-mika.png` | [`csel_noef_021Mika.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_021Mika.png) | `sha256:fa56a74db9792734738822b69b3ebf93375a3db05efa0225c9060e4811aa1075` |
| Wagner | `/art/uni2-wagner.png` | [`csel_noef_016Wagner.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_016Wagner.png) | `sha256:e8eb4fcea9347ad992b50ded641c18aa54c46526d293af0566c46f24dcd1f22a` |
| Enkidu | `/art/uni2-enkidu.png` | [`csel_noef_017Enkidu.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_017Enkidu.png) | `sha256:e264f609214b897ed8499ee4cc3eae58859f55675876d300d8b639bad532a49b` |
| Londrekia | `/art/uni2-londrekia.png` | [`csel_noef_018Londrekia.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_018Londrekia.png) | `sha256:0f6a279fcef6057aa8f0152fcca18ae0ba04416cbe37627cd6fa8e2b3d180642` |
| Tsurugi | `/art/uni2-tsurugi.png` | [`csel_noef_019Tsurugi.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_019Tsurugi.png) | `sha256:895b5721a45d379276f39535b1ccea1707c42a8537b66717cc291f6ce3501d21` |
| Kaguya | `/art/uni2-kaguya.png` | [`csel_noef_022Kaguya.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_022Kaguya.png) | `sha256:5f11e1b3b566bd44be459891ca85826499e7a345459ee749a292fbc8496130a0` |
| Kuon | `/art/uni2-kuon.png` | [`csel_noef_023Kuon.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_023Kuon.png) | `sha256:9b3aaa0143daa03a3ba424460784446ffff8477a8b8465a2a01344cc6191babd` |
| Uzuki | `/art/uni2-uzuki.png` | [`csel_noef_020Uzuki.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_020Uzuki.png) | `sha256:a553e77ee3c92798060c818b7679d59a6c8b9d774faa604fd7f5c05f4baedaf4` |
| Ogre | `/art/uni2-ogre.png` | [`csel_noef_025Ogre.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_025Ogre.png) | `sha256:3aa92b8eecc4a346961a0a79f7b64532176d624edb250cb2b13363d330d0aeef` |
| Izumi | `/art/uni2-izumi.png` | [`csel_noef_026Izumi.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_026Izumi.png) | `sha256:f547ea2a60643c078f0bfbabe63779ad97e6725e0e1f5185ef56c04e5e4764c1` |
| Zohar | `/art/uni2-zohar.png` | [`csel_noef_027zohar.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_027zohar.png) | `sha256:ff2f7b33f659edbd3c909b0d5002acd6ce37a95522e7cb4261861a92181a4cd5` |
| Eltnum | `/art/uni2-eltnum.png` | [`csel_noef_011Eltnum.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_011Eltnum.png) | `sha256:d3ad6b4fc2780287c53e3fb724d63616ff8e82177f57257bc2bf09a0b05f4e80` |
| Akatsuki | `/art/uni2-akatsuki.png` | [`csel_noef_014Akatsuki.png`](https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/csel_noef_014Akatsuki.png) | `sha256:51ce0e39c69595e0facebb6b1010e62830932e06cd97934c9a186904590a7403` |

The fan-kit page also offers non-playable/support character images. They are not entries on the official 28-fighter roster and are correctly excluded from this roster-art set.

## Named gaps and uncertainties

1. **GGST operator eligibility is not established by this audit.** The license is useful but conditional. Do not mark the four assets approved until MainStation's non-commercial status and individual/unincorporated-organization status are affirmatively recorded. A later commercial launch, sponsorship, advertising, subscription, or other monetary benefit requires a new rights review.
2. **Three current GGST seed source URLs are dead.** On 2026-08-25, the seeded `.../character/ramlethal/`, `.../character/nagoriyuki/`, and `.../character/bridget/` URLs returned HTTP 404. The live official character URLs are [`/ram/`](https://www.guiltygear.com/ggst/en/character/ram/), [`/nag/`](https://www.guiltygear.com/ggst/en/character/nag/), and [`/bgt/`](https://www.guiltygear.com/ggst/en/character/bgt/). Sol's seeded `/sol/` URL remains live. This report records the issue but does not edit the seed.
3. **Plus R has art but no affirmative image-use grant.** The dedicated GGST and UNI2 fan kits cannot be stretched to cover version-specific Plus R artwork. Until Arc supplies a Plus R-specific license or written permission, preserve the fallback.
4. **Tekken has art but no affirmative image-use grant.** Direct CMS availability and page-level download affordances are not permission for a third-party public site. Written permission or a clearly applicable Bandai Namco press/fan license is required.
5. **No individual artists are credited for these twelve files.** Publisher/rights-holder attribution is the most exact first-party provenance available; it must not be presented as a creator credit or as permission.
6. **The Plus R files are wide transparent compositor strips.** They are usable character cutouts only if permission is later obtained; they are not square portraits. Any crop/derivative would itself require permission under the current restriction.
7. **Jin and King are WebP, not PNG.** They are the largest official alpha-bearing files found on their fighter pages. Converting them to PNG would not cure the missing license and was not performed.
8. **This is row-complete, not roster-complete.** The three non-UNI2 games remain preview catalogs, and this report intentionally does not add missing roster members or claim catalog completeness.
9. **No fair-use conclusion is made.** Fair use is fact-specific and is not an explicit publisher grant. It is not an acceptable automatic approval basis under MainStation's current provenance policy.

## Recommended handoff disposition

- Keep all 28 UNI2 records and files unchanged.
- Treat the four GGST fan-kit files as the only implementation-ready candidates from this slice, contingent on recording the two eligibility facts and displaying `© ARC SYSTEM WORKS` clearly wherever the kit is used.
- Keep all +R and Tekken rows in the typographic `ART REVIEW` state until separate written permission or a game-specific first-party license is obtained.
- If the GGST eligibility gate is satisfied later, store the exact fan-kit files, retain the SHA-256 values above, use the fan-kit page as both `source_url` context and `license_url`, and do not substitute promotional-page art.

This report is a provenance and published-terms audit, not legal advice.
