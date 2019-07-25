#!/bin/sh

usermod -u ${HOST_USER} -o user
groupmod -g ${HOST_GROUP} user

if [ ! -e ~user/.composer ]; then
	mkdir -p ~user/.composer
	chown user. ~user/.composer
fi

/usr/sbin/php-fpm -F
