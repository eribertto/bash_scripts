#!/usr/bin/env perl

use v5.40;

# using qw in arrays e.g. a variable preceeded by the sigil @ and the value enclosed in parens
# the qw operator takes a string and auto insert whitespace in the below list
# this operator can use any pair of balanced delimiters

my @odds = qw( 1 3 5 charlie );
print "@odds\n";
my @even = qw< 2 4 6 8 james bond>;
print "@even\n";
my @punctuations = qw[ this-are-punctuations . ; ! () {} ];
print "@punctuations";
