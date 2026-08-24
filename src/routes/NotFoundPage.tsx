import { Link } from 'react-router-dom';

export function NotFoundPage() {
  return (
    <div className="state-page page-frame">
      <p className="eyebrow">ROUTE / 404</p>
      <h1>This stop is not on the line.</h1>
      <p>The address may have changed, or this page has not been cached for offline use.</p>
      <Link className="button-primary" to="/">Return to MainStation</Link>
    </div>
  );
}
