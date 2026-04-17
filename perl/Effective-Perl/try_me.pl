#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# Lexical scope my vs local operators
# Chapter 4 Subroutines

use Modern::Perl;
use warnings;

{
    my $a = 2.7183;     # Lexical
    say "I am the local $a";
  }
our $a = 3.1416;                   # global
say "I am the global $a";
