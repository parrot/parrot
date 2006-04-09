#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 1;

run_apl_is();

__DATA__

=== vectors
--- APL: 10 2 3
--- out: 10 2 3
--- todo: basic vector support missing
