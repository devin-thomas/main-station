import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { CatalogRail } from '../components/CatalogRail';
import { catalogBySlug } from '../data/catalog';
import { loadGamePublicStats, type GamePublicStats } from '../features/stats/publicStats';
import { supabaseConfigured } from '../lib/supabase';

interface GameStatsResult {
  gameSlug: string;
  stats: GamePublicStats | null;
  error: string | null;
}

export function GamePage() {
  const { gameSlug } = useParams();
  const game = gameSlug ? catalogBySlug.get(gameSlug) : undefined;
  const [statsResult, setStatsResult] = useState<GameStatsResult | null>(null);

  useEffect(() => {
    let active = true;
    if (!gameSlug || !supabaseConfigured) return;
    void loadGamePublicStats(gameSlug)
      .then((stats) => {
        if (active) setStatsResult({ gameSlug, stats, error: null });
      })
      .catch((error: unknown) => {
        if (active) setStatsResult({
          gameSlug,
          stats: null,
          error: error instanceof Error ? error.message : 'Public Game statistics could not be loaded.',
        });
      });
    return () => {
      active = false;
    };
  }, [gameSlug]);

  if (!game) return <div className="state-page page-frame"><p className="eyebrow">GAME / NOT FOUND</p><h1>Unknown Game Version.</h1><Link className="button-primary" to="/">Return to the network</Link></div>;

  const currentStats = statsResult?.gameSlug === game.slug ? statsResult : null;
  const playerCount = !supabaseConfigured
    ? 'Data connection unavailable'
    : currentStats?.error
      ? 'Temporarily unavailable'
      : currentStats?.stats
        ? currentStats.stats.registeredPlayerCount.toLocaleString()
        : 'Loading current count...';

  return (
    <div className="game-page page-frame">
      <header className="game-masthead">
        <div className="game-masthead__code">{game.shortName}</div>
        <div><p className="eyebrow">GAME VERSION / {game.releaseLabel.toUpperCase()}</p><h1>{game.name}</h1></div>
        <dl>
          <div><dt>Registered players</dt><dd>{playerCount}</dd></div>
          <div><dt>Selection</dt><dd>{game.schema.noun} · {game.schema.slots.length} {game.schema.slots.length === 1 ? 'slot' : 'slots'}</dd></div>
          <div><dt>Catalog</dt><dd>{game.catalogStatus === 'verified' ? 'Verified' : 'Preview fixture'}</dd></div>
        </dl>
      </header>

      {!game.schema.verified && <div className="notice notice--warning"><strong>Selection review open</strong><p>{game.schema.verificationNote}</p></div>}
      {game.schema.constraintNote && <div className="notice"><strong>Conservative save rule</strong><p>{game.schema.constraintNote}</p></div>}
      {currentStats?.error && <div className="notice notice--error" role="alert"><strong>Public count unavailable</strong><p>{currentStats.error}</p></div>}

      <section className="roster-ledger" aria-labelledby="roster-heading">
        <div className="section-heading section-heading--split">
          <div>
            <p className="eyebrow">VERSION-SCOPED ROSTER</p>
            <h2 id="roster-heading">{game.catalogStatus === 'verified' ? 'Official roster' : 'Reviewed preview entries'}</h2>
          </div>
          <p>{game.catalogStatus === 'verified'
            ? `${game.characters.length} source-checked entries${game.sourceCheckedAt ? ` · reviewed ${game.sourceCheckedAt}` : ''}.`
            : 'This is an implementation fixture, not a claim that the complete launch roster audit has closed.'}</p>
        </div>
        <ol>
          {game.characters.map((character, index) => (
            <li key={character.slug}>
              <span>{String(index + 1).padStart(2, '0')}</span>
              <Link to={`/games/${game.slug}/characters/${character.slug}`}>{character.name}</Link>
              <small>{character.role}</small>
              <strong>{character.art ? 'ART REVIEWED' : 'ART REVIEW'}</strong>
            </li>
          ))}
        </ol>
      </section>
      <a className="source-line" href={game.sourceUrl} target="_blank" rel="noreferrer">Catalog source · {new URL(game.sourceUrl).hostname}</a>
      <CatalogRail current={game.slug} />
    </div>
  );
}
