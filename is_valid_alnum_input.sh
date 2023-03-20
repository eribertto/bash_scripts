#!/bin/bash -
#===============================================================================
#
#          FILE: is_valid_alnum_input.sh
#         USAGE: ./is_valid_alnum_input.sh
#   DESCRIPTION: check if user inputted valid alphabetic numeric characters e.g. using the regex [:alnum:]
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: For the pdf book Wicked Cool Scripts example no. 2
#        AUTHOR: Eriberto Mendez (EMJ), erimendz@gmail_com
#  ORGANIZATION: 2023  SARAMCO Hawiyah Unayzah Pipeline Infrastructure Support group
#       CREATED: 03/20/2023 19:58
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# create a function input checker
validAlphaNum()
{
	# validate user input $1, remove all unacceptable characters
	# note sed -e means perforn the script expression using regex shorthand for alphanumeric characters
	validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"
	if [ "$validchars" = "$1" ]; then	# note this is equality expression in bash, not assignment
		return 0 # success; input is clean
	else
		return 1 # dirty input, you dirty lol :-)
	fi
}

# ask user input
read -rp "Enter your input: " input
# input validation
if ! validAlphaNum "$input"; then
	echo "Please enter only letters and numbers." >&2
	exit 1
else
	echo "Input is valid!"
fi
exit 0

