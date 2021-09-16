#!/bin/bash
mkdir -p /var/log/push-server

#блок для установки запускаиз исзходников
#ln -sf /opt/node_modules/push-server/logs /var/log/push-server
#ln -sf /opt/node_modules/push-server/etc/push-server /etc/push-server
#dir1="/opt/node_modules/push-server"
#cp $dir1/etc/init.d/push-server-multi /usr/local/bin/push-server-multi
#cp $dir1/etc/sysconfig/push-server-multi  /etc/sysconfig/push-server-multi
#cp $dir1/etc/push-server/push-server.service  /etc/systemd/system/
#ln -sf /opt/node_modules/push-server /opt/push-server
#mkdir -p /opt/push-server/logs


chmod -R 777 /var/log/push-server
chmod -R 777 /var/log/supervisor
chmod -R 777 /var/log/push-server/*
chmod -R 777 /var/log/supervisor/*
useradd bitrix -u 600 -g 600
usermod bitrix -G root

mkdir -p /var/log/supervisor
mkdir -p /var/log/push-server
useradd bitrix -u 600 -g 600
usermod bitrix -G root


#блок для установки запускаиз исзходников
#/etc/init.d/push-server-multi reset
#/etc/init.d/push-server-multi start sub
#/etc/init.d/push-server-multi start pub

exec /usr/bin/supervisord # -c /etc/supervisor.d/supervisord.conf
