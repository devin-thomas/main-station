import { Link } from 'react-router-dom';
import { catalogBySlug } from '../data/catalog';
import type { Lineup } from '../types/domain';

export function Mainline({ lineups, label = 'Player Mainline' }: { lineups: Lineup[]; label?: string }) {
  if (lineups.length === 0) {
    return (
      <div className="empty-line">
        <span className="empty-line__marker" aria-hidden="true" />
        <p>No stops yet. Choose a Game and record the first Character that feels like yours.</p>
        <Link className="text-link" to="/build">Add your first stop</Link>
      </div>
    );
  }

  return (
    <ol className="mainline" aria-label={label}>
      {lineups.map((lineup, index) => {
        const game = catalogBySlug.get(lineup.gameSlug);
        if (!game) return null;
        const names = lineup.picks.map((pick) => game.characters.find((character) => character.slug === pick.characterSlug)?.name).filter(Boolean);
        const firstPick = lineup.picks[0];
        return (
          <li className="mainline__stop" key={lineup.id}>
            <div className="mainline__track" aria-hidden="true">
              <span className="mainline__sequence">{String(index + 1).padStart(2, '0')}</span>
              <span className="mainline__node" />
            </div>
            <div className="mainline__body">
              <div className="mainline__meta">
                <Link to={`/games/${game.slug}`}>{game.shortName}</Link>
                <span>{lineup.category}</span>
                <span>{lineup.lifecycle}</span>
                {lineup.visibility === 'private' && <span>private</span>}
              </div>
              {firstPick ? (
                <Link className="mainline__characters" to={`/games/${game.slug}/characters/${firstPick.characterSlug}`}>
                  {names.join(' / ')}
                </Link>
              ) : (
                <span className="mainline__characters">Incomplete stop</span>
              )}
              {lineup.teamOption && <span className="mainline__option">{game.schema.teamOptionLabel}: {lineup.teamOption}</span>}
            </div>
          </li>
        );
      })}
    </ol>
  );
}
