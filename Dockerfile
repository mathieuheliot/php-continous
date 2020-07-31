FROM php:7.4-fpm AS Build

# Install needed dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git

# Build website
WORKDIR /opt/application
COPY . .
COPY --from=composer:1.10 /usr/bin/composer /usr/bin/composer
RUN composer install

# Bundle generated application
FROM php:7.4-apache

COPY --from=build /opt/application/src /var/www/app
COPY --from=build /opt/application/vendor /var/www/vendor
COPY ./conf/apache.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /var/www

# Enable Apache extensions
RUN a2enmod rewrite
EXPOSE 80