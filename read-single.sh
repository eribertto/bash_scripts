#!/bin/bash - 
#===============================================================================
#
#          FILE: read-single.sh
# 
#         USAGE: ./read-single.sh 
# 
#   DESCRIPTION: read input and echo using default variable 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/05/2020 06:49:48 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo -n "Enter one or more values at the prompt: "
read	# default variable is $REPLY
echo "You entered '$REPLY'!"

# another variant using read -p
read -p "Again enter anything at the prompt: "
echo "You entered >$REPLY<!"

