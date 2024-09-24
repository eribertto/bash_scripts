#!/usr/bin/env bash

# simple arrays

my_array=("james bond 007" "shawn kemp the reigman" 345 3.1467 "whatever" )
# get all the array elements
echo "The whole array is: ${my_array[*]}"
echo "The first array element is: ${my_array}"
echo "Array no. 2 is: ${my_array[1]}"
echo "Last array is: ${my_array[-1]}"
echo "Second to last array is: ${my_array[-2]}"
#echo "The whole array is: ${my_array[@]}"
# get all the array elements
# get all the array elements

# about substring or slicing in Bash

letters=('A''B''C''D''E')
SCRNAME="$(basename "$0")"
echo "The name of this script is: $SCRNAME"
echo "${letters[@]}"
#echo "the scriptname $(SCRNAME) value is ${letters[@]}"
