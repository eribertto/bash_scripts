#!/bin/bash - 
#===============================================================================
#
#          FILE: posit-shift.sh
# 
#         USAGE: ./posit-shift.sh 
# 
#   DESCRIPTION: using shift operator
# 		
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/14/2020 12:08
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

count=1
echo "Number of parameter: $#"
while [[ $# -gt 0 ]]; do
	echo "Argument $count = $1"
	count=$((count + 1))
	shift
	echo "Number of parameter: $#"
done
