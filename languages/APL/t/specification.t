#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 6;

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

=== multiple specification
--- APL
(A B C)←1 2 3
A
B
C
--- out
1
2
3
--- todo
--- excuse: APLX only?

=== multiple specification, repeated
--- APL
(A B C)←3.14
A
B
C
--- out
3.14
3.14
3.14
--- todo
--- excuse: APLX only?
