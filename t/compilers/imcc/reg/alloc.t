#!perl
# Copyright (C) 2005-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 10;

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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
