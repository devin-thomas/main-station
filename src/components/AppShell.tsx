import { useEffect, useState } from 'react';
import { NavLink, Outlet, useLocation } from 'react-router-dom';
import { useAuth } from '../features/auth/AuthProvider';
import { usePwaLifecycle } from '../features/pwa/usePwaLifecycle';
import { Wordmark } from './Wordmark';

function navClass({ isActive }: { isActive: boolean }) {
  return isActive ? 'site-nav__link site-nav__link--active' : 'site-nav__link';
}

export function AppShell() {
  const [online, setOnline] = useState(navigator.onLine);
  const location = useLocation();
  const lifecycle = usePwaLifecycle();
  const { session, registeredHandle } = useAuth();
  const profilePath = registeredHandle ? `/p/${registeredHandle}` : session ? '/settings' : '/p/station-zero';

  useEffect(() => {
    const updateOnline = () => setOnline(true);
    const updateOffline = () => setOnline(false);
    window.addEventListener('online', updateOnline);
    window.addEventListener('offline', updateOffline);
    return () => {
      window.removeEventListener('online', updateOnline);
      window.removeEventListener('offline', updateOffline);
    };
  }, []);

  return (
    <div className="app-shell">
      <a className="skip-link" href="#main-content">Skip to content</a>
      {!online && (
        <div className="system-rail system-rail--warning" role="status">
          <span>OFFLINE</span>
          <p>Your guest draft remains available on this device. Account saves and fresh recommendations need a connection.</p>
        </div>
      )}
      {lifecycle.updateReady && (
        <div className="system-rail" role="status">
          <span>UPDATE READY</span>
          <p>A controlled new version is waiting.</p>
          <button type="button" onClick={() => void lifecycle.applyUpdate?.()}>Update now</button>
          <button type="button" className="button-quiet" onClick={lifecycle.deferUpdate}>Later</button>
        </div>
      )}
      {lifecycle.offlineReady && (
        <div className="system-rail system-rail--ready" role="status">
          <span>OFFLINE READY</span>
          <p>The app shell can now reopen without a connection.</p>
          <button type="button" className="button-quiet" onClick={lifecycle.dismissOfflineReady}>Dismiss</button>
        </div>
      )}
      {lifecycle.registrationError && (
        <div className="system-rail system-rail--error" role="alert">
          <span>OFFLINE SETUP FAILED</span>
          <p>{lifecycle.registrationError}</p>
        </div>
      )}
      <header className="site-header">
        <Wordmark compact />
        <nav className="site-nav" aria-label="Primary">
          <NavLink className={navClass} to="/build">Build</NavLink>
          <NavLink className={navClass} to="/recommend">Recommend</NavLink>
          <NavLink className={navClass} to={profilePath}>Profile</NavLink>
          <NavLink className={navClass} to="/settings">Settings</NavLink>
        </nav>
        {location.pathname !== '/build' && <NavLink className="header-command" to="/build">Add a main</NavLink>}
      </header>
      <main id="main-content" tabIndex={-1}>
        <Outlet />
      </main>
      <footer className="site-footer">
        <div className="site-footer__brand">
          <img src="/uppercut-labs-logo.png" alt="Uppercut Labs" />
          <span>Developed by Uppercut Labs</span>
        </div>
        <p>MainStation preview · Character imagery is published only with a recorded usage basis.</p>
      </footer>
    </div>
  );
}
