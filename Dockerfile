FROM php:apache

MAINTAINER Thiago Moreira <loganguns@gmail.com>

COPY ./config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default.conf && a2enmod rewrite

RUN pecl install mongodb

RUN echo "extension=mongodb.so" > /etc/php/7.0/fpm/conf.d/20-mongodb.ini && \
	echo "extension=mongodb.so" > /etc/php/7.0/cli/conf.d/20-mongodb.ini && \
	echo "extension=mongodb.so" > /etc/php/7.0/mods-available/mongodb.ini

WORKDIR /var/app/web
