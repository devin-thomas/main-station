import { requireSupabase, safeAppRedirect } from '../../lib/supabase';

export type AuthAction = 'discord' | 'email' | 'callback';

export function friendlyAuthError(error: unknown, action: AuthAction): string {
  const detail = error instanceof Error ? error.message.toLowerCase() : '';
  if (detail === 'enter a valid email address.' || detail === 'invalid email address') {
    return 'Enter a valid email address.';
  }
  if (detail.includes('network') || detail.includes('fetch')) {
    return 'MainStation could not be reached. Check your connection.';
  }
  if (detail.includes('rate') || detail.includes('too many')) {
    return 'Too many sign-in attempts. Please wait a moment.';
  }
  // The PKCE verifier is stored by the browser that asked for the link, so opening the
  // link somewhere else (an in-app mail browser, another device) cannot complete the
  // exchange. The link itself is fine, and telling people it expired sends them in circles.
  if (detail.includes('code verifier') || detail.includes('flow state') || detail.includes('pkce')) {
    return 'Open the sign-in link in the same browser you requested it from. A link opened in a different browser cannot finish signing you in.';
  }
  if (detail.includes('expired') || detail.includes('invalid')) {
    return 'That sign-in link is no longer valid.';
  }
  if (action === 'email') return 'Your sign-in link could not be sent.';
  if (action === 'discord') return 'Discord sign-in could not be started.';
  return 'Sign-in could not be completed. Please try again.';
}

let exchange: { code: string; result: ReturnType<ReturnType<typeof requireSupabase>['auth']['exchangeCodeForSession']> } | null = null;

export function completeSignIn(code: string | null) {
  const client = requireSupabase();
  if (!code) return client.auth.getSession();
  // PKCE codes are single use, including across StrictMode and account remounts.
  if (exchange?.code !== code) exchange = { code, result: client.auth.exchangeCodeForSession(code) };
  return exchange.result;
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
