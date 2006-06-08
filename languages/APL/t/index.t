#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 12;

run_apl_is();

__DATA__

=== literal numeric vector
--- APL: 2 4 6 8[3]
--- out: 6
--- todo

=== literal character vector
--- APL: 'ABCDEFG'[3]
--- out: C
--- todo


=== variable indexing, math.
--- APL
PRIMES←1 2 3 5 7 11
PRIMES[3]+PRIMES[5]
--- out: 10
--- todo

=== multiple specification, numeric
--- APL
PRIMES←1 2 3 5 7 11
PRIMES[5 4 1]
--- out: 11 2 1
--- todo

=== multiple specification, alpha
--- APL
LETTERS←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LETTERS[3 15 11 5]
--- out: COKE
--- todo

=== simple 2D
--- APL
TMP←2 3⍴⍳6
TMP[2;3]
--- out: 6
--- todo

=== slice 2D
--- APL
TMP←2 3⍴⍳6
TMP[2;]
--- out: 4 5 6
--- todo

=== multiple specification, alpha, matrix
--- APL
LETTERS←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LETTERS[2 3⍴⍳6]
--- out
ABC
DEF
--- todo

=== literal numeric vector (⎕)
--- APL: 3⎕2 4 6 8
--- out: 6
--- todo

=== literal character vector (⎕)
--- APL: 3⎕'ABCDEFG'
--- out: C
--- todo

=== variable indexing, math. (⎕)
--- APL
PRIMES←1 2 3 5 7 11
(3⎕PRIMES)+5⎕PRIMES
--- out: 10
--- todo

=== simple 2D (⎕)
--- APL
TMP←2 3⍴⍳6
2 3⎕TMP
--- out: 6
--- todo
