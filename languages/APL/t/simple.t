#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 1;

run_apl_is();

__DATA__

=== vectors
--- APL: print 10 2 3
--- out: 10 2 3
--- skip: basic vector support missing
