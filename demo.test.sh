#!/bin/bash - 
#===============================================================================
#
#          FILE: demo.test.sh
# 
#         USAGE: ./demo.test.sh 
# 
#   DESCRIPTION: evaluate the status of a file
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 03/28/2020 06:09:58 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILE=~/.bashrc

if [ -e "$FILE" ]; then
  if [ -f "$FILE" ]; then
	echo "$FILE is a regular file"
  fi
  if [ -d "$FILE" ]; then
	echo "$FILE is a directory."
  fi
  if [ -r "$FILE" ]; then
	echo "$FILE is readable"
  fi
  if [ -w "$FILE" ]; then
	echo "$FILE is writeable"
  fi
  if [ -x "$FILE" ]; then
	echo "$FILE is executable/searchable"
  fi
else
  echo "$FILE does not exist!"
  exit 1
fi

exit
