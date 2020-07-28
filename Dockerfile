#
# @see https://blog.silarhi.fr/image-docker-php-apache-parfaite/
#
FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl

RUN pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini
    
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Build website
WORKDIR /opt/application
COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

# Bundle generated application
RUN mkdir /var/www/app
RUN cp -R /opt/application/src/* /var/www/app
RUN cp -R /opt/application/vendor /var/www
COPY ./conf/apache.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache extensions
RUN a2enmod rewrite

EXPOSE 80