export type BuilderAccountState = 'checking' | 'guest' | 'profile-setup' | 'registered' | 'account-check-needed';

export interface BuilderAccountPresentation {
  state: BuilderAccountState;
  eyebrow: string;
  heading: string;
  description: string;
  actionLabel: string | null;
  visibilityNote: string;
  reviewDescription: string;
  reviewActionLabel: string | null;
  mainlineLabel: string;
}

interface BuilderAccountInput {
  hasSession: boolean;
  sessionLoading: boolean;
  profileLoading: boolean;
  profileLookupFailed: boolean;
  registeredHandle: string | null;
}

export function getBuilderAccountPresentation(input: BuilderAccountInput): BuilderAccountPresentation {
  if (input.sessionLoading || (input.hasSession && input.profileLoading)) {
    return {
      state: 'checking',
      eyebrow: 'CHECKING ACCOUNT',
      heading: 'Build your line.',
      description: 'Checking how this draft connects to your account.',
      actionLabel: null,
      visibilityNote: 'We will show the right save step once your account is ready.',
      reviewDescription: 'Checking your account before showing save options.',
      reviewActionLabel: null,
      mainlineLabel: 'Your draft',
    };
  }

  if (!input.hasSession) {
    return {
      state: 'guest',
      eyebrow: 'DRAFT SAVED ON THIS DEVICE',
      heading: 'Build your line.',
      description: 'Choose a Game Version, build a Character or Team, and decide how it belongs in your history.',
      actionLabel: 'Sign in to save & share',
      visibilityNote: 'Sign in and save your profile when you are ready to share this entry.',
      reviewDescription: 'Save this draft online to use it across devices and share your profile when you are ready.',
      reviewActionLabel: 'Sign in to save this draft',
      mainlineLabel: 'Your draft',
    };
  }

  if (input.profileLookupFailed) {
    return {
      state: 'account-check-needed',
      eyebrow: 'ACCOUNT CHECK NEEDED',
      heading: 'Check your account.',
      description: 'Your draft is still safe on this device. Open your account to retry before saving changes.',
      actionLabel: 'Check your account',
      visibilityNote: 'Check your account before saving this entry online.',
      reviewDescription: 'Check your account before choosing how to save this draft.',
      reviewActionLabel: 'Check your account',
      mainlineLabel: 'Your draft',
    };
  }

  if (input.registeredHandle) {
    const handle = `@${input.registeredHandle}`;
    return {
      state: 'registered',
      eyebrow: `SIGNED IN AS ${handle}`,
      heading: 'Keep your line current.',
      description: `You are signed in as ${handle}. Changes stay on this device until you save them to your profile.`,
      actionLabel: 'Save changes to profile',
      visibilityNote: 'This entry stays on this device until you save changes to your profile.',
      reviewDescription: `Your latest edits are on this device. Save changes to update ${handle}.`,
      reviewActionLabel: 'Save changes to profile',
      mainlineLabel: 'Your local changes',
    };
  }

  return {
    state: 'profile-setup',
    eyebrow: 'SIGNED IN',
    heading: 'Finish your profile.',
    description: 'Choose your public name and handle to save this draft online and use it across devices.',
    actionLabel: 'Finish profile setup',
    visibilityNote: 'This entry can be shared after you finish your profile setup.',
    reviewDescription: 'Finish your profile setup to save this draft online.',
    reviewActionLabel: 'Finish profile setup',
    mainlineLabel: 'Your draft',
  };
}
