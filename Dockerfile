FROM debian:jessie

MAINTAINER Vikrant Kamble <k.vikrantt@gmail.com>

ENV NGINX_VERSION 1.6.2
ENV PHP_VERSION 5.6

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ca-certificates \
        php5-fpm=${PHP_VERSION}* \
        php5-mysqlnd \
        php5-curl \
        php5-gd \
        php5-intl \
        php-pear \
        php5-imagick \
        php5-imap \
        php5-mcrypt \
        php5-memcache \
        php5-snmp \
        php5-xmlrpc \
        php5-xsl \
        nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /

RUN chmod +x /run.sh



CMD ["/run.sh"]
