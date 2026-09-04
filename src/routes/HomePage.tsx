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
          <h1 id="entry-title">Your mains.</h1>
          <p className="entry-stage__lede">
            Track your characters and teams across games.
          </p>
          <div className="command-row">
            <Link className="button-primary" to="/build">Build your Mainline</Link>
            <Link className="button-secondary" to="/p/station-zero">View preview profile</Link>
          </div>
        </div>
        {uni2 && hyde && <CharacterStage character={hyde} game={uni2} />}
      </section>

      <section className="section-block section-block--line" aria-labelledby="preview-line-title">
        <div className="section-heading">
          <h2 id="preview-line-title">Example Mainline</h2>
        </div>
        <Mainline lineups={demoProfile.lineups} label="Preview player Mainline" />
      </section>

      <section className="section-block" aria-labelledby="catalog-title">
        <div className="section-heading section-heading--split">
          <div>
            <h2 id="catalog-title">Games</h2>
          </div>
        </div>
        <CatalogRail />
      </section>

    </div>
  );
}
