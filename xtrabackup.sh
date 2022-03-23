#!/bin/bash
xtrabackup -H192.168.33.222 -P3306 -u root -p**Admin** --backup --datadir=./volumes/mysql --target-dir=./volumes/tmp/backup
xtrabackup  --prepare --target-dir=./volumes/tmp/backup
#восстанавливаем через волумы подключаяясь ко второй копии БД
xtrabackup -H192.168.33.222 -P3307 -u root -p**Admin** --copy-back --datadir=/media/roman/working/bitrix-node2/volumes/mysql --target-dir=./volumes/tmp/backup

CHANGE MASTER TO MASTER_HOST = '192.168.33.222', MASTER_PORT = 3306, MASTER_USER = 'root', MASTER_PASSWORD = '**Admin**', MASTER_AUTO_POSITION = 1;