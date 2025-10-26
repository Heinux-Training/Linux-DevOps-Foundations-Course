<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About - Laravel with Nginx</title>
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
                max-width: 700px;
                margin: 2rem;
            }
            .logo {
                font-size: 2.5rem;
                font-weight: 700;
                color: #667eea;
                margin-bottom: 1rem;
            }
            .content {
                text-align: left;
                line-height: 1.6;
                color: #333;
            }
            .content h2 {
                color: #667eea;
                border-bottom: 2px solid #667eea;
                padding-bottom: 0.5rem;
            }
            .back-link {
                display: inline-block;
                margin-top: 2rem;
                padding: 0.75rem 1.5rem;
                background: #667eea;
                color: white;
                text-decoration: none;
                border-radius: 25px;
                transition: background 0.3s;
            }
            .back-link:hover {
                background: #5a6fd8;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="logo">About This Project</div>
            
            <div class="content">
                <h2>Laravel + Nginx Setup</h2>
                <p>This is a basic Laravel application configured to work with Nginx web server. It demonstrates the integration between Laravel framework and Nginx for serving web applications.</p>
                
                <h2>Technologies Used</h2>
                <ul>
                    <li><strong>Laravel 10:</strong> Modern PHP web application framework</li>
                    <li><strong>Nginx:</strong> High-performance web server and reverse proxy</li>
                    <li><strong>PHP 8.1+:</strong> Server-side scripting language</li>
                    <li><strong>Composer:</strong> PHP dependency manager</li>
                </ul>
                
                <h2>Features</h2>
                <ul>
                    <li>Clean and modern web interface</li>
                    <li>API endpoints for health checks</li>
                    <li>Responsive design</li>
                    <li>Optimized for Nginx serving</li>
                </ul>
                
                <h2>Configuration</h2>
                <p>The application is configured with proper Nginx virtual host settings, including:</p>
                <ul>
                    <li>PHP-FPM integration</li>
                    <li>Static file serving</li>
                    <li>Security headers</li>
                    <li>Gzip compression</li>
                </ul>
            </div>
            
            <a href="/" class="back-link">← Back to Home</a>
        </div>
    </body>
</html>
