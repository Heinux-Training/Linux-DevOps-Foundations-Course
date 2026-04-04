function About() {
  return (
    <div className="page">
      <header className="page-header">
        <h1>About</h1>
        <p className="subtitle">
          A short bio you can replace with your own story for demos and
          portfolios.
        </p>
      </header>
      <div className="content-columns">
        <section className="panel">
          <h2>Background</h2>
          <p>
            I care about how software gets from a laptop to production: Linux
            fundamentals, networking, services, and the habits that keep
            systems observable and recoverable.
          </p>
          <p>
            This site is a teaching demo: three routes (home, about, contact)
            served as a single-page app, often placed behind Nginx.
          </p>
        </section>
        <section className="panel">
          <h2>Skills (sample)</h2>
          <ul className="tag-list">
            <li>Bash &amp; CLI</li>
            <li>systemd units</li>
            <li>Nginx</li>
            <li>Git</li>
            <li>React (basics)</li>
          </ul>
        </section>
      </div>
    </div>
  );
}

export default About;
