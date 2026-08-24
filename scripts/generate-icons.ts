import { mkdir } from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const outputDirectory = path.resolve('public/icons');

function iconSvg(size: number, safe: boolean): Buffer {
  const inset = safe ? Math.round(size * 0.2) : Math.round(size * 0.08);
  const inner = size - inset * 2;
  const wordSize = Math.round(inner * 0.3);
  const subSize = Math.round(inner * 0.065);
  const markup = `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 ${size} ${size}">
    <rect width="${size}" height="${size}" fill="#090b0c"/>
    <path d="M0 ${size * 0.7}H${size}" stroke="#263137" stroke-width="${Math.max(2, size * 0.012)}"/>
    <circle cx="${size * 0.77}" cy="${size * 0.7}" r="${Math.max(5, size * 0.035)}" fill="#45c6d4"/>
    <text x="${inset}" y="${inset + inner * 0.58}" fill="#f2eedf" font-family="Arial Narrow, sans-serif" font-size="${wordSize}" font-weight="800" letter-spacing="-${wordSize * 0.06}">MS</text>
    <text x="${inset}" y="${inset + inner * 0.78}" fill="#a6afb2" font-family="monospace" font-size="${subSize}" letter-spacing="${subSize * 0.12}">PROVISIONAL</text>
  </svg>`;
  return Buffer.from(markup);
}

async function writeIcon(filename: string, size: number, safe = false): Promise<void> {
  await sharp(iconSvg(size, safe)).png().toFile(path.join(outputDirectory, filename));
}

await mkdir(outputDirectory, { recursive: true });
await Promise.all([
  writeIcon('icon-192.png', 192),
  writeIcon('icon-512.png', 512),
  writeIcon('icon-maskable-192.png', 192, true),
  writeIcon('icon-maskable-512.png', 512, true),
  writeIcon('apple-touch-icon.png', 180, true),
]);
