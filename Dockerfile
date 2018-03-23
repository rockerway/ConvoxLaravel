FROM richarvey/nginx-php-fpm:latest

MAINTAINER Tod Shen <tod.shen@104.com.tw>

COPY nginx/default.conf /etc/nginx/sites-available/default.conf
COPY laravel /var/www/html/laravel
WORKDIR /var/www/html/laravel
RUN cp /var/www/html/laravel/.env.example /var/www/html/laravel/.env
RUN composer install
RUN php artisan key:generate
