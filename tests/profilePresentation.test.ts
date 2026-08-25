import { describe, expect, it } from 'vitest';
import { getProfileBuildAction } from '../src/features/profile/profilePresentation';

describe('profile build CTA', () => {
  it('uses a continuation label for an owner with saved Lineups', () => {
    expect(getProfileBuildAction(true, 1)).toBe('Keep building');
  });

  it('uses a first-step label only for a blank owner profile', () => {
    expect(getProfileBuildAction(true, 0)).toBe('Start building');
  });

  it('keeps the invitation neutral on another player profile', () => {
    expect(getProfileBuildAction(false, 4)).toBe('Build yours');
  });
});
