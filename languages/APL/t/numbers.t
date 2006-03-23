#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 6;

run_apl_is();

__DATA__

=== integer
--- APL: print 2
--- out: 2

=== negative integer
--- APL: print ⁻2
--- out: ⁻2
--- skip: not implemented

=== number
--- APL: print 1.44
--- out: 1.44
--- skip: need to drop extra zeros.

=== negative number
--- APL: print ⁻1.44
--- out: ⁻1.44
--- skip: not implemented

=== positive exponent
--- APL: print 10E2
--- out: 1000
--- skip: not implemented

=== negative exponent
--- APL: print 144E⁻2
--- out: 1.44
--- skip: not implemented
