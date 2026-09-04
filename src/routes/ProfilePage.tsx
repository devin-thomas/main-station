import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { Mainline } from '../components/Mainline';
import { demoProfile } from '../data/demo';
import { useAuth } from '../features/auth/AuthProvider';
import { loadPublicProfile } from '../features/profile/profile';
import { getProfileBuildAction } from '../features/profile/profilePresentation';
import { supabaseConfigured } from '../lib/supabase';
import type { GuestDraft } from '../types/domain';

interface ProfileResult {
  handle: string;
  profile: GuestDraft | null;
  error: string | null;
}

export function ProfilePage() {
  const { handle } = useParams();
  const { registeredHandle } = useAuth();
  const [result, setResult] = useState<ProfileResult | null>(null);

  useEffect(() => {
    let active = true;
    if (!supabaseConfigured || !handle) return;
    void loadPublicProfile(handle)
      .then((profile) => {
        if (active) setResult({ handle, profile, error: null });
      })
      .catch(() => {
        if (active) setResult({
          handle,
          profile: null,
          error: 'The public profile could not be loaded.',
        });
      });
    return () => {
      active = false;
    };
  }, [handle]);

  const currentResult = result && result.handle === handle ? result : null;
  const remotePending = Boolean(supabaseConfigured && handle && !currentResult);
  if (remotePending) {
    return <div className="state-page page-frame" role="status"><h1>Loading profile...</h1></div>;
  }

  if (currentResult?.error) {
    return <div className="state-page page-frame"><h1>Could not load profile</h1><Link className="button-secondary" to="/">Home</Link></div>;
  }

  const remoteProfile = currentResult?.profile ?? null;
  const isDemo = !remoteProfile && handle === 'station-zero';
  const profile = remoteProfile ?? (isDemo ? demoProfile : null);
  if (!profile) {
    return (
      <div className="state-page page-frame">
        <h1>Profile not found</h1>
        <Link className="button-primary" to="/build">Build your Mainline</Link>
      </div>
    );
  }

  const publicLineups = profile.lineups.filter((lineup) => lineup.visibility === 'public');
  const isOwnProfile = Boolean(registeredHandle && registeredHandle === profile.profile.handle);
  const buildAction = getProfileBuildAction(isOwnProfile, profile.lineups.length);
  return (
    <div className="profile-page page-frame">
      <header className="profile-identity">
        <div>
          <h1>{profile.profile.displayName}</h1>
          <p className="profile-identity__handle">@{profile.profile.handle}</p>
        </div>
        {profile.profile.bio && <p className="profile-identity__bio">{profile.profile.bio}</p>}
        <Link className="button-secondary" to="/build">{buildAction}</Link>
      </header>
      <section className="profile-mainline" aria-labelledby="profile-line-heading">
        <div className="section-heading section-heading--split">
          <h2 id="profile-line-heading">Mainline</h2>
          {isDemo && <p>Example profile. Excluded from recommendations.</p>}
        </div>
        <Mainline lineups={publicLineups} />
      </section>
    </div>
  );
}
