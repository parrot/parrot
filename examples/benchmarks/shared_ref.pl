#!/usr/bin/perl -w
use strict;
use threads;
use threads::shared;

for my $i (0..99_999) {
    my $r :shared;
    my $j :shared;
    $r = \$j;
    $$r = $i;
}
