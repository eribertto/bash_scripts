#!/bin/bash - 
#===============================================================================
#
#          FILE: case-menu.sh
# 
#         USAGE: 
# 
#   DESCRIPTION: demo of case compound command
#         NOTES: a menu driven system information program
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Mon Apr 13, 2020 12:01
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

clear
echo "
Please select:
1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
"

read -rp "Enter selection [0-3]: "

# use case command for the logic
# note $REPLY is default variable of read

case "$REPLY" in
	0)	echo "Program terminated"
		exit
		;;
	1)	echo "Hostname: $HOSTNAME"
		echo "Uptime: $(uptime)"
		;;
	2)	"$(df -h)" # useless echo; remove it here
		;;
	3)	if [[ "$(id -u)" -eq 0 ]]; then
			echo "Home Space Utilization (All Users)"
			du -sh /home/*
		else
			echo "Home Space Utilization ($USER)"
			du -sh "$HOME"
	  	fi
		;;
	*)	echo "Invalid entry, aborting!" >&2
		exit 1
		;;
esac
