import { Link, useParams } from 'react-router-dom';
import { Mainline } from '../components/Mainline';
import { demoProfile } from '../data/demo';

export function ProfilePage() {
  const { handle } = useParams();
  if (handle !== 'station-zero') {
    return (
      <div className="state-page page-frame">
        <p className="eyebrow">PROFILE / NOT FOUND</p>
        <h1>No public line reaches “{handle}”.</h1>
        <p>Guest drafts stay private on their device until an account explicitly claims them.</p>
        <Link className="button-primary" to="/build">Build your profile</Link>
      </div>
    );
  }

  return (
    <div className="profile-page page-frame">
      <header className="profile-identity">
        <div className="profile-identity__number">P/001</div>
        <div>
          <p className="eyebrow">PUBLIC PROFILE PREVIEW</p>
          <h1>{demoProfile.profile.displayName}</h1>
          <p className="profile-identity__handle">@{demoProfile.profile.handle}</p>
        </div>
        <p className="profile-identity__bio">{demoProfile.profile.bio}</p>
        <Link className="button-secondary" to="/build">Build yours</Link>
      </header>
      <section className="profile-mainline" aria-labelledby="profile-line-heading">
        <div className="section-heading section-heading--split">
          <div><p className="eyebrow">MAIN HISTORY / 3 STOPS</p><h2 id="profile-line-heading">The Mainline</h2></div>
          <p>This demonstration profile shows the accepted structure. It is not registered contribution data.</p>
        </div>
        <Mainline lineups={demoProfile.lineups} />
      </section>
    </div>
  );
}
