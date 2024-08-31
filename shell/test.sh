#!/bin/bash - 
#===============================================================================
#
#          FILE: test.sh
# 
#         USAGE: ./test.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 01/10/2020 01:50:26 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

print_something () {
    echo "Hello $(whoami) this is a function!"
}

print_something
print_something

