#!/bin/bash -
#===============================================================================
#
#          FILE: plain.variable.sh
#
#         USAGE: ./plain.variable.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 02/03/2023 17:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo
# assignment
num=879	# note no space before/after the number
echo "the value of 'num' is $num"
# using let assignment (red-flagged by shellcheck, use the new syntax  instead)
#let num=16+6
(( num=16+6 ))
echo "the value of 'num' is now $num"

# do the for loop aka a type of disguised assignment
function space {
    echo; echo
}
# call the function
space
echo -n "bash for-loop of num from 7-11-> "
for num in 7 8 9 11
do
    # dont use newline on each loop aka concatenable the numbers
    echo -n "$num"
done
space
echo "after the loop the value of 'num' is $num"
#using read, a type of assignment
# take note of  the proper the order of command switches, else it gives error
echo "Heres a demo of variable substitution, plain and fancy styles"
echo "plain"
aa=23; echo "the value of 'aa' is $aa"
bb=$aa
echo "the value of 'bb' is $bb"
echo "fancy using command substitution"
# note the use of backticks, an old school style of command substitution aka legacy
# in the command line, using exclamation mark (!) within a command substitution will now work
# since this triggers the history mechanism
# but inside a script the history functions are disabled by default
#update: backticks are deprecated as per shellcheck; use the new syntax $(command)
#aa=$(echo Hello)		# echo is useless in this case
aa=Hello
echo "the value of 'aa' is now $aa"
aa=$(ls -l)
#aa=`ls -l`
echo "unquoted value aa:"	# removes tabs and spaces
space
echo $aa
space
echo "quoted value aa:"		# preserves whitespace.
echo "$aa"
space
read -rp "Getting user input. Enter anything: " user_input
echo "You entered $user_input"
exit 0