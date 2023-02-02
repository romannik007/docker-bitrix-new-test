#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./ssl/nginx.key -out ./ssl/nginx.crt -config localhost.conf
openssl dhparam -out ./ssl/dhparam.pem 2048
