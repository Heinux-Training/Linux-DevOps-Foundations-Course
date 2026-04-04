/**
 * API origin for cross-origin backends. Set REACT_APP_API_URL in .env — see .env.example.
 * Empty keeps same-origin URLs (dev proxy / Nginx).
 */
const raw = process.env.REACT_APP_API_URL || '';
const API_BASE_URL = String(raw).replace(/\/$/, '');

export function apiUrl(pathname) {
  const path = pathname.startsWith('/') ? pathname : `/${pathname}`;
  if (!API_BASE_URL) {
    return path;
  }
  return `${API_BASE_URL}${path}`;
}

export { API_BASE_URL };
