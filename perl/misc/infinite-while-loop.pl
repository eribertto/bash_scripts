#!/usr/bin/env perl
use v5.38;
# use v5.010;
use strict;
use warnings;
use utf8;

my $typed; # empty variable
do {
    print "What language is best for extraction and reporting? Hint: Perl : ";
    chomp ( $typed = <STDIN> );
    } while ( $typed ne 'Perl' );
