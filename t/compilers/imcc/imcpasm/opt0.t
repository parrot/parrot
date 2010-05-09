#!perl
# Copyright (C) 2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 4;

# these tests are run with -O0 by TestCompiler and show
# generated PASM code for various optimizations at level 0

pir_2_pasm_is( <<'CODE', <<'OUT', "sub_n_ic_n" );
.sub _ :anon
   sub $N0, 2, $N1
   div $N0, 2, $N1
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_:
  sub N0, 2, N1
  div N0, 2, N1
  set_returns
  returncc
OUT

##############################
pir_2_pasm_is( <<'CODE', <<'OUT', "added return - end" );
.sub _test
   noop
   end
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
  noop
  end
OUT

##############################
pir_2_pasm_is( <<'CODE', <<'OUT', "added return - exit" );
.sub _test
   noop
   exit 0
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
  noop
  exit 0
OUT

##############################
pir_2_pasm_is( <<'CODE', <<'OUT', "added return - nil" );
.sub _test
   noop
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
_test:
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
