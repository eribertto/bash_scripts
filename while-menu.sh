#!/bin/bash - 
#===============================================================================
#
#          FILE: while-menu.sh
# 
#         USAGE: 
# 
#   DESCRIPTION: adding while loop to menu driven script
#         NOTES: a menu driven system information program
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
 #       CREATED: Wed Apr 08, 2020 18:46
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

DELAY=3		# number of seconds to display result

while [[ "$REPLY" != 0 ]]; do
  clear
  cat <<- _EOF_

  Please select:
  1. Display System Information
  2. Display Disk Space
  3. Display Home Space Utilization
  0. Quit

_EOF_
read -p "Enter selection [0-3]: "
  # do the logic
  if [[ "$REPLY" =~ ^[0-3]$ ]]; then
	if [[ "$REPLY" == 1 ]]; then
	  echo "Hostname: $HOSTNAME"
	  echo "Uptime: $(uptime)"
	  sleep "$DELAY"
	fi

	if [[ "$REPLY" == 2 ]]; then
	  df -h
	  sleep "$DELAY"
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
	  sleep "$DELAY"
	fi
  else
	echo "Invalid Entry, try again!" >&2
	sleep "$DELAY"
  fi
done
echo "Program terminated!"
