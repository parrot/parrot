#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 5;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "assignments");
.sub main
    .local pmc x, y, z
    .local string a, b, c
    .local int i, j
    .local num pi
    x = 1
    a = "hi"
    i = 42
    pi = 3.14
.end
CODE
.namespace []
main:
    set P0, 1
    set S0, "hi"
    set I0, 42
    set N0, 3.140000
    set_returns
    returncc
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "if statement");
.sub main
    .local int x, y, z
    if x < y goto X
    unless y > x goto Y
X:
Y:
Z:
.end
CODE
.namespace []
main:
    lt I0, I1, 8
    le I1, I0, 4
X:
Y:
Z:
    set_returns
    returncc
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "if statement with keywords");
.sub int
    .local int if, int, goto
    .local pmc pmc, null
    if int > if goto goto
    if int > if goto L
goto:
L:
.end
CODE
.namespace []
int:
    lt I1, I0, 8
    lt I1, I0, 4
goto:
L:
    set_returns
    returncc
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "sub call not in this compilation unit");
.sub main
    foo()
.end
CODE
.namespace []
main:
    set_args ""
    get_results ""
    find_sub_not_null P0, "foo"
    invokecc P0
    set_returns
    returncc
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "sub call in this compilation unit");
.sub main
    foo()
.end
.sub foo
.end
CODE
.namespace []
main:
    set_args ""
    get_results ""
    set P0, 0
    invokecc P0
    set_returns
    returncc
.namespace []
foo:
    set_returns
    returncc
OUTPUT


##
### test return statements
##    .return (1)
##    .return (x :flat)
##    .return (x :named('z'))
##    .return (a, b, c)
##    .return (a :flat, b, c :flat :named)
##
### test yield statements
##
##    .yield (1)
##    .yield (a :flat)
##    .yield (x :named)
##    .yield (b :named('b'))
##    .yield (d, e, f)
##.end
###
### comments
##.sub foo
##    .param pmc args :slurpy
##    .local int i
##    i = args[0]
##    print i
##
### test long return statement
##    .begin_return
##    .end_return
##
##    .begin_return
##    .return p :flat :named('myP')
##    .end_return
##
### test long yield statement
##    .begin_yield
##    .end_yield
##
##    .begin_yield
##    .return q :flat
##    .return r :named('myR')
##    .return s :flat :named
##    .end_yield
##
##    x = null
##    null x
##
### test long subcall
##    .begin_call
##    .call Y
##    .end_call
##
##    .begin_call
##    .arg y :flat
##    .arg z :named('z')
##    .call Z
##    .result P0 :slurpy
##    .local pmc x
##    .result x
##    .end_call
##
##
##.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
