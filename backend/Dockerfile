FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite headers

COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

WORKDIR /var/www/html
