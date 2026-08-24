import { Link, useParams } from 'react-router-dom';
import { CharacterStage } from '../components/CharacterStage';
import { catalogBySlug } from '../data/catalog';

export function CharacterPage() {
  const { gameSlug, characterSlug } = useParams();
  const game = gameSlug ? catalogBySlug.get(gameSlug) : undefined;
  const character = game?.characters.find((candidate) => candidate.slug === characterSlug);
  if (!game || !character) return <div className="state-page page-frame"><p className="eyebrow">CHARACTER / NOT FOUND</p><h1>This Character is not at this stop.</h1><Link className="button-primary" to={game ? `/games/${game.slug}` : '/'}>Return to roster</Link></div>;

  return (
    <div className="character-page">
      <section className="character-dossier" aria-labelledby="character-heading">
        <CharacterStage character={character} game={game} />
        <div className="character-dossier__ledger">
          <div className="character-dossier__route"><span aria-hidden="true" /><Link to={`/games/${game.slug}`}>{game.shortName}</Link><small>{game.releaseLabel}</small></div>
          <p className="eyebrow">CHARACTER DOSSIER / {character.role.toUpperCase()}</p>
          <h1 id="character-heading">{character.name}</h1>
          <p className="character-summary">{character.summary}</p>
          <a className="source-line" href={character.sourceUrl} target="_blank" rel="noreferrer">Summary source · {new URL(character.sourceUrl).hostname}</a>

          <dl className="character-stat-ledger">
            <div><dt>Public players</dt><dd>Not enough public data yet</dd></div>
            <div><dt>Main / Secondary</dt><dd>Awaiting registered profiles</dd></div>
            <div><dt>Active / Retired</dt><dd>Awaiting registered profiles</dd></div>
            <div><dt>Game share</dt><dd>Not calculated</dd></div>
          </dl>

          <div className="provenance-block">
            <span>IMAGE PROVENANCE</span>
            {character.art ? (
              <>
                <strong>{character.art.usageBasis.replaceAll('-', ' ')}</strong>
                <p>{character.art.creditText}</p>
                <a href={character.art.sourceUrl} target="_blank" rel="noreferrer">Review official usage terms</a>
              </>
            ) : (
              <><strong>No approved image record</strong><p>The page stays complete without hotlinking or treating attribution as permission.</p></>
            )}
          </div>
        </div>
      </section>
    </div>
  );
}
