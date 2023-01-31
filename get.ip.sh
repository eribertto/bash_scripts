#!/usr/bin/bash

# get ip address

myip=`ip a s | awk '/global/ { print $2 }' | sed 's|/20||g'`
echo "Your IP is ${myip}"
