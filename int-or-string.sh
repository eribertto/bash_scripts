#!/bin/bash -
#===============================================================================
#
#          FILE: int-or-string.sh
#
#
#   DESCRIPTION: demo of integer or string in bash
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendez
#  ORGANIZATION:
#       CREATED: 02/03/2023 19:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
a=2334
echo "a before: $a"
(( a += 1))			# bash expression e.g. increment by 1
echo "a after: $a"
echo
b=${a/23/BB}		# this is substitution e.g. substitue 23 in a with BB, how crazy is that!
echo "b = $b"
declare -i b 			# declare b as integer, doesnt work
echo "b = $b"
#(( b += 1 ))
#echo "b = $b"
echo
c=BB34
echo "c = $c"
d=${c/BB/33}		# now d is an integer
echo "d = $d"
(( d += 1 ))				# ok arithmetic
echo "d = $d"
echo
# what about null values?
e=''		# or e="" ... e=
echo "e = $e"
(( e += 1 ))		# can you do arithmetic with null?
echo "e = $e"	# yup e is now 1 lol :-)
echo
# how about undeclared variables
# update: this whole f block is not executed
# gives error f: unbound variable
echo "f = $f"		# f is referenced but not assigned, is null
(( f += 1 ))
echo "f = $f"

# conclusion: variables in bash are untyped, with all attendant consequences
exit $?