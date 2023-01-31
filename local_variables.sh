#!/bin/bash - 
#===============================================================================
#
#          FILE: local_variables.sh
# 
#         USAGE: ./local_variables.sh 
# 
#   DESCRIPTION: all about local/global variable scoping
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/10/2020 11:43:49 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

var_change () {
	local var1='local 1'
	local var2='local 2'
	echo "Inside function: var1 is $var1 : var 2 is $var2"
	var1='changed again'
	var2='2 changed again'
}

# these are global since outside of function
var1='global 1'
var2='global 2'

echo "Before function call: var1 is $var1 : var2 is $var2"
var_change
echo "After function call: var1 is $var1 : var2 is $var2"
