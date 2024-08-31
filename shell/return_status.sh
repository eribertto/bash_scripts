#!/bin/bash - 
#===============================================================================
#
#          FILE: return_status.sh
# 
#         USAGE: ./return_status.sh 
# 
#   DESCRIPTION: assigning return status of function
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/10/2020 11:08:15 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

print_something () {
	echo "Hello there $1"
	return 5
}
print_something Mars
print_something Jupiter Uranus
echo "The previous function returned a value of $?"
