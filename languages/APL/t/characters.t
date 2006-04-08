#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 6;

run_apl_is();

__DATA__

=== double quotes
--- APL: "testing"
--- out: testing

=== double quote, embedded double
--- APL: "he said, ""she said."""
--- out: he said, "she said."

=== double quote, embedded single
--- APL: "he said, ''he can't.''"
--- out: he said, ''he can't.''

=== single quotes
--- APL: 'testing'
--- out: testing

=== single quotes, embedded single
--- APL: 'surely you can''t be serious.'
--- out: surely you can't be serious.

=== single quote, embedded double
--- APL: '""and?""'
--- out: ""and?""
