#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# Item 8 Understand conversions betw strings and numbers

use v5.38;
use warnings;


my $num = 0 + "123"; # the number 123
print "$num \n";
$num = 0 + "123abc";	# also number
print "$num \n";
$num = 0 + "\n123";	# same number, leading whitespace ignored
print "$num \n";
$num = 0 + "a123";	# 0 no number at the beginning
print $num, "\n";
$num = 0 + "\x{2165}";	# 0 - roman numerals aren't numbers
print $num, "\n";
