#!/usr/bin/env perl
# Perl by Example
# a simple Perl script with basic data types in use

use v5.38;
use warnings;

# some print outputs

print "Hello, world!\n";
print "Hello,", " world!\n";
print ("It's a perfect day today!\n"); # parens optional
print "The date and time now: ", localtime, "\n";
printf "Hello, world\n";
printf("Meet %s%:Age 5d%:Salary \$10.2f\n", "John", 40, 5500);
