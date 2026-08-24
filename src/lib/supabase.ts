import { createClient, type SupabaseClient } from '@supabase/supabase-js';

const projectUrl = import.meta.env.VITE_SUPABASE_URL?.trim();
const publishableKey = import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY?.trim();

export const supabaseConfigured = Boolean(projectUrl && publishableKey);

export const supabase: SupabaseClient | null = projectUrl && publishableKey
  ? createClient(projectUrl, publishableKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
        flowType: 'pkce',
      },
    })
  : null;

export function requireSupabase(): SupabaseClient {
  if (!supabase) throw new Error('Account features are not configured on this release yet. Your local draft is still available.');
  return supabase;
}

export function safeAppRedirect(pathname = '/settings'): string {
  const allowed = new Set(['/settings', '/build', '/recommend']);
  const safePath = allowed.has(pathname) ? pathname : '/settings';
  return `${window.location.origin}/auth/callback?next=${encodeURIComponent(safePath)}`;
}
