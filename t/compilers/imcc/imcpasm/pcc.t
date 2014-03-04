#!perl
# Copyright (C) 2005,2014 Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 1;

pir_2o1_pasm_is( <<'CODE', <<'OUT', 'end in :main' );
.sub _main :main
     noop
.end
CODE
.pcc_sub :main _main:
  noop
  set_returns
  returncc
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

