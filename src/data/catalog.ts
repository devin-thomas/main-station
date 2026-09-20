import type { Character, GameVersion, RosterRole, SelectionSchema } from '../types/domain';
import { avatarSupportOptions, avatarSupportOptionsByFighter, completeRosters, type RosterEntry } from './completeRosters';
import { characterSummariesByGame } from './characterSummaries';
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

const summaryFor = (gameSlug: string, characterSlug: string): string => {
  const summary = characterSummariesByGame[gameSlug]?.[characterSlug];
  if (!summary) throw new Error(`Missing gameplay summary for ${gameSlug}/${characterSlug}.`);
  return summary;
};

const sourcedRoster = (
  gameSlug: string,
  sourceUrl: string,
  sourcePublisher: string,
  entries: readonly RosterEntry[],
  role: RosterRole = 'fighter',
): Character[] => entries.map(({ slug, name }) => fighter(
  slug,
  name,
  summaryFor(gameSlug, slug),
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

const uni2Fighter = (
  slug: string,
  name: string,
  summary: string,
  summarySourceUrl = uni2BalanceNotesUrl,
): Character => fighter(
  slug,
  name,
  summary,
  summarySourceUrl,
  {
    sourcePublisher: 'Arc System Works',
    sourceCheckedAt: uni2FanKitReviewedAt,
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
      constraintNote: 'Choose different champions for Point and Assist.',
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
    characters: sourcedRoster('marvel-tokon', 'https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/', 'PlayStation / Arc System Works', completeRosters.marvelTokon),
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
    characters: sourcedRoster('mvc2', 'https://game.capcom.com/manual/MVCFC/en/switch/top', 'Capcom', completeRosters.mvc2),
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
    characters: sourcedRoster('umvc3', 'https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf', 'Capcom', completeRosters.umvc3),
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
      uni2Fighter('hyde', 'Hyde', 'A mid-range sword fighter whose strong pokes, interrupts, and flexible combo routes reward measured neutral control.'),
      uni2Fighter('linne', 'Linne', 'A fast close-range fighter who uses quick normals, frame traps, block strings, and aerial throw punishes to sustain offense.'),
      uni2Fighter('waldstein', 'Waldstein', 'A large claw fighter who uses mix-ups, anti-air attacks, and reliable follow-ups to turn openings into damaging combos.'),
      uni2Fighter('carmine', 'Carmine', 'A blood-powered mix-up fighter whose overheads, placed attacks, and mid-range knockdowns feed extended combos.'),
      uni2Fighter('orie', 'Orie', 'A flexible neutral fighter who uses delayed thrust strings, defensive buttons, and aerial Thanatos commands to vary pressure.'),
      uni2Fighter('gordeau', 'Gordeau', 'A close-range pressure specialist whose approach tools and long-reaching attacks let him threaten from mid- and long-range.'),
      uni2Fighter('merkava', 'Merkava', 'An air-mobile setplay fighter who uses drill routes and cling setups to maintain point-blank pressure after combos.'),
      uni2Fighter('vatista', 'Vatista', 'A technical charge fighter whose enhanced aerial options and expanded EX routes support air control and varied combo routing.'),
      uni2Fighter('seth', 'Seth', 'A deceptive setup fighter who converts aerial attacks and Vanishing Confusion into varied neutral and high-reward offense.'),
      uni2Fighter('yuzuriha', 'Yuzuriha', 'A mobile stance-and-sword fighter who baits movement, pokes from range, and turns flexible cancels into offense.'),
      uni2Fighter('hilda', 'Hilda', 'A deceptive ranged pressure fighter whose delayed attacks and block strings turn neutral openings into high-damage combos.'),
      uni2Fighter('chaos', 'Chaos', 'A setup fighter who commands Azhi Dahaka to extend pressure, reposition the summon, and diversify combo routes.'),
      uni2Fighter('nanase', 'Nanase', 'A mobile wind fighter with safer pokes, aerial tools, and conversions that carry stray hits into full combos.'),
      uni2Fighter('byakuya', 'Byakuya', 'An aggressive setup fighter whose improved normals, traps, and dash attacks help him close space and force pressure.'),
      uni2Fighter('phonon', 'Phonon', 'A long-reach specialist who controls neutral with mid-range pokes and threatening block strings while covering a weaker defense.'),
      uni2Fighter('mika', 'Mika', 'A lunging close-range fighter whose missiles, cannon, and advancing attacks create varied offense with useful defensive options.'),
      uni2Fighter('wagner', 'Wagner', 'A sword-and-shield power-up fighter who strengthens pressure and damage by activating and managing both weapons.'),
      uni2Fighter('enkidu', 'Enkidu', 'A hand-to-hand ground fighter who uses frame traps, attack strings, and strong single-hit damage to win close interactions.'),
      uni2Fighter('londrekia', 'Londrekia', 'An ice-based mid-range fighter whose frozen projectiles and pressure resets control space and support overhead conversions.'),
      uni2Fighter('tsurugi', 'Tsurugi', 'An aggressive armored fighter whose dashing attacks and projectile-invulnerable movement let him force his way through neutral.'),
      uni2Fighter('kaguya', 'Kaguya', 'A flexible dual-gun fighter who uses movement feints, projectiles, and anti-air tools to adapt her neutral and combo routes.'),
      uni2Fighter('kuon', 'Kuon', 'A ground-and-air space controller who places persistent projectiles to restrict movement and open throws or layered offense.'),
      uni2Fighter('uzuki', 'Uzuki', 'A versatile trap-and-summon fighter who tracks opponents with dolls and coffins to build unpredictable offense.'),
      uni2Fighter('ogre', 'Ogre', 'A neutral-focused brawler whose long pokes and whiff punishes convert clean hits into consistent combos.'),
      uni2Fighter('izumi', 'Izumi', 'A companion-led fighter who uses Elefee and a bouncing Bubbly Breath projectile to shape close-range exchanges.', 'https://www.arcsystemworks.jp/portal/post-30481/'),
      uni2Fighter('zohar', 'Zohar', 'A claw-armed close-range fighter who uses a doppelganger to mirror and layer attacks.', 'https://www.youtube.com/watch?v=YOJNP1c36B8'),
      uni2Fighter('eltnum', 'Eltnum', 'A versatile close-range and gun fighter who balances Etherite pressure with Hollow Point and Warning Shot confirms.'),
      uni2Fighter('akatsuki', 'Akatsuki', 'A close-range specialist who pairs fast Blitz Shot projectiles with lockdown strings and high-reward strike mix-ups.'),
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
      constraintNote: 'Each fighter has three support choices. Support is part of the fighter loadout.',
    },
    characters: sourcedRoster('avatar-legends', 'https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/', 'Gameplay Group International / PM Studios', completeRosters.avatarFighters),
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
    characters: sourcedRoster('melee', 'https://www.smashbros.com/wii/en_us/gamemode/various/various22.html', 'Nintendo', completeRosters.melee),
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
    characters: sourcedRoster('ggxxacpr', 'https://www.arcsystemworks.jp/steam/ggxxacpr/en/', 'Arc System Works', completeRosters.ggxxacpr),
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
    characters: sourcedRoster('vampire-savior', 'https://www.capcom-games.com/cfc/en-us/title/darkstalkers.html', 'Capcom', completeRosters.vampireSavior),
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
    characters: sourcedRoster('sf6', 'https://news.capcomusa.com/street_fighter', 'Capcom', completeRosters.sf6),
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
      ...sourcedRoster('mk1', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', completeRosters.mk1Fighters),
      ...sourcedRoster('mk1', 'https://www.mortalkombat.com/en-us/roster', 'NetherRealm Studios / Warner Bros. Games', completeRosters.mk1Kameos, 'kameo'),
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
    characters: sourcedRoster('tekken-8', 'https://tekken.com/fighters', 'Bandai Namco Entertainment', completeRosters.tekken8),
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
    characters: sourcedRoster('ggst', 'https://www.guiltygear.com/ggst/en/character/', 'Arc System Works', completeRosters.ggst),
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
