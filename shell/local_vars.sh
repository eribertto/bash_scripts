#!/bin/bash - 
#===============================================================================
#
#          FILE: local_vars.sh
# 
#         USAGE: ./local_vars.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/13/2020 05:43:53 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
var_change () {
	local var1='local 1'
	echo "Inside function: var1 is $var1, var2 is $var2"	# always use quoting
	var1='changed again'
	var2='2 changed again'
}

var1='global 1'
var2='global 2'

echo "Before function call: var1 is $var1, var2 is $var2"
#call the function
var_change
echo "After function call: var1 is $var1, var2 is $var2"


