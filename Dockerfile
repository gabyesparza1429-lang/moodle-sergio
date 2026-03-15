FROM php:8.1-apache

# Instalamos lo necesario para Moodle
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libzip-dev libicu-dev libxml2-dev \
    && docker-php-ext-install gd zip intl mysqli opcache xml

# Descargamos Moodle directamente
ADD https://github.com/moodle/moodle/archive/refs/heads/MOODLE_403_STABLE.tar.gz /tmp/moodle.tar.gz
RUN tar -xzf /tmp/moodle.tar.gz -C /var/www/html --strip-components=1 \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
