import { useEffect, useMemo, useState } from 'react';

interface BeforeInstallPromptEvent extends Event {
  prompt(): Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed'; platform: string }>;
}

function isStandalone(): boolean {
  return window.matchMedia('(display-mode: standalone)').matches || ('standalone' in navigator && navigator.standalone === true);
}

export function useInstall() {
  const [promptEvent, setPromptEvent] = useState<BeforeInstallPromptEvent | null>(null);
  const [installed, setInstalled] = useState(isStandalone);

  useEffect(() => {
    const onPrompt = (event: Event) => {
      event.preventDefault();
      setPromptEvent(event as BeforeInstallPromptEvent);
    };
    const onInstalled = () => {
      setInstalled(true);
      setPromptEvent(null);
    };
    window.addEventListener('beforeinstallprompt', onPrompt);
    window.addEventListener('appinstalled', onInstalled);
    return () => {
      window.removeEventListener('beforeinstallprompt', onPrompt);
      window.removeEventListener('appinstalled', onInstalled);
    };
  }, []);

  const guidance = useMemo(() => {
    const ua = navigator.userAgent;
    if (/iPad|iPhone|iPod/.test(ua)) return 'In Safari, open Share and choose Add to Home Screen.';
    if (/Macintosh/.test(ua) && /Safari/.test(ua) && !/Chrome/.test(ua)) return 'In Safari, choose File, then Add to Dock.';
    if (/Firefox/.test(ua)) return 'This browser does not expose an install prompt here. MainStation remains fully usable in this tab.';
    return 'Use your browser menu and choose Install MainStation when the install prompt is available.';
  }, []);

  return {
    installed,
    canPrompt: Boolean(promptEvent),
    guidance,
    async prompt() {
      if (!promptEvent) return;
      await promptEvent.prompt();
      const choice = await promptEvent.userChoice;
      if (choice.outcome === 'accepted') setInstalled(true);
      setPromptEvent(null);
    },
  };
}
