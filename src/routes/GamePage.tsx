import { Link, useParams } from 'react-router-dom';
import { CatalogRail } from '../components/CatalogRail';
import { catalogBySlug } from '../data/catalog';

export function GamePage() {
  const { gameSlug } = useParams();
  const game = gameSlug ? catalogBySlug.get(gameSlug) : undefined;
  if (!game) return <div className="state-page page-frame"><p className="eyebrow">GAME / NOT FOUND</p><h1>Unknown Game Version.</h1><Link className="button-primary" to="/">Return to the network</Link></div>;

  return (
    <div className="game-page page-frame">
      <header className="game-masthead">
        <div className="game-masthead__code">{game.shortName}</div>
        <div><p className="eyebrow">GAME VERSION / {game.releaseLabel.toUpperCase()}</p><h1>{game.name}</h1></div>
        <dl>
          <div><dt>Registered players</dt><dd>{game.playerCount ?? 'Not enough public data yet'}</dd></div>
          <div><dt>Selection</dt><dd>{game.schema.noun} · {game.schema.slots.length} {game.schema.slots.length === 1 ? 'slot' : 'slots'}</dd></div>
          <div><dt>Catalog</dt><dd>{game.catalogStatus === 'verified' ? 'Verified' : 'Preview fixture'}</dd></div>
        </dl>
      </header>

      {!game.schema.verified && <div className="notice notice--warning"><strong>Selection review open</strong><p>{game.schema.verificationNote}</p></div>}

      <section className="roster-ledger" aria-labelledby="roster-heading">
        <div className="section-heading section-heading--split">
          <div><p className="eyebrow">VERSION-SCOPED ROSTER</p><h2 id="roster-heading">Reviewed preview entries</h2></div>
          <p>This is an implementation fixture, not a claim that the complete launch roster audit has closed.</p>
        </div>
        <ol>
          {game.characters.map((character, index) => (
            <li key={character.slug}>
              <span>{String(index + 1).padStart(2, '0')}</span>
              <Link to={`/games/${game.slug}/characters/${character.slug}`}>{character.name}</Link>
              <small>{character.role}</small>
              <strong>{character.art ? 'ART CLEARED' : 'ART REVIEW'}</strong>
            </li>
          ))}
        </ol>
      </section>
      <a className="source-line" href={game.sourceUrl} target="_blank" rel="noreferrer">Catalog source · {new URL(game.sourceUrl).hostname}</a>
      <CatalogRail current={game.slug} />
    </div>
  );
}
