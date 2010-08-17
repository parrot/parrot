#!perl
# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw(lib);
use Parrot::Test tests => 6;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a local, a reg and an if-stat");
.sub main
    .local int i
    i = 1
    $I0 = 1
    if i == $I0 goto ok
    say "nok"
    .return()
  ok:
    say "ok"
.end
CODE
ok
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "tale of a local, a reg and an unless-stat");
.sub main
    .local int i
    i = 1
    $I0 = 2
    unless i == $I0 goto ok
    say "nok"
    .return()
  ok:
    say "ok"
.end
CODE
ok
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "comparison, if, unless");
.sub main
    .local int i,j
    i = 1
    j = 2
    if i == j goto L1
    say "ok"
    goto L2
  L1:
    say "nok"
  L2:
    if i != j goto L3
    say "nok"
    goto L4
  L3:
    say "ok"
  L4:
    unless i == j goto L5
    say "nok"
    goto L6
  L5:
    say "ok"
  L6:
.end
CODE
ok
ok
ok
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "indexing an array");
.sub main
    .local pmc p
    p = new "ResizableIntegerArray"
    p[0] = 42
    p[1] = 43
    $I0 = p[0]
    say $I0
    $I1 = p[1]
    say $I1
.end
CODE
42
43
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "indexing a hash with a string constant");
.sub main
    .local pmc p
    p = new "Hash"
    p["hello"] = 42
    $I0 = p["hello"]
    say $I0
    p["bye"] = 3.3
    $N1 = p["bye"]
    say $N1
.end
CODE
42
3.3
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "indexing a hash with a string register");
.sub main
    .local pmc p
    p = new "Hash"
    $S0 = "hello"
    p[$S0] = 42
    $I0 = p[$S0]
    say $I0
    # and combine indexing with string constant and register
    $S1 = "bye"
    p["bye"] = 3.3
    $N1 = p["bye"]
    say $N1
.end
CODE
42
3.3
OUTPUT



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
