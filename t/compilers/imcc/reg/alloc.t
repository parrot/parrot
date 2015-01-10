#!perl
# Copyright (C) 2005-2015, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 11;

pir_output_is( <<'CODE', <<'OUT', "alligator" );
# if the side-effect of set_label/continuation isn't
# detected this program prints "Hi\nalligator\n"

.sub main :main
    $P0 = new 'String'
    $P0 = "Hi\n"
    $I0 = 2
lab:
    print $P0
    dec $I0
    unless $I0 goto ex
    new $P1, 'Continuation'
    set_label $P1, lab
    $P2 = find_name "alligator"
    set_args "0", $P1
    invokecc $P2
ex:
.end
.sub alligator
    get_params "0", $P0
    invokecc $P0
.end
CODE
Hi
Hi
OUT

pir_output_is( <<'CODE', <<'OUT', "alligator 2 - r9629" );
.sub xyz :main
    .local pmc args
    args = new 'ResizablePMCArray'
    push args, "abc"
    push args, "def"
    push args, "POPME"

    $S0 = args[-1]
    if $S0 != "POPME" goto start
    # P0 used_once falsely deleted [GH #1036]
    $P0 = pop args
  start:
    $I1 = elements args
    $I0 = 0
  loop:
    if $I0 >= $I1 goto end
    $S0 = args[$I0]
    print $S0
    print "\n"
    inc $I0
    goto loop
  end:
.end
CODE
abc
def
OUT

pir_output_is( <<'CODE', <<'OUT', "Explicit large register: S, PIR" );
.sub main :main
  $S32 = "ok\n"
  print $S32
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "Explicit large register: N, PIR" );
.sub main :main
  $N32 = 3.8
  print $N32
  print "\n"
.end
CODE
3.8
OUT

pir_output_is( <<'CODE', <<'OUT', "Explicit large register: I, PIR" );
.sub main :main
  $I32 = 123
  print $I32
  print "\n"
.end
CODE
123
OUT

pir_output_is( <<'CODE', <<'OUT', "Explicit large register: P, PIR" );
.sub main :main
  $P32 = new 'String'
  $P32 = "ok\n"
  print $P32
.end
CODE
ok
OUT

pasm_output_is( <<'CODE', <<'OUT', "Explicit large register: S, PASM" );
.pcc_sub :main main:
  set S32, "ok\n"
  print S32
  end
CODE
ok
OUT

pasm_output_is( <<'CODE', <<'OUT', "Explicit large register: N, PASM" );
.pcc_sub :main main:
  set N32, 3.8
  print N32
  print "\n"
  end
CODE
3.8
OUT

pasm_output_is( <<'CODE', <<'OUT', "Explicit large register: I, PASM" );
.pcc_sub :main main:
  set I32, 123
  print I32
  print "\n"
  end
CODE
123
OUT

pasm_output_is( <<'CODE', <<'OUT', "Explicit large register: P, PASM" );
.pcc_sub :main main:
  new P32, 'String'
  set P32, "ok\n"
  print P32
  end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "Wrong regs_used[S], afl crash 3 - GH #1168" );
# src/call/context.c:713: failed assertion 'get_regs_used(interp, ctx, REGNO_STR) > idx'

.sub main :main
    $P1 = newclass "Foo11"
    $P2 = new "Foo11"
    $S1 = $P2
    eq $S1, 'stringy thingy', ok
  ok:
.end
.namespace [ "Foo11" ]
.sub 'get_string' :vtable
    end # <== this is the inserted statement, leading to the wrong n_regs_used[S]
.end
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
