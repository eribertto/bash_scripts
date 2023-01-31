#!/bin/bash - 
#===============================================================================
#
#          FILE: while-menu.sh
# 
#   DESCRIPTION: using break in conjunction with while loop
#         NOTES: a menu driven system information program
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Wed Apr 08, 2020 21:00
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

DELAY=3		# number of seconds to display result

# do continuos loop
while true; do
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
	  continue
	fi

	if [[ "$REPLY" == 2 ]]; then
	  df -h
	  sleep "$DELAY"
	  continue
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
	  continue
	fi

	# note the use of break to get out of loop
	if [[ "$REPLY" == 0 ]]; then
	  break
	fi
  else
	echo "Invalid Entry, try again!" >&2
	sleep "$DELAY"
  fi
done
echo "Program terminated!"
