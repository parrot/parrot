#!perl
# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 3;

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



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
