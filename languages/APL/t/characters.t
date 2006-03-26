#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 6;

run_apl_is();

__DATA__

=== double quotes
--- APL: print "testing"
--- out: testing

=== double quote, embedded double
--- APL: print "he said, ""she said."""
--- out: he said, "she said."

=== double quote, embedded single
--- APL: print "he said, ''he can't.''"
--- out: he said, ''he can't.''

=== single quotes
--- APL: print 'testing'
--- out: testing

=== single quotes, embedded single
--- APL: print 'surely you can''t be serious.'
--- out: surely you can't be serious.

=== single quote, embedded double
--- APL: print '""and?""'
--- out: ""and?""
