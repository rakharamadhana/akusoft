# Akaunting / Akusoft

[![Framework](https://img.shields.io/badge/Laravel-5.4-orange.svg)](https://laravel.com)
[![PHP Version](https://img.shields.io/badge/PHP-%3E%3D5.6.4%20%7C%207.x-blue.svg)](https://php.net)
[![License](https://img.shields.io/badge/License-GPL--3.0-green.svg)](LICENSE.txt)

> [!WARNING]
> **DEPRECATED & UNMAINTAINED**
> 
> This version of **Akusoft** is no longer maintained.
> It has been replaced by **[akusoft V3](https://github.com/rakharamadhana/akusoftV3)**. Please refer to [https://github.com/rakharamadhana/akusoftV3](https://github.com/rakharamadhana/akusoftV3) for the active codebase, ongoing development, and updates.

**Akaunting** is an open-source online accounting software designed for small businesses and freelancers. Built on the Laravel PHP framework, it provides invoicing, expense tracking, client management, and financial reporting out of the box.

---

## Table of Contents

- [Project Architecture & Tech Stack](#project-architecture--tech-stack)
- [Directory Overview](#directory-overview)
- [Environment Configuration (.env)](#environment-configuration-env)
- [Development Setup](#development-setup)
  - [Option 1: Using Docker (Recommended)](#option-1-using-docker-recommended)
  - [Option 2: Using Local PHP & Artisan](#option-2-using-local-php--artisan)
- [Production Deployment Guide](#production-deployment-guide)
  - [1. Server Requirements](#1-server-requirements)
  - [2. Environment Security](#2-environment-security)
  - [3. Web Server Setup (Apache / Nginx)](#3-web-server-setup-apache--nginx)
  - [4. File & Folder Permissions](#4-file--folder-permissions)
  - [5. Production Optimization Commands](#5-production-optimization-commands)
- [Testing & Quality Assurance](#testing--quality-assurance)

---

## Project Architecture & Tech Stack

- **Backend Framework**: PHP (Laravel 5.4)
- **Frontend Architecture**: Blade Templating + AdminLTE 2.3 Theme
- **Database**: MySQL / MariaDB (or SQLite for testing)
- **Modular Plugin System**: Powered by `nwidart/laravel-modules`
- **Asset / Package Management**: Composer (PHP) & Yarn/NPM (JS/CSS)
- **Containerization**: Docker & Docker Compose (Apache + PHP + MySQL)

---

## Directory Overview

```text
akusoft/
├── app/                  # Application core code (Controllers, Models, Middleware, Observers)
├── bootstrap/            # Framework startup & autoload configuration
├── config/               # Configuration files (app, database, mail, queue, services)
├── database/             # Database migrations, seeders, and factories
├── modules/              # Custom modular plugins & extensions
├── public/               # Web root (contains index.php, assets, uploaded files)
├── resources/            # Blade template views, language packs (i18n), raw assets
├── routes/               # Route definitions (web.php, api.php, console.php)
├── storage/              # Application logs, sessions, file uploads, compiled views
├── tests/                # Automated PHPUnit tests
├── .env.example          # Environment variables template
├── docker-compose.yml    # Docker services definition (Web & MySQL)
├── Dockerfile            # Custom PHP-Apache container definition
└── composer.json         # PHP dependency manifest
```

---

## Environment Configuration (.env)

The application relies on `.env` for system configuration. Create `.env` by copying [.env.example](file:///c:/Users/User/akusoft/.env.example):

```bash
cp .env.example .env
```

### Key Environment Variables Explained

| Category | Variable | Description | Default / Example |
| :--- | :--- | :--- | :--- |
| **App** | `APP_NAME` | Display name of the application | `Akaunting` |
| | `APP_ENV` | Environment type (`local`, `staging`, `production`) | `local` |
| | `APP_DEBUG` | Display detailed error stack traces (`true` for Dev, `false` for Prod) | `true` |
| | `APP_URL` | Canonical URL of the application | `http://localhost` |
| | `APP_KEY` | 32-character AES encryption key | Generated via `php artisan key:generate` |
| **Database** | `DB_CONNECTION` | Database driver (`mysql`, `sqlite`, `pgsql`) | `mysql` |
| | `DB_HOST` | Database host hostname or IP | `127.0.0.1` (or `mysql` in Docker) |
| | `DB_PORT` | Database server port | `3306` |
| | `DB_DATABASE` | Database name | `akaunting_db` |
| | `DB_USERNAME` | Database user | `akaunting_admin` |
| | `DB_PASSWORD` | Database password | `akaunting_password` |
| **Cache/Session**| `CACHE_DRIVER` | Cache driver (`file`, `redis`, `memcached`) | `file` |
| | `SESSION_DRIVER` | Session storage engine (`file`, `database`, `redis`) | `file` |
| **Mail** | `MAIL_DRIVER` | Email delivery service (`smtp`, `mailgun`, `sendmail`) | `smtp` |

---

## Development Setup

### Option 1: Using Docker (Recommended)

Docker provides an isolated PHP 7/Apache + MySQL 5.7 environment ready for development.

1. **Start the Docker Services**:
   ```bash
   docker-compose up -d --build
   ```
2. **Access the Application**:
   Open your browser to **[http://localhost:8080](http://localhost:8080)**.
3. **Container Credentials** (defined in `docker-compose.yml`):
   - MySQL Host: `mysql` (port `3306` on localhost)
   - DB Name: `akaunting_db`
   - DB User: `akaunting_admin`
   - DB Password: `akaunting_password`
4. **Stop Containers**:
   ```bash
   docker-compose down
   ```

---

### Option 2: Using Local PHP & Artisan

If you have PHP (5.6 - 7.x recommended) and MySQL installed locally:

1. **Install PHP Dependencies**:
   ```bash
   composer install
   ```
2. **Setup Environment File**:
   ```bash
   cp .env.example .env
   ```
3. **Generate Application Key**:
   ```bash
   php artisan key:generate
   ```
4. **Run Database Migrations & Seeds**:
   ```bash
   php artisan migrate --seed
   ```
5. **Launch Development Server**:
   ```bash
   php artisan serve
   ```
   Access the server at **[http://127.0.0.1:8000](http://127.0.0.1:8000)**.

---

## Production Deployment Guide

Follow these steps when deploying Akaunting to a production server (Ubuntu/Debian, VPS, or Cloud Host).

### 1. Server Requirements
- **PHP**: `>= 5.6.4` (7.0 - 7.3 supported for Laravel 5.4)
- **PHP Extensions**: `OpenSSL`, `PDO`, `Mbstring`, `Tokenizer`, `XML`, `GD`, `Zip`, `CURL`
- **Database**: MySQL 5.7+ or MariaDB 10.2+
- **Web Server**: Nginx or Apache with URL rewriting (`mod_rewrite`) enabled

### 2. Environment Security
In your production `.env` file:
- Set `APP_ENV=production`
- Set `APP_DEBUG=false` (**Crucial for security so sensitive data is not exposed on errors**)
- Ensure `APP_KEY` is populated (`php artisan key:generate`)
- Set `APP_URL` to your domain name (e.g. `https://your-accounting-domain.com`)

### 3. Web Server Setup (Apache / Nginx)

> **Important**: The Document Root must point strictly to the `public/` directory, **NOT** the root project folder.

#### Nginx Example Configuration
Use the provided [nginx.example.com.conf](file:///c:/Users/User/akusoft/nginx.example.com.conf) template:
```nginx
server {
    listen 80;
    server_name your-accounting-domain.com;
    root /var/www/akusoft/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

### 4. File & Folder Permissions
Ensure web server user (e.g., `www-data`) has read/write access to `storage` and `bootstrap/cache`:

```bash
sudo chown -R www-data:www-data /var/www/akusoft
sudo chmod -R 775 /var/www/akusoft/storage
sudo chmod -R 775 /var/www/akusoft/bootstrap/cache
```

### 5. Production Optimization Commands
Run the following commands on the server to cache configuration and boost performance:

```bash
# Optimize composer autoloader
composer install --no-dev --optimize-autoloader

# Cache framework configuration and routes
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Clear compiled assets if needed
php artisan clear-compiled
```

---

## Testing & Quality Assurance

Run PHPUnit automated test suite:

```bash
# Run unit & integration tests using .env.testing configuration
vendor/bin/phpunit
```
