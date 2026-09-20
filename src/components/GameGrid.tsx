import { CharacterPortrait } from './CharacterPortrait';
import type { GameVersion } from '../types/domain';

/** Three faces from the roster, so a Game reads as its cast rather than as a row of initials. */
function faces(game: GameVersion) {
  return game.characters.filter((character) => character.art).slice(0, 3);
}

interface GameGridProps {
  games: readonly GameVersion[];
  selectedSlug?: string | null;
  onChoose(gameSlug: string): void;
  label: string;
}

export function GameGrid({ games, selectedSlug = null, onChoose, label }: GameGridProps) {
  return (
    <ul className="game-grid" aria-label={label}>
      {games.map((game) => {
        const selected = game.slug === selectedSlug;
        return (
          <li key={game.slug}>
            <button
              type="button"
              className={`game-card${selected ? ' game-card--selected' : ''}`}
              aria-pressed={selected}
              onClick={() => onChoose(game.slug)}
            >
              <span className="game-card__faces" aria-hidden="true">
                {faces(game).map((character) => (
                  <CharacterPortrait key={character.slug} character={character} gameName={game.name} decorative />
                ))}
              </span>
              <span className="game-card__label">
                <strong>{game.shortName}</strong>
                <span>{game.name}</span>
              </span>
            </button>
          </li>
        );
      })}
    </ul>
  );
}
