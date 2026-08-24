import { Link } from 'react-router-dom';

export function Wordmark({ compact = false }: { compact?: boolean }) {
  return (
    <Link className={`wordmark${compact ? ' wordmark--compact' : ''}`} to="/" aria-label="MainStation home">
      <span className="wordmark__main">MAIN</span>
      <span className="wordmark__station">STATION</span>
      <span className="wordmark__signal" aria-hidden="true" />
    </Link>
  );
}
