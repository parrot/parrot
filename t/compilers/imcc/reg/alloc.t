#!perl
# Copyright (C) 2005-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 2;

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
    $P2($P1)
ex:
.end
.sub alligator
    .param pmc func
    func()
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
