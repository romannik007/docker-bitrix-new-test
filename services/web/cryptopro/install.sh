#!/bin/bash
    V=${PHP_VERSION:0:1}
    cd /opt/cprocsp/src/phpcades && \ 
    curl -L https://www.cryptopro.ru/sites/default/files/products/cades/php${V}_support.patch.zip -O && \
    echo $V && \
    ls -al && \
    unzip ./php${V}_support.patch.zip && \
    mv php${V}_support.patch php_support.patch && \
    ls -al