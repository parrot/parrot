#!perl
use strict;
use TestCompiler tests => 6;

# these tests are run with -Oc by TestCompiler and show
# generated PASM code for call optimization

SKIP: {
    skip("PCC changes", 6);

##############################
# prototyped calls, invokecc
output_like(<<'CODE', <<'OUT', "in P param");
.sub _main
    .local Sub sub
    $P0 = new PerlUndef
    $P0 = 42
    newsub sub, .Sub, _sub
    .pcc_begin prototyped
    .arg $P0
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub prototyped
    .param PerlUndef a
    print a
    end
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
  null I3
  pushtopp
  invokecc
ret:
  poptopp
  end
_sub:
  print P5
  end/
OUT

output_like(<<'CODE', <<'OUT', "in, out P param");
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
  pushtopp
  invokecc
ret:
  poptopp
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
  invoke P1/
OUT

output_like(<<'CODE', <<'OUT', "in, out P param, P var");
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
  pushtopp
  invokecc
ret:
  poptopp
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
  invoke P1/
OUT

output_like(<<'CODE', <<'OUT', "in, out different P param");
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
  pushtopp
  invokecc
ret:
  poptopp
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
  invoke P1/
OUT

output_like(<<'CODE', <<'OUT', "in, out different P param, interfer");
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
  pushtopp
  invokecc
ret:
  poptopp
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
  invoke P1/
OUT

output_like(<<'CODE', <<'OUT', "tail call");
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
        pushtopp
        invokecc
ret:
        poptopp
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
        invoke P1
/
OUT

}
