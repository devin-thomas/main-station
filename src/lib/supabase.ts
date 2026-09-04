import { createClient, type SupabaseClient } from '@supabase/supabase-js';
import type { Database } from '../types/database';

const projectUrl = import.meta.env.VITE_SUPABASE_URL?.trim();
const publishableKey = import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY?.trim();

export const supabaseConfigured = Boolean(projectUrl && publishableKey);

export const supabase: SupabaseClient<Database> | null = projectUrl && publishableKey
  ? createClient<Database>(projectUrl, publishableKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        // The dedicated callback route performs the PKCE exchange exactly once.
        detectSessionInUrl: false,
        flowType: 'pkce',
      },
    })
  : null;

export function requireSupabase(): SupabaseClient<Database> {
  if (!supabase) throw new Error('Sign-in is unavailable. Please try again later.');
  return supabase;
}

export async function accountAuthorization(userId: string): Promise<string> {
  const { data, error } = await requireSupabase().auth.getSession();
  if (error) throw error;
  if (!userId || !data.session || data.session.user.id !== userId) {
    throw new Error('Your account changed. Sign in again before continuing.');
  }
  // Bind the request to this identity even if another tab switches accounts.
  return `Bearer ${data.session.access_token}`;
}

export function safeAppRedirect(pathname = '/settings'): string {
  const allowed = new Set(['/settings', '/build', '/recommend']);
  const safePath = allowed.has(pathname) ? pathname : '/settings';
  return `${window.location.origin}/auth/callback?next=${encodeURIComponent(safePath)}`;
}
