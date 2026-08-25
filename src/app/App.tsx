import { Route, Routes } from 'react-router-dom';
import { AppShell } from '../components/AppShell';
import { AuthCallbackPage } from '../routes/AuthCallbackPage';
import { BuilderPage } from '../routes/BuilderPage';
import { CharacterPage } from '../routes/CharacterPage';
import { GamePage } from '../routes/GamePage';
import { HomePage } from '../routes/HomePage';
import { NotFoundPage } from '../routes/NotFoundPage';
import { ProfilePage } from '../routes/ProfilePage';
import { RecommendationPage } from '../routes/RecommendationPage';
import { SettingsPage } from '../routes/SettingsPage';

export function App() {
  return (
    <Routes>
      <Route path="auth/callback" element={<AuthCallbackPage />} />
      <Route element={<AppShell />}>
        <Route index element={<HomePage />} />
        <Route path="build" element={<BuilderPage />} />
        <Route path="recommend" element={<RecommendationPage />} />
        <Route path="p/:handle" element={<ProfilePage />} />
        <Route path="games/:gameSlug" element={<GamePage />} />
        <Route path="games/:gameSlug/characters/:characterSlug" element={<CharacterPage />} />
        <Route path="settings" element={<SettingsPage />} />
        <Route path="*" element={<NotFoundPage />} />
      </Route>
    </Routes>
  );
}
