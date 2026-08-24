interface Env {
  ASSETS: Fetcher;
}

const securityHeaders: Record<string, string> = {
  'Content-Security-Policy': "default-src 'self'; connect-src 'self' https://bqfzzrasfunysseoogcg.supabase.co wss://bqfzzrasfunysseoogcg.supabase.co; img-src 'self' data:; font-src 'self'; style-src 'self'; script-src 'self'; object-src 'none'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'; upgrade-insecure-requests",
  'Permissions-Policy': 'camera=(), microphone=(), geolocation=(), payment=(), usb=()',
  'Referrer-Policy': 'strict-origin-when-cross-origin',
  'X-Content-Type-Options': 'nosniff',
  'X-Frame-Options': 'DENY',
};

function cachePolicy(pathname: string, isHtml: boolean): string {
  if (isHtml || pathname === '/sw.js' || pathname.endsWith('.webmanifest')) {
    return 'public, max-age=0, must-revalidate';
  }
  if (/^\/assets\/.+-[A-Za-z0-9_-]{8,}\.[A-Za-z0-9]+$/.test(pathname)) {
    return 'public, max-age=31536000, immutable';
  }
  return 'public, max-age=3600';
}

function looksLikeAsset(pathname: string): boolean {
  const finalSegment = pathname.split('/').at(-1) ?? '';
  return finalSegment.includes('.');
}

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const response = await env.ASSETS.fetch(request);
    const pathname = new URL(request.url).pathname;
    const isHtml = response.headers.get('Content-Type')?.toLowerCase().includes('text/html') ?? false;
    const headers = new Headers(response.headers);
    for (const [name, value] of Object.entries(securityHeaders)) {
      headers.set(name, value);
    }
    if (isHtml && pathname !== '/index.html' && looksLikeAsset(pathname)) {
      headers.set('Cache-Control', 'no-store');
      headers.set('Content-Type', 'text/plain; charset=utf-8');
      return new Response('Not found', { status: 404, headers });
    }
    headers.set('Cache-Control', cachePolicy(pathname, isHtml));
    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers,
    });
  },
} satisfies ExportedHandler<Env>;
