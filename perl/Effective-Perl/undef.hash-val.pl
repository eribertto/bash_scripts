#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# End of the array Chapter 1 the Basics of Perl

use v5.38;
use warnings;


# check for valid hash values, including undef
my %hash;	# undef
# once a key is assigned even with an undef value, that key now exist
$hash{'foo'} = undef;

if ( exists $hash{'foo'} ) {
	print keys %hash;
}

# NB: there are 4 false values
# undef, '', 0, '0'
# everything else is true
# ensure you test for the type of value that you want, not just truth.
