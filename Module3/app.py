from flask import Flask, jsonify

app = Flask(__name__)

from flask import render_template_string

HOME_PAGE_HTML = """
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello Home</title>
    <style>
      :root { color-scheme: light dark; }
      body {
        margin: 0;
        font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif;
        line-height: 1.5;
        min-height: 100vh;
        display: grid;
        place-items: center;
        background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
      }
      .container {
        width: min(420px, 90vw);
        background: rgba(255,255,255,0.92);
        border-radius: 18px;
        padding: 36px 28px 28px;
        box-shadow: 0 8px 36px rgba(0,0,0,0.12);
        text-align: center;
      }
      h1 {
        margin-top: 0;
        font-size: 2.3rem;
        color: #0075ee;
        letter-spacing: 1px;
        margin-bottom: 8px;
      }
      p {
        margin: 0 0 16px;
        color: #444;
        font-size: 1.1rem;
      }
      .hello {
        font-size: 2.6rem;
        font-weight: bold;
        color: #fdad00;
        margin-bottom: 20px;
        text-shadow: 1px 2px 12px #fcb90044;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }
      a {
        color: #326cff;
        text-decoration: none;
        font-weight: 500;
      }
      a:hover {
        text-decoration: underline;
      }
      footer {
        margin-top: 22px;
        color: #777;
        font-size: 0.95rem;
      }
    </style>
  </head>
  <body>
    <main class="container">
      <div class="hello">👋 Hello!</div>
      <h1>Welcome to the Flask Home Page</h1>
      <p>This is the <strong>index.html</strong> rendered by Flask with beautiful CSS styling.</p>
      <p>Try visiting the <a href="/hello">/hello</a> route for a JSON hello.</p>
      <p>Try visiting the <a href="/login">/login</a> route for Login information.</p>
      <footer>
        Powered by <a href="https://flask.palletsprojects.com/" target="_blank" rel="noopener">Flask</a>
      </footer>
    </main>
  </body>
</html>
"""

@app.get("/")
def home():
    return render_template_string(HOME_PAGE_HTML)

@app.get("/hello")
def hello():
    return jsonify(message="Hello from Flask!")


@app.get("/login")
def login():
    return jsonify(message="Please provide credentials"), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)


