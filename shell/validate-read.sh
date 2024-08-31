#!/bin/bash -
#===============================================================================
#
#          FILE: validate-read.sh
#
#         USAGE: ./validate-read.sh
#
#   DESCRIPTION: demo script of validating user input
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/07/2020 06:16:30 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# common function
invalid_input () {
  # echo "Invalid input '$REPLY'" >&2
  echo "Invalid input " >&2
  exit 1
}

read -rp "Enter any input you like at the prompt: "
#default variable to catch input is $REPLY

# input is empty (invalid)
# [[ -z "$REPLY" ]] && invalid_input
# [[ -z "$REPLY" ]] && echo "Empty input" && invalid_input
[[ -z "$REPLY" ]] && invalid_input

# input is multiple (arg) items (invalid)
# see man wc
#(( "$(echo "$REPLY" | wc -w)" > 1 )) && invalid_input
(( "$(echo "$REPLY" | wc -w)" > 1 )) && echo "Too many args" && invalid_input

# todo: complete the below.
# is input a valid filename?
if [[ "$REPLY" =~ ^[-[:alnum:]\._]+$ ]]; then
  echo "'$REPLY' is a valid filename."
  if [[ -e "$REPLY" ]]; then
	echo "And file '$REPLY' exists!"
  else
	echo "Uuppps, file '$REPLY' does not exist!"
  fi

  # is input a floating number?
  if [[ "$REPLY" =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
	echo "'$REPLY' is a floating point number!"
  else
	echo "'$REPLY' is not floating point number!"
  fi

  # is input an integer?
  if [[ "$REPLY" =~ ^-?[[:digit:]]+$ ]]; then
	echo "'$REPLY' is an integer!"
  else
	echo "'$REPLY' is not an integer!"
  fi
  # is input alphabetic chars?
  if [[ "$REPLY" =~ ^-?[[:alpha:]]+$ ]]; then
	echo "'$REPLY' is alphabetic!"
  else
	echo "'$REPLY' is not alphabetic!"
  fi

else
  echo "The input '$REPLY' is not a valid filename!"
fi
