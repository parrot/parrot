#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 7;

run_apl_is();

__DATA__

=== integer
--- APL: print 2
--- out: 2

=== negative integer
--- APL: print ⁻2
--- out: ⁻2

=== number
--- APL: print 1.44
--- out: 1.44
--- excuse: prints extra zeros
--- skip: not implemented

=== negative number
--- APL: print ⁻1.44
--- out: ⁻1.44
--- skip: not implemented

=== integer positive exponent
--- APL: print 10E2
--- out: 1000

=== integer negative exponent
--- APL: print 10000E⁻2
--- out: 100

=== integer negative exponent (convert to float)
--- APL: print 144E⁻2
--- out: 1.44
--- excuse: doesn't autoconvert to float yet, and if it did, too many zeros.
--- skip: not implemented
