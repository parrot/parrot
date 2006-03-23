#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 4;

run_apl_is();

__DATA__

=== vectors
--- APL: print 10 2 3
--- out: 10 2 3
--- skip: basic vector support missing

=== ceiling (scalar)
--- APL: print ⌈ 2.5
--- out: 3
--- skip: use same glyph in monadic and dyadic forms

=== maximum (scalar)
--- APL: print 2 ⌈ 3
--- out: 3
--- skip: use same glyph in monadic and dyadic forms

=== scalar multiplication
--- APL: print 10 × 2
--- out: 20

