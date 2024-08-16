#!/usr/bin/env perl
# https://metacpan.org/pod/IO::Prompter

use v5.38;
use warnings;
use IO::Prompter;

my $score = prompt 'Enter score between 1-100:',
  -number => sub { 0 <= $_ && $_ <= 100 };
say "You entered $score";

# This call has no automatically added options...
my $assent = prompt "Do you wish to take the test?", -yn;
exit 1 if not $assent;

{
    use IO::Prompter [ -yesno, -single, -style => 'bold' ];

    # These three calls all have: -yesno, -single, -style=>'bold' options
    my $ready = prompt 'Are you ready to begin?';
    my $prev  = prompt 'Have you taken this test before?';
    my $hints = prompt 'Do you want hints as we go?';
}

# This call has no automatically added options...
scalar prompt 'Type any key to start...', -single;
