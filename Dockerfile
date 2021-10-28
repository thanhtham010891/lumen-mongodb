FROM php:7.4-fpm

RUN apt-get -y update && apt-get -y install libsodium-dev git zip unzip libcurl4-openssl-dev pkg-config libssl-dev

# RUN pecl install -f libsodium
RUN pecl install mongodb &&  echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/docker-php-ext-mongodb.ini

RUN docker-php-ext-install sodium && echo "extension=sodium.so" > /usr/local/etc/php/conf.d/docker-php-ext-sodium.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html/

COPY . .

WORKDIR /var/www/html/src


RUN composer require jenssegers/mongodb

RUN ls