# Laravel Application with Nginx

A basic Laravel application configured to be served by Nginx web server.

## Prerequisites

### Required Software Versions

- **PHP**: 8.1 or higher
- **Composer**: 2.0 or higher
- **Nginx**: 1.18 or higher
- **PHP-FPM**: 8.1 or higher

### PHP Extensions Required

Make sure the following PHP extensions are installed:

```bash
# Required extensions
php-mbstring
php-xml
php-curl
php-zip
php-bcmath
php-json
php-tokenizer
php-fileinfo
php-openssl
php-pdo
php-mysql (if using MySQL)
```

## Installation

### 1. Install Dependencies

```bash
# Install Composer dependencies
composer install
```

### 2. Environment Configuration

```bash
# Copy environment file
cp env.example .env

# Generate application key
php artisan key:generate
```

### 3. Configure Nginx

Copy the provided `nginx.conf` to your Nginx sites configuration:

```bash
# For Ubuntu/Debian
sudo cp nginx.conf /etc/nginx/sites-available/laravel-app
sudo ln -s /etc/nginx/sites-available/laravel-app /etc/nginx/sites-enabled/

# Test Nginx configuration
sudo nginx -t

# Reload Nginx
sudo systemctl reload nginx
```

### 4. Set Permissions

```bash
# Set proper permissions for Laravel
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
sudo chmod -R 775 /var/www/html/storage
sudo chmod -R 775 /var/www/html/bootstrap/cache
```

## Project Structure

```
Module1_Nginx/
├── app/
│   ├── Http/Controllers/    # Application controllers
│   └── Providers/          # Service providers
├── bootstrap/              # Application bootstrap files
├── config/                 # Configuration files
├── public/                 # Web server document root
│   └── index.php          # Application entry point
├── resources/
│   └── views/             # Blade templates
├── routes/                # Route definitions
│   ├── web.php           # Web routes
│   ├── api.php           # API routes
│   └── console.php       # Console routes
├── composer.json         # Composer dependencies
├── artisan              # Laravel command-line interface
├── nginx.conf           # Nginx configuration
└── README.md            # This file
```

## Available Routes

- **Home**: `/` - Welcome page
- **About**: `/about` - About page
- **API Status**: `/api/status` - Application status
- **Health Check**: `/api/health` - Health check endpoint

## Configuration

### Nginx Configuration Features

The provided `nginx.conf` includes:

- **PHP-FPM Integration**: Proper FastCGI configuration
- **Security Headers**: XSS protection, content type options, etc.
- **Gzip Compression**: Enabled for better performance
- **Static File Caching**: 1-year cache for static assets
- **Laravel Optimizations**: Proper handling of Laravel routes
- **Health Check**: `/health` endpoint for monitoring

### Key Nginx Settings

- **Document Root**: `/var/www/html/public`
- **PHP-FPM Socket**: `/var/run/php/php8.1-fpm.sock`
- **Server Name**: `localhost` and `laravel-nginx-app.local`
- **Port**: 80

## Development

### Local Development Server

For development, you can use Laravel's built-in server:

```bash
# Start development server
php artisan serve

# Server will be available at http://localhost:8000
```

### Production Deployment

For production deployment:

1. **Set Environment**: Change `APP_ENV=production` in `.env`
2. **Disable Debug**: Set `APP_DEBUG=false` in `.env`
3. **Optimize Application**:
   ```bash
   php artisan config:cache
   php artisan route:cache
   php artisan view:cache
   ```
4. **Configure Nginx**: Use the provided `nginx.conf`
5. **Set Proper Permissions**: Ensure web server has correct permissions

## Troubleshooting

### Common Issues

1. **Permission Denied**:
   ```bash
   sudo chown -R www-data:www-data /var/www/html
   sudo chmod -R 755 /var/www/html
   ```

2. **PHP-FPM Not Working**:
   ```bash
   # Check PHP-FPM status
   sudo systemctl status php8.1-fpm
   
   # Restart PHP-FPM
   sudo systemctl restart php8.1-fpm
   ```

3. **Nginx Configuration Error**:
   ```bash
   # Test configuration
   sudo nginx -t
   
   # Check error logs
   sudo tail -f /var/log/nginx/error.log
   ```

4. **Laravel Application Key Missing**:
   ```bash
   php artisan key:generate
   ```

### Log Files

- **Nginx Access Log**: `/var/log/nginx/access.log`
- **Nginx Error Log**: `/var/log/nginx/error.log`
- **Laravel Log**: `storage/logs/laravel.log`
- **PHP-FPM Log**: `/var/log/php8.1-fpm.log`

## Security Considerations

The Nginx configuration includes several security features:

- **Security Headers**: XSS protection, content type options, etc.
- **Hidden File Protection**: Denies access to `.env` and `.git` files
- **PHP-FPM Security**: Hides X-Powered-By header
- **File Permissions**: Proper ownership and permissions

For production, consider:

- **SSL/TLS Certificates**: Enable HTTPS
- **Rate Limiting**: Implement request rate limiting
- **Firewall**: Configure proper firewall rules
- **Regular Updates**: Keep PHP, Nginx, and Laravel updated

## Version Information

- **Laravel**: 10.x
- **PHP**: 8.1+
- **Composer**: 2.0+
- **Nginx**: 1.18+

## Support

For issues related to:

- **Laravel**: Check [Laravel Documentation](https://laravel.com/docs)
- **Nginx**: Check [Nginx Documentation](https://nginx.org/en/docs/)
- **PHP**: Check [PHP Documentation](https://www.php.net/docs.php)
