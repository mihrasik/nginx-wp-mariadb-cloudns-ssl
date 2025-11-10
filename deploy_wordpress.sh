#!/bin/bash

# WordPress deployment script
WP_VERSION="6.4.2"
WP_DOMAIN="example.com"
WP_PATH="/var/www/html"
WP_DB_NAME="wordpress"
WP_DB_USER="wpuser"
WP_DB_PASS="securepassword123"

# Create WordPress directory
mkdir -p $WP_PATH
cd $WP_PATH

# Download WordPress
wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz
tar -xzf wordpress-$WP_VERSION.tar.gz
rm wordpress-$WP_VERSION.tar.gz

# Create database
mysql -u root -e "CREATE DATABASE $WP_DB_NAME;"
mysql -u root -e "CREATE USER '$WP_DB_USER'@'localhost' IDENTIFIED BY '$WP_DB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Configure WordPress
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$WP_DB_NAME/" wp-config.php
sed -i "s/username_here/$WP_DB_USER/" wp-config.php
sed -i "s/password_here/$WP_DB_PASS/" wp-config.php

# Set proper permissions
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

echo "WordPress deployed successfully"
