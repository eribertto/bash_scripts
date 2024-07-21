#!/usr/bin/env perl

use Modern::Perl '2024';

  #use v5.38;
  #use utf8;

  # Guess the number game
  # https://code-maven.com/slides/perl/solution-number-guessing-game

my $N = 200;    # constant number
my $hidden = 1 + int rand $N;
print "Please guess the number from 1 to $N ($hidden)> ";
my $guess = <ARGV>;
chomp $guess;

# do a loop
if ( $guess < $hidden ) {
    print "$guess is too low\n";
    print "The magic number is $hidden.";
}
if ( $guess > $hidden ) {
    print "$guess is too high\n";
    print "The magic number is $hidden.";
}
if ( $guess == $hidden ) {
    print "Eureka! $guess is the magic number!";
}
