#!/bin/bash
source functions.sh

echo
echo "\
4. INSTALL PHP
    Apache is built to be expanded by 'modules' that provide
    expanded functionality. We are going to install the PHP
    libraries, and the PHP apache module to add PHP support 
    to our webstack."
press_key

echo_execute "sudo apt install php libapache2-mod-php php-mysql -y" 

echo
echo "\
    Now that we have PHP and our PHP apache module installed,
    we need to run a test. I already have a file made named
    index.php which contains a simple 'Hello World' script.
    This is what is looks like:"

echo_execute "cat index.php"

echo
echo "\
    We are going to copy this into /var/www/html/ and remove
    the default index.html."
press_key

echo_execute "sudo cp -v index.php /var/www/html/index.php"
echo_execute "sudo rm -v /var/www/html/index.html"

echo
echo "\
    To enable the PHP module, we need to make sure we have a
    compatible MPM module active. We want to use a prefork
    MPM to utilize the PHP module."
press_key

echo_execute "sudo a2dismod mpm_event"
echo_execute "sudo a2enmod mpm_prefork"
echo_execute "sudo a2enmod php7.3"

echo
echo "\
    Lets reset our Apache2 service to load our module changes."
press_key

echo_execute "sudo systemctl restart apache2"

echo
echo "\
    Now our webserver should properly load index.php."
press_key

# Test php index page using w3m
pub_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo_execute "w3m $pub_ip" | cat

echo
echo "\
    It still works! We made it!
    
    To sum it all up, we are:
    1. Running a webstack on LINUX.
    2. Using an APACHE web server.
    3. Utilizing a MYSQL database.
    4. Using PHP.

    We officially have a LAMP server!"
echo 
