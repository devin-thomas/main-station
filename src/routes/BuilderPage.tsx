import { useMemo, useState, type FormEvent } from 'react';
import { Link } from 'react-router-dom';
import { Mainline } from '../components/Mainline';
import { catalog, catalogBySlug } from '../data/catalog';
import { getBuilderAccountPresentation } from '../features/auth/accountPresentation';
import { useAuth } from '../features/auth/AuthProvider';
import { useDraft } from '../features/draft/DraftProvider';
import { validateLineup } from '../lib/lineupValidation';
import type { CharacterPick, Lineup, LineupCategory, LineupLifecycle, LineupVisibility } from '../types/domain';

function initialPicks(gameSlug: string): CharacterPick[] {
  const game = catalogBySlug.get(gameSlug);
  return game?.schema.slots.map((slot) => ({ slotId: slot.id, characterSlug: '' })) ?? [];
}

export function BuilderPage() {
  const { draft, storageError, addLineup, updateLineup, moveLineup, removeLineup } = useDraft();
  const { session, sessionLoading, registeredHandle, profileLoading, profileLookupFailed } = useAuth();
  const [selectedGame, setSelectedGame] = useState('uni2');
  const [picks, setPicks] = useState<CharacterPick[]>(() => initialPicks('uni2'));
  const [category, setCategory] = useState<LineupCategory>('main');
  const [lifecycle, setLifecycle] = useState<LineupLifecycle>('active');
  const [visibility, setVisibility] = useState<LineupVisibility>('public');
  const [teamOption, setTeamOption] = useState('');
  const [message, setMessage] = useState<string | null>(null);
  const [attempted, setAttempted] = useState(false);
  const [editingLineupId, setEditingLineupId] = useState<string | null>(null);
  const game = catalogBySlug.get(selectedGame) ?? catalog[0];
  const accountPresentation = getBuilderAccountPresentation({
    hasSession: Boolean(session),
    sessionLoading,
    profileLoading,
    profileLookupFailed,
    registeredHandle,
  });

  const candidate = useMemo<Lineup>(() => ({
    id: 'candidate',
    gameSlug: game.slug,
    category,
    lifecycle,
    visibility,
    picks,
    teamOption: teamOption || undefined,
    createdAt: new Date().toISOString(),
  }), [category, game.slug, lifecycle, picks, teamOption, visibility]);
  const validation = validateLineup(candidate);

  function chooseGame(gameSlug: string) {
    setSelectedGame(gameSlug);
    setPicks(initialPicks(gameSlug));
    setTeamOption('');
    setAttempted(false);
    setEditingLineupId(null);
    setMessage(null);
  }

  function updatePick(slotId: string, patch: Partial<CharacterPick>) {
    setPicks((current) => current.map((pick) => pick.slotId === slotId ? { ...pick, ...patch } : pick));
  }

  async function saveLineup(event: FormEvent) {
    event.preventDefault();
    setAttempted(true);
    if (!validation.valid) return;
    const existing = editingLineupId ? draft.lineups.find((lineup) => lineup.id === editingLineupId) : undefined;
    const lineup = {
      ...candidate,
      id: existing?.id ?? crypto.randomUUID(),
      createdAt: existing?.createdAt ?? new Date().toISOString(),
    };
    try {
      if (existing) await updateLineup(lineup);
      else await addLineup(lineup);
      setPicks(initialPicks(game.slug));
      setTeamOption('');
      setAttempted(false);
      setEditingLineupId(null);
      setMessage(accountPresentation.state === 'registered'
        ? `${game.schema.noun} ${existing ? 'updated' : 'saved'} here. Save changes to update your profile.`
        : `${game.schema.noun} ${existing ? 'updated' : 'saved'} on this device.`);
    } catch {
      setMessage(null);
    }
  }

  function beginEdit(lineup: Lineup) {
    setSelectedGame(lineup.gameSlug);
    setPicks(lineup.picks.map((pick) => ({ ...pick })));
    setCategory(lineup.category);
    setLifecycle(lineup.lifecycle);
    setVisibility(lineup.visibility);
    setTeamOption(lineup.teamOption ?? '');
    setEditingLineupId(lineup.id);
    setAttempted(false);
    setMessage('Editing this local stop. Save the editor to keep the changes.');
    document.querySelector('.lineup-editor')?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  async function patchLineup(lineup: Lineup, patch: Partial<Lineup>, successMessage: string) {
    try {
      await updateLineup({ ...lineup, ...patch });
      setMessage(successMessage);
    } catch {
      setMessage(null);
    }
  }

  return (
    <div className="builder-page page-frame">
      <header className="page-title page-title--builder">
        <div>
          <p className="eyebrow">{accountPresentation.eyebrow}</p>
          <h1>{accountPresentation.heading}</h1>
        </div>
        <div className="builder-intro">
          <p>{accountPresentation.description}</p>
          {accountPresentation.actionLabel && <Link className="button-primary builder-intro__cta" to="/settings">{accountPresentation.actionLabel}</Link>}
        </div>
      </header>

      {storageError && <div className="notice notice--error" role="alert"><strong>Draft storage failed</strong><p>{storageError}</p></div>}
      {message && <div className="notice" role="status"><strong>Saved</strong><p>{message}</p></div>}

      <section className="builder-workbench" aria-labelledby="select-game-heading">
        <div className="builder-workbench__games">
          <h2 id="select-game-heading">01 / Game Version</h2>
          <div className="game-selector" role="list" aria-label="Choose a Game Version">
            {catalog.map((catalogGame, index) => (
              <button
                type="button"
                role="listitem"
                className={catalogGame.slug === game.slug ? 'game-selector__item game-selector__item--active' : 'game-selector__item'}
                key={catalogGame.slug}
                onClick={() => chooseGame(catalogGame.slug)}
                aria-pressed={catalogGame.slug === game.slug}
              >
                <span>{String(index + 1).padStart(2, '0')}</span>
                <strong>{catalogGame.shortName}</strong>
                <small>{catalogGame.schema.verified ? catalogGame.schema.noun : 'REVIEW'}</small>
              </button>
            ))}
          </div>
        </div>

        <form className="lineup-editor" onSubmit={(event) => void saveLineup(event)}>
          <div className="lineup-editor__heading">
            <div>
              <p className="eyebrow">02 / {game.schema.noun.toUpperCase()} CONSTRUCTION</p>
              <h2>{game.name}</h2>
            </div>
            <span className={game.schema.verified ? 'status-mark status-mark--ready' : 'status-mark status-mark--review'}>
              {game.schema.verified ? 'SCHEMA READY' : 'SCHEMA REVIEW'}
            </span>
          </div>

          {!game.schema.verified && (
            <div className="notice notice--warning" role="status">
              <strong>Save held for verification</strong>
              <p>{game.schema.verificationNote}</p>
            </div>
          )}

          {game.schema.constraintNote && (
            <div className="notice" role="note">
              <strong>Conservative save rule</strong>
              <p>{game.schema.constraintNote}</p>
            </div>
          )}

          <div className="slot-ledger">
            {game.schema.slots.map((slot, index) => {
              const pick = picks.find((candidatePick) => candidatePick.slotId === slot.id);
              const availableCharacters = game.characters.filter((character) => slot.allowedRoles.includes(character.role));
              const optionValues = pick?.characterSlug
                ? slot.optionValuesByCharacter?.[pick.characterSlug] ?? slot.optionValues
                : slot.optionValues;
              return (
                <fieldset className="slot-row" key={slot.id}>
                  <legend><span>{String(index + 1).padStart(2, '0')}</span>{slot.label}</legend>
                  <label>
                    <span>Character</span>
                    <select value={pick?.characterSlug ?? ''} onChange={(event) => updatePick(slot.id, { characterSlug: event.target.value, option: undefined })}>
                      <option value="">{game.catalogStatus === 'verified' ? 'Choose Character' : 'Choose from preview roster'}</option>
                      {availableCharacters.map((character) => <option value={character.slug} key={character.slug}>{character.name}</option>)}
                    </select>
                  </label>
                  {(slot.optionValues || slot.optionValuesByCharacter) && (
                    <label>
                      <span>{slot.optionLabel}</span>
                      <select value={pick?.option ?? ''} onChange={(event) => updatePick(slot.id, { option: event.target.value })}>
                        <option value="">Choose {slot.optionLabel}</option>
                        {optionValues?.map((option) => <option value={option} key={option}>{option}</option>)}
                      </select>
                    </label>
                  )}
                </fieldset>
              );
            })}
          </div>

          {game.schema.teamOptionValues && (
            <label className="field-row">
              <span>{game.schema.teamOptionLabel}</span>
              <select value={teamOption} onChange={(event) => setTeamOption(event.target.value)}>
                <option value="">Choose {game.schema.teamOptionLabel}</option>
                {game.schema.teamOptionValues.map((option) => <option value={option} key={option}>{option}</option>)}
              </select>
            </label>
          )}

          <div className="classification-grid">
            <label>Role<select value={category} onChange={(event) => setCategory(event.target.value as LineupCategory)}><option value="main">Main</option><option value="secondary">Secondary</option></select></label>
            <label>Lifecycle<select value={lifecycle} onChange={(event) => setLifecycle(event.target.value as LineupLifecycle)}><option value="active">Active</option><option value="retired">Retired</option></select></label>
            <label>Profile visibility<select value={visibility} onChange={(event) => setVisibility(event.target.value as LineupVisibility)}><option value="public">Show on profile · contributes</option><option value="private">Keep private · excluded</option></select></label>
          </div>

          {attempted && !validation.valid && (
            <div className="validation-block" role="alert" tabIndex={-1}>
              <strong>Complete this stop</strong>
              <ul>{validation.errors.map((error) => <li key={error}>{error}</li>)}</ul>
            </div>
          )}

          <div className="lineup-editor__commands">
            <p>{visibility === 'private' ? 'Private entries stay off your profile and do not shape recommendations.' : accountPresentation.visibilityNote}</p>
            <div className="command-row">
              {editingLineupId && <button className="button-secondary" type="button" onClick={() => chooseGame(game.slug)}>Cancel edit</button>}
              <button className="button-primary" type="submit" disabled={!game.schema.verified}>{editingLineupId ? 'Update' : 'Save'} {game.schema.noun}</button>
            </div>
          </div>
        </form>
      </section>

      <section className="draft-line" aria-labelledby="draft-line-heading">
        <div className="section-heading section-heading--split">
          <div><p className="eyebrow">03 / REVIEW DRAFT</p><h2 id="draft-line-heading">Your draft</h2></div>
          <div className="draft-claim"><p>{accountPresentation.reviewDescription}</p>{accountPresentation.reviewActionLabel && <Link className="button-primary" to="/settings">{accountPresentation.reviewActionLabel}</Link>}</div>
        </div>
        <Mainline lineups={draft.lineups} label={accountPresentation.mainlineLabel} />
        {draft.lineups.length > 0 && (
          <div className="draft-action-ledger" aria-label="Edit and reorder local draft entries">
            {draft.lineups.map((lineup, index) => {
              const lineupGame = catalogBySlug.get(lineup.gameSlug);
              return (
                <div className={editingLineupId === lineup.id ? 'draft-action-ledger__row draft-action-ledger__row--editing' : 'draft-action-ledger__row'} key={lineup.id}>
                  <span>{String(index + 1).padStart(2, '0')}</span>
                  <div><strong>{lineupGame?.shortName ?? 'Entry'}</strong><small>{lineup.category} · {lineup.lifecycle} · {lineup.visibility}</small></div>
                  <div className="draft-action-ledger__commands">
                    <button type="button" onClick={() => beginEdit(lineup)}>Edit</button>
                    <button type="button" onClick={() => void patchLineup(lineup, { visibility: lineup.visibility === 'public' ? 'private' : 'public' }, lineup.visibility === 'public' ? 'Stop hidden from the public profile and recommendation graph.' : 'Stop restored to public contribution.')}>{lineup.visibility === 'public' ? 'Hide' : 'Publish'}</button>
                    <button type="button" onClick={() => void patchLineup(lineup, { lifecycle: lineup.lifecycle === 'active' ? 'retired' : 'active' }, lineup.lifecycle === 'active' ? 'Stop marked Retired.' : 'Stop restored to Active.')}>{lineup.lifecycle === 'active' ? 'Retire' : 'Reactivate'}</button>
                    <button type="button" disabled={index === 0} onClick={() => void moveLineup(lineup.id, -1)}>Move up</button>
                    <button type="button" disabled={index === draft.lineups.length - 1} onClick={() => void moveLineup(lineup.id, 1)}>Move down</button>
                    <button type="button" onClick={() => void removeLineup(lineup.id)}>Remove</button>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </section>
    </div>
  );
}
