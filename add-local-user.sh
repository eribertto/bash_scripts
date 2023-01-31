#!/bin/bash - 
#===============================================================================
#
#          FILE: add-local-user.sh
# 
#         USAGE: ./add-local-user.sh 
# 
#   DESCRIPTION: script to create local user accounts, to be run as root
# todo: add check to run this in libvirt kvm environment.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Eriberto Mendz (), erimendz@gmail.com
#  ORGANIZATION: JIGCC 2020
#       CREATED: 01/15/2020 07:39:10 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# ensure only root executes the script
if [[ "${UID}" -ne 0 ]]
then
	echo "Please run this script with sudo or root."
	exit 1		# exit as code unsuccessful
fi

# create username/login name
read -p "Enter the username to create: " USER_NAME

# Get the full name of the username
read -p "Enter the name of person or application that matches the username: " COMMENT

# Get the password
read -p "Enter the user password: " PASSWORD

# Create the user account
# note comment variable is quoted to catch any space or special character 
# -c is comment, -m is create home directory
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check if the useradd command succeeded
# we dont want to tell the user that an account was created when actually it's not
if [[ "${?}" -ne 0 ]]
then
	echo "Error: the account cannot be created."
	exit 1
fi

# create the password
# check switches used in man page
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# do sanity check, todo: this should be created as function
if [[ "${?}" -ne 0 ]]
then
	echo "Error: the password cannot be created."
	exit 1
fi

# force password change on first login
passwd -e ${USER_NAME}

# display username, password and hostname of the created account
echo
echo "username:"
echo "${USER_NAME}"
echo
echo "password:"
echo "${PASSWORD}"
echo
echo "hostname:"
echo "${HOSTNAME}"
exit 0
