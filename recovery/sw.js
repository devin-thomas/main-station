// MainStation service-worker recovery build.
//
// Deploy this file AT THE SAME URL as the normal worker (/sw.js) to retire a broken
// worker from every installed client. It installs and activates promptly, claims all
// clients, removes only MainStation's own caches, and registers no fetch handler, so
// every request goes straight to the network while it is in control.
//
// It does not touch IndexedDB, so account drafts in `mainstation-accounts` survive.
//
// Procedure and rollback: docs/pwa-recovery.md

// Only caches MainStation itself creates. Never broad-delete caches on this origin:
// other apps may share it, and deleting their storage is not ours to do.
const OWNED_CACHE_PREFIXES = ['workbox-precache', 'mainstation'];

function isOwnedCache(name) {
  return OWNED_CACHE_PREFIXES.some((prefix) => name.startsWith(prefix));
}

self.addEventListener('install', (event) => {
  event.waitUntil(self.skipWaiting());
});

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    const names = await caches.keys();
    await Promise.all(names.filter(isOwnedCache).map((name) => caches.delete(name)));
    await self.clients.claim();
    // Reload open clients once so no document keeps running against the retired build.
    const clients = await self.clients.matchAll({ type: 'window' });
    for (const client of clients) client.navigate(client.url);
  })());
});

// No fetch handler on purpose: the network answers every request while this worker
// is installed. Adding one here would defeat the point of a recovery build.
