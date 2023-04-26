FROM php:8.2-bullseye

ENV COMPOSER_AUTH=${COMPOSER_AUTH}

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt update && apt install git openssl zip zlib1g-dev libpng-dev libzip-dev libsodium-dev -y
RUN docker-php-ext-install gd zip sodium

WORKDIR /var/www

ENTRYPOINT ["tail", "-f", "/dev/null"]