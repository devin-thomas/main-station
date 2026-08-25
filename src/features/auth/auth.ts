import { requireSupabase, safeAppRedirect } from '../../lib/supabase';

export type AuthAction = 'discord' | 'email' | 'callback';

export function friendlyAuthError(error: unknown, action: AuthAction): string {
  const detail = error instanceof Error ? error.message.toLowerCase() : '';
  if (detail.includes('network') || detail.includes('fetch')) {
    return 'We could not reach MainStation. Check your connection and try again.';
  }
  if (detail.includes('rate') || detail.includes('too many')) {
    return 'Please wait a moment before trying again.';
  }
  if (detail.includes('pkce') || detail.includes('code verifier') || detail.includes('expired') || detail.includes('invalid')) {
    return 'That sign-in link is no longer valid. Start again to get a fresh link.';
  }
  if (action === 'email') return 'We could not send that sign-in link. Check the address and try again.';
  if (action === 'discord') return 'We could not start Discord sign-in. Try again in a moment.';
  return 'We could not finish signing you in. Start again to keep your draft safe.';
}

export async function signInWithDiscord(next = '/settings'): Promise<void> {
  const { error } = await requireSupabase().auth.signInWithOAuth({
    provider: 'discord',
    options: { redirectTo: safeAppRedirect(next) },
  });
  if (error) throw error;
}

export async function sendEmailLink(email: string, next = '/settings'): Promise<void> {
  const normalized = email.trim().toLowerCase();
  if (!/^\S+@\S+\.\S+$/.test(normalized)) throw new Error('Enter a valid email address.');
  const { error } = await requireSupabase().auth.signInWithOtp({
    email: normalized,
    options: { emailRedirectTo: safeAppRedirect(next) },
  });
  if (error) throw error;
}

export async function signOut(): Promise<void> {
  const { error } = await requireSupabase().auth.signOut();
  if (error) throw error;
}
