import { Link } from 'react-router-dom';

export function NotFoundPage() {
  return (
    <div className="state-page page-frame">
      <h1>Page not found</h1>
      <Link className="button-primary" to="/">Return to MainStation</Link>
    </div>
  );
}
