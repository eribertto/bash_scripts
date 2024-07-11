#!/usr/bin/env perl
use v5.38;

# simple subroutine example
# From the book Effective Perl Programming 2nd edition 2010

sub hi {
my $name = shift;
return "Hello there, $name\n";
}

# called the function
print &hi("Fred"); # old school style
print hi("Eriberto!\n");
# the parens is optional
say hi "James Bond";
