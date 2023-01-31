#!/bin/bash - 
#===============================================================================
#
#          FILE: override.sh
# 
#         USAGE: ./override.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/13/2020 05:57:03 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
# create a wrapper around the ls command
ls () {
	command ls -lth
	echo
	command ls -1t
}
# call it
ls

