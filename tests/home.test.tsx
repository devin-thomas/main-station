import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { describe, expect, it } from 'vitest';
import { HomePage } from '../src/routes/HomePage';

describe('home route', () => {
  it('leads with the Mainline and explicitly refuses cold-start invention', () => {
    render(<MemoryRouter><HomePage /></MemoryRouter>);
    expect(screen.getByRole('heading', { level: 1, name: /your mains\s*form a line/i })).toBeInTheDocument();
    expect(screen.getByText('Invented cold-start matches')).toBeInTheDocument();
    expect(screen.getByText('0', { selector: 'dd' })).toBeInTheDocument();
    expect(screen.getByRole('navigation', { name: 'Founding Game catalog' })).toBeInTheDocument();
  });
});
