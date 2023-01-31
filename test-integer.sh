#!/bin/bash - 
#===============================================================================
#
#          FILE: test-integer.sh
# 
#         USAGE: ./flow.control.sh 
# 
#   DESCRIPTION: check if input is integer or no
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: Sun Mar 29, 2020 18:30
#      REVISION:  ---
# 
#===============================================================================

set -o nounset                              # Treat unset variables as an error


## check for string equality with '=' or '==' (the former is POSIX compliant)
#if [ "$ANSWER" = "yes" ]; then
#  echo "The answer is YES!" 
#elif [ "$ANSWER" = "no" ]; then
#  echo "The answer is NO!" 
#elif [ "$ANSWER" = "maybe" ]; then
#  echo "The answer is MAYBE!" 
#else
#  echo "You have entered $ANSWER"
#fi
#
## test for integers
#INT=8
#
#if [ -z "$INT" ]; then
#  echo "$INT is empty." >&2
#  exit 1
#fi
#
#if [ "$INT" -eq 0 ]; then
#  echo "$INT" is zero
#else
#  if [ "$INT" -lt 0 ]; then
#	echo "$INT is negative"
#  else
#	echo "$INT is positive"
#  fi
#  # note the arithmetic operation using double parens
#  # and the no space allowed in inner parens
#  if [ $((INT % 2)) -eq 0 ]; then
#	echo "$INT is even"
#  else
#	echo "$INT is odd"
#  fi
#fi
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
##############
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  echo "You entered the number $INT, good job"
  if [ "$INT" -eq 0 ]; then
	echo "$INT" is zero
  else
	if [ "$INT" -lt 0 ]; then
	  echo "$INT is negative"
	else
	  echo "$INT is positive"
	fi
	# note the arithmetic operation using double parens
	# and the no space allowed in inner parens
	if [ $((INT % 2)) -eq 0 ]; then
	  echo "$INT is even"
	else
	  echo "$INT is odd"
	fi
  fi
else
  echo "$INT is not integer" >&2
fi


