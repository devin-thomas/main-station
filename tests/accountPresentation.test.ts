import { describe, expect, it } from 'vitest';
import { getBuilderAccountPresentation } from '../src/features/auth/accountPresentation';

describe('Builder account presentation', () => {
  it('keeps the account-creation prompt for a guest only', () => {
    const presentation = getBuilderAccountPresentation({ hasSession: false, sessionLoading: false, profileLoading: false, profileLookupFailed: false, registeredHandle: null });
    expect(presentation.state).toBe('guest');
    expect(presentation.actionLabel).toBe('Sign in to save & share');
  });

  it('asks a signed-in person without a profile to finish setup', () => {
    const presentation = getBuilderAccountPresentation({ hasSession: true, sessionLoading: false, profileLoading: false, profileLookupFailed: false, registeredHandle: null });
    expect(presentation.state).toBe('profile-setup');
    expect(presentation.actionLabel).toBe('Finish profile setup');
  });

  it('does not fall back to guest copy while an account is loading or needs a retry', () => {
    const checking = getBuilderAccountPresentation({ hasSession: true, sessionLoading: false, profileLoading: true, profileLookupFailed: false, registeredHandle: null });
    const failed = getBuilderAccountPresentation({ hasSession: true, sessionLoading: false, profileLoading: false, profileLookupFailed: true, registeredHandle: null });
    expect(checking.state).toBe('checking');
    expect(failed.state).toBe('account-check-needed');
    expect(failed.actionLabel).toBe('Check your account');
  });

  it('never shows a registered user account-creation language', () => {
    const presentation = getBuilderAccountPresentation({ hasSession: true, sessionLoading: false, profileLoading: false, profileLookupFailed: false, registeredHandle: 'station-zero' });
    expect(presentation.state).toBe('registered');
    expect(presentation.description).toContain('@station-zero');
    expect(presentation.actionLabel).toBe('Save changes to profile');
  });
});
