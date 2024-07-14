#!/usr/bin/env perl
# From the Book Learning Perl 2021 edition
# Chapter 1 Introduction

use v5.38;

my @lines = `perldoc -u -f atan2`;
foreach (@lines) {
    s/\w<(.+?)>/\U$1/g;
    print;
}
