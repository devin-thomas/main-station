import '@fontsource-variable/archivo/wght.css';
import '@fontsource/barlow-condensed/latin-600.css';
import '@fontsource/barlow-condensed/latin-700.css';
import '@fontsource/barlow-condensed/latin-800.css';
import '@fontsource/ibm-plex-mono/latin-400.css';
import '@fontsource/ibm-plex-mono/latin-600.css';
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { App } from './app/App';
import { AuthProvider } from './features/auth/AuthProvider';
import { DraftProvider } from './features/draft/DraftProvider';
import './styles/global.css';

const root = document.getElementById('root');
if (!root) throw new Error('MainStation root element is missing.');

createRoot(root).render(
  <StrictMode>
    <BrowserRouter>
      <AuthProvider>
        <DraftProvider>
          <App />
        </DraftProvider>
      </AuthProvider>
    </BrowserRouter>
  </StrictMode>,
);
