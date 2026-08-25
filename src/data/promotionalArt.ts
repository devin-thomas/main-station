import type { CharacterArtAsset } from '../types/domain';

export interface PromotionalArtRecord extends CharacterArtAsset {
  gameSlug: string;
  characterSlug: string;
}

const reviewedAt = '2026-08-25';
const publisherPromotionalEvidence = 'Official publisher-hosted promotional asset; no express blanket reuse license was located. Included under accepted ADR-023 with the limitation recorded and a per-asset disable or replacement path.';
const arcPromotionalEvidence = 'Official publisher-hosted promotional asset. Arc System Works fan-content guidance does not grant direct official-visual reuse; included under accepted ADR-023 with the restriction and per-asset removal path recorded.';
const ggstFanKitEvidence = 'Official fan-kit permits non-commercial use by individuals or unincorporated organizations with a visible notice and compliant processing. Re-review is required before monetization or an operator-status change.';
const riotCommunityEvidence = 'Riot permits revocable non-commercial community use under its Legal Jibber Jabber policy. MainStation is a free community PWA with original profile and statistical content, and the required project notice is displayed; re-review is required if scope or monetization changes.';
const capcomPromotionalEvidence = 'Official Capcom-hosted promotional art. Capcom fan-content guidance does not grant unchanged public display and excludes relevant third-party IP where applicable; included under accepted ADR-023 with the restriction and removal path recorded.';
const playstationPromotionalEvidence = 'Official PlayStation-hosted promotional art. PlayStation website terms reserve copying and public display absent express permission; included under accepted ADR-023 with the restriction and removal path recorded.';
const avatarPromotionalEvidence = 'Official publisher promotional art. The publisher terms reserve unauthorized public reuse; included under accepted ADR-023 with the limitation, asset-fit gap, and removal path recorded.';
const nintendoPromotionalEvidence = 'Official Super Smash Bros. Ultimate promotional render used as a clearly labeled cross-version identity fallback for Melee. Nintendo terms do not grant this public display; included under accepted ADR-023 with the mismatch and removal path recorded.';
const wbPromotionalEvidence = 'Official Mortal Kombat 1 roster art. The official Kommunity Kit is a community-use signal but provides no general app license; included under accepted ADR-023 with the limitation and removal path recorded.';

type PromotionalArtInput = Omit<PromotionalArtRecord, 'usageBasis' | 'reviewedAt'>;

const promotionalArt = (input: PromotionalArtInput): PromotionalArtRecord => ({
  ...input,
  usageBasis: 'publisher-promotional',
  reviewedAt,
});

const riotArt = (
  characterSlug: string,
  extension: 'jpg' | 'png',
  sourceUrl: string,
  assetHash: string,
): PromotionalArtRecord => ({
  gameSlug: '2xko',
  characterSlug,
  localPath: `/art/2xko-${characterSlug}.${extension}`,
  sourceUrl,
  sourcePublisher: 'Riot Games',
  reviewUrl: 'https://www.riotgames.com/en/legal',
  creditText: 'MainStation was created under Riot Games\' "Legal Jibber Jabber" policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project.',
  usageBasis: 'conditional-community-policy',
  permissionEvidence: riotCommunityEvidence,
  assetHash: `sha256:${assetHash}`,
  reviewedAt,
});

const sf6Art = (
  characterSlug: string,
  sourceSlug: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'sf6',
  characterSlug,
  localPath: `/art/sf6-${characterSlug}.png`,
  sourceUrl: `https://www.streetfighter.com/6/assets/images/character/${sourceSlug}/${sourceSlug}.png`,
  sourcePublisher: 'Capcom',
  reviewUrl: 'https://www.capcom-games.com/en/fan-content-guidelines/',
  creditText: 'Street Fighter 6 ©CAPCOM',
  permissionEvidence: capcomPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const tekkenArt = (
  characterSlug: string,
  extension: 'png' | 'webp',
  sourceUrl: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'tekken-8',
  characterSlug,
  localPath: `/art/tekken-8-${characterSlug}.${extension}`,
  sourceUrl,
  sourcePublisher: 'Bandai Namco Entertainment',
  reviewUrl: 'https://www.bandainamcoent.com/legal/terms',
  creditText: 'TEKKEN 8 ©Bandai Namco Entertainment Inc.',
  permissionEvidence: publisherPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const ggstFanKitArt = (
  characterSlug: string,
  sourceFilename: string,
  assetHash: string,
): PromotionalArtRecord => ({
  gameSlug: 'ggst',
  characterSlug,
  localPath: `/art/ggst-${characterSlug}.png`,
  sourceUrl: `https://www.guiltygear.com/ggst/jp/wordpress/wp-content/themes/ggst/img/fankit/${sourceFilename}`,
  sourcePublisher: 'Arc System Works',
  reviewUrl: 'https://www.guiltygear.com/ggst/en/fankit/',
  creditText: '© ARC SYSTEM WORKS',
  usageBasis: 'conditional-fan-kit',
  permissionEvidence: ggstFanKitEvidence,
  assetHash: `sha256:${assetHash}`,
  reviewedAt,
});

const plusRArt = (
  characterSlug: string,
  sourceIndex: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'ggxxacpr',
  characterSlug,
  localPath: `/art/ggxxacpr-${characterSlug}.png`,
  sourceUrl: `https://www.arcsystemworks.jp/switch/gg20th/acpr/en/img_2x/character/img_${sourceIndex}.png`,
  sourcePublisher: 'Arc System Works',
  reviewUrl: 'https://www.arcsystemworks.jp/portal/fancontent/en/',
  creditText: '© ARC SYSTEM WORKS',
  permissionEvidence: arcPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
  displayFit: 'cover',
});

const tokonArt = (
  characterSlug: string,
  sourceFilename: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'marvel-tokon',
  characterSlug,
  localPath: `/art/marvel-tokon-${characterSlug}.png`,
  sourceUrl: `https://gmedia.playstation.com/is/image/SIEPDC/${sourceFilename}?$1600px--t$`,
  sourcePublisher: 'Sony Interactive Entertainment / Marvel',
  reviewUrl: 'https://www.playstation.com/en-us/legal/website-terms-of-use/',
  creditText: 'Marvel Tōkon: Fighting Souls character art © Sony Interactive Entertainment / Marvel',
  permissionEvidence: playstationPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const avatarKeyArt = (
  characterSlug: 'aang' | 'korra' | 'zuko',
  objectPosition: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'avatar-legends',
  characterSlug,
  localPath: '/art/avatar-key-art.jpg',
  sourceUrl: 'https://cdn.prod.website-files.com/6916373abb21267659191bf4/6a45f0a2b3629f80990bbd1d_FINAL-KEY-ART_ALTFG.jpg',
  sourcePublisher: 'PM Studios / Gameplay Group International',
  reviewUrl: 'https://thegameplaygroup.com/terms-of-service',
  creditText: 'Avatar Legends: The Fighting Game key art © Gameplay Group International / Viacom International',
  permissionEvidence: `${avatarPromotionalEvidence} No standalone first-party ${characterSlug} cutout was found; this shared key art is character-focused in the page crop.`,
  assetHash: 'sha256:03dd1af59874090717f6faafc407fd888cb6d6ad6a0dcfc9e7153c0cec7f7a7a',
  displayFit: 'cover',
  objectPosition,
});

const mvc2Art = (
  characterSlug: string,
  sourceFilename: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'mvc2',
  characterSlug,
  localPath: `/art/mvc2-${characterSlug}.png`,
  sourceUrl: `https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/${sourceFilename}.png`,
  sourcePublisher: 'Capcom / Marvel',
  reviewUrl: 'https://www.capcom-games.com/en/terms/',
  creditText: 'Official Marvel vs. Capcom 2 promotional art via Capcom; Marvel character rights',
  permissionEvidence: capcomPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const umvc3Art = (
  characterSlug: 'zero' | 'vergil' | 'dante',
  assetId: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'umvc3',
  characterSlug,
  localPath: `/art/umvc3-${characterSlug}.png`,
  sourceUrl: `https://cdn.capcom-unity.com/capcom-unity.com/user/mikeeb13/ultimate_marvel_vs._capcom_3__char_art/large/${assetId}.png`,
  sourcePublisher: 'Capcom / UMVC3 development team',
  reviewUrl: 'https://www.capcom-games.com/en/fan-content-guidelines/',
  creditText: 'Official Ultimate Marvel vs. Capcom 3 high-resolution character art via Capcom',
  permissionEvidence: `${capcomPromotionalEvidence} The official art post invites fan creations but does not grant unchanged app reuse.`,
  assetHash: `sha256:${assetHash}`,
});

const meleeFallbackArt = (
  characterSlug: string,
  fighterNumber: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'melee',
  characterSlug,
  localPath: `/art/melee-${characterSlug}.png`,
  sourceUrl: `https://www.smashbros.com/assets_v2/img/fighter/${characterSlug}/main.png`,
  sourcePublisher: 'Nintendo',
  reviewUrl: 'https://www.nintendo.com/us/terms-of-use/ncl/',
  creditText: `Super Smash Bros. Ultimate render © Nintendo; cross-version identity fallback for Melee (fighter ${fighterNumber})`,
  permissionEvidence: nintendoPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const vampireSaviorArt = (
  characterSlug: string,
  sourceIndex: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'vampire-savior',
  characterSlug,
  localPath: `/art/vampire-savior-${characterSlug}.png`,
  sourceUrl: `https://www.capcom-games.com/cfc/assets/img/title/vampire-s/char/${sourceIndex}-e.png`,
  sourcePublisher: 'Capcom',
  reviewUrl: 'https://www.capcom-games.com/en/terms/',
  creditText: 'Official Vampire Savior promotional art ©CAPCOM',
  permissionEvidence: capcomPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const mk1Art = (
  characterSlug: string,
  sourcePath: string,
  assetHash: string,
): PromotionalArtRecord => promotionalArt({
  gameSlug: 'mk1',
  characterSlug,
  localPath: `/art/mk1-${characterSlug}.webp`,
  sourceUrl: `https://cdn-mk1.mortalkombat.com/roster/${sourcePath}.webp`,
  sourcePublisher: 'Warner Bros. Games / NetherRealm Studios',
  reviewUrl: 'https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.5.2.html',
  creditText: 'Mortal Kombat 1 character art © Warner Bros. Entertainment Inc. / NetherRealm Studios',
  permissionEvidence: wbPromotionalEvidence,
  assetHash: `sha256:${assetHash}`,
});

const records: PromotionalArtRecord[] = [
  riotArt('ahri', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/593043e42b15c4826f7e0fc2a0bea85a05cdd994-780x1040.png?accountingTag=2XKO', 'a8b7868f1782f73790bb95976f0124b522909cba99cd5fcc8f57e66b22ba1f70'),
  riotArt('akali', 'jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/1705793c7046ee13bb9027b868a91e5b935095b6-472x630.jpg?accountingTag=2XKO', '29a29fcf24cfa7a3e2fc1d6c7296fc2bde78d5779bc7fa52ca01ca414996d14e'),
  riotArt('blitzcrank', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/5af8a16de4c87ea5bb8a3b3f945e90f3306a4cfe-780x1040.png?accountingTag=2XKO', 'beecc00b38bf24c55fca13d48fa14211212b4ae706a4d14dae26e620bf8a7691'),
  riotArt('braum', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/96bcb8cdcee7f3fd12b379c8517aa1f33504c371-780x1040.png?accountingTag=2XKO', '4c3778c3a2f3c2bd3715a7a95b58143d698503f296256617a4c96628e2b939fe'),
  riotArt('caitlyn', 'jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7d7c3713add9fe798cc71ba66217a1a46d6634bc-780x1040.jpg?accountingTag=2XKO', 'b866957ee92e1832262d79b5b26336ae0f2a7c3a3751e6a09db11a49aeb5e164'),
  riotArt('darius', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/67e08591a957c9068e3b146976785fb8308d6cd4-780x1040.png?accountingTag=2XKO', 'ad35f39c908a5b5f3386a5a3a2bd85e575ee9a53bdcc7580c0f9230a32cb3b6a'),
  riotArt('ekko', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f98dcc375555b36de58cc991c381c4fce641b636-780x1040.png?accountingTag=2XKO', '3956f83f517517a8d86ab1dd6780b47ffe4f298c783d3dc4ace34681bd89e977'),
  riotArt('illaoi', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/12a5e9cea0ea7626b0d89e3740180f13341b5dc8-780x1040.png?accountingTag=2XKO', '5faf3f20c07751a798a6e9727c67324c10f1aeecb0ce35e1a94225d836c5fe4f'),
  riotArt('jinx', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/f0e8ed7da57962c1245dfca8c26a8a81ddab017d-780x1040.png?accountingTag=2XKO', 'b9807815aaf85b1bf6848b9014ade9568a2be86e98075319eac9b53193537839'),
  riotArt('senna', 'jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0606aa0ee6b494a762057c971c7bb642fe607bba-780x1040.jpg?accountingTag=2XKO', '3a1b260485576fcf812f7906fa76bc5166e6a3f48021319d5cf370f69aa59877'),
  riotArt('teemo', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/0933542e8d4fc57628e7fe7dff9cd17d2ff457a4-780x1040.png?accountingTag=2XKO', '185a0c0bd7a1d932b21ddb71e499ab47eb7b671c7e0118720ad7a94f04721593'),
  riotArt('thresh', 'jpg', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/2c9af0c83fd43c0a8f5258f75f8f197655971de9-780x1040.jpg?accountingTag=2XKO', 'a08696516143ef646c54e8a41d6c567de8c591a71dd370e9ff9798fc6a2db71c'),
  riotArt('vi', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/d69d95df23f8a7e5c951a1021f4f5b118fadaec3-780x1040.png?accountingTag=2XKO', '692475c52ffe6346d8a0fe0161f1d3035ccafff3b3cb5b60df46f26d379d3e0e'),
  riotArt('warwick', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/6aa9fb38660c1b63c37716c6f44739ba406b501f-780x1040.png?accountingTag=2XKO', 'd9e8e03c1357ee068298dc5506a431874ce26bd9415d9293f391614510306fdc'),
  riotArt('yasuo', 'png', 'https://cmsassets.rgpub.io/sanity/images/dsfx7636/game_data_live/7e9459768d4641533fdbfa1c0e84b6574d8e05ab-780x1040.png?accountingTag=2XKO', '296dbb227cbccb9b67091d7b586d37c9fbd6743306094570bcb2848ac7f44f15'),
  sf6Art('ken', 'ken', 'cb5052e9506ad88dfb430236f2dfa2b93979dcd1c0a440b5ca00026ce8eff7a7'),
  sf6Art('chun-li', 'chunli', '2d96b387d2a2dda6e65e5cdfb4baeb4c1b80f6e554066522482bc75e7c9d7c29'),
  sf6Art('akuma', 'gouki_akuma', '27b005a34450c691ae04a24ebf1c6e5c70ee399754e77a102b10a62b990166a0'),
  sf6Art('juri', 'juri', '991ba53250a47db5f09ade953750d10a64d36146d3c4c6f32eb0e42b221431c8'),
  tekkenArt('jin', 'webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/CSlAd5qETdKPCZ06jH88', '112a0e87360839ecc7ba2c97ff5b05f7eacb4388166be5873aa61173145d7bba'),
  tekkenArt('reina', 'webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/TfCpIKWORbmnzyPWwqkK', 'd7c04a8c79b6c2f45cfc9a0a5e71e2040387e896520cff43dc9ee7d17d795377'),
  tekkenArt('king', 'webp', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/ESDBWWFCTiWikbaNUkLm', '4d19461384934edc9ffef3ad6e83365815c97982e6f0b223e174436de1b126d0'),
  tekkenArt('lili', 'png', 'https://us-east-1-bandai.graphassets.com/AXzioIclSWilEjFtsMJPwz/pQi3O39ATPipjt8KqWgz', '155d22e8f6de4f6e4bb1a0426abe0f16c86abe154298b6fd3e42fd9533222088'),
  ggstFanKitArt('sol', 'chara01_sol.png', '7fd6a1a4cc85e7196d3ca68df3e248b92df4abd84601b8292274ed3020677477'),
  ggstFanKitArt('ramlethal', 'chara10_ram.png', '1033fb5a445a2d774091d10c26e3a7360036fb9aad94e3f3aefc4db853356806'),
  ggstFanKitArt('nagoriyuki', 'chara12_nag.png', 'e856f37d4379827d0edf3d1b66dd3a559d48753969969071c4c97dbc3537f973'),
  ggstFanKitArt('bridget', 'chara21_bgt.png', 'e9d2043da468825cda117f0eac9db930a43ec7b547e0e041a29f0660d14311da'),
  plusRArt('sol', '15', 'df54c4c9296de3bdcc0c8d978d6a8351dc44aa86ec2233c3b5a3e8585ffd3cd9'),
  plusRArt('ky', '07', '0ddd478928d6e92eb516eae273a439b2fa80ddad4dcf4531dc4f3a628e5448fc'),
  plusRArt('testament', '18', '8694ae2f59904d619ed97b649406cbfd76871dd28493718e88ab6a57ce755ff2'),
  plusRArt('zappa', '09', 'bc0b04ed27aad92bc2b940f00dcfb354ead3971c1ada92e67dd0fdc2ffcb73ae'),
  tokonArt('magik', 'magik-big-10-02-2026', '51401dc3f3048d15f88013b39f31e3c46885a1f32db05d846a32a5ddf1ed781f'),
  tokonArt('spider-man', 'spider-man-big-20-11-2025', '9c1ff858cd3c773da6fda90a80916c9379a795866fc49402d0505e37890743d5'),
  tokonArt('black-panther', 'black-panther-big-21-04-2026', 'c15cc1540105a6b4d66f2308ab40459262c0241578431d8196ad03e2251a610a'),
  tokonArt('storm', 'storm-big-20-11-2025', '558bbb66e3580c4f1a5543eaea1ff426ff4bf78b8bd9f0af101a9c48bdf5e9d3'),
  tokonArt('iron-man', 'iron-man-big-16-02-2026', '0431f9ecaa2d0f3ab66a60887c10e23ff33355f763772838c241938ed8407c55'),
  tokonArt('doctor-doom', 'dr-doom-big-20-11-2025', '6cb2bb0244b68eb0d778b4bdcb680d62808a73604df1d1962227e40f73d420f6'),
  promotionalArt({
    gameSlug: 'avatar-legends',
    characterSlug: 'azula',
    localPath: '/art/avatar-azula.jpg',
    sourceUrl: 'https://live.staticflickr.com/65535/55168531880_df00c7e87a_k.jpg',
    sourcePublisher: 'Gameplay Group International via PlayStation Blog',
    reviewUrl: 'https://www.playstation.com/en-us/legal/website-terms-of-use/',
    creditText: 'Avatar Legends: The Fighting Game promotional screenshot © Gameplay Group International / Viacom International',
    permissionEvidence: `${avatarPromotionalEvidence} This version-exact screenshot features Azula rather than a standalone cutout.`,
    assetHash: 'sha256:9cf595dacb4d71c1eef1af50a9ca4ad6134859393ad8dd52a81603fde4d4ec6e',
    displayFit: 'cover',
    objectPosition: '56% 45%',
  }),
  avatarKeyArt('aang', '64% 72%'),
  avatarKeyArt('korra', '31% 66%'),
  avatarKeyArt('zuko', '12% 30%'),
  mvc2Art('storm', 'storm', 'ccb6b88438a76bc7d61831a3171fa8cd14eec18c006d5f73f555c94e8e13ade6'),
  mvc2Art('magneto', 'magneto', '419c3f9d88276fd2d65c10f21f4b930f80e871cba719d55b3e522370f73e58c2'),
  mvc2Art('sentinel', 'sentinel', '693e4b48a209f9656dbf37ba970c4c242d84d4d985f93de00ffe72b6f7d99c2a'),
  mvc2Art('cable', 'cable', 'c76a8626ac3e2908044ed3688d91459d7cadb54f5db5b54a6d8b96e27d94ce54'),
  umvc3Art('zero', '2f7319c0e9932a47d0e9db7ef453ec4f', '66f595785490a5e6cadb6e05607b26bc8b1ef0fb9d718c21b0de789d5ee73b7e'),
  umvc3Art('vergil', 'b910a3cc3952012c7111b152af718e2f', '4dfdd583f5462e8db772896c825170bf4c2fc1d39a54aea376dd0cc2f63477c3'),
  promotionalArt({
    gameSlug: 'umvc3',
    characterSlug: 'doom',
    localPath: '/art/umvc3-doom.png',
    sourceUrl: 'https://www.capcom-games.com/marvel-vs-capcom-fc/assets/images/title/title6/character/doctor_doom.png',
    sourcePublisher: 'Capcom / Marvel',
    reviewUrl: 'https://www.capcom-games.com/en/terms/',
    creditText: 'Marvel vs. Capcom 2 Doctor Doom art via Capcom; cross-version identity fallback for UMVC3',
    permissionEvidence: `${capcomPromotionalEvidence} No live first-party version-matched UMVC3 Doctor Doom render was found; this MVC2 art is explicitly cross-version.`,
    assetHash: 'sha256:2867aaa52ef1094fbdfd24d961fd6e904182e2631a71591fb30f75029420b5a2',
  }),
  umvc3Art('dante', '893d1dc95c1896f2177e84bea51dad7d', '6641ca935f62229c8e1f416315711ff606366ebbab375882b4869b0b18e4cb95'),
  meleeFallbackArt('fox', '07', '67db02396021221a109fff6b83940b5879705a77e07cb2740d90b50fb00add82'),
  meleeFallbackArt('marth', '21', '0437c89299459e11811e76e3b322a851d00619e93c5b55c9437ace13dfb3b1a4'),
  meleeFallbackArt('falco', '20', 'a616cc0cba78d999dec0eb1d43dee61117dd5e9decae0ed2a8a5e47262505d03'),
  meleeFallbackArt('sheik', '16', '1bc2bbceb4a1caacd3944c5d556243a401cc587b2b00bf7c672e7c4642ca941e'),
  vampireSaviorArt('morrigan', '9', '953ea42cbc7b84d930ec056985768ef4c0bced4f90a6373dc6ec852cdd6d80d9'),
  vampireSaviorArt('jedah', '0', '64b1f9913b9ac101d1e2643147adada5b786826a1bb3f3610b60d09d60e69373'),
  vampireSaviorArt('bulleta', '1', 'a1cdaee20de0e86fc7c9697ceae141fb45de5f4369ebc916c11529ef04b2cb78'),
  vampireSaviorArt('q-bee', '3', '78bdb1a0805b0031cb3a1f18644da2bd92a8d467f5c420e42d22181d93247b79'),
  mk1Art('scorpion', 'scorpion/hero', 'dd4235ccd1b35ab31986473ab94ffb45e79c657a570780ab13f7708466e756cc'),
  mk1Art('sub-zero', 'sub-zero/hero', '876ce25cd0bc55849f48dd2c96ff8053fa778a20a9ff1f4a3d55d7018af84cff'),
  mk1Art('mileena', 'mileena/hero', '25f601067356c7b1fff6fddcdf68f1550364a07a7565cde68ae82cbd069e9fce'),
  mk1Art('sonya', 'kameos/sonya', 'ad51c7cb6e3929558eb60c8b885582695b4922f34683a8299108104789abfd9b'),
  mk1Art('kano', 'kameos/kano', 'b3876a74989be498442d16bd366282a754b93f67924879a3f28db13881241034'),
];

function indexPromotionalArt(source: PromotionalArtRecord[]): ReadonlyMap<string, CharacterArtAsset> {
  const indexed = new Map<string, CharacterArtAsset>();
  for (const { gameSlug, characterSlug, ...art } of source) {
    const key = `${gameSlug}/${characterSlug}`;
    if (indexed.has(key)) throw new Error(`Duplicate promotional art record for ${key}.`);
    indexed.set(key, art);
  }
  return indexed;
}

export const promotionalArtByCharacter = indexPromotionalArt(records);
