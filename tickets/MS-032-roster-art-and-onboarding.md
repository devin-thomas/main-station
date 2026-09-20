# MS-032 — Full-roster Character art and guided onboarding

**Depends on:** MS-031

MainStation launched with reviewed art for 90 of its 410 roster rows. Every other Character fell
back to its name in a box, so most players could not see the character they were claiming, and
account creation was a display name, a handle, and a bio — nothing that connected a new member to
what they actually play.

Source publisher art for the full roster, deliver it at display resolution with a roster
thumbnail, mirror it into the shared `fgc-assets` repository, and replace the account-claim form
with a guided, image-led flow that cannot finish until the member has claimed at least one main
and lets them claim as many as they want.

**Acceptance:** every founding Game covers its full roster; each record
names its publisher source, rights basis, credit line, and the SHA-256 of both delivered files;
the hosted art ledger matches the shipped ledger; a new account cannot create a profile without a
complete main; any number of mains can be claimed first; the roster is presented as art on every
surface where a Character is chosen; geometry, WCAG 2.2 AA, and 44px targets hold on the new
surface at every supported width.

## Status

**Closed 2026-09-20.** Acceptance evidence:
`docs/releases/2026-09-20-roster-art-and-onboarding.md`. Released to
`https://mainstation.uppercut-labs.workers.dev`, Worker version
`f5a9c6ee-b2b1-4f89-a6f5-00365f7de9f3`; hosted migration head `202609200003`.

| Acceptance item | State |
| --- | --- |
| Full-roster art coverage | verified — 410 of 410; all 13 Games complete |
| Per-record provenance and hashes | verified — 820 files hashed by `npm run verify:art` |
| Hosted ledger matches shipped ledger | verified — 410 approved primary rows, 0 artless Characters, 0 non-WebP paths |
| Creation blocked without a complete main | verified — e2e, including the team and Kameo cases |
| Unlimited mains before creation | verified — e2e claims two Games, then creates |
| Roster shown as art | verified — Game step, roster step, slot rail, claimed strip, Mainline, Game page |
| Surface acceptance on the new route | verified — 14 geometry, 4 axe, 2 target cases |

## Coverage

| Game | Characters | Delivered | Source |
| --- | ---: | ---: | --- |
| 2XKO | 15 | 15 | Riot community policy |
| Marvel Tōkon | 20 | 20 | PlayStation media / shared asset repo |
| Marvel vs. Capcom 2 | 56 | 56 | Capcom MvC Fighting Collection |
| Ultimate Marvel vs. Capcom 3 | 50 | 50 | Capcom high-res art post; SuperCombo Wiki mirror |
| UNI2 | 28 | 28 | Arc System Works fan kit |
| Avatar Legends | 12 | 12 | PlayStation.Blog roster art |
| Melee | 26 | 26 | Smash Ultimate renders, cross-version |
| GGXX AC+R | 25 | 25 | Arc System Works |
| Vampire Savior | 15 | 15 | Capcom Fighting Collection |
| Street Fighter 6 | 31 | 31 | Capcom |
| Mortal Kombat 1 | 56 | 56 | Warner Bros. / NetherRealm |
| Tekken 8 | 42 | 42 | Bandai Namco |
| Guilty Gear -Strive- | 34 | 34 | Arc System Works fan kit |
| **Total** | **410** | **410** | |

## How the UMVC3 Marvel half was closed

This shipped at 395 of 410 on the first pass. Capcom's own high-resolution art post publishes the
25 Capcom-side renders and nothing else: its Marvel-side links were removed by a moderator and the
bulk download it offered has not resolved since 2012. Ten of the missing characters took their
Marvel vs. Capcom 2 render as a labelled cross-version fallback; the other 15 kept the typographic
fallback. Marvel's own character pages were evaluated and rejected — one wide masthead each,
several live-action film stills, and Dormammu's shows no character at all.

The gap closed the same day from `devin-thomas/fgc-assets`, whose catalog carries all 48 roster
entries it tracks for UMVC3 as the game's own portraits, mirrored by the SuperCombo Wiki. All 25
Marvel-side rows now use those, which also retires the ten cross-version fallbacks: UMVC3 no longer
borrows a single MvC2 render. Each file was refetched from the wiki and matched byte for byte
against the SHA-256 in that repository's `catalog/manifests/357190.json` before it was accepted.

The images carry a new usage basis, `community-mirrored`, rather than being filed as publisher
art: the wiki hosts the art as a reference work and grants nothing of its own, so the credit and
the rights stay with Capcom and Marvel. `202609200003` widens the database's reuse-mode check to
admit it.

That catalog tracks 48 UMVC3 entries against MainStation's 50. It carries Jill Valentine and
Shuma-Gorath, which Capcom's manual omits as DLC, and is missing Ryu and Hsien-Ko, both of whom
are in the game. Both already had Capcom-side art here, so nothing was blocked.

Carried unchanged from MS-031: Discord sign-in end to end, installed-surface brand acceptance on
physical devices, and WebKit coverage. None is a code defect.
