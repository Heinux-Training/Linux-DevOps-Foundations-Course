<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel with Nginx</title>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Nunito', sans-serif;
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .container {
                background: rgba(255, 255, 255, 0.95);
                padding: 3rem;
                border-radius: 20px;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 600px;
                margin: 2rem;
            }
            .logo {
                font-size: 3rem;
                font-weight: 700;
                color: #667eea;
                margin-bottom: 1rem;
            }
            .subtitle {
                font-size: 1.2rem;
                color: #666;
                margin-bottom: 2rem;
            }
            .features {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1rem;
                margin: 2rem 0;
            }
            .feature {
                background: #f8f9fa;
                padding: 1.5rem;
                border-radius: 10px;
                border-left: 4px solid #667eea;
            }
            .feature h3 {
                margin: 0 0 0.5rem 0;
                color: #333;
            }
            .feature p {
                margin: 0;
                color: #666;
                font-size: 0.9rem;
            }
            .links {
                margin-top: 2rem;
            }
            .links a {
                display: inline-block;
                margin: 0.5rem;
                padding: 0.75rem 1.5rem;
                background: #667eea;
                color: white;
                text-decoration: none;
                border-radius: 25px;
                transition: background 0.3s;
            }
            .links a:hover {
                background: #5a6fd8;
            }
            .info {
                background: #e3f2fd;
                padding: 1rem;
                border-radius: 10px;
                margin-top: 2rem;
                border-left: 4px solid #2196f3;
            }
            .info h4 {
                margin: 0 0 0.5rem 0;
                color: #1976d2;
            }
            .info p {
                margin: 0;
                color: #666;
                font-size: 0.9rem;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="logo">Laravel</div>
            <div class="subtitle">Served with Nginx Web Server</div>
            
            <div class="features">
                <div class="feature">
                    <h3>🚀 Laravel 10</h3>
                    <p>Modern PHP framework with elegant syntax</p>
                </div>
                <div class="feature">
                    <h3>⚡ Nginx</h3>
                    <p>High-performance web server and reverse proxy</p>
                </div>
                <div class="feature">
                    <h3>🔧 PHP 8.1+</h3>
                    <p>Latest PHP features and performance improvements</p>
                </div>
                <div class="feature">
                    <h3>📦 Composer</h3>
                    <p>Dependency management for PHP</p>
                </div>
            </div>

            <div class="links">
                <a href="/about">About</a>
                <a href="/api/status">API Status</a>
                <a href="/api/health">Health Check</a>
            </div>

            <div class="info">
                <h4>System Information</h4>
                <p>
                    <strong>PHP Version:</strong> {{ PHP_VERSION }}<br>
                    <strong>Laravel Version:</strong> {{ app()->version() }}<br>
                    <strong>Server:</strong> {{ $_SERVER['SERVER_SOFTWARE'] ?? 'Nginx' }}<br>
                    <strong>Environment:</strong> {{ app()->environment() }}
                </p>
            </div>
        </div>
    </body>
</html>
