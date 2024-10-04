#!/usr/bin/env perl
# Perl by Examples 4th ed
# example 4.11 Printing special literals

use v5.38;
use warnings;

print "The name of this file is ", __FILE__, ".\n";
print "We are on line number ", __LINE__, ".\n";
__END__
And this stuff is just a bunch of chitter-chatter that is to be ignored by Perl.
The __END__ literal is like Ctrl-D or \004.
