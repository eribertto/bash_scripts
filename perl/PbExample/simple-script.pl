#!/usr/bin/env perl
# Chapter 3 Perl scripts Perl by Examples 4th ed
# a simple Perl script with basic data types in use

use v5.38;
use warnings;

print "What is your name?: ";
chomp (my $name = <STDIN>); # waits for user input
print "Hello welcome $name, are you ready to learn Perl now? ";
chomp (my $response = <STDIN>);
# convert response to lowercase
$response = lc($response);
# use eq for string comparison, for numerals see the documentation
if ($response eq "yes" or $response eq "y"){
    print "Great! Let's get started learning Perl by Examples.\n'";
}
else {
    print "Okay, maybe some other time when you're ready :-)\n";
}

my $now = localtime; # get localtime
say "Hey $name, you ran this script on $now";
say "The name of this file is ", __FILE__;  # note the special literal __FILE__
