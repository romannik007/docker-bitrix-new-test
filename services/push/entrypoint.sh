#!/bin/bash

#блок для установки запускаиз исзходников
#ln -sf /opt/node_modules/push-server/logs /var/log/push-server
#ln -sf /opt/node_modules/push-server/etc/push-server /etc/push-server
#dir1="/opt/node_modules/push-server"
#cp $dir1/etc/init.d/push-server-multi /usr/local/bin/push-server-multi
#cp $dir1/etc/sysconfig/push-server-multi  /etc/sysconfig/push-server-multi
#cp $dir1/etc/push-server/push-server.service  /etc/systemd/system/
#ln -sf /opt/node_modules/push-server /opt/push-server
#mkdir -p /opt/push-server/logs

#useradd bitrix -u $USER_ID -g 1000
#usermod bitrix -G root
echo mkdir -p /var/log/push-server
mkdir -p /var/log/push-server
mkdir -p /var/log/supervisor

chmod -R 777 /var/log
#chmod -R 777 /var/log/supervisor
#chmod -R 777 /var/log/push-server/*
#chmod -R 777 /var/log/supervisor/*


#блок для установки запускаиз исзходников
#/etc/init.d/push-server-multi reset
#/etc/init.d/push-server-multi start sub
#/etc/init.d/push-server-multi start pub

#/etc/init.d/push-server-multi reset
#/etc/init.d/push-server-multi stop
/etc/init.d/push-server-multi update_configs
exec /usr/bin/supervisord # -c /etc/supervisor.d/supervisord.conf

