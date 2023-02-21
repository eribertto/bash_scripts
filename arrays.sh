#!/usr/bin/env bash

# simple arrays

my_array=("james bond 007" "shawn kemp the reigman" 345 3.1467 "whatever" )
echo "${my_array[1]}"
echo "${my_array[-1]}"
echo "${my_array[-2]}"
# get all the array elements
echo "${my_array[@]}"

# about substring or slicing in Bash

letters=('A''B''C''D''E')
SCRNAME="$(basename "$0")"
echo "$SCRNAME"
echo "${letters[@]}"
#echo "the scriptname $(SCRNAME) value is ${letters[@]}"