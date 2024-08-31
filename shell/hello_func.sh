#!/usr/bin/bash
# another function script
# Tue 24 Mar 2020 07:01:48 PM +03

# always declare first 

function hello {
	echo $1
	return 11
}

# call the function, output assigned exit status
echo "Output from function hello: "
hello Richard
echo "Exit status value from function hello is: $?"

# example 1 global variable
function globhello {
	name=$1
	echo "Hello there ${name}"
}

echo -n "Enter your name: "
read name		# use Richard as input
#call function
globhello Peter
# this var is global
echo "Value of name is ${name}"

# example 1 global variable
function lochello {
	local name=$1
	echo "Hi hello ${name}"
}
echo -n "Enter another name: "
read name
# give argument
lochello Peter
echo "Value of name is ${name}"
