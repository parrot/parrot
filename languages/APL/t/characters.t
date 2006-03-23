#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 6;

run_apl_is();

__DATA__

=== double quotes
--- APL: print "testing"
--- out: testing
--- skip: not implemented

=== double quote, embedded double
--- APL: print "he said, ""she said."""
--- out: he said, "she said."
--- skip: not implemented

=== double quote, embedded single
--- APL: print "he said he can't"
--- out: he said he can't
--- skip: not implemented

=== single quotes
--- APL: print 'testing'
--- out: testing
--- skip: not implemented

=== single quotes, embedded single
--- APL: print 'surely you can''t be serious.'
--- out: surely you can't be serious
--- skip: not implemented

=== single quote, embedded double
--- APL: print '"and?"'
--- out: and?
--- skip: not implemented
