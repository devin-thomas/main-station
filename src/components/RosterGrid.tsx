import { CharacterPortrait } from './CharacterPortrait';
import { Icon } from './Icon';
import type { Character, GameVersion } from '../types/domain';

interface RosterGridProps {
  game: GameVersion;
  characters: Character[];
  selectedSlugs: readonly string[];
  disabledSlugs?: readonly string[];
  onChoose(characterSlug: string): void;
  label: string;
}

/**
 * The roster as art. Every row is a real picture of the character the player is about to claim,
 * which is the whole point of the surface — the name alone does not connect anyone to their main.
 */
export function RosterGrid({ game, characters, selectedSlugs, disabledSlugs = [], onChoose, label }: RosterGridProps) {
  return (
    <ul className="roster-grid" aria-label={label}>
      {characters.map((character) => {
        const selected = selectedSlugs.includes(character.slug);
        const disabled = disabledSlugs.includes(character.slug);
        return (
          <li key={character.slug}>
            <button
              type="button"
              className={`roster-card${selected ? ' roster-card--selected' : ''}`}
              aria-pressed={selected}
              disabled={disabled}
              onClick={() => onChoose(character.slug)}
            >
              <span className="roster-card__frame">
                <CharacterPortrait character={character} gameName={game.name} decorative />
                {selected && <span className="roster-card__check" aria-hidden="true"><Icon name="check" /></span>}
              </span>
              <span className="roster-card__name">{character.name}</span>
              {character.role === 'kameo' && <span className="roster-card__role">Kameo</span>}
            </button>
          </li>
        );
      })}
    </ul>
  );
}
