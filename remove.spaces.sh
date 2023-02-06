#!/bin/bash - 
# this removes spaces in filenames in the current directory

echo "This script removes spaces in the filenames in the current directory."
#for file in *\ *; do echo mv -v "$file" "${file// /_}"; done

for file in *\ *;
do
	echo mv -v "$file" "${file// /_}"
done
read -rp "Is this OK? [N/y] " answer

if [ "$answer" = y ]; then
	for file in *\ *;
	do
		mv -v "$file" "${file// /_}"
	done
else
	echo "Exiting... bye!"
	exit 1
fi


