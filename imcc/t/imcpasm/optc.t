#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 6;

# these tests are run with -Oc by TestCompiler and show
# generated PASM code for call optimization


##############################
# prototyped calls, invokecc
pir_2_pasm_like(<<'CODE', <<'OUT', "in P param");
.sub _main
    $P0 = new PerlUndef
    $P0 = 42
    foo($P0)
    noop
    end
.end
.sub foo prototyped
    .param PerlUndef a
    print a
.end
CODE
/_main:
  new (P\d+), \d+ # \.PerlUndef
  set \1, 42
  set_p_pc (P\d+), foo
@pcc_sub_call_\d:
  set P5, \1
  set I0, 1
  null I1
  null I2
  set I3, 1
  null I4
  set P0, \2
  invokecc
  noop
  end
foo:
  set (P\d+), P5
  print \3
  null I0
  null I3
  returncc/
OUT

SKIP: {
    skip("PCC changes", 5);
pir_2_pasm_like(<<'CODE', <<'OUT', "in, out P param");
.sub _main
    .local Sub sub
    .local PerlUndef x
    x = new PerlUndef
    x = 42
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg x
    .pcc_call sub
    ret:
    .result x
    .pcc_end
    print x
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    a = a + 1
    .pcc_begin_return
    .return a
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  new P5, \d+ # \.PerlUndef
  set P5, 42
  newsub P0, \d+, _sub
@pcc_sub_call_\d:
  set I0, 1
  null I1
  set I2, 1
  set I3, -2
  invokecc
ret:
  print P5
  end
_sub:
  add P5, P5, 1
@pcc_sub_ret_\d+:
  set I0, 1
  null I1
  null I2
  set I3, 1
  null I4
  returncc/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "in, out P param, P var");
.sub _main
    .local Sub sub
    .local PerlUndef x
    x = new PerlUndef
    x = 42
    .local PerlUndef y
    y = new PerlUndef
    y = 10
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg x
    .pcc_call sub
    ret:
    .result x
    .pcc_end
    print x
    print y
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    a = a + 1
    .pcc_begin_return
    .return a
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  new P5, \d+ # \.PerlUndef
  set P5, 42
  new P16, \d+ # \.PerlUndef
  set P16, 10
  newsub P0, \d+, _sub
@pcc_sub_call_\d+:
  set I0, 1
  null I1
  set I2, 1
  set I3, -2
  invokecc
ret:
  print P5
  print P16
  end
_sub:
  add P5, P5, 1
@pcc_sub_ret_\d+:
  set I0, 1
  null I1
  null I2
  set I3, 1
  null I4
  returncc/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "in, out different P param");
.sub _main
    .local Sub sub
    .local PerlUndef x
    x = new PerlUndef
    x = 42
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg x
    .pcc_call sub
    ret:
    .local PerlUndef y
    .result y
    .pcc_end
    print y
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    a = a + 1
    .pcc_begin_return
    .return a
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  new P5, \d+ # \.PerlUndef
  set P5, 42
  newsub P0, \d+, _sub
@pcc_sub_call_\d:
  set I0, 1
  null I1
  set I2, 1
  set I3, -2
  invokecc
ret:
  print P5
  end
_sub:
  add P5, P5, 1
@pcc_sub_ret_\d+:
  set I0, 1
  null I1
  null I2
  set I3, 1
  null I4
  returncc/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "in, out different P param, interfer");
.sub _main
    .local Sub sub
    .local PerlUndef x
    x = new PerlUndef
    x = 42
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg x
    .pcc_call sub
    ret:
    .local PerlUndef y
    .result y
    .pcc_end
    print x
    print y
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    a = a + 1
    .pcc_begin_return
    .return a
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  new P16, \d+ # \.PerlUndef
  set P16, 42
  newsub P0, \d+, _sub
@pcc_sub_call_\d:
  set P5, P16
  set I0, 1
  null I1
  set I2, 1
  set I3, -2
  invokecc
ret:
  print P16
  print P5
  end
_sub:
  add P5, P5, 1
@pcc_sub_ret_\d+:
  set I0, 1
  null I1
  null I2
  set I3, 1
  null I4
  returncc/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "tail call");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub1
    .pcc_begin prototyped
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub1 prototyped
    .local Sub sub
    newsub sub, .Sub, _sub2
    .pcc_begin prototyped
    .arg P16
    .pcc_call sub
    ret:
    .result P16
    .pcc_end
    .pcc_begin_return
    .return P16
    .pcc_end_return
.end
.pcc_sub _sub2 prototyped
    .pcc_begin_return
    .pcc_end_return
.end
CODE
/_main:
        set P16, P1
        newsub P0, \d+, _sub1
@pcc_sub_call_\d+:
        set I0, 1
        null I1
        null I2
        null I3
        invokecc
ret:
        end
_sub1:
        set P17, P1
        newsub P17, \d+, _sub2
@pcc_sub_call_\d+:
        set P5, P16
        set I16, P17
        jump I16
ret:
@pcc_sub_ret_\d+:
_sub2:
@pcc_sub_ret_\d+:
        set I0, 1
        null I1
        null I2
        null I3
        null I4
        returncc
/
OUT

}
