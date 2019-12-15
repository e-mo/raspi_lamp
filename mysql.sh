#!/bin/bash
source functions.sh

echo
echo "\
3. INSTALL MYSQL
    Databases play a central role in the data organization and
    storage of a web server." 
press_key

echo_execute "sudo apt install mariadb-server -y"

echo
echo "\
    Before using MySQL, we should run the mysql_secure_installation
    script to set a root user password and secure some common
    security holes like the default user and test database."
press_key

echo_execute "sudo mysql_secure_installation"

echo
echo "\
    Since we don't have anything to store in our database yet, this 
    is as far as we need to go with MySQL."
press_key
