#!/usr/bin/env perl
# https://metacpan.org/pod/IO::Prompter

use v5.38;
use warnings;
use IO::Prompter;

# use IO::Prompter;
#
# # This call has no automatically added options...
# my $assent = prompt "Do you wish to take the test?", -yn;
#
# {
#     use IO::Prompter [-yesno, -single, -style=>'bold'];
#
#     # These three calls all have: -yesno, -single, -style=>'bold' options
#     my $ready = prompt 'Are you ready to begin?';
#     my $prev  = prompt 'Have you taken this test before?';
#     my $hints = prompt 'Do you want hints as we go?';
# }
#
# # This call has no automatically added options...
# scalar prompt 'Type any key to start...', -single;




# while (prompt -num, 'Enter a number') {
#     say "You entered: $_";
# }

my $passwd = prompt 'Enter your password: ', -echo=>'*';
# show the password
say "You entered: $passwd\n";


my $selection = prompt 'Choose wisely from the below menu: ', -menu => {
            wealth => [ 'moderate', 'vast', 'incalculable' ],
            health => [ 'hale', 'hearty', 'rude' ],
            wisdom => [ 'cosmic', 'folk' ],
      }, '> ';

say "You selected: $selection";
