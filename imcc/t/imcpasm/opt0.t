#!perl
use strict;
use TestCompiler tests => 6;

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
output_like(<<'CODE', <<'OUT', "sub_n_i_n");
.sub _test
   sub N0, I0, N1
   div N0, I0, N1
.end
CODE
/_test:
  set N(\d+), I0
  sub N0, N\1, N1
  set N\1, I0
  div N0, N\1, N1
  null I0
  null I3
  returncc/
OUT

##############################
output_is(<<'CODE', <<'OUT', "added return - end");
.sub _test
   noop
   end
.end
CODE
_test:
  noop
  end
OUT

##############################
output_is(<<'CODE', <<'OUT', "added return - exit");
.sub _test
   noop
   exit 0
.end
CODE
_test:
  noop
  exit 0
OUT

##############################
output_is(<<'CODE', <<'OUT', "added return - nil");
.sub _test
   noop
.end
CODE
_test:
  noop
  null I0
  null I3
  returncc
OUT
