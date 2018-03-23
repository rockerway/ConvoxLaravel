FROM richarvey/nginx-php-fpm:latest

MAINTAINER Tod Shen <tod.shen@104.com.tw>

ARG DB_HOST
ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD
COPY nginx/default.conf /etc/nginx/sites-available/default.conf
COPY laravel /var/www/html/laravel
WORKDIR /var/www/html/laravel
RUN cp /var/www/html/laravel/.env.example /var/www/html/laravel/.env
RUN sed -i "s/DB_HOST=127.0.0.1/DB_HOST=$DB_HOST/g" /var/www/html/laravel/.env
RUN sed -i "s/DB_DATABASE=homestead/DB_DATABASE=$DB_DATABASE/g" /var/www/html/laravel/.env
RUN sed -i "s/DB_USERNAME=homestead/DB_USERNAME=$DB_USERNAME/g" /var/www/html/laravel/.env
RUN sed -i "s/DB_PASSWORD=secret/DB_PASSWORD=$DB_PASSWORD/g" /var/www/html/laravel/.env
RUN composer install
RUN php artisan key:generate
RUN php artisan migrate
