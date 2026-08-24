/// <reference lib="webworker" />
import { clientsClaim } from 'workbox-core';
import { cleanupOutdatedCaches, matchPrecache, precacheAndRoute } from 'workbox-precaching';
import { registerRoute } from 'workbox-routing';

declare const self: ServiceWorkerGlobalScope & {
  __WB_MANIFEST: Array<{ url: string; revision?: string | null }>;
};

precacheAndRoute(self.__WB_MANIFEST);
cleanupOutdatedCaches();
clientsClaim();

registerRoute(
  ({ request, url }) => request.mode === 'navigate' && url.origin === self.location.origin,
  async ({ request }) => {
    try {
      const response = await fetch(request);
      if (!response.ok) throw new Error(`Navigation returned ${response.status}.`);
      return response;
    } catch {
      return (await matchPrecache('/index.html')) ?? new Response('MainStation is unavailable offline until it has loaded once.', {
        status: 503,
        headers: { 'Content-Type': 'text/plain; charset=utf-8' },
      });
    }
  },
);

self.addEventListener('message', (event) => {
  if (event.data?.type === 'SKIP_WAITING') void self.skipWaiting();
});
