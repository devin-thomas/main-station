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

**Acceptance:** every founding Game covers its full roster, or records why it cannot; each record
names its publisher source, rights basis, credit line, and the SHA-256 of both delivered files;
the hosted art ledger matches the shipped ledger; a new account cannot create a profile without a
complete main; any number of mains can be claimed first; the roster is presented as art on every
surface where a Character is chosen; geometry, WCAG 2.2 AA, and 44px targets hold on the new
surface at every supported width.

## Status

**Closed 2026-09-20.** Acceptance evidence:
`docs/releases/2026-09-20-roster-art-and-onboarding.md`. Released to
`https://mainstation.uppercut-labs.workers.dev`, Worker version
`34dd3892-edb5-42dd-88de-23dad94526c1`; hosted migration head `202609200002`.

| Acceptance item | State |
| --- | --- |
| Full-roster art coverage | verified — 395 of 410; 12 of 13 Games complete |
| Uncovered rows recorded, with cause | verified — 15 UMVC3 Marvel-side rows, cause below |
| Per-record provenance and hashes | verified — 790 files hashed by `npm run verify:art` |
| Hosted ledger matches shipped ledger | verified — 395 approved primary rows, 0 non-WebP paths |
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
| Ultimate Marvel vs. Capcom 3 | 50 | 35 | Capcom high-res art post; MvC2 fallback |
| UNI2 | 28 | 28 | Arc System Works fan kit |
| Avatar Legends | 12 | 12 | PlayStation.Blog roster art |
| Melee | 26 | 26 | Smash Ultimate renders, cross-version |
| GGXX AC+R | 25 | 25 | Arc System Works |
| Vampire Savior | 15 | 15 | Capcom Fighting Collection |
| Street Fighter 6 | 31 | 31 | Capcom |
| Mortal Kombat 1 | 56 | 56 | Warner Bros. / NetherRealm |
| Tekken 8 | 42 | 42 | Bandai Namco |
| Guilty Gear -Strive- | 34 | 34 | Arc System Works fan kit |
| **Total** | **410** | **395** | |

## Open, and why

**The Marvel half of the Ultimate Marvel vs. Capcom 3 cast, 15 rows.** Capcom's own
high-resolution art post still publishes the 25 Capcom-side renders, and those are used. Its
Marvel-side links were removed by a moderator, the bulk download it offered was a MegaUpload link
that has not resolved since 2012, and no other publisher publishes fighting-game art for those
characters. The ten that also appear in Marvel vs. Capcom 2 use that official render, labelled as
a cross-version fallback, exactly as UMVC3 Doctor Doom already did. The remaining 15 —
Thor, Deadpool, Dormammu, Super-Skrull, X-23, She-Hulk, Taskmaster, MODOK, Phoenix, Iron Fist,
Nova, Doctor Strange, Ghost Rider, Hawkeye, Rocket Raccoon — keep the typographic fallback.

Marvel's own character pages were evaluated and rejected: each publishes one wide masthead, several
are live-action film stills, and Dormammu's shows no character at all. Putting those beside Capcom
renders would be worse than the fallback, not better.

Carried unchanged from MS-031: Discord sign-in end to end, installed-surface brand acceptance on
physical devices, and WebKit coverage. None is a code defect.
