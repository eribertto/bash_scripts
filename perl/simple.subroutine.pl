#!/usr/bin/env perl
use v5.38;
use utf8;

# simple subroutine example
# From the book Effective Perl Programming 2nd edition 2010

sub hi {
    my $name = shift;
    return "Hello there, $name\n";
}

# called the function
my $name = 'Eriberto';
print &hi("Fred");    # old school style
# the parens is optional
print hi("$name.");
print hi "James Bond. Look no parens here lol :-)";
say hi "$name" x 3; # string repetition operator
