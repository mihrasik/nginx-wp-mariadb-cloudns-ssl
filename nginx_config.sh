#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please use sudo."
   exit 1
fi

# Nginx configuration for WordPress
WP_DOMAIN="lde1.mykhailo.abrdns.com"
WP_PATH="/var/www/html/wordpress"

# Create Nginx virtual host configuration
cat > /etc/nginx/sites-available/$WP_DOMAIN << EOF
server {
    listen 80;
    server_name $WP_DOMAIN www.$WP_DOMAIN;
    root $WP_PATH;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

# Enable the site
ln -s /etc/nginx/sites-available/$WP_DOMAIN /etc/nginx/sites-enabled/
nginx -t
systemctl reload nginx

echo "Nginx configuration completed"
