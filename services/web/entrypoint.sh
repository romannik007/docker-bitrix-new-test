#!/bin/bash

#groupadd bitrix -g 600
#useradd bitrix -u $USER_ID -g 600
#usermod bitrix -G root

rm -f /var/run/*.pid
#mkdir -p /var/run/httpd
mkdir -p /var/log/supervisor 
mkdir -p /var/log/crond
mkdir -p /var/log/httpd
mkdir -p /var/log/nginx
mkdir -p /var/log/php
mkdir -p /home/bitrix/.bx_temp/sitemanager
chmod -R 777 /home/bitrix/.bx_temp/sitemanager
mkdir -p /tmp/session
chmod -R 777 /tmp/session
mkdir -p /var/lib/php/session
chmod -R 777 /var/lib/php/session
mkdir -p /tmp/php_upload
chmod -R 777 /tmp/php_upload
#chown -R nginx:apache /var/www/html/bx-site
#chown -R bitrix /var/www/html/bx-site
#chmod -R 777 /var/log
exec /usr/bin/supervisord #-c /etc/supervisor.d/supervisord.conf
