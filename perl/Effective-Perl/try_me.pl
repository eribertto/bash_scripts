#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# Lexical scope my vs local operators
# Chapter 4 Subroutines

use v5.38;
use warnings;

{
    my $a = 2.7183;     # Lexical
    print "I am the local $a";
  }
our $a = 3.1416;                   # global
print $a;
