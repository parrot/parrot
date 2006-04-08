#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 10;

run_apl_is();

__DATA__

=== integer
--- APL: 2
--- out: 2

=== negative integer
--- APL: ⁻2
--- out: ⁻2

=== number
--- APL: 1.44
--- out: 1.44

=== negative number
--- APL: ⁻1.44
--- out: ⁻1.44

=== integer positive exponent
--- APL: 10E2
--- out: 1000

=== integer negative exponent
--- APL: 10000E⁻2
--- out: 100

=== integer negative exponent (convert to float)
--- APL: 144E⁻2
--- out: 1.44

=== number positive exponent
--- APL: 1.4444E2
--- out: 144.44

=== number negative exponent
--- APL: 1.44E⁻2
--- out: 0.0144

=== number positive exponent (convert to int)
--- APL: 1.4444E4
--- out: 14444
