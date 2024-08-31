#!/bin/bash - 
#===============================================================================
#
#          FILE: menu-read.sh
# 
#         USAGE: ./menu-read.sh 
# 
#   DESCRIPTION: sample menu driven script
#         NOTES: a menu driven system information program
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/08/2020 05:06:55 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

clear
echo "
Please select:
1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
"
read -p "Enter selection [0-3]: "

# do the logic
if [[ "$REPLY" =~ ^[0-3]$ ]]; then
  if [[ "$REPLY" == 0 ]]; then
	echo "Program terminated."
	exit
  fi
  if [[ "$REPLY" == 1 ]]; then
	echo "Hostname: $HOSTNAME"
	echo "Uptime: $(uptime)"
	exit
  fi
  if [[ "$REPLY" == 2 ]]; then
	df -h
	exit
  fi
  if [[ "$REPLY" == 3 ]]; then
	# check if user is root or no
	if [[ "$(id -u)" -eq 0 ]]; then
	  echo "Home Space Utilization (All Users)"
	  du -sh /home/*
	else
	  echo "Home Space Utilization ($USER)"
	  du -sh "$HOME"
	fi
	exit
  fi
else
  echo "Invalid Entry!" >&2
  exit 1
fi
