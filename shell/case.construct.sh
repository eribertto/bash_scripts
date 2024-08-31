#!/bin/bash - 
#===============================================================================
#
#          FILE: case.construct.sh
# 
#         USAGE: ./case.construct.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 03/10/2020 05:11:15 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo "This demo is about case construct in bash"
case "$(whoami)" in
	"root")
		echo "You are root!"
		;;
	"eribertt")
		echo "You are normal user"
		;;
	*)
		echo "I dont know you"
		;;
esac

