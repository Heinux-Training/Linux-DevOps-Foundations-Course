import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import App from './App';

test('renders home hero', () => {
  render(
    <MemoryRouter initialEntries={['/']}>
      <App />
    </MemoryRouter>
  );
  expect(screen.getByRole('heading', { name: /Hein Htet Win/i })).toBeInTheDocument();
  expect(
    screen.getByRole('navigation', { name: /primary/i })
  ).toBeInTheDocument();
});
