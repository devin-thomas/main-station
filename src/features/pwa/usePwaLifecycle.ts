import { useEffect, useRef, useState } from 'react';
import { registerSW } from 'virtual:pwa-register';

export function usePwaLifecycle() {
  const [offlineReady, setOfflineReady] = useState(false);
  const [updateReady, setUpdateReady] = useState(false);
  const [registrationError, setRegistrationError] = useState<string | null>(null);
  const updateServiceWorker = useRef<((reloadPage?: boolean) => Promise<void>) | null>(null);

  useEffect(() => {
    const update = registerSW({
      immediate: true,
      onOfflineReady: () => setOfflineReady(true),
      onNeedRefresh: () => setUpdateReady(true),
      onRegisterError: (error) => setRegistrationError(error instanceof Error ? error.message : 'The offline worker could not be registered.'),
    });
    updateServiceWorker.current = update;
    return () => {
      updateServiceWorker.current = null;
    };
  }, []);

  return {
    offlineReady,
    updateReady,
    registrationError,
    applyUpdate: async () => {
      await updateServiceWorker.current?.(true);
    },
    dismissOfflineReady: () => setOfflineReady(false),
    deferUpdate: () => setUpdateReady(false),
  };
}
