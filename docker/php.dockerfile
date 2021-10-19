FROM php:7.4-fpm-alpine

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache libzip-dev

RUN apk add --no-cache libpng libpng-dev && docker-php-ext-install gd && apk del libpng-dev


RUN apk add --no-cache libpng libpng-dev libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev freetype-dev  \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd  \
    && docker-php-ext-install exif \
    && apk del libpng-dev
