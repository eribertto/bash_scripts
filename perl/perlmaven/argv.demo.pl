#!/usr/bin/env perl
# Effective Perl Programming 2nd Edition
# End of the array Chapter 1 the Basics of Perl

use v5.38;
use warnings;
# use Data::Dumper qw(Dumper);

# print Dumper \@ARGV;
my ($name, $number) = @ARGV;
if (not defined $name) {
  die "Need a first name and optional last name!\n";
}
if (defined $number) {
  print "Saved in DB '$name' and '$number'.\n"; # save the variables
  exit;
}

print "Fetch '$name'\n";
