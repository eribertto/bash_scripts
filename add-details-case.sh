#!/bin/bash - 
#===============================================================================
#
#          FILE: add-details-case.sh
# 
#         USAGE: ./add-details-case.sh 
# 
#   DESCRIPTION: read data input from user with the use of case construct
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 03/10/2020 05:33:14 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
read -p "Enter your name: " NAME
read -p "Enter your age: " AGE
read -p "Enter your department: " DEP
echo "You have entered the following details: "
# todo: try printf with tab spacing next coding sess
echo "Name:		${NAME}"
echo "Age:		${AGE}"
echo "Department:				${DEP}"

read -p "Is this data correct? [Y/n] " ANSWER
# now for the case construct to check answer
case "${ANSWER}" in
	"Y"|"y"|"" )
		echo "Name:		${NAME}" >> employee.txt
		echo "Age:		${AGE}" >> employee.txt
		echo "Department:		${DEP}" >> employee.txt
		echo "=====================================" >> employee.txt
		echo "Your data is saved in the file employee.txt"
		;;
	"N"|"n" )
		echo "Nothing is saved, run the script again if you like to add data to employee file."
		;;
	* )
		echo "Wrong answer provided"
		;;
esac
# todo: next sess continue and add while loop code, 10min mark in the video.
