#!perl
use strict;
use TestCompiler tests => 3;

# these tests are run with -O0 by TestCompiler and show
# generated PASM code for various optimizations at level 0

##############################
output_is(<<'CODE', <<'OUT', "add_n_i_n");
.emit
   add N0, I0, N1
   mul N0, I0, N1
.eom
CODE
  add N0, N1, I0
  mul N0, N1, I0
OUT

##############################
output_is(<<'CODE', <<'OUT', "sub_n_ic_n");
.emit
   sub N0, 2, N1
   div N0, 2, N1
.eom
CODE
  sub N0, 2, N1
  div N0, 2, N1
OUT

##############################
output_is(<<'CODE', <<'OUT', "sub_n_i_n");
.sub _test
   sub N0, I0, N1
   div N0, I0, N1
.end
CODE
_test:
  set N16, I0
  sub N0, N16, N1
  set N16, I0
  div N0, N16, N1
OUT
