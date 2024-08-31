#!/bin/bash - 
#===============================================================================
#
#          FILE: read-default.sh
# 
#         USAGE: ./read-default.sh 
# 
#   DESCRIPTION: demo script to supply default value if user presses Enter key
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/05/2020 07:33:06 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

read -e -p "What is your user name? " -i $USER
echo "Your answer is: '$REPLY'"
