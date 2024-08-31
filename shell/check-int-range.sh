#!/bin/bash - 
#===============================================================================
#
#          FILE: check-int-range.sh
# 
#         USAGE: 
# 
#   DESCRIPTION: Check for integer range
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Sun Mar 29, 2020 21:50
#      REVISION:  ---
# 
#===============================================================================

set -o nounset                              # Treat unset variables as an error

MIN_VAL=1
MAX_VAL=100

read -rp "Enter any number and i will guess it's range from 1 to 100: " INT
# check if string is empty using -z
if [ -z "$INT" ]; then
  # redirect to stderr
  echo "NO input is given, exiting!" >&2
  exit 1
fi

##############
# modern version of test
# take note of this new syntax
# using regex to match the string
##############
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  #echo "You entered the number $INT, good job"
  if [[ "$INT" -ge "$MIN_VAL" && "$INT" -le "$MAX_VAL" ]]; then
	echo "$INT is within $MIN_VAL to $MAX_VAL."
  else
	echo "$INT is out of range"
  fi
else
  echo "Sorry $INT is not integer" >&2
fi


