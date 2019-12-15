#!/bin/bash

red="\e[38;5;196m"
blue="\e[38;5;25m"
grey="\e[38;5;247m"
def="\e[0m"

# Pauses the script to wait for any key input
function press_key {
    echo -e $blue
    read -n 1 -s -p "<press any key>"
    echo -e $def
}

# Echoes command in red and calls grey_ouput
function echo_execute {
    echo
    echo -e "$red\$ $1 $def"
    grey_output "$1"
}

# Executes passed command after setting echo text to grey
function grey_output {
    echo -en $grey
    $1
    echo -en $def
}

