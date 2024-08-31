#!/bin/bash - 
#===============================================================================
#
#          FILE: file-info.sh
# 
#         USAGE: ./file-info.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/14/2020 13:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# simple file info program using basename
# note the usage of $(basename), which strips the leading portion of script name
PROGNAME="$(basename "$0")"
if [[ -e "$1" ]]; then
	echo -e "\nFile Type:"
	file "$1"
	echo -e "\nFile Status:"
	stat "$1"
else
	echo "$PROGNAME: usage: $PROGNAME file" >&2
	exit 1
fi

