#!/bin/bash

# Main initialization script that runs all setup steps
echo "Starting nginx-wp-mariadb-cloudns-ssl project setup..."

# Make scripts executable
chmod +x install_packages.sh
chmod +x deploy_wordpress.sh
chmod +x setup_ssl.sh
chmod +x setup_dns.sh
chmod +x nginx_config.sh

# Run installation
./install_packages.sh

# Deploy WordPress
./deploy_wordpress.sh

# Configure Nginx
./nginx_config.sh

# Setup SSL
./setup_ssl.sh

# Configure DNS
./setup_dns.sh

echo "Project setup completed successfully!"
