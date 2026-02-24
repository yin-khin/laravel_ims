#!/bin/sh
set -e

php artisan config:cache
php artisan route:cache
# php artisan storage:link || true
php artisan storage:link
php artisan config:clear || true
php artisan cache:clear || true



php artisan view:clear

# Run migrations
php artisan migrate --force || true

# Cache again
php artisan config:cache || true
php artisan route:cache || true

exec apache2-foreground
