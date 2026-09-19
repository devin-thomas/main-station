import { describe, expect, it } from 'vitest';
import { friendlyAuthError } from '../src/features/auth/auth';

describe('sign-in failure messages', () => {
  // Supabase reports a missing PKCE verifier in several shapes; all of them mean the link
  // was opened somewhere other than the browser that asked for it.
  it.each([
    'invalid request: both auth code and code verifier should be non-empty',
    'invalid flow state, no valid flow state found',
    'PKCE exchange failed',
  ])('explains a cross-browser link instead of calling it expired: %s', (message) => {
    const text = friendlyAuthError(new Error(message), 'callback');
    expect(text).toMatch(/same browser you requested it from/);
    expect(text).not.toMatch(/no longer valid/);
  });

  it('still reports a genuinely expired link as expired', () => {
    expect(friendlyAuthError(new Error('Email link is expired'), 'callback')).toBe('That sign-in link is no longer valid.');
  });

  it('keeps the network, rate limit, and address messages distinct', () => {
    expect(friendlyAuthError(new Error('Failed to fetch'), 'email')).toMatch(/could not be reached/);
    expect(friendlyAuthError(new Error('Too many requests'), 'email')).toMatch(/Too many sign-in attempts/);
    expect(friendlyAuthError(new Error('Enter a valid email address.'), 'email')).toBe('Enter a valid email address.');
  });

  it('falls back per action', () => {
    expect(friendlyAuthError(new Error('boom'), 'email')).toBe('Your sign-in link could not be sent.');
    expect(friendlyAuthError(new Error('boom'), 'discord')).toBe('Discord sign-in could not be started.');
    expect(friendlyAuthError(new Error('boom'), 'callback')).toBe('Sign-in could not be completed. Please try again.');
  });
});
