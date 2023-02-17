#!/bin/bash

groupmod --gid $USER_GID www-data  && \
usermod --uid $USER_ID www-data; \
curl -o /var/www/html/bx-site/bitrixsetup.php -L http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php;  \
curl -o /var/www/html/bx-site/restore.php -L https://www.1c-bitrix.ru/download/files/scripts/restore.php;  \
chown www-data:www-data /var/www/html/bx-site/bitrixsetup.php /var/www/html/bx-site/restore.php
exec docker-php-entrypoint apache2-foreground
