import { createReadStream, promises as fs } from 'node:fs';
import { createServer } from 'node:http';
import path from 'node:path';

const TYPES = new Map(Object.entries({
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.mjs': 'text/javascript; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.webmanifest': 'application/manifest+json; charset=utf-8',
  '.png': 'image/png',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.txt': 'text/plain; charset=utf-8',
}));

// Revalidated on every request, exactly as the release contract requires. Everything
// else is content-hashed and may be cached hard.
const NEVER_STORE = new Set(['/index.html', '/sw.js', '/manifest.webmanifest']);

/**
 * Serves the production build with two controls the lifecycle evidence needs:
 * a release counter that changes the worker's bytes (so the browser sees an update),
 * and a switch that serves the recovery worker at the same /sw.js URL.
 */
export async function startPwaServer({ dist, recoveryWorker }) {
  const state = { release: 1, recovery: false };

  const server = createServer(async (request, response) => {
    const url = new URL(request.url, 'http://127.0.0.1');
    let pathname = decodeURIComponent(url.pathname);

    if (pathname === '/__control/release') {
      state.release += 1;
      state.recovery = false;
      response.writeHead(200, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
      response.end(JSON.stringify({ release: state.release }));
      return;
    }
    if (pathname === '/__control/recovery') {
      state.recovery = true;
      response.writeHead(200, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
      response.end(JSON.stringify({ recovery: true }));
      return;
    }

    if (pathname === '/sw.js') {
      const body = state.recovery
        ? await fs.readFile(recoveryWorker, 'utf8')
        // A changed release appends a comment: same behaviour, different bytes, so the
        // browser installs it as an update instead of treating it as byte-identical.
        : `${await fs.readFile(path.join(dist, 'sw.js'), 'utf8')}\n// release ${state.release}\n`;
      response.writeHead(200, { 'Content-Type': TYPES.get('.js'), 'Cache-Control': 'no-store' });
      response.end(body);
      return;
    }

    if (pathname.endsWith('/')) pathname += 'index.html';
    let file = path.join(dist, pathname);
    if (!file.startsWith(dist)) {
      response.writeHead(403).end('Forbidden');
      return;
    }

    let stat = await fs.stat(file).catch(() => null);
    if (!stat?.isFile()) {
      // Single-page-application fallback, matching the deployed Worker.
      file = path.join(dist, 'index.html');
      stat = await fs.stat(file).catch(() => null);
      if (!stat?.isFile()) {
        response.writeHead(404, { 'Content-Type': 'text/plain' }).end('Not found');
        return;
      }
      pathname = '/index.html';
    }

    response.writeHead(200, {
      'Content-Type': TYPES.get(path.extname(file)) ?? 'application/octet-stream',
      'Content-Length': stat.size,
      'Cache-Control': NEVER_STORE.has(pathname) ? 'no-store' : 'public, max-age=31536000, immutable',
    });
    createReadStream(file).pipe(response);
  });

  await new Promise((resolve) => server.listen(0, '127.0.0.1', resolve));
  const { port } = server.address();

  return {
    origin: `http://127.0.0.1:${port}`,
    async close() {
      await new Promise((resolve) => server.close(resolve));
    },
  };
}
