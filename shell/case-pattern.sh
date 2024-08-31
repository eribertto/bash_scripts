#!/bin/bash - 
#===============================================================================
#
#          FILE: case-pattern.sh
# 
#         USAGE: ./case-pattern.sh 
# 
#   DESCRIPTION: demo of various case patterns
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz
#  ORGANIZATION: 
#       CREATED: 04/13/2020 13:11
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

read -p "Enter anything at the prompt: "
case "$REPLY" in
	[[:alpha:]])	echo "'$REPLY' is a single alphabetic character.";;
	[ABC][0-9])	echo "'$REPLY' is A,B or C followed by a digit.";;
	???)		echo "'$REPLY' is 3 characters long.";;
	*.txt)		echo "'$REPLY' is a word ending in '.txt'.";;
	*)		echo "'$REPLY' is something else.";;
esac
