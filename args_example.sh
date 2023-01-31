#!/bin/bash - 
#===============================================================================
#
#          FILE: args_example.sh
# 
#         USAGE: ./args_example.sh 
# 
#   DESCRIPTION: passing argument to function
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
}
print_something Mars
print_something Jupiter Uranus
