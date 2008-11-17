#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 1;


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "macro");
.macro Hi()
    print "hello"
.endm

.sub main
    .Hi()
.end
CODE
.namespace []
main:
  get_params
  print "hello"
  set_returns
  returncc
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

