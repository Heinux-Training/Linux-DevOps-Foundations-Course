function Contact() {
  return (
    <div className="page">
      <header className="page-header">
        <h1>Contact us</h1>
        <p className="subtitle">
          Demo contact block — swap these placeholders for your real links or a
          form handler.
        </p>
      </header>
      <section className="panel contact-panel">
        <dl className="contact-grid">
          <div>
            <dt>Email</dt>
            <dd>
              <a href="mailto:you@example.com">you@example.com</a>
            </dd>
          </div>
          <div>
            <dt>GitHub</dt>
            <dd>
              <a
                href="https://github.com/"
                target="_blank"
                rel="noopener noreferrer"
              >
                github.com/yourusername
              </a>
            </dd>
          </div>
          <div>
            <dt>Location</dt>
            <dd>Yangon, Myanmar (example)</dd>
          </div>
        </dl>
        <p className="muted fine-print">
          For production, you might POST this form to an API or use a service;
          here it is static HTML for the lab.
        </p>
      </section>
    </div>
  );
}

export default Contact;
