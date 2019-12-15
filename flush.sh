#!/bin/bash

sudo rm -v /var/www/html/*

sudo apt purge ufw -y

sudo apt purge apache2 -y
sudo apt purge dnsutils w3m -y

sudo apt purge mariadb-server -y

sudo apt purge php libapache2-mod-php php-mysql -y
