import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Mainline } from '../components/Mainline';
import { demoProfile } from '../data/demo';
import { loadPublicProfile } from '../features/profile/profile';
import { supabaseConfigured } from '../lib/supabase';
import type { GuestDraft } from '../types/domain';

interface ProfileResult {
  handle: string;
  profile: GuestDraft | null;
  error: string | null;
}

export function ProfilePage() {
  const { handle } = useParams();
  const [result, setResult] = useState<ProfileResult | null>(null);

  useEffect(() => {
    let active = true;
    if (!supabaseConfigured || !handle) return;
    void loadPublicProfile(handle)
      .then((profile) => {
        if (active) setResult({ handle, profile, error: null });
      })
      .catch((error: unknown) => {
        if (active) setResult({
          handle,
          profile: null,
          error: error instanceof Error ? error.message : 'The public profile could not be loaded.',
        });
      });
    return () => {
      active = false;
    };
  }, [handle]);

  const currentResult = result && result.handle === handle ? result : null;
  const remotePending = Boolean(supabaseConfigured && handle && !currentResult);
  if (remotePending) {
    return <div className="state-page page-frame" role="status"><p className="eyebrow">PROFILE / NETWORK</p><h1>Following the line...</h1><p>Loading the current public profile from MainStation.</p></div>;
  }

  if (currentResult?.error) {
    return <div className="state-page page-frame"><p className="eyebrow">PROFILE / UNAVAILABLE</p><h1>The public line could not load.</h1><p>{currentResult.error}</p><Link className="button-secondary" to="/">Return to the network</Link></div>;
  }

  const remoteProfile = currentResult?.profile ?? null;
  const isDemo = !remoteProfile && handle === 'station-zero';
  const profile = remoteProfile ?? (isDemo ? demoProfile : null);
  if (!profile) {
    return (
      <div className="state-page page-frame">
        <p className="eyebrow">PROFILE / NOT FOUND</p>
        <h1>No public line reaches “{handle}”.</h1>
        <p>Drafts stay on their device until they are saved to a profile.</p>
        <Link className="button-primary" to="/build">Build your line</Link>
      </div>
    );
  }

  const publicLineups = profile.lineups.filter((lineup) => lineup.visibility === 'public');
  return (
    <div className="profile-page page-frame">
      <header className="profile-identity">
        <div className="profile-identity__number">P/{isDemo ? '001' : profile.profile.handle.slice(0, 3).toUpperCase()}</div>
        <div>
          <p className="eyebrow">{isDemo ? 'PUBLIC PROFILE PREVIEW' : 'REGISTERED PUBLIC PROFILE'}</p>
          <h1>{profile.profile.displayName}</h1>
          <p className="profile-identity__handle">@{profile.profile.handle}</p>
        </div>
        <p className="profile-identity__bio">{profile.profile.bio || 'No profile note supplied.'}</p>
        <Link className="button-secondary" to="/build">Build yours</Link>
      </header>
      <section className="profile-mainline" aria-labelledby="profile-line-heading">
        <div className="section-heading section-heading--split">
          <div><p className="eyebrow">MAIN HISTORY / {publicLineups.length} {publicLineups.length === 1 ? 'STOP' : 'STOPS'}</p><h2 id="profile-line-heading">The Mainline</h2></div>
          <p>{isDemo ? 'This demonstration profile shows the accepted structure. It is not registered contribution data.' : 'Only complete public Characters and Teams appear here or contribute to aggregate data.'}</p>
        </div>
        <Mainline lineups={publicLineups} />
      </section>
    </div>
  );
}
