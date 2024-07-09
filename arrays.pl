#!/usr/bin/env perl

use v5.40;

# all about arrays e.g. a variable preceeded by the sigil @ and the value enclosed in parens

my $nine = 9;
my @stuff = ( 7, 'of', $nine );
print @stuff, "\n";   # no spacing, newline is provided explicitly
print "@stuff\n"; # interpolation inside double quotes provides auto spacing
say @stuff; # say as plain print but with newline in the end

# arrays indexing start at [0]
my @words = ( "and", "another", "thing" );
my $first = $words[0];
my $second = $words[1];
my $third = $words[2];
say "@words";

# reversing the list the hard way
say "reverse 1: $third $second $first";
# replace list element
$words[1] = "one more"; # replace with new value
say "@words";
# using function reverse
my @reverse_word = reverse @words;
say "reverse 2: @reverse_word";
# say "@reverse_word";
