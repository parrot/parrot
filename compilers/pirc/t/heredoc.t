#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$


use lib "../../lib";
use Parrot::Test tests => 3;


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "heredoc test");
.sub main
    foo(<<'A', <<'B', <<'HI')
this is a simple single-line heredoc.
A
this is a simple
multi
line
heredoc
.
B
and yet another
multi
line
heredoc
string.
HI

.end
CODE
.namespace []
main:
    set_args "\nthis is a simple single-line heredoc.\n", "\nthis is a simple\nmulti\nline\nheredoc\n.\n", "\nand yet another\nmulti\nline\nheredoc\nstring.\n"
    get_results ""
    find_sub_not_null P0, "foo"
    invokecc P0
    set_returns
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "more heredoc");
.sub foo
    .param pmc args :slurpy

    .yield(<<'YIELD')
 This is some text returned through .yield!

YIELD

    .return(<<'RET')
 Some text returned through return
RET
.end
CODE
.namespace []
foo:
    get_params
    set_returns "\n This is some text returned through .yield!\n\n"
    yield
    set_returns "\n Some text returned through return\n"
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "heredoc string assignment");
.sub main
    $S0 = <<'A'
this is a simple assigned heredoc string to $S0.
A
    .local string s
    s = <<'B'
this is a simple assigned heredoc string to string s.
B
.end
CODE
.namespace []
main:
    set S0, "\nthis is a simple assigned heredoc string to $S0.\n"
    set S1, "\nthis is a simple assigned heredoc string to string s.\n"
    set_returns
    returncc
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
