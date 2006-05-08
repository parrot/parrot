#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 15;

run_apl_is();

__DATA__

=== simple vector parsing
--- APL: 10 2 3
--- out: 10 2 3

=== index list
--- APL: ⍳5
--- out: 1 2 3 4 5

=== index list, empty
--- APL: ⍳0

=== index of, scalar
--- APL: 1 2 3 5 7 9 11⍳7
--- out: 5

=== index of, scalar, not found
--- APL: 1 2 3 5 7 9 11⍳3.14
--- out: 8

=== index of, vector
--- APL: 1 2 3 5 7 9 11⍳7 3 9 10
--- out: 5 3 6 7

=== index of, alpha
--- APL: 'COKE'⍳'O'
--- out: 2

=== index of, alpha, multiple
--- APL: 'ALPHABETICAL'⍳'CAB'
--- out: 10 1 6

=== index of, not found
--- APL: 'AEIOU'⍳'Y'
--- out: 6

=== reverse
--- APL: ⌽1 2 3 4 5
--- out: 5 4 3 2 1
--- todo

=== reverse, characters
--- APL: ⌽'APL IS WIERD'
--- out: DREIW SI LPA
--- todo

=== rotate
--- APL: 1⊖6 7 8 9 
--- out: 7 8 9 6
--- todo

=== rotate multiple positions
--- APL: 2⊖1 2 3 4 5
--- APL: 3 4 5 1 2
--- todo

=== rotate backwards
--- APL: ⁻2⊖1 2 3 4 5
--- out: 4 5 1 2 3
--- todo

=== rotate characters
--- APL: 3⊖'QWERTY'
--- out: RTYQWE
--- todo

