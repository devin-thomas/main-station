import { useState } from 'react';
import { characterArtThumbPath, type Character } from '../types/domain';

interface CharacterPortraitProps {
  character: Character;
  gameName: string;
  /** Roster grids and slot chips load the small copy; pass `full` for a hero-sized frame. */
  size?: 'thumb' | 'full';
  decorative?: boolean;
}

/**
 * The player's own character, shown as art wherever they are asked to choose. When a roster row
 * has no reviewed art the name carries the frame instead, at the same size, so a grid never
 * collapses around a gap.
 */
export function CharacterPortrait({ character, gameName, size = 'thumb', decorative = false }: CharacterPortraitProps) {
  const [failed, setFailed] = useState(false);
  const art = character.art && !failed ? character.art : null;
  const source = art ? (size === 'thumb' ? characterArtThumbPath(art) : art.localPath) : null;

  if (!source || !art) {
    return (
      <span
        className="character-portrait character-portrait--textual"
        role={decorative ? undefined : 'img'}
        aria-hidden={decorative || undefined}
        aria-label={decorative ? undefined : `${character.name}; artwork unavailable`}
      >
        <span>{character.name}</span>
      </span>
    );
  }

  return (
    <img
      className={`character-portrait${art.displayFit === 'cover' ? ' character-portrait--cover' : ''}`}
      src={source}
      alt={decorative ? '' : `${character.name} from ${gameName}`}
      aria-hidden={decorative || undefined}
      loading="lazy"
      decoding="async"
      style={art.objectPosition ? { objectPosition: art.objectPosition } : undefined}
      onError={() => setFailed(true)}
    />
  );
}
