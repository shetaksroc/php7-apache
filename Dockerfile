FROM php:apache

MAINTAINER Thiago Moreira <loganguns@gmail.com>

COPY ./config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default.conf
RUN a2enmod rewrite

WORKDIR /var/app/web
