#!/bin/bash - 
#===============================================================================
#
#          FILE: cleanup.sh
# 
#         USAGE: ./cleanup.sh 
# 
#   DESCRIPTION: Enhanced script to clean up log files in /var/log dir
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: --- https://tldp.org/LDP/abs/html/sha-bang.html
#        AUTHOR: Eriberto Mendez (), erimendz@gmail.com
#  ORGANIZATION: 2023 Saudi Aramco Hawiyah Unayzah Pipelines Support Infrastructure Div HUPIS
#       CREATED: 03/07/2023 15:10
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

LOG_DIR=/var/log
ROOT_UID=0
LINES=50	# limit lines to 50
E_XCD=86
E_NOTROOT=87

# check that user is root
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "You must be root to run this script."
	exit $E_NOTROOT
fi

# check if argument is provided or not
# unix.stackexchange.com solution to resolve the error $1: unbound variable
# as side effect of set -u

if [ $# -ge 1 ] && [ -n "$1" ]
then
	lines=$1
	# debugging
	echo "lines is $1"
else
	lines=$LINES
	echo "lines is $LINES"
fi

#cd $LOG_DIR
#if [ "$(pwd)" != $LOG_DIR ]
#then
#	echo "Cannot change to $LOG_DIR."
#	exit $E_XCD
#fi

## a more efficient style is
cd $LOG_DIR || {
	echo "Cannot change to $LOG_DIR." >&2	# dump to the bit bucket
	exit $E_XCD
}

# save last section of log file
tail -n "$lines" messages > mesg.temp
mv mesg.temp messages
cat /dev/null > wtmp
echo "Log files cleaned up!"
exit 0
# a zero return value from the script upon exit indicates success
# to the shell
