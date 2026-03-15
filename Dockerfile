FROM php:8.1-apache

# 1. Instalamos librerías necesarias para Moodle
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libzip-dev libicu-dev libxml2-dev \
    && docker-php-ext-install gd zip intl mysqli opcache xml

# 2. SOLUCIÓN AL ERROR AH00534: Desactivamos mpm_event y activamos mpm_prefork
RUN a2dismod mpm_event && a2enmod mpm_prefork

# 3. Descargamos Moodle
ADD https://github.com/moodle/moodle/archive/refs/heads/MOODLE_403_STABLE.tar.gz /tmp/moodle.tar.gz
RUN tar -xzf /tmp/moodle.tar.gz -C /var/www/html --strip-components=1

# 4. Permisos y carpeta de datos
RUN mkdir /var/www/moodledata \
    && chown -R www-data:www-data /var/www/html /var/www/moodledata \
    && chmod -R 777 /var/www/moodledata

EXPOSE 80
