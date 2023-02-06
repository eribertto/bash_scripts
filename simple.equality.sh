#!/bin/bash - 
# this is a script using branching and the equality operator =
# in combo with braces for conditional statement and the &&, || operators
#
set -o nounset                              # Treat unset variables as an error

read -rp "Enter the magic number [1]: " answer

#echo "normal branching style"; sleep 2
# conventional style  
#if [ $answer = 1 ]; then
#	echo "You guessed the magic number $answer."
#	exit 0
#else
#	echo "Nope your guess is wrong: $answer."
#	exit 120
#fi

# concise style
[ "$answer" = 1 ] \
	&& { echo "You guessed the magic number, excellent!" ; exit 0; } \
	|| { echo "Uh-oh, nope, run away lol!" ; exit 120; }

