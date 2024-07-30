#!/usr/bin/perl -wl

# https://metacpan.org/pod/Modern::Perl
use v5.38;

# naked block structure, Chap 10 Learning Perl 8th ed.

{
    print "Please enter a number: ";
    chomp( my $num = <STDIN> );
    my $root = sqrt $num; # get the square root
    print "The square root of $num is $root.\n"
}
