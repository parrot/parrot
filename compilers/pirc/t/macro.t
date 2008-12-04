#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 2;


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "simple macro without parameters");
.macro Hi()
    print "hello"
.endm
.sub main
    .Hi()
.end
CODE
.namespace []
main:
    print "hello"
    set_returns
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "expansion w/ parameters and nested macro_const expansion");
.macro_const ANSWER 42

.macro foo(a,b)
    say .a
    say .b
.endm

.sub main
    .foo(.ANSWER, "hi")
.end

CODE
.namespace []
main:
    say 42
    say "hi"
    set_returns
    returncc
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

