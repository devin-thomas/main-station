import type { Character, GameVersion, RosterRole, SelectionSchema } from '../types/domain';
import { avatarSupportOptions, avatarSupportOptionsByFighter, completeRosters, type RosterEntry } from './completeRosters';
import { promotionalArtByCharacter } from './promotionalArt';

const fighter = (
  slug: string,
  name: string,
  summary: string,
  sourceUrl: string,
  extra: Partial<Character> = {},
): Character => ({ slug, name, summary, sourceUrl, role: 'fighter', ...extra });

const rosterCheckedAt = '2026-08-25';
const twoXkoSourceCheckedAt = rosterCheckedAt;

const sourcedRoster = (
  gameName: string,
  sourceUrl: string,
  sourcePublisher: string,
  entries: readonly RosterEntry[],
  role: RosterRole = 'fighter',
): Character[] => entries.map(({ slug, name }) => fighter(
  slug,
  name,
  `Selectable ${gameName} roster entry for the checked version boundary.`,
  sourceUrl,
  { role, sourcePublisher, sourceCheckedAt: rosterCheckedAt },
));

const twoXkoFighter = (slug: string, name: string, summary: string): Character => fighter(
  slug,
  name,
  summary,
  `https://2xko.riotgames.com/en-us/champions/${slug}/`,
  { sourcePublisher: 'Riot Games', sourceCheckedAt: twoXkoSourceCheckedAt },
);

const soloSchema = (verified = true): SelectionSchema => ({
  version: 1,
  noun: 'Character',
  verified,
  ordered: false,
  uniqueCharacters: true,
  slots: [{ id: 'fighter', label: 'Character', allowedRoles: ['fighter'] }],
});

const teamSchema = (count: number, verified = true): SelectionSchema => ({
  version: 1,
  noun: 'Team',
  verified,
  ordered: true,
  uniqueCharacters: true,
  slots: Array.from({ length: count }, (_, index) => ({
    id: `slot-${index + 1}`,
    label: `Slot ${index + 1}`,
    allowedRoles: ['fighter'] as const,
  })),
});

const mvcSchema = (assistValues: string[]): SelectionSchema => ({
  version: 1,
  noun: 'Team',
  verified: true,
  ordered: true,
  uniqueCharacters: true,
  slots: Array.from({ length: 3 }, (_, index) => ({
    id: `slot-${index + 1}`,
    label: ['Point', 'Middle', 'Anchor'][index],
    allowedRoles: ['fighter'] as const,
    optionLabel: 'Assist',
    optionValues: assistValues,
  })),
});

const uni2FanKitReviewedAt = '2026-08-25';
const uni2BalanceNotesUrl = 'https://www.arcsystemworks.jp/portal/post-30285/';

const uni2FanKitArt = (filename: string, sourceFilename: string, assetHash: string): NonNullable<Character['art']> => ({
  localPath: `/art/${filename}`,
  sourceUrl: `https://www.arcsystemworks.jp/uni2celes/assets/img/fankit/character/${sourceFilename}`,
  sourcePublisher: 'Arc System Works',
  reviewUrl: 'https://www.arcsystemworks.jp/uni2celes/en/fankit/',
  creditText: '© FRENCH-BREAD / ARC SYSTEM WORKS',
  usageBasis: 'express-fan-kit',
  permissionEvidence: 'Official fan-kit terms permit website use and unmodified redistribution with notice and an official-site link.',
  assetHash: `sha256:${assetHash}`,
  reviewedAt: uni2FanKitReviewedAt,
});

const uni2Fighter = (
  slug: string,
  name: string,
  summary: string,
  sourceFilename: string,
  assetHash: string,
  summarySourceUrl = uni2BalanceNotesUrl,
): Character => fighter(
  slug,
  name,
  summary,
  summarySourceUrl,
  {
    sourcePublisher: 'Arc System Works',
    sourceCheckedAt: uni2FanKitReviewedAt,
    art: uni2FanKitArt(`uni2-${slug}.png`, sourceFilename, assetHash),
  },
);

const catalogBase: GameVersion[] = [
  {
    slug: '2xko',
    name: '2XKO',
    shortName: '2XKO',
    releaseLabel: 'Current live roster',
    sourceUrl: 'https://2xko.riotgames.com/en-us/champions/',
    sourceCheckedAt: twoXkoSourceCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: {
      ...teamSchema(2),
      slots: [
        { id: 'point', label: 'Point', allowedRoles: ['fighter'] },
        { id: 'assist', label: 'Assist', allowedRoles: ['fighter'] },
      ],
      teamOptionLabel: 'Fuse',
      teamOptionValues: ['Double Down', 'Juggernaut', 'Sidekick', '2X Assist', 'Freestyle', 'Teamfight'],
      constraintNote: 'Riot does not publish a same-Champion team rule. MainStation conservatively requires distinct Point and Assist picks so saved teams remain valid under either outcome.',
    },
    characters: [
      twoXkoFighter('ahri', 'Ahri', 'A mobile mage who turns space control into fast approach and conversion routes.'),
      twoXkoFighter('akali', 'Akali', 'A close-range assassin who uses rapid movement and layered follow-ups to stay on top of opponents.'),
      twoXkoFighter('blitzcrank', 'Blitzcrank', 'A heavyweight grappler whose Rocket Grab and armored advances turn range into command-grab pressure.'),
      twoXkoFighter('braum', 'Braum', 'A defensive brawler who protects space with his shield and converts close contact into team-friendly pressure.'),
      twoXkoFighter('caitlyn', 'Caitlyn', 'A long-range marksman who controls lanes with rifle shots and traps before cashing out on precise confirms.'),
      twoXkoFighter('darius', 'Darius', 'A heavy mid-range threat whose axe controls movement and rewards decisive reads.'),
      twoXkoFighter('ekko', 'Ekko', 'A mobile close-range fighter built around temporal pressure and layered mixups.'),
      twoXkoFighter('illaoi', 'Illaoi', 'A heavy-hitting brawler who summons tentacles to extend pressure and punish opponents who contest her space.'),
      twoXkoFighter('jinx', 'Jinx', 'A projectile specialist who switches weapons and covers movement with gadgets for chaotic screen control.'),
      twoXkoFighter('senna', 'Senna', 'A long-range marksman who blends deliberate shots with support tools that reshape team positioning.'),
      twoXkoFighter('teemo', 'Teemo', 'A compact trap setter who uses poison, mobility, and mushrooms to make every route risky.'),
      twoXkoFighter('thresh', 'Thresh', 'A control specialist whose chain, hook, and lantern create unusual conversions and tag positions.'),
      twoXkoFighter('vi', 'Vi', 'A forward-driving brawler who uses armored punches and charged movement to force close-range exchanges.'),
      twoXkoFighter('warwick', 'Warwick', 'A relentless rushdown fighter whose lunges and feral pressure reward staying in motion.'),
      twoXkoFighter('yasuo', 'Yasuo', 'A stance-rich swordsman with precise movement and expressive combo routing.'),
    ],
  },
  {
    slug: 'marvel-tokon',
    name: 'Marvel Tokon: Fighting Souls',
    shortName: 'TOKON',
    releaseLabel: 'Launch roster',
    sourceUrl: 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: teamSchema(4),
    characters: sourcedRoster('Marvel Tokon', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', completeRosters.marvelTokon),
  },
  {
    slug: 'mvc2',
    name: 'Marvel vs. Capcom 2',
    shortName: 'MVC2',
    releaseLabel: 'Arcade / collection ruleset',
    sourceUrl: 'https://game.capcom.com/manual/MVCFC/en/switch/top',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: mvcSchema(['Assist A', 'Assist B', 'Assist C']),
    characters: sourcedRoster('Marvel vs. Capcom 2', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', completeRosters.mvc2),
  },
  {
    slug: 'umvc3',
    name: 'Ultimate Marvel vs. Capcom 3',
    shortName: 'UMVC3',
    releaseLabel: 'Ultimate roster',
    sourceUrl: 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: mvcSchema(['Assist alpha', 'Assist beta', 'Assist gamma']),
    characters: sourcedRoster('Ultimate Marvel vs. Capcom 3', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', completeRosters.umvc3),
  },
  {
    slug: 'uni2',
    name: 'Under Night In-Birth II Sys:Celes',
    shortName: 'UNI2',
    releaseLabel: 'Current official roster',
    sourceUrl: 'https://www.arcsystemworks.jp/uni2celes/en/character/',
    sourceCheckedAt: '2026-08-25',
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: [
      uni2Fighter('hyde', 'Hyde', 'A mid-range sword fighter whose strong pokes, interrupts, and flexible combo routes reward measured neutral control.', 'csel_noef_000Hyde.png', '6deb04b76669e9e05ea301e53ddaecb0a31d312c4b313c675ba41a2b3f5038e4'),
      uni2Fighter('linne', 'Linne', 'A fast close-range fighter who uses quick normals, frame traps, block strings, and aerial throw punishes to sustain offense.', 'csel_noef_001Linne.png', 'c01bac53bf24aee8a760b9a8f0f2cd522cdc6d0f26db9d4d861b442cb1d287e7'),
      uni2Fighter('waldstein', 'Waldstein', 'A large claw fighter who uses mix-ups, anti-air attacks, and reliable follow-ups to turn openings into damaging combos.', 'csel_noef_002Waldstein.png', 'fdd8d928fab8aa94879f9afa0d9073eb7415fefb4b32e4b597c722d7d7a6dc18'),
      uni2Fighter('carmine', 'Carmine', 'A blood-powered mix-up fighter whose overheads, placed attacks, and mid-range knockdowns feed extended combos.', 'csel_noef_003Carmine.png', '532eac2560010c3d30a78e10517b7b4a142e1b2b5339f1ae82523fe2477fb87b'),
      uni2Fighter('orie', 'Orie', 'A flexible neutral fighter who uses delayed thrust strings, defensive buttons, and aerial Thanatos commands to vary pressure.', 'csel_noef_004Orie.png', 'd034e2e20297dd150d69b2337cb9beb130a56e2503ea0be74ec3d07d55d9f9e3'),
      uni2Fighter('gordeau', 'Gordeau', 'A close-range pressure specialist whose approach tools and long-reaching attacks let him threaten from mid- and long-range.', 'csel_noef_005Gordeau.png', '7e4f743ab31a913642633d0331c8e275e6c17540ef16d00545616315fbe1b1b1'),
      uni2Fighter('merkava', 'Merkava', 'An air-mobile setplay fighter who uses drill routes and cling setups to maintain point-blank pressure after combos.', 'csel_noef_006Merkava.png', 'dcf8c5f5c85d31d357288aab1876f6111c14fe7801840d6bb60a064d4ba65512'),
      uni2Fighter('vatista', 'Vatista', 'A technical charge fighter whose enhanced aerial options and expanded EX routes support air control and varied combo routing.', 'csel_noef_007Vatista.png', 'c5bd16037b77842456c7406d9686ba4efd6f8f116ebf6ddda03cab1809e161d4'),
      uni2Fighter('seth', 'Seth', 'A deceptive setup fighter who converts aerial attacks and Vanishing Confusion into varied neutral and high-reward offense.', 'csel_noef_008Seth.png', 'd764d96b9ddf29d57b0f3430db98d0eab446010cbaa96a723ff75ffc961cc0b5'),
      uni2Fighter('yuzuriha', 'Yuzuriha', 'A mobile stance-and-sword fighter who baits movement, pokes from range, and turns flexible cancels into offense.', 'csel_noef_009Yuzuriha.png', 'cbf1fc94121b64faf4ba632d59def84a916b66eebd991fd1f7c591188b3e169c'),
      uni2Fighter('hilda', 'Hilda', 'A deceptive ranged pressure fighter whose delayed attacks and block strings turn neutral openings into high-damage combos.', 'csel_noef_010Hilda.png', 'f4b26461883d7655697c8e8920d11134b06db267ce6eaa333a04cf32e689df86'),
      uni2Fighter('chaos', 'Chaos', 'A setup fighter who commands Azhi Dahaka to extend pressure, reposition the summon, and diversify combo routes.', 'csel_noef_015Chaos.png', 'fb2cf6eb6b6e81650b5d25828f24f888d6cc2f7755537120c1b20186f3faf78b'),
      uni2Fighter('nanase', 'Nanase', 'A mobile wind fighter with safer pokes, aerial tools, and conversions that carry stray hits into full combos.', 'csel_noef_012Nanase.png', 'dd7f0a9408971650777e665972dc2ccd06fbbaa346695c10559061b35e6b1566'),
      uni2Fighter('byakuya', 'Byakuya', 'An aggressive setup fighter whose improved normals, traps, and dash attacks help him close space and force pressure.', 'csel_noef_013Byakuya.png', '2eb71cb253c9d2682ef38fa6af7eeddd200eac5cf013a21711ab60772b90dac2'),
      uni2Fighter('phonon', 'Phonon', 'A long-reach specialist who controls neutral with mid-range pokes and threatening block strings while covering a weaker defense.', 'csel_noef_024phonon.png', '60b21d7571dc0bcf5626e73c9b419bd822fec88658f48a26f5182074176399ca'),
      uni2Fighter('mika', 'Mika', 'A lunging close-range fighter whose missiles, cannon, and advancing attacks create varied offense with useful defensive options.', 'csel_noef_021Mika.png', 'fa56a74db9792734738822b69b3ebf93375a3db05efa0225c9060e4811aa1075'),
      uni2Fighter('wagner', 'Wagner', 'A sword-and-shield power-up fighter who strengthens pressure and damage by activating and managing both weapons.', 'csel_noef_016Wagner.png', 'e8eb4fcea9347ad992b50ded641c18aa54c46526d293af0566c46f24dcd1f22a'),
      uni2Fighter('enkidu', 'Enkidu', 'A hand-to-hand ground fighter who uses frame traps, attack strings, and strong single-hit damage to win close interactions.', 'csel_noef_017Enkidu.png', 'e264f609214b897ed8499ee4cc3eae58859f55675876d300d8b639bad532a49b'),
      uni2Fighter('londrekia', 'Londrekia', 'An ice-based mid-range fighter whose frozen projectiles and pressure resets control space and support overhead conversions.', 'csel_noef_018Londrekia.png', '0f6a279fcef6057aa8f0152fcca18ae0ba04416cbe37627cd6fa8e2b3d180642'),
      uni2Fighter('tsurugi', 'Tsurugi', 'An aggressive armored fighter whose dashing attacks and projectile-invulnerable movement let him force his way through neutral.', 'csel_noef_019Tsurugi.png', '895b5721a45d379276f39535b1ccea1707c42a8537b66717cc291f6ce3501d21'),
      uni2Fighter('kaguya', 'Kaguya', 'A flexible dual-gun fighter who uses movement feints, projectiles, and anti-air tools to adapt her neutral and combo routes.', 'csel_noef_022Kaguya.png', '5f11e1b3b566bd44be459891ca85826499e7a345459ee749a292fbc8496130a0'),
      uni2Fighter('kuon', 'Kuon', 'A ground-and-air space controller who places persistent projectiles to restrict movement and open throws or layered offense.', 'csel_noef_023Kuon.png', '9b3aaa0143daa03a3ba424460784446ffff8477a8b8465a2a01344cc6191babd'),
      uni2Fighter('uzuki', 'Uzuki', 'A versatile trap-and-summon fighter who tracks opponents with dolls and coffins to build unpredictable offense.', 'csel_noef_020Uzuki.png', 'a553e77ee3c92798060c818b7679d59a6c8b9d774faa604fd7f5c05f4baedaf4'),
      uni2Fighter('ogre', 'Ogre', 'A neutral-focused brawler whose long pokes and whiff punishes convert clean hits into consistent combos.', 'csel_noef_025Ogre.png', '3aa92b8eecc4a346961a0a79f7b64532176d624edb250cb2b13363d330d0aeef'),
      uni2Fighter('izumi', 'Izumi', 'A companion-led fighter who uses Elefee and a bouncing Bubbly Breath projectile to shape close-range exchanges.', 'csel_noef_026Izumi.png', 'f547ea2a60643c078f0bfbabe63779ad97e6725e0e1f5185ef56c04e5e4764c1', 'https://www.arcsystemworks.jp/portal/post-30481/'),
      uni2Fighter('zohar', 'Zohar', 'A claw-armed close-range fighter who uses a doppelganger to mirror and layer attacks.', 'csel_noef_027zohar.png', 'ff2f7b33f659edbd3c909b0d5002acd6ce37a95522e7cb4261861a92181a4cd5', 'https://www.youtube.com/watch?v=YOJNP1c36B8'),
      uni2Fighter('eltnum', 'Eltnum', 'A versatile close-range and gun fighter who balances Etherite pressure with Hollow Point and Warning Shot confirms.', 'csel_noef_011Eltnum.png', 'd3ad6b4fc2780287c53e3fb724d63616ff8e82177f57257bc2bf09a0b05f4e80'),
      uni2Fighter('akatsuki', 'Akatsuki', 'A close-range specialist who pairs fast Blitz Shot projectiles with lockdown strings and high-reward strike mix-ups.', 'csel_noef_014Akatsuki.png', '51ce0e39c69595e0facebb6b1010e62830932e06cd97934c9a186904590a7403'),
    ],
  },
  {
    slug: 'avatar-legends',
    name: 'Avatar Legends: The Fighting Game',
    shortName: 'AVATAR',
    releaseLabel: 'Launch roster + support pools',
    sourceUrl: 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: {
      ...soloSchema(),
      slots: [{
        id: 'fighter',
        label: 'Character',
        allowedRoles: ['fighter'],
        optionLabel: 'Support',
        optionValues: avatarSupportOptions,
        optionValuesByCharacter: avatarSupportOptionsByFighter,
      }],
      constraintNote: 'Each fighter exposes the three support choices published for the launch build. Supports change the fighter loadout; they are not separate roster slots.',
    },
    characters: sourcedRoster('Avatar Legends', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', completeRosters.avatarFighters),
  },
  {
    slug: 'melee',
    name: 'Super Smash Bros. Melee',
    shortName: 'MELEE',
    releaseLabel: 'NTSC 1.02 playable forms',
    sourceUrl: 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Super Smash Bros. Melee', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', completeRosters.melee),
  },
  {
    slug: 'ggxxacpr',
    name: 'Guilty Gear XX Accent Core Plus R',
    shortName: '+R',
    releaseLabel: 'Plus R',
    sourceUrl: 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Guilty Gear XX Accent Core Plus R', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', completeRosters.ggxxacpr),
  },
  {
    slug: 'vampire-savior',
    name: 'Vampire Savior',
    shortName: 'VSAV',
    releaseLabel: 'Darkstalkers 3 arcade rules',
    sourceUrl: 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Vampire Savior', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', completeRosters.vampireSavior),
  },
  {
    slug: 'sf6',
    name: 'Street Fighter 6',
    shortName: 'SF6',
    releaseLabel: 'Current live roster',
    sourceUrl: 'https://news.capcomusa.com/street_fighter',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Street Fighter 6', 'https://news.capcomusa.com/street_fighter', 'Capcom', completeRosters.sf6),
  },
  {
    slug: 'mk1',
    name: 'Mortal Kombat 1',
    shortName: 'MK1',
    releaseLabel: 'Definitive roster + Kameos',
    sourceUrl: 'https://www.mortalkombat.com/en-us/roster',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: {
      version: 1,
      noun: 'Team',
      verified: true,
      ordered: true,
      uniqueCharacters: true,
      slots: [
        { id: 'fighter', label: 'Fighter', allowedRoles: ['fighter'] },
        { id: 'kameo', label: 'Kameo', allowedRoles: ['kameo'] },
      ],
    },
    characters: [
      ...sourcedRoster('Mortal Kombat 1', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', completeRosters.mk1Fighters),
      ...sourcedRoster('Mortal Kombat 1 Kameo', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', completeRosters.mk1Kameos, 'kameo'),
    ],
  },
  {
    slug: 'tekken-8',
    name: 'Tekken 8',
    shortName: 'TEKKEN 8',
    releaseLabel: 'Current live roster',
    sourceUrl: 'https://tekken.com/fighters',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Tekken 8', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', completeRosters.tekken8),
  },
  {
    slug: 'ggst',
    name: 'Guilty Gear -Strive-',
    shortName: 'STRIVE',
    releaseLabel: 'Current live roster',
    sourceUrl: 'https://www.guiltygear.com/ggst/en/character/',
    sourceCheckedAt: rosterCheckedAt,
    catalogStatus: 'verified',
    playerCount: null,
    schema: soloSchema(),
    characters: sourcedRoster('Guilty Gear -Strive-', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', completeRosters.ggst),
  },
];

export const catalog: GameVersion[] = catalogBase.map((game) => ({
  ...game,
  characters: game.characters.map((character) => ({
    ...character,
    art: character.art ?? promotionalArtByCharacter.get(`${game.slug}/${character.slug}`),
  })),
}));

export const catalogBySlug = new Map(catalog.map((game) => [game.slug, game]));

export function findCharacter(gameSlug: string, characterSlug: string): Character | undefined {
  return catalogBySlug.get(gameSlug)?.characters.find((character) => character.slug === characterSlug);
}
