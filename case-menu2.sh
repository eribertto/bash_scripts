#!/bin/bash - 
#===============================================================================
#
#          FILE: case-menu2.sh
# 
#         USAGE: 
# 
#   DESCRIPTION: case modified version
#         NOTES: a menu driven system information program
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Mon Apr 13, 2020 17:11
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

clear
echo "
Please select your choice:
A. Display System Information
B. Display Disk Space
C. Display Home Space Utilization
Q. Quit
"

read -p "Enter a letter to proceed [A,B,C,Q]: "

# use case command for the logic
# using the OR operator |

case "$REPLY" in
	Q|q)	echo "Program terminated"
		exit
		;;
	A|a)	echo "Hostname: $HOSTNAME"
		echo "Uptime: $(uptime)"
		;;
	B|b)	echo "$(df -h)"
		;;
	C|c)	if [[ "$(id -u)" -eq 0 ]]; then
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
