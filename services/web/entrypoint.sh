#!/bin/bash

groupmod --gid $USER_GID www-data  && \
usermod --uid $USER_ID www-data; \
exec docker-php-entrypoint apache2-foreground
