export type BuilderAccountState = 'checking' | 'guest' | 'profile-setup' | 'registered' | 'account-check-needed';

export interface BuilderAccountPresentation {
  state: BuilderAccountState;
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
      heading: 'Build your Mainline',
      description: 'Checking your account...',
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
      heading: 'Build your Mainline',
      description: 'Drafts stay on this device until you sign in and save your profile.',
      actionLabel: 'Sign in to save & share',
      visibilityNote: 'Public entries appear on your profile and contribute to recommendations once saved online.',
      reviewDescription: '',
      reviewActionLabel: 'Sign in to save this draft',
      mainlineLabel: 'Your draft',
    };
  }

  if (input.profileLookupFailed) {
    return {
      state: 'account-check-needed',
      heading: 'Check your account.',
      description: 'We could not load your account. Your draft is safe on this device.',
      actionLabel: 'Check your account',
      visibilityNote: 'Check your account before saving this entry online.',
      reviewDescription: '',
      reviewActionLabel: 'Check your account',
      mainlineLabel: 'Your draft',
    };
  }

  if (input.registeredHandle) {
    const handle = `@${input.registeredHandle}`;
    return {
      state: 'registered',
      heading: 'Your Mainline',
      description: `Changes to ${handle} stay on this device until you save them to your profile.`,
      actionLabel: 'Save changes to profile',
      visibilityNote: 'Public entries appear on your profile and contribute to recommendations once saved online.',
      reviewDescription: '',
      reviewActionLabel: 'Save changes to profile',
      mainlineLabel: 'Your local changes',
    };
  }

  return {
    state: 'profile-setup',
    heading: 'Finish your profile.',
    description: 'Choose your public name and handle to save this draft online and use it across devices.',
    actionLabel: 'Finish profile setup',
    visibilityNote: 'This entry can be shared after you finish your profile setup.',
    reviewDescription: '',
    reviewActionLabel: 'Finish profile setup',
    mainlineLabel: 'Your draft',
  };
}
