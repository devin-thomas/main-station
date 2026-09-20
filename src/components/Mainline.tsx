import { Link } from 'react-router-dom';
import { BuildLink } from './BuildLink';
import { CharacterPortrait } from './CharacterPortrait';
import { catalogBySlug } from '../data/catalog';
import type { Lineup } from '../types/domain';

export function Mainline({ lineups, label = 'Player Mainline' }: { lineups: Lineup[]; label?: string }) {
  if (lineups.length === 0) {
    return (
      <div className="empty-line">
        <span className="empty-line__marker" aria-hidden="true" />
        <p>No entries yet.</p>
        <BuildLink className="text-link">Add a character or team</BuildLink>
      </div>
    );
  }

  return (
    <ol className="mainline" aria-label={label}>
      {lineups.map((lineup) => {
        const game = catalogBySlug.get(lineup.gameSlug);
        if (!game) return null;
        const picked = lineup.picks
          .map((pick) => ({ pick, character: game.characters.find((character) => character.slug === pick.characterSlug) }))
          .filter((entry): entry is { pick: typeof entry.pick; character: NonNullable<typeof entry.character> } => Boolean(entry.character));
        const names = picked.map(({ character }) => character.name);
        const firstPick = lineup.picks[0];
        return (
          <li className="mainline__stop" key={lineup.id}>
            <div className="mainline__track" aria-hidden="true">
              <span className="mainline__node" />
            </div>
            <div className="mainline__body">
              {picked.length > 0 && (
                <span className="mainline__faces" aria-hidden="true">
                  {picked.map(({ pick, character }) => (
                    <CharacterPortrait key={pick.slotId} character={character} gameName={game.name} decorative />
                  ))}
                </span>
              )}
              <div className="mainline__meta">
                <Link to={`/games/${game.slug}`}>{game.shortName}</Link>
                <span>{lineup.category === 'main' ? 'Main' : 'Secondary'}</span>
                <span>{lineup.lifecycle === 'active' ? 'Active' : 'Retired'}</span>
                {lineup.visibility === 'private' && <span>Private</span>}
              </div>
              {firstPick ? (
                <Link className="mainline__characters" to={`/games/${game.slug}/characters/${firstPick.characterSlug}`}>
                  {names.join(' / ')}
                </Link>
              ) : (
                <span className="mainline__characters">Incomplete entry</span>
              )}
              {lineup.teamOption && <span className="mainline__option">{game.schema.teamOptionLabel}: {lineup.teamOption}</span>}
            </div>
          </li>
        );
      })}
    </ol>
  );
}
