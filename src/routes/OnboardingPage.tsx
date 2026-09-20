import { useEffect, useRef, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { CharacterPortrait } from '../components/CharacterPortrait';
import { GameGrid } from '../components/GameGrid';
import { Icon } from '../components/Icon';
import { RosterGrid } from '../components/RosterGrid';
import { catalog, catalogBySlug } from '../data/catalog';
import { useAuth } from '../features/auth/AuthProvider';
import { signOut } from '../features/auth/auth';
import { useDraft } from '../features/draft/DraftProvider';
import {
  applyCharacterChoice,
  candidateLineup,
  clearSlot,
  emptyPicks,
  nextOpenSlotId,
  onboardingReadiness,
  stageOrder,
  suggestHandle,
  targetSlotId,
  type OnboardingStage,
} from '../features/onboarding/onboardingModel';
import { loadMyProfileDraft, writeProfileDraft } from '../features/profile/profile';
import { validateLineup } from '../lib/lineupValidation';
import type { CharacterPick, DraftProfile, GameVersion } from '../types/domain';

const STAGES: { id: OnboardingStage; label: string }[] = [
  { id: 'game', label: 'Game' },
  { id: 'roster', label: 'Main' },
  { id: 'identity', label: 'You' },
];

function pickedCharacters(game: GameVersion, picks: readonly CharacterPick[]) {
  return picks.map((pick) => ({
    pick,
    slot: game.schema.slots.find((slot) => slot.id === pick.slotId),
    character: game.characters.find((character) => character.slug === pick.characterSlug),
  }));
}

export function OnboardingPage() {
  const navigate = useNavigate();
  const { session, registeredHandle, refreshProfile } = useAuth();
  const { draft, addLineup, removeLineup, replaceDraft } = useDraft();

  const [stage, setStage] = useState<OnboardingStage>('game');
  const [gameSlug, setGameSlug] = useState<string | null>(null);
  const [picks, setPicks] = useState<CharacterPick[]>([]);
  const [focusedSlotId, setFocusedSlotId] = useState<string | null>(null);
  const [teamOption, setTeamOption] = useState('');
  const [profile, setProfile] = useState<DraftProfile>(draft.profile);
  const [handleTouched, setHandleTouched] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [online, setOnline] = useState(() => navigator.onLine);
  const stageHeading = useRef<HTMLHeadingElement | null>(null);

  const game = gameSlug ? catalogBySlug.get(gameSlug) ?? null : null;
  const activeSlotId = game ? targetSlotId(picks, focusedSlotId) : null;
  const mains = draft.lineups.filter((lineup) => lineup.category === 'main');
  const readiness = onboardingReadiness(draft, profile);
  const validation = game ? validateLineup(candidateLineup(game, picks, teamOption)) : null;
  const complete = validation?.valid ?? false;
  const activeSlot = game?.schema.slots.find((slot) => slot.id === activeSlotId) ?? null;
  // A Kameo slot must not offer fighters, and a fighter slot must not offer Kameos.
  const selectable = game
    ? game.characters.filter((character) => !activeSlot || activeSlot.allowedRoles.includes(character.role))
    : [];

  useEffect(() => {
    const update = () => setOnline(navigator.onLine);
    window.addEventListener('online', update);
    window.addEventListener('offline', update);
    return () => {
      window.removeEventListener('online', update);
      window.removeEventListener('offline', update);
    };
  }, []);

  // A member who already has a public profile has nothing to onboard. Creating one here is the
  // one case that must not bounce: this page navigates to the new profile itself.
  const leavingForNewProfile = useRef(false);
  useEffect(() => {
    if (registeredHandle && !leavingForNewProfile.current) navigate('/settings', { replace: true });
  }, [navigate, registeredHandle]);

  const firstPaint = useRef(true);
  useEffect(() => {
    if (firstPaint.current) {
      firstPaint.current = false;
      return;
    }
    stageHeading.current?.focus();
  }, [stage, gameSlug]);

  function chooseGame(slug: string) {
    const nextGame = catalogBySlug.get(slug);
    if (!nextGame) return;
    setGameSlug(slug);
    setPicks(emptyPicks(nextGame));
    setFocusedSlotId(nextGame.schema.slots[0]?.id ?? null);
    setTeamOption('');
    setError(null);
    setStage('roster');
  }

  function chooseCharacter(characterSlug: string) {
    if (!game) return;
    const next = applyCharacterChoice(game, picks, characterSlug, focusedSlotId);
    setPicks(next);
    setFocusedSlotId(nextOpenSlotId(next));
  }

  function setSlotOption(slotId: string, option: string) {
    setPicks((current) => current.map((pick) => pick.slotId === slotId ? { ...pick, option } : pick));
  }

  async function commitMain() {
    if (!game || !complete) return;
    setError(null);
    try {
      await addLineup({
        ...candidateLineup(game, picks, teamOption),
        id: crypto.randomUUID(),
      });
      setGameSlug(null);
      setPicks([]);
      setTeamOption('');
      setFocusedSlotId(null);
      setStage('game');
    } catch {
      setError('That main could not be stored on this device. Try again.');
    }
  }

  async function createProfile() {
    if (!session || !readiness.ready || saving) return;
    setError(null);
    if (!online) {
      setError('You need a connection to create your profile. Your mains are still saved on this device.');
      return;
    }
    setSaving(true);
    let savedOnline = false;
    try {
      leavingForNewProfile.current = true;
      const toSave = { ...draft, profile, updatedAt: new Date().toISOString() };
      const receipt = await writeProfileDraft(toSave, false, session.user.id);
      savedOnline = true;
      const savedDraft = await loadMyProfileDraft(session.user.id);
      if (!savedDraft) throw new Error('Your saved profile could not be reloaded.');
      await replaceDraft(savedDraft);
      // Leave first: refreshing the handle re-renders the account guard above this page, which
      // would otherwise unmount the flow mid-navigation and bounce to settings.
      navigate(`/p/${receipt.handle}`, { replace: true });
      void refreshProfile();
    } catch {
      leavingForNewProfile.current = false;
      setError(savedOnline
        ? 'Your profile was created, but this device could not reload it. Open your account to continue.'
        : 'Your profile could not be created. Your mains are still saved on this device; try again.');
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="onboarding-page page-frame">
      <header className="onboarding-head">
        <p className="onboarding-kicker">New account</p>
        <h1>Claim your mains</h1>
        <p className="onboarding-lede">
          Your profile starts with the characters you actually play. Pick one to create your account —
          then add as many more as you want.
        </p>
        <ol className="onboarding-steps" aria-label="Steps">
          {STAGES.map((entry) => {
            const state = stageOrder(entry.id) < stageOrder(stage)
              ? 'done'
              : entry.id === stage ? 'current' : 'todo';
            return (
              <li key={entry.id} className={`onboarding-steps__item onboarding-steps__item--${state}`}>
                <span aria-hidden="true">{state === 'done' ? <Icon name="check" /> : stageOrder(entry.id) + 1}</span>
                {entry.label}
                {state === 'current' && <span className="sr-only"> (current step)</span>}
              </li>
            );
          })}
        </ol>
      </header>

      {mains.length > 0 && (
        <section className="onboarding-claimed" aria-labelledby="claimed-heading">
          <h2 id="claimed-heading">Your mains <span>{mains.length}</span></h2>
          <ul className="claimed-line">
            {mains.map((lineup) => {
              const lineupGame = catalogBySlug.get(lineup.gameSlug);
              if (!lineupGame) return null;
              return (
                <li key={lineup.id} className="claimed-entry">
                  <span className="claimed-entry__faces">
                    {pickedCharacters(lineupGame, lineup.picks).map(({ pick, character }) => character && (
                      <CharacterPortrait key={pick.slotId} character={character} gameName={lineupGame.name} decorative />
                    ))}
                  </span>
                  <span className="claimed-entry__body">
                    <strong>{lineupGame.shortName}</strong>
                    <span>{pickedCharacters(lineupGame, lineup.picks).map(({ character }) => character?.name).filter(Boolean).join(' / ')}</span>
                    {lineup.teamOption && <small>{lineupGame.schema.teamOptionLabel}: {lineup.teamOption}</small>}
                  </span>
                  <button
                    type="button"
                    className="icon-button"
                    aria-label={`Remove ${lineupGame.shortName} main`}
                    onClick={() => void removeLineup(lineup.id).catch(() => setError('That main could not be removed. Try again.'))}
                  >
                    <Icon name="trash-2" />
                  </button>
                </li>
              );
            })}
          </ul>
        </section>
      )}

      {stage === 'game' && (
        <section className="onboarding-stage" aria-labelledby="stage-heading">
          <h2 id="stage-heading" tabIndex={-1} ref={stageHeading}>
            {mains.length === 0 ? 'Which game do you main?' : 'Add another main'}
          </h2>
          <p className="onboarding-stage__hint">Pick the game. You choose the character next.</p>
          <GameGrid games={catalog} onChoose={chooseGame} label="Choose a game" />
          {mains.length > 0 && (
            <div className="command-row onboarding-commands">
              <button type="button" className="button-primary" onClick={() => setStage('identity')}>
                Done adding mains
              </button>
            </div>
          )}
        </section>
      )}

      {stage === 'roster' && game && (
        <section className="onboarding-stage" aria-labelledby="stage-heading">
          <h2 id="stage-heading" tabIndex={-1} ref={stageHeading}>
            {game.schema.noun === 'Team' ? `Build your ${game.shortName} team` : `Choose your ${game.shortName} main`}
          </h2>

          <div className="slot-rail" role="group" aria-label={`${game.schema.noun} slots`}>
            {pickedCharacters(game, picks).map(({ pick, slot, character }) => {
              const optionValues = character
                ? slot?.optionValuesByCharacter?.[character.slug] ?? slot?.optionValues
                : undefined;
              return (
                <div
                  key={pick.slotId}
                  className={`slot-chip${pick.slotId === activeSlotId ? ' slot-chip--active' : ''}${character ? ' slot-chip--filled' : ''}`}
                >
                  <button
                    type="button"
                    className="slot-chip__face"
                    aria-label={character
                      ? `${slot?.label}: ${character.name}. Choose a different Character.`
                      : `${slot?.label}: empty. Fill this slot next.`}
                    onClick={() => {
                      setFocusedSlotId(pick.slotId);
                      if (character) setPicks(clearSlot(picks, pick.slotId));
                    }}
                  >
                    {character
                      ? <CharacterPortrait character={character} gameName={game.name} decorative />
                      : <span className="slot-chip__empty" aria-hidden="true"><Icon name="plus" /></span>}
                  </button>
                  <span className="slot-chip__label">
                    {game.schema.slots.length > 1 && <small>{slot?.label}</small>}
                    <strong>{character?.name ?? 'Empty'}</strong>
                  </span>
                  {character && optionValues?.length && (
                    <label className="slot-chip__option">
                      <span className="sr-only">{slot?.optionLabel} for {character.name}</span>
                      <select value={pick.option ?? ''} onChange={(event) => setSlotOption(pick.slotId, event.target.value)}>
                        <option value="">{slot?.optionLabel}…</option>
                        {optionValues.map((option) => <option key={option} value={option}>{option}</option>)}
                      </select>
                    </label>
                  )}
                </div>
              );
            })}
          </div>

          {game.schema.teamOptionValues && (
            <label className="field-row onboarding-team-option">
              <span>{game.schema.teamOptionLabel}</span>
              <select value={teamOption} onChange={(event) => setTeamOption(event.target.value)}>
                <option value="">Choose {game.schema.teamOptionLabel}</option>
                {game.schema.teamOptionValues.map((option) => <option key={option} value={option}>{option}</option>)}
              </select>
            </label>
          )}

          {game.schema.constraintNote && <p className="onboarding-stage__hint">{game.schema.constraintNote}</p>}

          {!activeSlotId && (
            <p className="onboarding-stage__hint">Every slot is filled. Tap a slot above to change it.</p>
          )}

          <RosterGrid
            game={game}
            characters={selectable}
            selectedSlugs={picks.map((pick) => pick.characterSlug).filter(Boolean)}
            disabledSlugs={!activeSlotId
              ? selectable.map((character) => character.slug)
              : game.schema.uniqueCharacters
                ? picks.filter((pick) => pick.slotId !== activeSlotId).map((pick) => pick.characterSlug).filter(Boolean)
                : []}
            onChoose={chooseCharacter}
            label={activeSlot && game.schema.slots.length > 1
              ? `${game.name} roster for ${activeSlot.label}`
              : `${game.name} roster`}
          />

          <div className="command-row onboarding-commands">
            <button type="button" className="button-secondary" onClick={() => { setGameSlug(null); setStage('game'); }}>
              Change game
            </button>
            <button type="button" className="button-primary" disabled={!complete} onClick={() => void commitMain()}>
              Claim this {game.schema.noun.toLowerCase()}
            </button>
          </div>
          {!complete && validation && validation.errors.length > 0 && (
            <p className="onboarding-stage__hint" role="status">{validation.errors[0]}</p>
          )}
        </section>
      )}

      {stage === 'identity' && (
        <section className="onboarding-stage" aria-labelledby="stage-heading">
          <h2 id="stage-heading" tabIndex={-1} ref={stageHeading}>Name your profile</h2>
          <p className="onboarding-stage__hint">This is what other players see. Private entries stay private.</p>
          <div className="onboarding-identity">
            <label>
              Display name
              <input
                required
                autoComplete="nickname"
                maxLength={48}
                value={profile.displayName}
                onChange={(event) => {
                  const displayName = event.target.value;
                  setProfile((current) => ({
                    ...current,
                    displayName,
                    handle: handleTouched ? current.handle : suggestHandle(displayName),
                  }));
                }}
              />
            </label>
            <label>
              Handle
              <input
                required
                autoCapitalize="none"
                autoComplete="username"
                spellCheck={false}
                maxLength={32}
                pattern="[a-z0-9-]+"
                placeholder="your-handle"
                value={profile.handle}
                onChange={(event) => {
                  setHandleTouched(true);
                  setProfile((current) => ({ ...current, handle: event.target.value.toLowerCase().replace(/[^a-z0-9-]/g, '') }));
                }}
              />
            </label>
            <label className="onboarding-identity__bio">
              Bio (optional)
              <input
                maxLength={160}
                value={profile.bio}
                onChange={(event) => setProfile((current) => ({ ...current, bio: event.target.value }))}
              />
            </label>
          </div>

          {!readiness.ready && (
            <div className="claim-readiness" role="status">
              <ul>{readiness.issues.map((issue) => <li key={issue}>{issue}</li>)}</ul>
            </div>
          )}

          <div className="command-row onboarding-commands">
            <button type="button" className="button-secondary" onClick={() => setStage('game')}>Add another main</button>
            <button
              type="button"
              className="button-primary"
              disabled={!readiness.ready || saving || !online}
              onClick={() => void createProfile()}
            >
              {saving ? 'Creating…' : 'Create profile'}
            </button>
          </div>
        </section>
      )}

      {error && <p className="inline-error" role="alert">{error}</p>}

      <footer className="onboarding-foot">
        <Link className="text-link" to="/settings">Account settings</Link>
        <button type="button" className="text-link" onClick={() => void signOut().catch(() => setError('You could not be signed out.'))}>
          Sign out
        </button>
      </footer>
    </div>
  );
}
