#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 34;

diag "need more tests to test int <op> int, float <op> float, etc.";

run_apl_is();

__DATA__

=== plus scalar (int/int)
--- APL: print 2 + 2
--- out: 4

=== plus scalar (int/float)
--- APL: 2 + 3.14
--- out: 5.14
--- skip: not implemented

=== plus mixed
--- APL: 1 2 3 4 + 3.14 
--- out: 4.14 5.14 6.14 7.14
--- skip: not implemented

=== plus vector
--- APL: 1 2 3 4 + 1.1 2.2 3.3 4.4
--- out: 2.1 4.2 6.3 8.4
--- skip: not implemented

=== plus domain
--- APL: 1 + 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== minus scalar (int/int)
--- APL: 2 - 3
--- out: ⁻1
--- skip: not implemented

=== minus scalar
--- APL: 2 - 3.14
--- out: ⁻1.14
--- skip: not implemented

=== minus mixed
--- APL: 1 2 3 4 - 3.14 
--- out: ⁻2.14 ⁻1.14 ⁻0.14 0.86
--- skip: not implemented

=== minus vector
--- APL: 1 2 3 4 - 1.1 2.2 3.3 4.4
--- out: ⁻0.1 ⁻0.2 ⁻0.3 ⁻0.4
--- skip: not implemented

=== minus domain
--- APL: 2 - 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== times scalar (int/int)
--- APL: print 2 × 2
--- out: 4

=== times scalar
--- APL: print 2 × 3.14
--- out: 6.28

=== times mixed
--- APL: 1 2 3 4 * 3.14 
--- out: 3.14 6.28 9.42 12.56
--- skip: not implemented

=== times vector
--- APL: 1 2 3 4 × 1.1 2.2 3.3 4.4
--- out: 1.1 4.4 9.9 17.6
--- skip: not implemented

=== times domain
--- APL: 2 × 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== divide scalar
--- APL: 2.1 ÷ 64
--- out: 0.0328125
--- skip: not implemented

=== divide mixed
--- APL: 1.1 2.2 3.3 4.4 ÷ 64
--- out: 0.0171875 0.034375 0.0515625 0.06875
--- skip: not implemented

=== divide vector
--- APL: 1.1 2.2 3.3 4.4 ÷ 1 2 3 4
--- out: 1.1 1.1 1.1 1.1
--- skip: not implemented

=== divide domain
--- APL: 2 ÷ 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== maximum scalar
--- APL: 2.1 ⌈ 2
--- out: 2.1
--- skip: not implemented

=== maximum mixed
--- APL: 1.1 2.2 3.3 4.4 ⌈ 3.1
--- out: 3.1 3.1 3.3 4.4
--- skip: not implemented

=== maximum vector
--- APL: 1.1 2.2 3.3 4.4 ⌈ 1.5 2 3.5 4
--- out: 1.5 2.2 3.5 4.4
--- skip: not implemented

=== maximum domain
--- APL: 2 ⌈ 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== minimum scalar
--- APL: 2.1 ⌊ 2
--- out: 2
--- skip: not implemented

=== minimum mixed
--- APL: 1.1 2.2 3.3 4.4 ⌊ 3.1
--- out: 1.1 2.2 3.1 3.1
--- skip: not implemented

=== minimum vector
--- APL: 1.1 2.2 3.3 4.4 ⌊ 1.5 2 3.5 4
--- out: 1.1 2 3.3 4
--- skip: not implemented

=== minimum domain
--- APL: 2 ⌊ 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== power scalar
--- APL: 2 ⋆ 3
--- out: 8
--- skip: not implemented

=== power mixed
--- APL: 1.1 2.2 3.3 4.4 ⋆ 2
--- out: 1.21 4.84 10.89 19.36
--- skip: not implemented

=== power vector
--- APL: 1.1 2.2 3.3 4.4 ⋆ 1 2 1 2
--- out: 1.1 4.84 3.3 19.36
--- skip: not implemented

=== power domain (character)
--- APL: 2 ⋆ 'TEA'
--- out: DOMAIN ERROR
--- skip: not implemented

=== power domain (negative sqrt)
--- APL: ⁻9 ⋆ .5
--- out: DOMAIN ERROR
--- skip: not implemented

=== logarithm
--- excuse: can't find operator
--- skip: not implemented

=== residue, binomial coefficient, deal, circular, and, or, nand, nor, less, not greater, equal, not less, greater, not equal
--- excuse: need tests
--- skip: not implemented
