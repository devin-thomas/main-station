import { Link } from 'react-router-dom';
import { CatalogRail } from '../components/CatalogRail';
import { CharacterStage } from '../components/CharacterStage';
import { Mainline } from '../components/Mainline';
import { catalogBySlug } from '../data/catalog';
import { demoProfile } from '../data/demo';

export function HomePage() {
  const uni2 = catalogBySlug.get('uni2');
  const hyde = uni2?.characters.find((character) => character.slug === 'hyde');

  return (
    <div className="home-page">
      <section className="entry-stage" aria-labelledby="entry-title">
        <div className="entry-stage__copy">
          <img className="entry-stage__mark" src="/brand/mainstation-logo.png" alt="" />
          <p className="eyebrow">PUBLIC MAINS · CONNECTED ACROSS GAMES</p>
          <h1 id="entry-title">Your mains<br />form a line.</h1>
          <p className="entry-stage__lede">
            Record the Characters and Teams that define how you play. Share the history. Let real player patterns support the next stop.
          </p>
          <div className="command-row">
            <Link className="button-primary" to="/build">Build your Mainline</Link>
            <Link className="button-secondary" to="/p/station-zero">View preview profile</Link>
          </div>
          <dl className="signal-ledger">
            <div><dt>Founding games</dt><dd>13</dd></div>
            <div><dt>Invented cold-start matches</dt><dd>0</dd></div>
            <div><dt>Profile contribution / game</dt><dd>1.00</dd></div>
          </dl>
        </div>
        {uni2 && hyde && <CharacterStage character={hyde} game={uni2} />}
      </section>

      <section className="section-block section-block--line" aria-labelledby="preview-line-title">
        <div className="section-heading">
          <p className="eyebrow">PROFILE PREVIEW / STATION-ZERO</p>
          <h2 id="preview-line-title">One history, not thirteen disconnected cards.</h2>
          <p>The Mainline keeps the game, role, lifecycle, and complete Team legible in one continuous route.</p>
        </div>
        <Mainline lineups={demoProfile.lineups} label="Preview player Mainline" />
      </section>

      <section className="section-block" aria-labelledby="catalog-title">
        <div className="section-heading section-heading--split">
          <div>
            <p className="eyebrow">FOUNDING NETWORK / 01–13</p>
            <h2 id="catalog-title">Built for actual FGC histories.</h2>
          </div>
          <p>Modern, legacy, solo, tag, assist, and Kameo rules remain version-scoped. Every founding game now exposes its complete checked selection roster; art review remains a separate ledger.</p>
        </div>
        <CatalogRail />
      </section>

      <section className="method-ledger" aria-labelledby="method-title">
        <header>
          <p className="eyebrow">RECOMMENDATION METHOD / LAUNCH</p>
          <h2 id="method-title">Evidence before confidence.</h2>
        </header>
        <ol>
          <li><span>01</span><strong>Record</strong><p>Players publish complete, game-valid Characters or Teams. Private entries stay absent.</p></li>
          <li><span>02</span><strong>Normalize</strong><p>Each player contributes one fixed unit per Game, regardless of how many Teams they save.</p></li>
          <li><span>03</span><strong>Connect</strong><p>Observed cross-game associations rank candidates and disclose the distinct Player support.</p></li>
          <li><span>04</span><strong>Stop honestly</strong><p>Zero observed support returns “Not enough public data yet.” No authored or popularity fallback.</p></li>
        </ol>
      </section>
    </div>
  );
}
