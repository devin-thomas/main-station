import { Link } from 'react-router-dom';
import { catalogBySlug } from '../data/catalog';
import type { Lineup } from '../types/domain';

export function Mainline({ lineups, label = 'Player Mainline' }: { lineups: Lineup[]; label?: string }) {
  if (lineups.length === 0) {
    return (
      <div className="empty-line">
        <span className="empty-line__marker" aria-hidden="true" />
        <p>No entries yet.</p>
        <Link className="text-link" to="/build">Add a character or team</Link>
      </div>
    );
  }

  return (
    <ol className="mainline" aria-label={label}>
      {lineups.map((lineup) => {
        const game = catalogBySlug.get(lineup.gameSlug);
        if (!game) return null;
        const names = lineup.picks.map((pick) => game.characters.find((character) => character.slug === pick.characterSlug)?.name).filter(Boolean);
        const firstPick = lineup.picks[0];
        return (
          <li className="mainline__stop" key={lineup.id}>
            <div className="mainline__track" aria-hidden="true">
              <span className="mainline__node" />
            </div>
            <div className="mainline__body">
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
