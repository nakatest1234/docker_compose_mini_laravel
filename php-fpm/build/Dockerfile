FROM amazonlinux:2
MAINTAINER nakatest1234 <ambient2step@gmail.com>

COPY ./docker-entrypoint.sh /

RUN amazon-linux-extras install -y php7.3=7.3.6 \
  && yum -y -q install php-bcmath php-exif php-gd php-mbstring php-opcache php-xml php-pecl-apcu php-pecl-mcrypt php-pecl-memcached php-pecl-zip unzip \
  && echo 'apc.filters="^phar://"' >> /etc/php.d/40-apcu.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && chmod +x /docker-entrypoint.sh \
  && useradd -m user \
  && yum clean all -q


EXPOSE 9000
#ENTRYPOINT /usr/sbin/php-fpm -F
ENTRYPOINT ["/docker-entrypoint.sh"]
