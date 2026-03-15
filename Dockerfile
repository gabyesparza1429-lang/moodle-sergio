FROM php:8.1-apache

# Instalamos solo lo mínimo indispensable
RUN apt-get update && apt-get install -y \
    libpng-dev libzip-get libicu-dev mysqli \
    && docker-php-ext-install gd zip intl mysqli

# Bajamos una versión de Moodle que no pese tanto
ADD https://github.com/moodle/moodle/archive/refs/tags/v4.1.0.tar.gz /tmp/moodle.tar.gz
RUN tar -xzf /tmp/moodle.tar.gz -C /var/www/html --strip-components=1

# Permisos mágicos para que no falle
RUN mkdir /var/www/moodledata && chmod -R 777 /var/www/html /var/www/moodledata && chown -R www-data:www-data /var/www/html

EXPOSE 80
