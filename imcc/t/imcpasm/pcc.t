#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 11;


pir_2_pasm_like(<<'CODE', <<'OUT', 'end in :main');
.sub _main :main
     noop
.end
CODE
/_main:
  noop
  end
/
OUT

##############################
# parrot calling conventions
#
SKIP: {
    skip("PCC changes", 10);

pir_2_pasm_like(<<'CODE', <<'OUT', "invokecc");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg 10
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .param int a
    print a
    end
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  set I5, 10
  set P0, P16
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, 0
  savetop
  invokecc
ret:
  restoretop
  end
_sub:
  print I5
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "basic syntax - constants");
.sub _main
    .local Sub sub
    .local Continuation cc
    newsub sub, .Sub, _sub
    newsub cc, .Continuation, ret
    .pcc_begin
    .arg 10
    .arg 20
    .pcc_call sub, cc
    ret:
    .local int k
    .result k
    .pcc_end
    end
.end
.pcc_sub _sub
    .param int a
    .param int b
    .local int c
    c = a + b
    .pcc_begin_return
    .return c
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  newsub P17, \d+, _sub
  newsub P16, \d+, ret
@pcc_sub_call_\d:
  set I5, 10
  set I6, 20
  set P0, P17
  set P1, P16
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, -2
  updatecc
  savetop
  invoke
ret:
  restoretop
  set I16, I5
  end
_sub:
  add I16, I5, I6
@pcc_sub_ret_\d+:
  set I5, I16
  set I0, 1
  set I1, 1
  set I2, 0
  set I3, 0
  set I4, 0
  returncc
/
OUT

#######################
pir_2_pasm_is(<<'CODE', <<'OUT', "basic syntax - sym constants");
.sub _main
    print "ok 1\n"
    .const int x = 10
    .const float y = 20.0
    .pcc_begin
    .arg x
    .arg y
    .pcc_call P0, P1
    ret:
    .result I5
    .pcc_end
    print "ok 2\n"
    end
.end
CODE
_main:
  set P16, P1
  print "ok 1\n"
@pcc_sub_call_5:
  set I5, 10
  set N5, 20.0
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, -2
  updatecc
  savetop
  invoke
ret:
  restoretop
  print "ok 2\n"
  end
OUT

#######################
# initial test with register move
#
pir_2_pasm_like(<<'CODE', <<'OUT', "basic syntax - vars");
.sub _main
    .local int x
    .local int y
    x = 10
    y = 20
    .pcc_begin
    .arg x
    .arg y
    .pcc_call P0, P1
    ret:
    .local int res
    .result res
    .pcc_end
    end
.end
CODE
/_main:
  set P16, P1
  set I(\d+), 10
  set I(\d+), 20
@pcc_sub_call_\d:
  set I5, I\1
  set I6, I\2
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, -2
  updatecc
  savetop
  invoke
ret:
  restoretop
  set I16, I5
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "I,S");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg 10
    .arg $S0
    .pcc_call sub
    ret:
    .local int k
    .result k
    .pcc_end
    end
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  new P3,.*?
  set P3, 2
  push P3, 10
  push P3, S16
  set P0, P16
  set I0, 0
  set I1, 2
  set I2, 0
  set I3, -2
  savetop
  invokecc
ret:
  restoretop
  shift I16, P3
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "P");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg $P0
    .arg $P1
    .pcc_call sub
    ret:
    .local pmc k
    .result k
    .pcc_end
    end
.end
CODE
/_main:
  set P16, P1
  newsub P(\d+), \d+, _sub
@pcc_sub_call_\d:
  set P5, P\d+
  set P6, P\d+
  set P0, P\1
  set I0, 0
  set I1, 0
  set I2, 2
  set I3, -2
  savetop
  invokecc
ret:
  restoretop
  set P16, P5
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "invokecc");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg 10
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .param int a
    print a
    end
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  new P3,.*?
  set P3, 1
  push P3, 10
  set P0, P16
  set I0, 0
  set I1, 1
  set I2, 0
  set I3, 0
  savetop
  invokecc
ret:
  restoretop
  end
_sub:
  set I16, 1
  bsr @check_params
  set I16, -100
  bsr @check_param_type
  shift I16, P3
  print I16
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "invokecc");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg 10
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .param int a
    print a
    end
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  set I5, 10
  set P0, P16
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, 0
  savetop
  invokecc
ret:
  restoretop
  end
_sub:
  if I0, (\S+)
  set I16, 1
  bsr @check_params
  set I16, -100
  bsr @check_param_type
  shift I5, P3
  branch (\S*)
\1:
\2:
  print I5
  end/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "invokecc, P param");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .arg $P0
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .param Undef a
    print a
    end
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  set P5, P17
  set P0, P16
  set I0, 1
  set I1, 0
  set I2, 1
  set I3, 0
  savetop
  invokecc
ret:
  restoretop
  end
_sub:
  if I0, (\S+)
  set I16, 1
  bsr (\S+)
  branch (\S+)
\1:
\3:
  print P5
  end
\2:/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "sub multiple returns");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .pcc_begin
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .pcc_begin_return
    .return P16
    .pcc_end_return
    .pcc_begin_return
    .return P17
    .pcc_end_return
.end
CODE
/_main:
  set P16, P1
  newsub P16, \d+, _sub
@pcc_sub_call_\d:
  set P0, P16
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, 0
  savetop
  invokecc
ret:
  restoretop
  end
_sub:
@pcc_sub_ret_\d+:
  set P5, P16
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, 1
  set I4, 0
  returncc
@pcc_sub_ret_\d+:
  set P5, P17
  set I0, 1
  set I1, 0
  set I2, 0
  set I3, 1
  set I4, 0
  returncc
/
OUT

}
