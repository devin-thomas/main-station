import { Link } from 'react-router-dom';
import { catalog } from '../data/catalog';

export function CatalogRail({ current }: { current?: string }) {
  return (
    <nav className="catalog-rail" aria-label="Founding Game catalog">
      <ol>
        {catalog.map((game, index) => (
          <li key={game.slug}>
            <Link to={`/games/${game.slug}`} aria-current={current === game.slug ? 'page' : undefined}>
              <span>{String(index + 1).padStart(2, '0')}</span>
              <strong>{game.shortName}</strong>
              <small>{game.catalogStatus === 'verified' ? 'VERIFIED' : 'PREVIEW'}</small>
            </Link>
          </li>
        ))}
      </ol>
    </nav>
  );
}
