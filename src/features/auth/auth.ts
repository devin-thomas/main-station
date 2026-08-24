import { requireSupabase, safeAppRedirect } from '../../lib/supabase';

export async function signInWithDiscord(): Promise<void> {
  const { error } = await requireSupabase().auth.signInWithOAuth({
    provider: 'discord',
    options: { redirectTo: safeAppRedirect('/settings') },
  });
  if (error) throw error;
}

export async function sendEmailLink(email: string): Promise<void> {
  const normalized = email.trim().toLowerCase();
  if (!/^\S+@\S+\.\S+$/.test(normalized)) throw new Error('Enter a valid email address.');
  const { error } = await requireSupabase().auth.signInWithOtp({
    email: normalized,
    options: { emailRedirectTo: safeAppRedirect('/settings') },
  });
  if (error) throw error;
}

export async function signOut(): Promise<void> {
  const { error } = await requireSupabase().auth.signOut();
  if (error) throw error;
}
