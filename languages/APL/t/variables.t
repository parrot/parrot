#!/usr/bin/perl

use lib qw(t . lib ../lib ../../lib ../../../lib);
use t::APL tests => 4;

run_apl_is();

__DATA__

=== assignment, scalar integer
--- APL
X←2
X
--- out: 2

=== assignment, character vector
--- APL
X←'foo'
X
--- out: foo

=== longer var names
--- APL
SOMEVARIABLE←3.14
SOMEVARIABLE
--- out: 3.14

=== assignment, integer vector
--- APL
X←1 2 3 4
X
--- out: 1 2 3 4
--- todo
