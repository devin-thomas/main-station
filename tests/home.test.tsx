import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { describe, expect, it } from 'vitest';
import { HomePage } from '../src/routes/HomePage';

describe('home route', () => {
  it('offers a Mainline and game catalog without implementation metrics', () => {
    render(<MemoryRouter><HomePage /></MemoryRouter>);
    expect(screen.getByRole('heading', { level: 1, name: 'Your mains.' })).toBeInTheDocument();
    expect(screen.getByRole('link', { name: 'Build your Mainline' })).toHaveAttribute('href', '/build');
    expect(screen.queryByText('Invented cold-start matches')).not.toBeInTheDocument();
    expect(screen.queryByText('Profile contribution / game')).not.toBeInTheDocument();
    expect(screen.getByRole('navigation', { name: 'Games' })).toBeInTheDocument();
  });
});
