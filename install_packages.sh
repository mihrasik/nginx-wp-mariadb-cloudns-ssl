#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please use sudo."
   exit 1
fi

# Install required packages for nginx, php, mariadb, and certbot
apt-get update
apt-get install -y nginx php8.3 php8.3-fpm php8.3-mysql php8.3-curl php8.3-gd php8.3-mbstring php8.3-xml php8.3-zip mariadb-server mariadb-client certbot python3-certbot-nginx dnsutils

# Enable and start services
echo "Enabling nginx service..."
if ! systemctl enable nginx 2>/dev/null; then
    echo "Warning: Could not enable nginx service. Please run with sudo privileges."
fi

echo "Enabling mariadb service..."
if ! systemctl enable mariadb 2>/dev/null; then
    echo "Warning: Could not enable mariadb service. Please run with sudo privileges."
fi

echo "Starting nginx service..."
if ! systemctl start nginx 2>/dev/null; then
    echo "Warning: Could not start nginx service. Please run with sudo privileges."
fi

echo "Starting mariadb service..."
if ! systemctl start mariadb 2>/dev/null; then
    echo "Warning: Could not start mariadb service. Please run with sudo privileges."
fi

echo "Packages installed successfully"
