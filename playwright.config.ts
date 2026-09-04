import { defineConfig, devices } from '@playwright/test';

const deployedBaseUrl = process.env.PLAYWRIGHT_BASE_URL;

export default defineConfig({
  metadata: { hostPlatform: process.platform },
  testDir: './tests/e2e',
  fullyParallel: true,
  retries: 0,
  reporter: 'list',
  use: {
    baseURL: deployedBaseUrl ?? 'http://127.0.0.1:4173',
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
  },
  webServer: deployedBaseUrl ? undefined : {
      command: 'npm run preview -- --host 127.0.0.1',
      port: 4173,
      reuseExistingServer: true,
    },
  projects: [
    { name: 'desktop-chromium', use: { ...devices['Desktop Chrome'] } },
    {
      name: 'iphone-16-pro-webkit',
      use: {
        ...devices['iPhone 16 Pro'],
        browserName: 'webkit',
        viewport: { width: 402, height: 874 },
        contextOptions: { screen: { width: 402, height: 874 } },
        deviceScaleFactor: 3,
      },
    },
    {
      name: 'galaxy-s21-ultra-chromium',
      use: {
        browserName: 'chromium',
        userAgent: devices['Galaxy S24'].userAgent.replace('SM-S921U', 'SM-G998B'),
        viewport: { width: 384, height: 854 },
        contextOptions: { screen: { width: 384, height: 854 } },
        deviceScaleFactor: 3.75,
        isMobile: true,
        hasTouch: true,
      },
    },
  ],
});
