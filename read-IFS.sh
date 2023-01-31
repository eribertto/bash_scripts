#!/bin/bash - 
#===============================================================================
#
#          FILE: read-IFS.sh
# 
#         USAGE: ./read-IFS.sh 
# 
#   DESCRIPTION: demo script about IFS internal field separator
#         NOTES: The default value contains space, tab and newline 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/05/2020 09:10:47 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILE=/etc/passwd

read -rp "Enter a username: " user_name
# search for username provided by input in the FILE variable
# note the regex supplied to grep
file_info="$(grep "^$user_name:" $FILE)"
# test if file is zero or no with -n
if [ -n "$file_info" ]; then
  # change default IFS to colon
  # read is given 7 argument variables
  # note the <<< operator or here string (like a here document but shorter)
  IFS=":" read -r user uid gid name home shell <<< "$file_info"
  # -e allows the use of tab characters
  echo -e "User:\t\t'$user'"
  echo -e "UID:\t\t'$uid'"
  echo -e "GID:\t\t'$gid'"
  echo -e "Full Name:\t'$name'"
  echo -e "Home Dir:\t'$home'"
  echo -e "Shell:\t\t'$shell'"
else
  echo "No such user '$user_name'" >&2
  exit 1
fi
