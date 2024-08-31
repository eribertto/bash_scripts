#!/usr/bin/bash
#===============================================================================
#
#          FILE: return_hack.sh
# 
#         USAGE: ./return_hack.sh + arg-file
# 
#   DESCRIPTION: setting a return value to a function. Note: you need to supply an argument file for this script to read into
# 
#       OPTIONS: ---
#  REQUIREMENTS: one file argument
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/10/2020 11:20:10 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# define the function
lines_in_file () {
	cat $1 | wc -l
}
num_lines=$(lines_in_file $1)
echo "The file $1 has $num_lines lines inside it."
