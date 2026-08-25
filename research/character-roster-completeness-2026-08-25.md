# MainStation Character Roster Completeness Research

Research cutoff: 2026-08-25. Scope is the 11 `catalogStatus: 'fixture'` entries present before this roster integration. `2xko` and `uni2` were already marked verified in the application and are not repeated here.

The lists below are ordered for data entry. Where a first-party roster page exposes an order, that order is preserved. Otherwise the list uses the game's conventional base-then-DLC or returning-then-newcomer order. Slugs are normalized, implementation-facing identifiers; names preserve the publisher/developer naming where it matters.

## Catalog audit

- Present fixture catalogs: `marvel-tokon`, `mvc2`, `umvc3`, `avatar-legends`, `melee`, `ggxxacpr`, `vampire-savior`, `sf6`, `mk1`, `tekken-8`, `ggst`.
- Already verified and intentionally excluded: `2xko`, `uni2`.
- Requested but absent: `street-fighter-3-3s`. No such game slug or name occurs in the current `src/data/catalog.ts`; a 3rd Strike roster is noted separately below as a non-catalog request.

## 1. Marvel Tokon: Fighting Souls (`marvel-tokon`)

### Scope

The game launched on 2026-08-06. Use the 20-character launch roster for the current game, not the subsequently announced Phoenix Cyclops Year 1 DLC. The official PlayStation page states 20 launch characters; the official team and beta articles establish the team membership and names.

### Ordered roster

1. `captain-america` - Captain America
2. `iron-man` - Iron Man
3. `hulk` - Hulk
4. `black-panther` - Black Panther
5. `storm` - Storm
6. `magik` - Magik
7. `wolverine` - Wolverine
8. `danger` - Danger
9. `spider-man` - Spider-Man
10. `ms-marvel` - Ms. Marvel
11. `star-lord` - Star-Lord
12. `peni-parker` - Peni Parker
13. `ghost-rider` - Ghost Rider
14. `blade` - Blade
15. `loki` - Loki
16. `deadpool` - Deadpool
17. `doctor-doom` - Doctor Doom
18. `magneto` - Magneto
19. `green-goblin` - Green Goblin
20. `carnage` - Carnage

### Sources and boundary

- [Official PlayStation game page](https://www.playstation.com/en-us/games/marvel-tokon-fighting-souls/) - states the 20-character launch roster.
- [Unbreakable X-Men reveal](https://blog.playstation.com/2026/02/12/marvel-tokon-fighting-souls-arrives-on-ps5-pc-august-6/) - Storm, Magik, Wolverine, and Danger.
- [Amazing Guardians reveal](https://blog.playstation.com/2026/03/22/peni-parker-revealed-for-marvel-tokon-fighting-souls/) - Spider-Man, Ms. Marvel, Star-Lord, and Peni Parker.
- [Fighting Avengers reveal](https://blog.playstation.com/2026/05/02/hulk-and-black-panther-join-the-fight-for-marvel-tokon-fighting-souls/) - Captain America, Iron Man, Hulk, and Black Panther.
- [Knights of Doom reveal](https://blog.playstation.com/2026/06/02/magneto-green-goblin-carnage-announced-for-marvel-tokon-fighting-souls/) and [Samurai Outriders reveal](https://blog.playstation.com/?p=420194) - the remaining eight launch fighters.
- [Phoenix Cyclops announcement](https://blog.playstation.com/2026/07/23/phoenix-cyclops-revealed-as-marvel-tokon-fighting-souls-first-year-1-dlc-character/) is announced future content and is not part of the current launch roster.

## 2. Marvel vs. Capcom 2 (`mvc2`)

### Scope

Use the arcade/collection version represented by Capcom's `Marvel vs. Capcom Fighting Collection: Arcade Classics` manual. Include all 56 selectable fighters, including the distinct Bone Wolverine slot. Do not include Abyss, which is a boss, or assist-only material as a fighter.

### Ordered roster - Marvel side

1. `blackheart` - Blackheart
2. `cable` - Cable
3. `captain-america` - Captain America
4. `colossus` - Colossus
5. `cyclops` - Cyclops
6. `doctor-doom` - Doctor Doom
7. `gambit` - Gambit
8. `hulk` - Hulk
9. `iceman` - Iceman
10. `iron-man` - Iron Man
11. `juggernaut` - Juggernaut
12. `magneto` - Magneto
13. `marrow` - Marrow
14. `omega-red` - Omega Red
15. `psylocke` - Psylocke
16. `rogue` - Rogue
17. `sabretooth` - Sabretooth
18. `sentinel` - Sentinel
19. `shuma-gorath` - Shuma-Gorath
20. `silver-samurai` - Silver Samurai
21. `spider-man` - Spider-Man
22. `spiral` - Spiral
23. `storm` - Storm
24. `thanos` - Thanos
25. `venom` - Venom
26. `war-machine` - War Machine
27. `wolverine` - Wolverine
28. `wolverine-bone` - Wolverine (Bone Claws)

### Ordered roster - Capcom side

29. `akuma` - Akuma
30. `amingo` - Amingo
31. `anakaris` - Anakaris
32. `bulleta` - B.B. Hood (Bulleta)
33. `cammy` - Cammy
34. `captain-commando` - Captain Commando
35. `charlie` - Charlie
36. `chun-li` - Chun-Li
37. `dan` - Dan
38. `dhalsim` - Dhalsim
39. `felicia` - Felicia
40. `guile` - Guile
41. `hayato` - Hayato Kanzaki
42. `jill-valentine` - Jill Valentine
43. `jin-saotome` - Jin Saotome
44. `ken` - Ken
45. `m-bison` - M. Bison
46. `mega-man` - Mega Man
47. `morrigan` - Morrigan
48. `roll` - Roll
49. `ruby-heart` - Ruby Heart
50. `ryu` - Ryu
51. `sakura` - Sakura
52. `servbot` - Servbot
53. `sonson` - SonSon
54. `strider-hiryu` - Strider Hiryu
55. `tron-bonne` - Tron Bonne
56. `zangief` - Zangief

### Sources and boundary

- [Official Capcom Fighting Collection manual](https://game.capcom.com/manual/MVCFC/en/switch/top) - exact collection and game/version scope.
- [Official Capcom manual entry for Marvel vs. Capcom 2](https://game.capcom.com/manual/MVCFC/pt-br/switch/page/7/1) - official game-specific manual entry.
- The manual's roster is primarily presented through game imagery rather than a text roster index. The 56-name transcription above follows the exact MvC2 arcade/collection roster, including the separate Bone Wolverine slot. The official source confirms the title/version boundary; the text extraction does not expose a clean machine-readable ordered list.

## 3. Ultimate Marvel vs. Capcom 3 (`umvc3`)

### Scope

Use the Ultimate release roster: 48 selectable fighters, including the 12 characters added to the original game. Do not add Galactus or other non-selectable bosses.

### Ordered roster

1. `strider-hiryu` - Strider Hiryu
2. `iron-fist` - Iron Fist
3. `nova` - Nova
4. `phoenix-wright` - Phoenix Wright
5. `doctor-strange` - Doctor Strange
6. `vergil` - Vergil
7. `ghost-rider` - Ghost Rider
8. `frank-west` - Frank West
9. `firebrand` - Firebrand
10. `hawkeye` - Hawkeye
11. `rocket-raccoon` - Rocket Raccoon
12. `nemesis-t-type` - Nemesis T-Type
13. `captain-america` - Captain America
14. `ryu` - Ryu
15. `chun-li` - Chun-Li
16. `thor` - Thor
17. `spider-man` - Spider-Man
18. `dante` - Dante
19. `trish` - Trish
20. `storm` - Storm
21. `crimson-viper` - Crimson Viper
22. `viewtiful-joe` - Viewtiful Joe
23. `spencer` - Spencer
24. `amaterasu` - Amaterasu
25. `magneto` - Magneto
26. `iron-man` - Iron Man
27. `wolverine` - Wolverine
28. `deadpool` - Deadpool
29. `super-skrull` - Super-Skrull
30. `modok` - M.O.D.O.K.
31. `tron-bonne` - Tron Bonne
32. `morrigan` - Morrigan
33. `phoenix` - Phoenix
34. `felicia` - Felicia
35. `x-23` - X-23
36. `doctor-doom` - Doctor Doom
37. `dormammu` - Dormammu
38. `haggar` - Mike Haggar
39. `hulk` - Hulk
40. `arthur` - Arthur
41. `she-hulk` - She-Hulk
42. `akuma` - Akuma
43. `taskmaster` - Taskmaster
44. `hsien-ko` - Hsien-Ko
45. `sentinel` - Sentinel
46. `chris-redfield` - Chris
47. `wesker` - Wesker
48. `zero` - Zero

### Sources and boundary

- [Official Capcom UMVC3 manual](https://static.capcom.com/manuals/umvc3/UMVC3_PS3_DMNL_EN.pdf), especially the official Fighters pages - lists the complete 48-character roster and states the 12-character expansion context.
- [Official Capcom UMVC3 manual, Xbox version](https://static.capcom.com/manuals/umvc3/UMVC3_360_DMNL_EN.pdf) - corroborating first-party roster pages.
- The manual prints `Chris` and `Wesker`; the normalized slugs retain names useful for the Capcom character identity while the display names should follow the manual unless the UI needs the longer franchise names.

## 4. Avatar Legends: The Fighting Game (`avatar-legends`)

### Scope

The game released on 2026-07-23. First-party publisher material establishes 12 playable launch fighters and three support choices per fighter. The accessible first-party pages do not provide a complete text roster index, so the final roster names and support mapping below use a dated secondary roster guide in addition to the first-party scope.

### Launch fighters

1. `aang` - Aang
2. `zuko` - Zuko
3. `katara` - Katara
4. `toph` - Toph
5. `sokka` - Sokka
6. `azula` - Azula
7. `kyoshi` - Avatar Kyoshi
8. `ozai` - Fire Lord Ozai
9. `korra` - Korra
10. `zaheer` - Zaheer
11. `nightmare-korra` - Nightmare Korra (Avatar State Korra)
12. `avatar-aang` - Avatar Aang (Avatar State Aang)

### Character-specific support choices

- `aang`: Gyatso, Momo, Appa
- `zuko`: Mai, Ran & Shaw, June
- `katara`: Kanna, Hakoda, Master Pakku
- `toph`: Badgermole, The Boulder, The Hippo
- `sokka`: Master Piandao, Suki, Princess Yue
- `azula`: Lo and Li, Joo Dee, Ursa
- `kyoshi`: Rangi, Kelsang, Yun
- `ozai`: Firelord Sozin, Admiral Zhao, Imperial Firebender
- `korra`: Naga, Tonraq, Raava
- `zaheer`: P'Li, Ming-Hua, Ghazan
- `nightmare-korra`: Vaatu, Dark Spirit, Dark Avatar Unalaq
- `avatar-aang`: Katara, Avatar Roku, Guru Pathik

### Sources and boundary

- [Official Steam store page](https://store.steampowered.com/app/2424420/Avatar_Legends_The_Fighting_Game/) - first-party product page and release context.
- [Official PlayStation elemental-bending breakdown](https://blog.playstation.com/2026/03/30/avatar-legends-the-fighting-game-elemental-bending-breakdown/) - confirms 12 playable fighters and three supports per fighter.
- [Official PM Studios game page](https://www.pm-studios.com/games/avatar-legends-the-fighting-game) - confirms the 12-fighter launch scope and support-based combat system.
- [Official developer announcement feed](https://steamcommunity.com/app/2424420/announcements/) - launch announcement and character reveal posts for Toph, Sokka, Azula, and Kyoshi.
- [Esports.gg support guide](https://esports.gg/guides/fgc/avatar-fighters-supports-explained/) - dated secondary source for the 12-name text index and all 36 support choices used by the implementation.
- The first-party completeness boundary remains explicit: the publisher confirms the size and support mechanic, while the complete names and support mapping are represented as a dated secondary-source transcription rather than an official text export. Supports are not separate fighter rows.

## 5. Super Smash Bros. Melee (`melee`)

### Scope

Use the NTSC 1.02 Melee fighter roster. There are 25 character-select slots. Zelda and Sheik share one slot and transform during play; if MainStation models playable forms rather than select slots, that slot represents two selectable forms and the effective name count is 26.

### Ordered roster - character-select slots

1. `dr-mario` - Dr. Mario
2. `mario` - Mario
3. `luigi` - Luigi
4. `bowser` - Bowser
5. `peach` - Peach
6. `yoshi` - Yoshi
7. `donkey-kong` - Donkey Kong
8. `captain-falcon` - Captain Falcon
9. `ganondorf` - Ganondorf
10. `falco` - Falco
11. `fox` - Fox
12. `ness` - Ness
13. `ice-climbers` - Ice Climbers
14. `kirby` - Kirby
15. `samus` - Samus
16. `zelda-sheik` - Zelda / Sheik
17. `link` - Link
18. `young-link` - Young Link
19. `mewtwo` - Mewtwo
20. `marth` - Marth
21. `roy` - Roy
22. `pichu` - Pichu
23. `pikachu` - Pikachu
24. `jigglypuff` - Jigglypuff
25. `mr-game-and-watch` - Mr. Game & Watch

### Sources and boundary

- [Nintendo's official Melee product/guidebook page](https://www.nintendo.co.jp/ngc/galj/koryaku/index.html) - confirms Nintendo's official complete-character guidebook scope for Super Smash Bros. DX/Melee.
- [Nintendo's official Melee reference link currently used by the catalog](https://www.smashbros.com/wii/en_us/gamemode/various/various22.html) - this URL is actually a Brawl DOJO page and is not a Melee roster source.
- Nintendo's accessible first-party pages do not expose a clean complete NTSC 1.02 roster index. The slot list above is the established Melee select-screen scope, but primary-source completeness is unavailable in the current source set. The existing four records (`fox`, `marth`, `falco`, `sheik`) are a preview only.

## 6. Guilty Gear XX Accent Core Plus R (`ggxxacpr`)

### Scope

Use the Plus R version's complete 25-character cast, including Kliff and Justice. Do not treat alternate versions such as Order-Sol as duplicates of Sol; they occupy distinct selectable character slots in this version.

### Ordered roster

1. `sol` - Sol Badguy
2. `ky` - Ky Kiske
3. `may` - May
4. `millia` - Millia Rage
5. `zato-1` - Eddie / Zato=1
6. `baiken` - Baiken
7. `faust` - Faust
8. `anji` - Anji Mito
9. `johnny` - Johnny
10. `jam` - Jam Kuradoberi
11. `venom` - Venom
12. `dizzy` - Dizzy
13. `testament` - Testament
14. `slayer` - Slayer
15. `i-no` - I-No
16. `zappa` - Zappa
17. `bridget` - Bridget
18. `robo-ky` - Robo-Ky
19. `aba` - A.B.A
20. `order-sol` - Order-Sol
21. `kliff` - Kliff Undersn
22. `justice` - Justice
23. `potemkin` - Potemkin
24. `chipp` - Chipp Zanuff
25. `axl` - Axl Low

### Sources and boundary

- [Official Arc System Works +R page](https://www.arcsystemworks.com/game/guilty-gear-xx-accent-core-plus-r/) - explicitly states that all 25 characters return.
- [Official Arc System Works Steam announcement](https://www.arcsystemworks.com/guilty-gear-xx-accent-core-plus-r-steam/) - explicitly states a full 25-character cast and names the Plus additions Kliff and Justice.
- [Official +R patch notes](https://www.arcsystemworks.com/guilty-gear-xx-accent-core-plus-patch-notes/) - confirms that Kliff and Justice become usable in the +R version.

## 7. Vampire Savior (`vampire-savior`)

### Scope

Use the original arcade `Vampire Savior: The Lord of Vampire` / Darkstalkers 3 ruleset named by the catalog. The regular arcade roster is 15 fighters. Exclude Donovan, Huitzil/Phobos, and Pyron, which belong to other Darkstalkers versions or console-expanded variants; exclude secret variants and assist-only material.

### Ordered roster

1. `anakaris` - Anakaris
2. `bishamon` - Bishamon
3. `demitri` - Demitri Maximoff
4. `felicia` - Felicia
5. `hsien-ko` - Hsien-Ko
6. `jon-talbain` - Jon Talbain / Gallon
7. `lord-raptor` - Lord Raptor / Zabel Zarock
8. `morrigan` - Morrigan Aensland
9. `rikuo` - Rikuo / Aulbath
10. `sasquatch` - Sasquatch
11. `victor` - Victor von Gerdenheim
12. `bulleta` - B.B. Hood / Bulleta
13. `jedah` - Jedah Dohma
14. `lilith` - Lilith
15. `q-bee` - Q-Bee

### Sources and boundary

- [Official Capcom Fighting Collection announcement](https://news.capcomusa.com/lets/browse/play-capcom-fighting-collection-now) - identifies Vampire Savior as part of the collection and distinguishes the five Darkstalkers versions.
- [Official Capcom Fighting Collection manual: Vampire Savior](https://game.capcom.com/manual/CFC/en/ps4/page/4/1) - exact collection game/manual boundary.
- The official manual is a gameplay manual and does not expose a text roster index. The 15-fighter list follows the original arcade ruleset named in MainStation; do not merge it with the 18-character console or Vampire Savior 2 variants. Primary-source text completeness is therefore limited, though the version boundary is clear.

## 8. Street Fighter 6 (`sf6`)

### Scope

Use the live roster as of 2026-08-25: 18 launch fighters, Year 1-3 additions, and Yasmine, who launched on 2026-08-03 as the first Year 4 character. Exclude World Tour-created avatars and non-playable story NPCs.

### Ordered roster

1. `ryu` - Ryu
2. `luke` - Luke
3. `chun-li` - Chun-Li
4. `jamie` - Jamie
5. `guile` - Guile
6. `kimberly` - Kimberly
7. `juri` - Juri
8. `ken` - Ken
9. `blanka` - Blanka
10. `dhalsim` - Dhalsim
11. `e-honda` - E. Honda
12. `dee-jay` - Dee Jay
13. `cammy` - Cammy
14. `manon` - Manon
15. `marisa` - Marisa
16. `lily` - Lily
17. `jp` - JP
18. `zangief` - Zangief
19. `rashid` - Rashid
20. `aki` - A.K.I.
21. `ed` - Ed
22. `akuma` - Akuma
23. `m-bison` - M. Bison
24. `terry` - Terry
25. `mai` - Mai
26. `elena` - Elena
27. `sagat` - Sagat
28. `c-viper` - C. Viper
29. `alex` - Alex
30. `ingrid` - Ingrid
31. `yasmine` - Yasmine

### Sources and boundary

- [Official Capcom Street Fighter news index](https://news.capcomusa.com/street_fighter) - current Year 3 and Year 4 release tracking.
- [Official Year 1 announcement](https://news.capcomusa.com/lets/browse/sf6-show-br) - Rashid, A.K.I., Ed, and Akuma.
- [Official Year 3 announcement](https://news.capcomusa.com/lets/browse/capcom-at-summer-game-fest-recap) - Sagat, C. Viper, Alex, and Ingrid.
- [Official Alex launch article](https://news.capcomusa.com/2026/03/17/alex-power-bombs-into-street-fighter-6-today/) and [official Ingrid article](https://news.capcomusa.com/2026/05/07/ingrid-lights-up-the-street-fighter-6-roster-on-may-28th/) - current release state.
- [Official Yasmine launch article](https://news.capcomusa.com/2026/08/03/activate-bayani-mode-as-yasmine-launches-today-in-street-fighter-6/) - first Year 4 fighter and the 2026-08-25 cutoff.

## 9. Mortal Kombat 1 (`mk1`)

### Scope

The catalog labels this `Definitive roster`, so include all current main fighters from the base game, Shang Tsung, Kombat Pack 1, and Kombat Pack 2. Because the selection schema has separate fighter and Kameo roles, the Kameo roster is listed separately and is required for true completeness.

### Ordered roster - main fighters

1. `liu-kang` - Liu Kang
2. `scorpion` - Scorpion
3. `sub-zero` - Sub-Zero
4. `raiden` - Raiden
5. `kung-lao` - Kung Lao
6. `kitana` - Kitana
7. `mileena` - Mileena
8. `johnny-cage` - Johnny Cage
9. `kenshi` - Kenshi
10. `smoke` - Smoke
11. `rain` - Rain
12. `li-mei` - Li Mei
13. `tanya` - Tanya
14. `baraka` - Baraka
15. `geras` - Geras
16. `reptile` - Reptile
17. `ashrah` - Ashrah
18. `havik` - Havik
19. `general-shao` - General Shao
20. `sindel` - Sindel
21. `reiko` - Reiko
22. `nitara` - Nitara
23. `shang-tsung` - Shang Tsung
24. `omni-man` - Omni-Man
25. `quan-chi` - Quan Chi
26. `peacemaker` - Peacemaker
27. `ermac` - Ermac
28. `homelander` - Homelander
29. `takeda-takahashi` - Takeda Takahashi
30. `cyrax` - Cyrax
31. `sektor` - Sektor
32. `noob-saibot` - Noob Saibot
33. `ghostface` - Ghostface
34. `conan` - Conan the Barbarian
35. `t-1000` - T-1000 Terminator

### Ordered roster - Kameo fighters

1. `sub-zero` - Sub-Zero
2. `shujinko` - Shujinko
3. `scorpion` - Scorpion
4. `motaro` - Motaro
5. `kung-lao` - Kung Lao
6. `cyrax` - Cyrax
7. `frost` - Frost
8. `goro` - Goro
9. `jax` - Jax
10. `kano` - Kano
11. `darrius` - Darrius
12. `sareena` - Sareena
13. `sektor` - Sektor
14. `sonya` - Sonya
15. `stryker` - Stryker
16. `tremor` - Tremor
17. `khameleon` - Khameleon
18. `janet-cage` - Janet Cage
19. `mavado` - Mavado
20. `ferra` - Ferra
21. `madam-bo` - Madam Bo

### Sources and boundary

- [Official Mortal Kombat 1 FAQ](https://www.mortalkombat.com/en-us/faq) - base roster, Kombat Pack 1, Kombat Pack 2, and Definitive Edition contents.
- [Official Mortal Kombat 1 roster page](https://www.mortalkombat.com/en-us/roster) - complete Kameo list and role naming.
- [Official Khaos Reigns page](https://www.mortalkombat.com/en-us/khaos-reigns) - Kombat Pack 2 fighter names.
- Include both role lists in MainStation. The current preview has only three main fighters and two Kameos, so it is far from the catalog's stated definitive scope.

## 10. Tekken 8 (`tekken-8`)

### Scope

Use the current official Fighters page as of the research cutoff. It lists 42 playable fighters, including the current DLC additions through Bob and Kunimitsu. No unreleased or merely rumored fighter is added.

### Ordered roster

1. `kazuya` - Kazuya
2. `jin` - Jin
3. `king` - King
4. `jun` - Jun
5. `paul` - Paul
6. `law` - Law
7. `jack-8` - Jack-8
8. `lars` - Lars
9. `xiaoyu` - Xiaoyu
10. `nina` - Nina
11. `leroy` - Leroy
12. `asuka` - Asuka
13. `lili` - Lili
14. `bryan` - Bryan
15. `hwoarang` - Hwoarang
16. `claudio` - Claudio
17. `azucena` - Azucena
18. `raven` - Raven
19. `leo` - Leo
20. `steve` - Steve
21. `kuma` - Kuma
22. `yoshimitsu` - Yoshimitsu
23. `shaheen` - Shaheen
24. `dragunov` - Dragunov
25. `feng` - Feng
26. `panda` - Panda
27. `lee` - Lee
28. `alisa` - Alisa
29. `zafina` - Zafina
30. `devil-jin` - Devil Jin
31. `victor` - Victor
32. `reina` - Reina
33. `eddy` - Eddy
34. `lidia` - Lidia
35. `heihachi` - Heihachi
36. `clive` - Clive
37. `anna` - Anna
38. `fahkumram` - Fahkumram
39. `armor-king` - Armor King
40. `miary-zo` - Miary Zo
41. `kunimitsu` - Kunimitsu
42. `bob` - Bob

### Sources and boundary

- [Official Bandai Namco Tekken 8 Fighters page](https://tekken.com/fighters) - complete current displayed order and all 42 names.
- The page's purchase section also identifies Eddy, Lidia, Heihachi, Clive, Anna, and the later Season 2 additions as playable character content. Treat the Fighters page as authoritative for the live roster, not the older edition marketing copy.

## 11. Guilty Gear -Strive- (`ggst`)

### Scope

Use the current official character index at the 2026-08-25 cutoff. Season 5 characters Jam and Robo-Ky are included because both had been added by April/July 2026. The two still-unknown Season 5 characters planned for Winter 2026 and Spring 2027 are not included.

### Ordered roster

1. `robo-ky` - Robo-Ky
2. `jam` - Jam Kuradoberi
3. `lucy` - Lucy
4. `unika` - Unika
5. `venom` - Venom
6. `dizzy` - Queen Dizzy
7. `slayer` - Slayer
8. `aba` - A.B.A
9. `elphelt` - Elphelt Valentine
10. `johnny` - Johnny
11. `asuka-r` - Asuka R#
12. `bedman` - Bedman?
13. `sin` - Sin Kiske
14. `bridget` - Bridget
15. `testament` - Testament
16. `baiken` - Baiken
17. `happy-chaos` - Happy Chaos
18. `jack-o` - Jack-O'
19. `goldlewis` - Goldlewis Dickinson
20. `i-no` - I-No
21. `anji` - Anji Mito
22. `giovanna` - Giovanna
23. `nagoriyuki` - Nagoriyuki
24. `leo` - Leo Whitefang
25. `ramlethal` - Ramlethal Valentine
26. `zato-1` - Zato=1 / Eddie
27. `millia` - Millia Rage
28. `faust` - Faust
29. `potemkin` - Potemkin
30. `chipp` - Chipp Zanuff
31. `axl` - Axl Low
32. `may` - May
33. `ky` - Ky Kiske
34. `sol` - Sol Badguy

### Sources and boundary

- [Official Arc System Works character index](https://www.guiltygear.com/ggst/en/character/) - current 34-character display order and season filters.
- [Official Season 5 product page](https://www.guiltygear.com/ggst/en/buynow/?tabs=5) - Jam and Robo-Ky availability plus the two still-unknown future Season 5 slots.
- [Official Jam patch notes](https://www.guiltygear.com/ggst/en/news/post-2851/) and [official Robo-Ky patch notes](https://www.guiltygear.com/ggst/en/news/post-5079/) - confirm both characters were added by the cutoff.

## Requested Street Fighter III: 3rd Strike note

`street-fighter-3-3s` is not a catalog entry in the current `src/data/catalog.ts`, so it is not counted among the 11 preview catalogs. Capcom's official archive contains developer material for 3rd Strike characters such as [Q](https://game.capcom.com/cfn/sfv/column/130020?lang=en), [Remy](https://game.capcom.com/cfn/sfv/column/130237?lang=en), and [the 3rd Strike intro](https://game.capcom.com/cfn/sfv/column/131671?lang=en), but no accessible first-party complete roster index was found in this pass. Do not add a new catalog or seed data from this report alone.

## Primary-source completeness gaps

Primary-source completeness is unavailable or materially limited for:

- `avatar-legends`: official first-party announcements establish a 12-character launch roster and three-support mechanic but do not textually enumerate the full list; the implementation therefore records the dated secondary transcription and keeps that provenance boundary visible here.
- `melee`: Nintendo's accessible first-party pages do not expose a clean complete NTSC 1.02 roster index; the official catalog URL is a Brawl page, not a Melee source.
- `mvc2` and `vampire-savior`: Capcom's official manuals establish the exact collection/game boundary but present the roster mainly as in-game imagery rather than a complete text index. The lists above are version-correct transcriptions, with explicit exclusions for bosses, assist-only entries, secret variants, and alternate ports.
- `street-fighter-3-3s`: not present in the application catalog, and no accessible first-party complete roster index was found.
