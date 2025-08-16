#!/bin/sh
set -e

if [ ! -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ]; then
  certbot certonly --webroot -w /var/www/certbot \
    -d $DOMAIN --email $EMAIL --agree-tos --non-interactive
else
  certbot renew --webroot -w /var/www/certbot --quiet
fi
