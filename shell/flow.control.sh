#!/bin/bash -
#===============================================================================
#
#          FILE: flow.control.sh
#
#         USAGE: ./flow.control.sh
#
#   DESCRIPTION: evaluate the value of a string using if/elif/else
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 03/28/2020 06:25:39 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

read -rp "What is your answer? [yes/no/maybe] " ANSWER

# check if string is empty using -z
if [ -z "$ANSWER" ]; then
    # redirect to stderr
    echo "There is no answer given!" >&2
    exit 1
#else
#	echo "OK"
fi

# check for string equality with '=' or '==' (the former is POSIX compliant)
# this is equality bcoz there is a space between the equal sign
# if no space the context is variable assignment

if [ "$ANSWER" = "yes" ]; then
    echo "The answer is YES!"
    elif [ "$ANSWER" = "no" ]; then
    echo "The answer is NO!"
    elif [ "$ANSWER" = "maybe" ]; then
    echo "The answer is MAYBE!"
else
    echo "The answer is UNKNOWN"
fi

# test for integers
INT=8
echo "The number is $INT"
if [ -z "$INT" ]; then
    echo "$INT is empty." >&2
    exit 1
fi

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

# modern version of test
read -rp "Press enter any number (integer) : " INT
#echo $INPUT
# take note of this new syntax
# using regex to match the string
##############
#INT=1.2
##############
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
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
    echo "$INT doesnt look like an integer"
fi


