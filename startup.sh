#!/bin/bash

if [ ! -f /etc/php5/php.ini ]; then
    cp -a /tmp/php5/. /etc/php5/
fi

if [ ! -f /etc/apache2/apache2.conf ]; then
    cp -a /tmp/apache2/. /etc/apache2/
fi

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
