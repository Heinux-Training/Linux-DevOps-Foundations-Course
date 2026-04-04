import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { API_BASE_URL, apiUrl } from '../apiConfig';

function Home() {
  const [apiDemo, setApiDemo] = useState(null);
  const [apiError, setApiError] = useState(null);
  const [apiLoading, setApiLoading] = useState(true);

  useEffect(() => {
    let cancelled = false;
    fetch(apiUrl('/api/demo'))
      .then((res) => {
        if (!res.ok) {
          throw new Error(`Request failed (${res.status})`);
        }
        return res.json();
      })
      .then((data) => {
        if (!cancelled) setApiDemo(data);
      })
      .catch((err) => {
        if (!cancelled) setApiError(err.message);
      })
      .finally(() => {
        if (!cancelled) setApiLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, []);

  return (
    <div className="page">
      <section className="hero">
        <p className="eyebrow">Hello, I am</p>
        <h1>Hein Htet Win</h1>
        <p className="lede">
          Linux &amp; DevOps learner building reliable systems, clear docs, and
          small tools that ship.
        </p>
        <div className="hero-actions">
          <Link className="btn btn-primary" to="/about">
            About me
          </Link>
          <Link className="btn btn-ghost" to="/contact">
            Get in touch
          </Link>
        </div>
      </section>
      <section className="panel">
        <h2>What I am working on</h2>
        <ul className="feature-list">
          <li>
            <strong>Automation</strong> — scripts and CI so repeat work stays
            boring (in a good way).
          </li>
          <li>
            <strong>Web serving</strong> — static sites and reverse proxies with
            Nginx.
          </li>
          <li>
            <strong>Learning in public</strong> — notes, labs, and demos like
            this React app.
          </li>
        </ul>
      </section>
      <section className="panel api-demo-panel" aria-live="polite">
        <h2>API demo</h2>
        <p className="api-demo-intro">
          This block loads JSON from{' '}
          <code>{API_BASE_URL ? `${API_BASE_URL}/api/demo` : '/api/demo'}</code>
          {API_BASE_URL
            ? ' (REACT_APP_API_URL).'
            : ' (same origin — dev proxy or Nginx in production).'}
        </p>
        {apiLoading && <p className="api-demo-status">Loading…</p>}
        {apiError && (
          <p className="api-demo-error" role="alert">
            Could not reach the API: {apiError}. Start the backend with{' '}
            <code>npm start</code> in <code>node-backend</code>.
          </p>
        )}
        {!apiLoading && !apiError && apiDemo && (
          <div className="api-demo-result">
            <p>
              <strong>{apiDemo.message}</strong>
            </p>
            <p className="api-demo-label">Topics from the server:</p>
            <ul className="feature-list">
              {apiDemo.topics.map((topic) => (
                <li key={topic}>{topic}</li>
              ))}
            </ul>
          </div>
        )}
      </section>
    </div>
  );
}

export default Home;
