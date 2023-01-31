#!/bin/bash - 
#===============================================================================
#
#          FILE: read-secret.sh
# 
#         USAGE: ./read-secret.sh 
# 
#   DESCRIPTION: demo of read with input not shown, time out 10 sec rule
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 04/05/2020 06:49:48 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if read -rt 10 -sp "Enter secret passphrase: > " secret_pass; then
  echo -e "\nSecret passphrase = '$secret_pass'"
else
  echo -e "\nExiting, 10 sec limit exceeded!" >&2
fi
