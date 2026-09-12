import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { describe, expect, it, vi } from 'vitest';
import { HomePage } from '../src/routes/HomePage';
vi.mock('../src/features/auth/AuthProvider', () => ({ useAuth: () => ({ session: null, sessionLoading: false }) }));

describe('home route', () => {
  it('offers a Mainline and game catalog without implementation metrics', () => {
    render(<MemoryRouter><HomePage /></MemoryRouter>);
    expect(screen.getByRole('heading', { level: 1, name: 'Your mains.' })).toBeInTheDocument();
    expect(screen.getByRole('img', { name: 'Ekko and Magik clash in battle' })).toBeInTheDocument();
    expect(screen.getByRole('link', { name: 'Sign in to build' })).toHaveAttribute('href', '/settings?next=%2Fbuild');
    expect(screen.queryByText('Invented cold-start matches')).not.toBeInTheDocument();
    expect(screen.queryByText('Profile contribution / game')).not.toBeInTheDocument();
    expect(screen.getByRole('navigation', { name: 'Games' })).toBeInTheDocument();
  });
});
