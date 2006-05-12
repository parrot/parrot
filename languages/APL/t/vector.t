#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 30;

run_apl_is();

__DATA__

=== simple vector parsing
--- APL: 10 2 3
--- out: 10 2 3

=== simple vector parsing, with negatives.
--- APL: ⁻10 2 ⁻3.1
--- out: ⁻10 2 ⁻3.1

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

=== reverse, characters
--- APL: ⌽'APL IS WIERD'
--- out: DREIW SI LPA

=== rotate
--- APL: 1⊖6 7 8 9 
--- out: 7 8 9 6

=== rotate multiple positions
--- APL: 2⊖1 2 3 4 5
--- out: 3 4 5 1 2

=== rotate backwards
--- APL: ⁻2⊖1 2 3 4 5
--- out: 4 5 1 2 3

=== rotate, but don't
--- APL: 0⊖1 2 3 4 5
--- out: 1 2 3 4 5

=== rotate characters
--- APL: 3⊖'QWERTYUIOP'
--- out: RTYUIOPQWE

=== rotate characters, backwards.
--- APL: ⁻3⊖'QWERTYUIOP'
--- out: IOPQWERTYU

=== rotate characters, but don't
--- APL: 0⊖'QWERTYUIOP'
--- out: QWERTYUIOP

=== without, characters
--- APL: 'APL ON PARROT'~'AEIOU '
--- out: PLNPRRT

=== without, numbers
--- APL: 1 2 3 4 5 6 7 8 9~1 3 5 7 9
--- out: 2 4 6 8

=== first
--- APL: ↑1 2 3 4 5
--- out: 1

=== take, characters
--- APL: 5↑'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
--- out: ABCDE

=== take, characters, negative
--- APL: ⁻5↑'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
--- out: VWXYZ

=== take, simple vector
--- APL: 5↑⍳20
--- out: 1 2 3 4 5

=== take, simple vector, negative
--- APL: ⁻5↑⍳20
--- out: 16 17 18 19 20

=== drop, characters
--- APL: 5↓'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
--- out: FGHIJKLMNOPQRSTUVWXYZ

=== drop, characters, negative
--- APL: ⁻5↓'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
--- out: ABCDEFGHIJKLMNOPQRSTU

=== drop, simple vector
--- APL: 5↓⍳11
--- out: 6 7 8 9 10 11

=== drop, simple vector, negative
--- APL: ⁻5↓⍳11
--- out: 1 2 3 4 5 6
