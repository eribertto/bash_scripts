#!/bin/bash -
#===============================================================================
#
#          FILE: and_list.sh
#
#         USAGE: ./and_list.sh "arg1" "arg2" "argn"
#
#   DESCRIPTION: using the 'and list' construct to test for command line arguments
#   DESCRIPTION: from pdf book advance_shell_scripting_guide.pdf
#
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendez
#  ORGANIZATION:
#       CREATED: March 5/23
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

## shellcheck: use -n instead of ! -z
if [ -n "$1" ] && echo "Argument #1 = $1" && [ -n "$2" ] && echo "Argument #2 = $2"
then
	echo "At least 2 arguments passed to script"
else
	echo "Fewer than 2 arguments passed to script"
fi
