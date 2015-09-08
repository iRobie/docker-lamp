FROM php:5.6-apache

MAINTAINER Robert Crandall "offlinegeek@outlook.com"

RUN a2enmod rewrite vhost_alias

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev imagemagick libxml2-dev libldap2-dev\
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql zip exif soap ldap; \
	rm -rf /tmp/*

VOLUME /usr/local/etc/php
VOLUME /etc/apache2
