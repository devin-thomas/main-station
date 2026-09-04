import { Link } from 'react-router-dom';
import { catalog } from '../data/catalog';
import { Icon } from './Icon';

export function CatalogRail({ current }: { current?: string }) {
  return (
    <nav className="catalog-rail" aria-label="Games">
      <ol>
        {catalog.map((game) => (
          <li key={game.slug}>
            <Link to={`/games/${game.slug}`} aria-current={current === game.slug ? 'page' : undefined}>
              <strong>{game.shortName}</strong>
              <Icon name="chevron-right" />
            </Link>
          </li>
        ))}
      </ol>
    </nav>
  );
}
