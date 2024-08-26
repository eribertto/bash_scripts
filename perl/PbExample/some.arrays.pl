#!/usr/bin/env perl
# Perl by Example
# a simple Perl script with basic data types in use

use v5.38;
use warnings;

# examples of arrays/collections/maps

my @names = ( "Jessica", "Michelle", "Stephanie" );
print @names, "\n"; # no spacing
print "@names\n"; # with spacing
print "$names[0] and $names[1]\n";
print "The last in the list is $names[-1]\n";
