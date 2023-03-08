#!/bin/bash -
#===============================================================================
#
#          FILE: delete.sh
#
#         USAGE: ./delete.sh filename
#
#   DESCRIPTION: a not-so-cunning file deletion utility
#
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendez
#  ORGANIZATION:
#       CREATED: March 5/23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_BADARGS=85
#if [ -z "$1" ]
# if [ $# -lt 1 ] || [ -z "$1" ]
# check if argument is provided
if [ $# -lt 1 ]
then
    echo "Usage: $(basename "$0") filename"
    exit $E_BADARGS
else
    file=$1
fi

## this is the short hand AND LIST to give error if file is non-existent
[ ! -f "$file" ] && echo "The filename \"$file\" is not found!"
## OR LIST to delete the file if present
[ ! -f "$file" ] || (rm -f "$file"; echo "File \"$file\" is deleted!")
exit $?

