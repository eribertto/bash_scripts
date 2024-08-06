#!/usr/bin/env perl

use v5.38;
use warnings FATAL => 'numeric';
use diagnostics;

my $sum = '123buster' + 5;
# print "The sum is $sum";    # prints the sum regardless of the warnings
print "The sum is $sum";    # this line is not suppressed
