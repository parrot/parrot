#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 25;

run_apl_is();

__DATA__

=== conjugate positive
--- APL: +2
--- out: 2

=== conjugate negative
--- APL: +⁻2
--- out: ⁻2

=== negate positive
--- APL: −2
--- out: ⁻2

=== negate negative
--- APL: −⁻2
--- out: 2

=== signum positive
--- APL: ×2
--- out: 1

=== signum negative
--- APL: ×⁻2
--- out: ⁻1

=== signum zero
--- APL: ×0
--- out: 0

=== reciprocal
--- APL: ÷10
--- out: 0.1

=== factorial, zero
--- APL: !0
--- out: 1

=== factorial
--- APL: !4
--- out: 24

=== circle
--- APL: ○1
--- out: 3.14159

=== circle
--- APL: ○3
--- out: 9.42478

=== ceiling positive
--- APL: ⌈3.14
--- out: 4

=== ceiling negative
--- APL: ⌈⁻3.14
--- out: ⁻3

=== floor positive
--- APL: ⌊3.14
--- out: 3

=== floor negative
--- APL: ⌊⁻3.14
--- out: ⁻4

=== exponential
--- APL: *1
--- out: 2.71828

=== natural logarithm
--- APL: ⍟2.718282
--- out: 1

=== inverse exp/ln
--- APL: ⍟*1
--- out: 1

=== magnitude positive
--- APL: |12
--- out: 12

=== magnitude negative
--- APL: |⁻12
--- out: 12

=== magnitude zero
--- APL: |0
--- out: 0

=== roll
--- APL: ?1
--- excuse: (need to add to t/APL.pm to handle code in the out)
--- todo

=== not, 0
--- APL: ~0
--- out: 1

=== not, 1
--- APL: ~1
--- out: 0










