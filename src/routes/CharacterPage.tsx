import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { CharacterStage } from '../components/CharacterStage';
import { catalogBySlug } from '../data/catalog';
import { loadCharacterPublicStats, type CharacterPublicStats } from '../features/stats/publicStats';
import { supabaseConfigured } from '../lib/supabase';

interface CharacterStatsResult {
  routeKey: string;
  stats: CharacterPublicStats | null;
  error: string | null;
}

export function CharacterPage() {
  const { gameSlug, characterSlug } = useParams();
  const game = gameSlug ? catalogBySlug.get(gameSlug) : undefined;
  const character = game?.characters.find((candidate) => candidate.slug === characterSlug);
  const [statsResult, setStatsResult] = useState<CharacterStatsResult | null>(null);
  const routeKey = `${gameSlug ?? ''}/${characterSlug ?? ''}`;

  useEffect(() => {
    let active = true;
    if (!gameSlug || !characterSlug || !supabaseConfigured) return;
    void loadCharacterPublicStats(gameSlug, characterSlug)
      .then((stats) => {
        if (active) setStatsResult({ routeKey, stats, error: null });
      })
      .catch((error: unknown) => {
        if (active) setStatsResult({
          routeKey,
          stats: null,
          error: error instanceof Error ? error.message : 'Public Character statistics could not be loaded.',
        });
      });
    return () => {
      active = false;
    };
  }, [characterSlug, gameSlug, routeKey]);

  if (!game || !character) return <div className="state-page page-frame"><p className="eyebrow">CHARACTER / NOT FOUND</p><h1>This Character is not at this stop.</h1><Link className="button-primary" to={game ? `/games/${game.slug}` : '/'}>Return to roster</Link></div>;

  const currentStats = statsResult?.routeKey === routeKey ? statsResult : null;
  const stats = currentStats?.stats;
  const unavailableLabel = !supabaseConfigured ? 'Data connection unavailable' : currentStats?.error ? 'Temporarily unavailable' : 'Loading current data...';

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
            <div><dt>Public players</dt><dd>{stats ? stats.publicPlayerCount.toLocaleString() : unavailableLabel}</dd></div>
            <div><dt>Main / Secondary</dt><dd>{stats ? `${stats.mainPlayerCount.toLocaleString()} / ${stats.secondaryPlayerCount.toLocaleString()}` : unavailableLabel}</dd></div>
            <div><dt>Active / Retired</dt><dd>{stats ? `${stats.activePlayerCount.toLocaleString()} / ${stats.retiredPlayerCount.toLocaleString()}` : unavailableLabel}</dd></div>
            <div><dt>Game share</dt><dd>{stats ? stats.registeredPlayerShare === null ? 'No registered players yet' : `${(stats.registeredPlayerShare * 100).toFixed(1)}%` : unavailableLabel}</dd></div>
          </dl>

          {currentStats?.error && <div className="notice notice--error" role="alert"><strong>Public data unavailable</strong><p>{currentStats.error}</p></div>}

          <section className="character-public-players" aria-labelledby="character-players-heading">
            <p className="eyebrow">PUBLIC PROFILE LINKS</p>
            <h2 id="character-players-heading">Players on this stop</h2>
            {stats?.profiles.length ? (
              <ul>{stats.profiles.map((profile) => <li key={profile.handle}><Link to={`/p/${profile.handle}`}>{profile.displayName}</Link><span>@{profile.handle}</span></li>)}</ul>
            ) : (
              <p>{stats ? 'No public registered profile uses this Character yet.' : unavailableLabel}</p>
            )}
          </section>

          <div className="provenance-block">
            <span>IMAGE PROVENANCE</span>
            {character.art ? (
              <>
                <strong>{character.art.usageBasis.replaceAll('-', ' ')}</strong>
                <p>{character.art.creditText} · {character.art.permissionEvidence}</p>
                <div className="provenance-block__links">
                  <a href={character.art.sourceUrl} target="_blank" rel="noreferrer">View original asset</a>
                  <a href={character.art.reviewUrl} target="_blank" rel="noreferrer">Review source basis</a>
                </div>
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
