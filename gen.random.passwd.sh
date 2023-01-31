#!/usr/bin/bash
#===============================================================================
#
#          FILE: gen_random_password.sh
#
#         USAGE: ./gen_random_password.sh
#
#   DESCRIPTION: generate random password
#         NOTES: learn concepts of command parameters, arguments, random number generation
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: TODO: Edit this in dot vim folder YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 01/29/2020 13:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "You executed this script: ${0}"

#display path and filename of script
echo -e "DIRNAME: $(dirname "${0}")\nBASENAME: $(basename "${0}")"
