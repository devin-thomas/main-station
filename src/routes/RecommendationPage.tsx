import { useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { catalog, catalogBySlug } from '../data/catalog';
import { useDraft } from '../features/draft/DraftProvider';

export function RecommendationPage() {
  const { draft } = useDraft();
  const [target, setTarget] = useState('umvc3');
  const targetGame = catalogBySlug.get(target) ?? catalog[0];
  const eligibleStops = useMemo(() => draft.lineups.filter((lineup) => lineup.visibility === 'public' && lineup.gameSlug !== target), [draft.lineups, target]);

  return (
    <div className="recommend-page page-frame">
      <header className="page-title">
        <div><p className="eyebrow">CROSS-GAME ROUTING / ASSOCIATION-V1</p><h1>Choose the next stop.</h1></div>
        <p>Recommendations rank only observed links among registered public profiles. A private local draft never enters the model.</p>
      </header>

      <div className="recommend-console">
        <section className="recommend-console__target" aria-labelledby="target-heading">
          <p className="eyebrow">01 / TARGET GAME</p>
          <h2 id="target-heading">Where are you going?</h2>
          <label className="field-row">
            <span>Game Version</span>
            <select value={target} onChange={(event) => setTarget(event.target.value)}>
              {catalog.map((game) => <option value={game.slug} key={game.slug}>{game.name}</option>)}
            </select>
          </label>
          <dl className="route-evidence">
            <div><dt>Local public stops</dt><dd>{eligibleStops.length}</dd></div>
            <div><dt>Registered support loaded</dt><dd>0</dd></div>
            <div><dt>Policy</dt><dd>association-v1</dd></div>
          </dl>
        </section>

        <section className="recommend-console__result" aria-labelledby="result-heading">
          <div className="route-branch" aria-hidden="true"><span /></div>
          <p className="eyebrow">02 / {targetGame.shortName} CANDIDATES</p>
          <h2 id="result-heading">Not enough public data yet.</h2>
          <p>MainStation has zero observed registered cross-game associations for this preview origin, so it will not substitute popularity, founder opinion, or an authored match.</p>
          <div className="support-zero"><span>SUPPORT</span><strong>0 players</strong></div>
          <div className="command-row">
            <Link className="button-primary" to="/build">Complete your Mainline</Link>
            <Link className="button-secondary" to={`/games/${targetGame.slug}`}>Inspect {targetGame.shortName}</Link>
          </div>
        </section>
      </div>
    </div>
  );
}
