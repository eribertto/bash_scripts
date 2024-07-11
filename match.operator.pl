#!/usr/bin/env perl
use v5.38;

# using the match operator ~~ for comparison
# avoiding the confusion of the eq and == operators
# From the book Effective Perl Programming 2nd edition 2010

# update: Smartmatch is now deprecated, see perldoc perldeprecation.

if (( '123' + 0 ) ~~ '123.0' ) { # number and numish comparison
say "Matched 1!";

}
