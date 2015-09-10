FROM php:5.6-apache
MAINTAINER Jesús Urrutia <jesus.urrutia@gmail.com>
# Install Git
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y nodejs npm
# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev \
    && docker-php-ext-install iconv mcrypt gd intl
# Install bower
RUN npm -g install bower
# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
RUN npm -g install pm2
# For Web application
EXPOSE 80
# For terminal
EXPOSE 8080
COPY terminal /var/www/terminal
COPY config/php.ini /usr/local/etc/php/
COPY entrypoint.sh /var/www/
WORKDIR /var/www/
CMD ["bash", "/var/www/entrypoint.sh"]