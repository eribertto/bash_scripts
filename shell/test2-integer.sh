#!/bin/bash - 
#===============================================================================
#
#          FILE: test2-integer.sh
# 
#         USAGE: ./test2-integer
# 
#   DESCRIPTION: use arithmetic compound operator (())
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Sun Mar 29, 2020 19:14
#      REVISION:  ---
# 
#===============================================================================

set -o nounset                              # Treat unset variables as an error


read -p "Enter any number and i will guess it: " INT
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
# and the double parens for test
##############
# this is a bug, program crash if input begins with 0
#if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
##############
if [[ "$INT" =~ ^-?[1-9]+$ ]]; then
  echo "You entered $INT, good job"
  if ((INT == 0)); then
	echo "$INT" is zero
  else
	if ((INT < 0)); then
	  echo "$INT is negative"
	else
	  echo "$INT is positive"
	fi
	# begin new block
	# check for odd/even
	if ((INT % 2 == 0)); then
	  echo "$INT is even"
	else
	  echo "$INT is odd"
	fi  
	# end new block
  fi
else
  echo "$INT is not integer" >&2
  exit 1
fi


