#!perl -w
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use Parrot::Test tests => 11;

pir_output_is(<<'CODE', <<'OUT', "alligator");
# if the side-effect of set_addr/continuation isn't
# detected this program prints "Hi\nalligator\n"

.sub main :main
    $P0 = new .String
    $P0 = "Hi\n"
    $I0 = 2
lab:
    print $P0
    dec $I0
    unless $I0 goto ex
    new $P1, .Continuation
    set_addr $P1, lab
    $P2 = find_name "alligator"
    set_args "(0)", $P1
    invokecc $P2
ex:
.end
.sub alligator
    get_params "(0)", $P0
    invokecc $P0
.end
CODE
Hi
Hi
OUT

pir_output_is(<<'CODE', <<'OUT', "alligator 2 - r9629");
.sub xyz
    .local pmc args
    args = new .ResizablePMCArray
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

pir_2_pasm_is(<<'CODE', <<'OUT', ":unique_reg");
.sub main
    .param int i :unique_reg
    .local int j :unique_reg
    .local int k :unique_reg
    i = 5
    j = 2
    k = j * 2
.end
CODE
# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392
main:
        get_params
        set I0, 5
        set I1, 2
        mul I2, I1, 2
        set_returns
        returncc
OUT

pir_output_is(<<'CODE', <<'OUT', "Explicit large register: S, PIR");
.sub main
  S32 = "ok\n"
  print S32
  print "\n"
.end
CODE
ok
OUT

pir_output_is(<<'CODE', <<'OUT', "Explicit large register: N, PIR");
.sub main
  N32 = 3.8
  print N32
  print "\n"
.end
CODE
3.8
OUT

pir_output_is(<<'CODE', <<'OUT', "Explicit large register: I, PIR");
.sub main
  I32 = 123
  print I32
  print "\n"
.end
CODE
123
OUT

pir_output_is(<<'CODE', <<'OUT', "Explicit large register: P, PIR");
.sub main
  P32 = new .String
  P32 = "ok\n"
  print P32
.end
CODE
ok
OUT

pasm_output_is(<<'CODE', <<'OUT', "Explicit large register: S, PASM");
  set S32, "ok\n"
  print S32
  end
CODE
ok
OUT

pasm_output_is(<<'CODE', <<'OUT', "Explicit large register: N, PASM");
  set N32, 3.8
  print N32
  print "\n"
  end
CODE
3.8
OUT

pasm_output_is(<<'CODE', <<'OUT', "Explicit large register: I, PASM");
  set I32, 123
  print I32
  print "\n"
  end
CODE
123
OUT

pasm_output_is(<<'CODE', <<'OUT', "Explicit large register: P, PASM");
  new P32, .String
  set P32, "ok\n"
  print P32
  end
CODE
ok
OUT
