#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$


use lib "../../lib";
use Parrot::Test tests => 2;


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "heredoc test");
.sub main
    foo(<<'A', <<'B', <<'HI')

    print "Hello!"
A
    Hello!
B
    this is some message
HI

.end
CODE
.namespace []
main:
  get_params
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
    set_returns
    returncc
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
