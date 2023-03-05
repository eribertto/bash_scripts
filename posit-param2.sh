#!/bin/bash - 
#===============================================================================
#
#          FILE: posit-param.sh
# 
#         USAGE: ./posit-param.sh 
# 
#   DESCRIPTION: demonstrate the use of $* and $@
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

# create functions
print_params () {
	echo "\$1 = $1"
	echo "\$2 = $2"
	echo "\$3 = $3"
	echo "\$4 = $4"
}

pass_params () {
	echo -e "\n" '$* :'; print_params "$@"
	echo -e "\n" '"$*" :'; print_params "$*"
	echo -e "\n" '$@ :'; print_params "$@"
	echo -e "\n" '"$@" :'; print_params "$@"
}

# call the second function
pass_params "words" "words with spaces"
