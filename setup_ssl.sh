#!/bin/bash

# SSL certificate setup using Let's Encrypt
WP_DOMAIN="lde1.mykhailo.abrdns.com"
WP_PATH="/var/www/html/wordpress"

# Obtain SSL certificate
certbot --nginx -d $WP_DOMAIN --non-interactive --agree-tos --email admin@$WP_DOMAIN

# Create a cron job to renew certificates automatically
# echo "0 12 * * * /usr/bin/certbot renew --quiet" | crontab -
echo "*/15 * * * *  /usr/bin/certbot renew --quiet" | crontab -
# */15 * * * *  /home/ubuntu/nginx-wp-mariadb-cloudns-ssl/setup_ssl.sh > /home/ubuntu/crontab.log
# echo "SSL certificate setup completed"
