import { useEffect, useRef, useState } from 'react';
import { registerSW } from 'virtual:pwa-register';

// The worker calls clientsClaim(), so adopting an update changes the controller in every
// open tab, not only the one that accepted. vite-plugin-pwa reloads just the accepting
// tab, which would leave the others running an old document against the new worker.
// Each tab therefore reloads itself once on `controllerchange`.
let reloadStarted = false;

function adoptNewWorkerOnce() {
  if (reloadStarted) return;
  reloadStarted = true;
  window.location.reload();
}

export function usePwaLifecycle() {
  const [offlineReady, setOfflineReady] = useState(false);
  const [updateReady, setUpdateReady] = useState(false);
  const [registrationError, setRegistrationError] = useState<string | null>(null);
  const updateServiceWorker = useRef<((reloadPage?: boolean) => Promise<void>) | null>(null);

  useEffect(() => {
    // A first visit has no controller until clientsClaim() takes hold. That first change
    // is the initial claim, not an update, and must not reload the page the visitor just
    // opened. Every change after the tab is controlled is a new worker taking over.
    let controlled = Boolean(navigator.serviceWorker?.controller);
    const onControllerChange = () => {
      if (!controlled) {
        controlled = true;
        return;
      }
      adoptNewWorkerOnce();
    };
    navigator.serviceWorker?.addEventListener('controllerchange', onControllerChange);

    const update = registerSW({
      immediate: true,
      onOfflineReady: () => setOfflineReady(true),
      onNeedRefresh: () => setUpdateReady(true),
      onRegisterError: (error) => setRegistrationError(error instanceof Error ? error.message : 'The offline worker could not be registered.'),
    });
    updateServiceWorker.current = update;
    return () => {
      navigator.serviceWorker?.removeEventListener('controllerchange', onControllerChange);
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
