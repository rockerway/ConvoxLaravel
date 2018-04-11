FROM richarvey/nginx-php-fpm:latest

MAINTAINER Tod Shen <tod.shen@104.com.tw>

COPY nginx/default.conf /etc/nginx/sites-available/default.conf
COPY laravel /var/www/html/laravel
WORKDIR /var/www/html/laravel
RUN cp /var/www/html/laravel/.env.example /var/www/html/laravel/.env
RUN sed -i 's/APP_URL=http:\/\/localhost/APP_URL=http:\/\/convoxapp-web-ekhk5py-2082748875.ap-northeast-1.elb.amazonaws.com/g' /var/www/html/laravel/.env
RUN composer install
RUN php artisan key:generate
RUN composer require tcg/voyager
