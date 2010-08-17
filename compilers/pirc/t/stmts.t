#!perl
# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw(lib);
use Parrot::Test tests => 5;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a simple sub call - no params");
.sub main
    foo()
.end

.sub foo
    say "ok"
.end
CODE
ok
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a simple sub call - single param");
.sub main
    foo(42)
.end

.sub foo
    .param int i
    say i
.end
CODE
42
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a simple sub call - boxing");
.sub main
    foo(42, 3.14, "hi there")
.end

.sub foo
    .param pmc i
    .param pmc f
    .param pmc t
    .local string s
    s = typeof i
    say s
    s = typeof f
    say s
    s = typeof t
    say s
.end
CODE
Integer
Float
String
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a simple sub call - slurpy param");
.sub main
    foo(1, 2, 3)
.end

.sub foo
    .param pmc args :slurpy
    $I0 = args
    say 3
.end
CODE
3
OUTPUT



pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "method call");
.sub main
    .local pmc cl, obj, meth
    cl  = newclass "Foo"
    obj = new "Foo"
    obj.'hi'()
.end

.namespace ["Foo"]
.sub hi :method
    say "ok"
.end


CODE
ok
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
