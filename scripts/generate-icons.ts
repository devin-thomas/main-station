import { mkdir } from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const outputDirectory = path.resolve('public/icons');
const brandDirectory = path.resolve('public/brand');
const sourceLogo = path.resolve('assets/brand/mainstation-logo.png');
const launcherBackground = { r: 0, g: 0, b: 0 };

async function iconBuffer(size: number, safe: boolean): Promise<Buffer> {
  if (!safe) {
    return sharp(sourceLogo)
      .resize(size, size, { fit: 'cover' })
      .png({ compressionLevel: 9 })
      .toBuffer();
  }

  const safeSize = Math.round(size * 0.7);
  const mark = await sharp(sourceLogo)
    .resize(safeSize, safeSize, { fit: 'cover' })
    .png({ compressionLevel: 9 })
    .toBuffer();

  return sharp({
    create: {
      width: size,
      height: size,
      channels: 3,
      background: launcherBackground,
    },
  })
    .composite([{ input: mark, gravity: 'center' }])
    .png({ compressionLevel: 9 })
    .toBuffer();
}

async function writeIcon(filename: string, size: number, safe = false): Promise<void> {
  await sharp(await iconBuffer(size, safe)).toFile(path.join(outputDirectory, filename));
}

await Promise.all([
  mkdir(outputDirectory, { recursive: true }),
  mkdir(brandDirectory, { recursive: true }),
]);
await Promise.all([
  writeIcon('icon-192.png', 192),
  writeIcon('icon-512.png', 512),
  writeIcon('icon-maskable-192.png', 192, true),
  writeIcon('icon-maskable-512.png', 512, true),
  writeIcon('apple-touch-icon.png', 180, true),
  sharp(sourceLogo)
    .resize(64, 64, { fit: 'cover' })
    .png({ compressionLevel: 9 })
    .toFile(path.resolve('public/favicon.png')),
  sharp(sourceLogo)
    .resize(640, 640, { fit: 'cover' })
    .png({ compressionLevel: 9 })
    .toFile(path.join(brandDirectory, 'mainstation-logo.png')),
]);
