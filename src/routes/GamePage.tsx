import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { CatalogRail } from '../components/CatalogRail';
import { VersionLabel } from '../components/VersionLabel';
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
      .catch(() => {
        if (active) setStatsResult({
          gameSlug,
          stats: null,
          error: 'Player counts could not be loaded.',
        });
      });
    return () => {
      active = false;
    };
  }, [gameSlug]);

  if (!game) return <div className="state-page page-frame"><h1>Game not found</h1><Link className="button-primary" to="/">Browse games</Link></div>;

  const currentStats = statsResult?.gameSlug === game.slug ? statsResult : null;
  const playerCount = !supabaseConfigured
    ? 'Unavailable'
    : currentStats?.error
      ? 'Temporarily unavailable'
      : currentStats?.stats
        ? currentStats.stats.registeredPlayerCount.toLocaleString()
        : 'Loading...';

  return (
    <div className="game-page page-frame">
      <header className="game-masthead">
        <div><VersionLabel className="eyebrow" label={game.releaseLabel} /><h1>{game.name}</h1></div>
        <dl>
          <div><dt>Public players</dt><dd>{playerCount}</dd></div>
          <div><dt>Selection</dt><dd>{game.schema.noun} · {game.schema.slots.length} {game.schema.slots.length === 1 ? 'slot' : 'slots'}</dd></div>
        </dl>
      </header>

      {!game.schema.verified && <div className="notice notice--warning"><strong>Team rules may be incomplete</strong><p>{game.schema.verificationNote}</p></div>}
      {game.schema.constraintNote && <div className="notice"><p>{game.schema.constraintNote}</p></div>}
      {currentStats?.error && <div className="notice notice--error" role="alert"><p>{currentStats.error}</p></div>}

      <section className="roster-ledger" aria-labelledby="roster-heading">
        <div className="section-heading section-heading--split">
          <div>
            <h2 id="roster-heading">{game.catalogStatus === 'verified' ? 'Official roster' : 'Partial roster'}</h2>
          </div>
          <p>{game.characters.length} characters</p>
        </div>
        <ol>
          {game.characters.map((character) => (
            <li key={character.slug}>
              <Link to={`/games/${game.slug}/characters/${character.slug}`}>{character.name}</Link>
              {character.role !== 'fighter' && <small>{character.role}</small>}
            </li>
          ))}
        </ol>
      </section>
      <a className="source-line" href={game.sourceUrl} target="_blank" rel="noreferrer">Catalog source · {new URL(game.sourceUrl).hostname}</a>
      <CatalogRail current={game.slug} />
    </div>
  );
}
