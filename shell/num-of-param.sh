#!/bin/bash - 
#===============================================================================
#
#          FILE: num-of-param.sh
# 
#         USAGE: ./num-of-param.sh
# 
#   DESCRIPTION: echo the number of arguments provided and their values
# 		
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/14/2020 11:48
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
# all about positional parameters

echo "
\$0 = $0
\$1 = $1
\$2 = $2
\$3 = $3
\$4 = $4
\$5 = $5
\$6 = $6
\$7 = $7
\$8 = $8
\$9 = $9
scriptname: $(basename "$0")
Number of arguments provided: $#
"
