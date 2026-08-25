import { Link } from 'react-router-dom';

export function Wordmark({ compact = false }: { compact?: boolean }) {
  return (
    <Link className={`wordmark${compact ? ' wordmark--compact' : ''}`} to="/" aria-label="MainStation home">
      <img className="wordmark__logo" src="/brand/mainstation-logo.png" alt="" />
      <span className="wordmark__type" aria-hidden="true">
        <span className="wordmark__main">MAIN</span>
        <span className="wordmark__station">STATION</span>
      </span>
      <span className="wordmark__signal" aria-hidden="true" />
    </Link>
  );
}
