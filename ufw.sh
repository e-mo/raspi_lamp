#!/bin/bash
source functions.sh

echo
echo "\
1. INSTALL UFW (Uncomplicated Firewall)
    Our web server needs a layer of protection from unwanted traffic!"
press_key

# Install ufw
echo_execute "sudo apt install ufw -y"

echo 
echo "\
    We need our firewall to allow incoming traffic on:
        - HTTP  PORT:(80)
	- HTTPS PORT:(443)
	- SSH   PORT:(22) - We are using SSH to remotely manage the server"
press_key

# Allow http
echo_execute "sudo ufw allow 80"
# Allow https
echo_execute "sudo ufw allow 443"
# Allow ssh (because we are using it to remote config)
echo_execute "sudo ufw allow 22"

echo
echo "\
    We should also set our default rule for all incoming traffic to DENY
    to close unwanted security holes.
    
    We have already specified rules for the ports we need to use, so this 
    shouldn't be a problem."
press_key

# Set default inc to DENY
echo_execute "sudo ufw default deny incoming"

echo
echo "\
    And last we need to enable UFW."
press_key

# Enable UFW
echo_execute "sudo ufw enable"

# Display UFW status to confirm config
echo_execute "sudo ufw status verbose"


echo "\
    We can see that UFW is running and our access rules are set!"
press_key
