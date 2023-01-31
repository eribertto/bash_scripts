#!/usr/bin/bash
# creating functions
# https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php
# unlike python, no args can be put between the parens
# and calling the function is also without parens <gasp!>

print_something () {
    echo "Hello $(whoami) welcome to $SHELL"
    #echo "Today is $(date '+%a %F')"
    echo "Today is $(date '+%c')"
    echo "This is a function!"
}

# call the function
print_something

# another function demo this time without the parens
# Fri Mar 27, 2020 21:34
echo
echo "This is another function"
function step2 {
  echo "Step 2 called from function step2"
  return
}

# Main program
echo "Step 1"
step2
echo "Step 3"
echo
echo "This is local function demo"
foo=0	#global

func_1 () {
  local foo=1		#local var
  echo "func_1: foo = $foo"
}

func_2 () {
  local foo=2		#local var
  echo "func_2: foo = $foo"
}

echo "global: foo = $foo"
func_1
echo "global: foo = $foo"
func_2
echo "global: foo = $foo"
