#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 1;

# these tests are run with -Oc by TestCompiler and show
# generated PASM code for call optimization


##############################

pir_2_pasm_like(<<'CODE', <<'OUT', "in P param");
.sub _main
    $P0 = new Undef
    $P0 = 42
    foo($P0)
    noop
    end
.end
.sub foo
    .param Undef a
    print a
.end
CODE
/_main:
  new (P\d+), \d+ # \.Undef
  set \1, 42
@pcc_sub_call_\d:
  set_args
  set_p_pc (P\d+), foo
  get_results
  invokecc \2
  noop
  end
foo:
  get_params
  print P0
  set_returns
  returncc/
OUT

