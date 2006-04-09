#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 16;

run_apl_is();

__DATA__

=== plus positive
--- APL: +2
--- out: 2

=== plus negative
--- APL: +⁻2
--- out: ⁻2

=== minus positive
--- APL: −2
--- out: ⁻2

=== minus negative
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


