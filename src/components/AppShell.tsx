import { useEffect, useState } from 'react';
import { NavLink, Outlet, useLocation } from 'react-router-dom';
import { useAuth } from '../features/auth/AuthProvider';
import { usePwaLifecycle } from '../features/pwa/usePwaLifecycle';
import { Wordmark } from './Wordmark';
import { Icon } from './Icon';

function navClass({ isActive }: { isActive: boolean }) {
  return isActive ? 'site-nav__link site-nav__link--active' : 'site-nav__link';
}

export function AppShell() {
  const [online, setOnline] = useState(navigator.onLine);
  const location = useLocation();
  const lifecycle = usePwaLifecycle();
  const { session, registeredHandle } = useAuth();
  const profilePath = registeredHandle ? `/p/${registeredHandle}` : session ? '/settings' : '/p/station-zero';
  const accountLabel = registeredHandle ? `@${registeredHandle}` : 'Account';
  const isFocusRoute = location.pathname === '/settings' || location.pathname === '/build';

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
      {lifecycle.updateReady && !isFocusRoute && (
        <div className="system-rail" role="status">
          <span>UPDATE READY</span>
          <button type="button" onClick={() => void lifecycle.applyUpdate?.()}>Update now</button>
          <button type="button" className="button-quiet" onClick={lifecycle.deferUpdate}>Later</button>
        </div>
      )}
      {lifecycle.offlineReady && !isFocusRoute && (
        <div className="system-rail system-rail--ready" role="status">
          <p>Ready to open offline.</p>
          <button type="button" className="button-quiet icon-button" aria-label="Dismiss" onClick={lifecycle.dismissOfflineReady}><Icon name="x" /></button>
        </div>
      )}
      {lifecycle.registrationError && (
        <div className="system-rail system-rail--error" role="alert">
          <p>Offline access could not be enabled.</p>
        </div>
      )}
      <header className="site-header">
        <Wordmark compact />
        <nav className="site-nav" aria-label="Primary">
          <NavLink className={navClass} to="/build"><Icon name="plus" />Build</NavLink>
          <NavLink className={navClass} to="/recommend"><Icon name="compass" />Recommend</NavLink>
          <NavLink className={navClass} to={profilePath}><Icon name="user-round" />Profile</NavLink>
        </nav>
        <div className="header-actions">
          <NavLink className="header-auth" to="/settings" aria-label={session ? accountLabel : undefined}>{session ? <Icon name="settings" /> : 'Sign in'}</NavLink>
        </div>
      </header>
      <main id="main-content" tabIndex={-1}>
        <Outlet />
      </main>
      <footer className="site-footer">
        <div className="site-footer__brand">
          <img src="/uppercut-labs-logo.png" alt="" />
          <span>Developed by Uppercut Labs</span>
        </div>
      </footer>
    </div>
  );
}
