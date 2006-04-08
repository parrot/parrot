#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 34;

diag "need more tests to test int <op> int, float <op> float, etc.";

run_apl_is();

__DATA__

=== plus scalar (int/int)
--- APL: 2+2
--- out: 4

=== plus scalar (int/float)
--- APL: 2+3.14
--- out: 5.14

=== plus mixed
--- APL: 1 2 3 4+3.14 
--- out: 4.14 5.14 6.14 7.14
--- todo

=== plus vector
--- APL: 1 2 3 4+1.1 2.2 3.3 4.4
--- out: 2.1 4.2 6.3 8.4
--- todo

=== plus domain
--- APL: 1+'TEA'
--- out: DOMAIN ERROR
--- todo

=== minus scalar (int/int)
--- APL: 2-3
--- out: ⁻1
--- todo

=== minus scalar
--- APL: 2-3.14
--- out: ⁻1.14
--- todo

=== minus mixed
--- APL: 1 2 3 4-3.14 
--- out: ⁻2.14 ⁻1.14 ⁻0.14 0.86
--- todo

=== minus vector
--- APL: 1 2 3 4-1.1 2.2 3.3 4.4
--- out: ⁻0.1 ⁻0.2 ⁻0.3 ⁻0.4
--- todo

=== minus domain
--- APL: 2-'TEA'
--- out: DOMAIN ERROR
--- todo

=== times scalar (int/int)
--- APL: 2×2
--- out: 4

=== times scalar
--- APL: 2×3.14
--- out: 6.28

=== times mixed
--- APL: 1 2 3 4*3.14 
--- out: 3.14 6.28 9.42 12.56
--- todo

=== times vector
--- APL: 1 2 3 4×1.1 2.2 3.3 4.4
--- out: 1.1 4.4 9.9 17.6
--- todo

=== times domain
--- APL: 2×'TEA'
--- out: DOMAIN ERROR
--- todo

=== divide scalar
--- APL: 2.1÷64
--- out: 0.0328125

=== divide mixed
--- APL: 1.1 2.2 3.3 4.4÷64
--- out: 0.0171875 0.034375 0.0515625 0.06875
--- todo

=== divide vector
--- APL: 1.1 2.2 3.3 4.4÷1 2 3 4
--- out: 1.1 1.1 1.1 1.1
--- todo

=== divide domain
--- APL: 2÷'TEA'
--- out: DOMAIN ERROR
--- todo

=== maximum scalar
--- APL: 2.1⌈2
--- out: 2.1
--- todo

=== maximum mixed
--- APL: 1.1 2.2 3.3 4.4⌈3.1
--- out: 3.1 3.1 3.3 4.4
--- todo

=== maximum vector
--- APL: 1.1 2.2 3.3 4.4⌈1.5 2 3.5 4
--- out: 1.5 2.2 3.5 4.4
--- todo

=== maximum domain
--- APL: 2⌈'TEA'
--- out: DOMAIN ERROR
--- todo

=== minimum scalar
--- APL: 2.1⌊2
--- out: 2
--- todo

=== minimum mixed
--- APL: 1.1 2.2 3.3 4.4⌊3.1
--- out: 1.1 2.2 3.1 3.1
--- todo

=== minimum vector
--- APL: 1.1 2.2 3.3 4.4⌊1.5 2 3.5 4
--- out: 1.1 2 3.3 4
--- todo

=== minimum domain
--- APL: 2⌊'TEA'
--- out: DOMAIN ERROR
--- todo

=== power scalar
--- APL: 2⋆3
--- out: 8
--- todo

=== power mixed
--- APL: 1.1 2.2 3.3 4.4⋆2
--- out: 1.21 4.84 10.89 19.36
--- todo

=== power vector
--- APL: 1.1 2.2 3.3 4.4⋆1 2 1 2
--- out: 1.1 4.84 3.3 19.36
--- todo

=== power domain (character)
--- APL: 2⋆'TEA'
--- out: DOMAIN ERROR
--- todo

=== power domain (negative sqrt)
--- APL: ⁻9⋆.5
--- out: DOMAIN ERROR
--- todo

=== logarithm
--- excuse: can't find operator
--- todo

=== residue, binomial coefficient, deal, circular, and, or, nand, nor, less, not greater, equal, not less, greater, not equal
--- excuse: need tests
--- todo
