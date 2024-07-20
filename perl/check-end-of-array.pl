#!/usr/bin/env perl

use v5.40;

## Chapter 1 The Basics of Perl Effective
## Check the end of an array having an undef element

my @cats = qw( Buster Roscoe Mimi );
$cats[3] = undef;
my @favorite = $cats[8]; # no such cat

# this is wrong style
# while ( defined( my $cat = shift @cats ) ) {
# print "I have a cat named $cat\n";
#}

# this is the right way using foreach
# ensure you go through all of the elements by using foreach
# and skip those that aren't defined

foreach my $cat (@cats) {
next unless defined $cat;
print "Again: I have a cat named $cat\n";
# print $cats[3];
}

# check the last element of array
# for ( my $i = 0 ; $i <= $#cats ; $i += 2 ) {
# next unless defined $cat[$i];
# print "I have a cat named $cat[$i]\n";
# }

