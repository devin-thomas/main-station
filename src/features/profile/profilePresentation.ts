export function getProfileBuildAction(isOwnProfile: boolean, lineupCount: number): string {
  if (!isOwnProfile) return 'Build yours';
  return lineupCount === 0 ? 'Start building' : 'Keep building';
}
