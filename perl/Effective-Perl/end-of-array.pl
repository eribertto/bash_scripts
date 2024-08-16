#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# End of the array Chapter 1 the Basics of Perl

use v5.38;
use warnings;


my @cats = qw( Buster Roscoe Mimi);
my $favorite = $cats[8]; #undefined
print "My favorite cat is ", $favorite, "\n";		# perldoc -f undef
# replace 2nd array elem with undef
$cats[1] = undef;
# use foreach to loop through the array elements using defined
foreach my $cat (@cats) {
	next unless defined $cat;
	print "I have a cat named $cat\n";
}

# to check for last element of array use $#cats syntax
# for (my $i = 0; $i <= $#cats ; $i += 2) {
# 	next unless defined $cat[i];
# 	print "I have a cat named $cat[$i]\n";
# }
