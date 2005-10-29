#!perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 2;

pir_output_is(<<'CODE', <<'OUT', "alligator");
# if the side-effect of newsub/continuation isn't
# detected this program prints "Hi\nalligator\n"

.sub main :main
    $P0 = new .String
    $P0 = "Hi\n"
    $I0 = 2
lab:
    print $P0
    dec $I0
    unless $I0 goto ex
    newsub $P1, .Continuation, lab
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
