import { useState } from 'react';
import type { Character, GameVersion } from '../types/domain';

interface CharacterStageProps {
  character: Character;
  game: GameVersion;
  compact?: boolean;
}

export function CharacterStage({ character, game, compact = false }: CharacterStageProps) {
  const [failedImagePath, setFailedImagePath] = useState<string | null>(null);
  const showImage = character.art && failedImagePath !== character.art.localPath ? character.art : null;

  return (
    <figure className={`character-stage${compact ? ' character-stage--compact' : ''}`}>
      <div className="character-stage__index" aria-hidden="true">{game.shortName}</div>
      {showImage ? (
        <img
          className={`character-stage__art${showImage.displayFit === 'cover' ? ' character-stage__art--cover' : ''}`}
          src={showImage.localPath}
          alt={`${character.name} reviewed character artwork for ${game.name}`}
          style={showImage.objectPosition ? { objectPosition: showImage.objectPosition } : undefined}
          onError={() => setFailedImagePath(showImage.localPath)}
        />
      ) : (
        <div className="character-stage__fallback" role="img" aria-label={`${character.name}; approved character art is not available yet`}>
          <span>{game.shortName}</span>
          <strong>{character.name}</strong>
          <small>ART RIGHTS REVIEW</small>
        </div>
      )}
      <div className="character-stage__rail" aria-hidden="true">
        <span />
      </div>
      {showImage && (
        <figcaption className="character-stage__credit">
          <a href={showImage.reviewUrl} target="_blank" rel="noreferrer">{showImage.creditText}</a>
        </figcaption>
      )}
    </figure>
  );
}
