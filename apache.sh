#!/bin/bash
source functions.sh

echo
echo "\
2. INSTALL APACHE HTTP SERVER
    Apache HTTP Server, called Apache, is a free and open-source 
    cross-platform web server software, and is primarily run on Linux."
press_key

# Install Apache2
echo_execute "sudo apt install apache2 -y"
# Display Apache status
echo_execute "sudo service apache2 status" | cat 

echo
echo "\
    Apache is now installed and active!
    By default, Apache is now listening for http traffic on
    port 80 and HTTPS on port 443.
    
    Now, lets install a tool named dig (domain information groper).
    Dig is going to help us find our server's public IP address.
    
    We'll also install w3m, a command line web browser, to help us
    test if Apache installed properly."
press_key

# Install dnsutils and w3m
echo_execute "sudo apt install dnsutils w3m -y"

# Get public IP
echo_execute "dig +short myip.opendns.com @resolver1.opendns.com"
pub_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo
echo "\
    So now we know that our public IP is: $pub_ip
    Apache sets up a default test page at /var/www/html/index.html.
    If we enter out public IP into a browser, we should see the test page."
press_key

# Test default index page using w3m
echo_execute "w3m $pub_ip" | cat

echo "\
    It works! Technically at this point, we have a working web server,
    though it doesn't do a whole lot."
press_key
