#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 7;

run_apl_is();

__DATA__

=== 'double quotes'
--- APL: print "he said, ""she said."""
--- out: he said, "she said."
--- skip: characters don't work yet.

=== 'single quotes'
--- APL: print 'surely you can''t be serious.'
--- out: surely you can't be serious
--- skip: characters don't work yet.

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

=== scalar multiplication (ascii)
--- APL: print 10 * 2
--- out: 20
