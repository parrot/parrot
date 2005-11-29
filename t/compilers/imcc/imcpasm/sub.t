#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 2;

##############################
pir_2_pasm_like(<<'CODE', <<'OUT', "non-constant dest bsr, invoke");
.sub _main
    $P26 = new Sub
    $I15 = addr _sub1
    $P26 = $I15
    invokecc $P26
    ret
_sub1:
    ret
.end
CODE
/^# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html\?id=32392
_main:
 new P(\d+), \d+ # \.Sub
 set_addr I(\d+), _sub1
 set P\1, I\2
 invokecc P\1
 ret
_sub1:
 ret/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "nonlocal bsr");
.sub _main
    $P26 = new Sub
    $I15 = addr _f
    $P26 = $I15
    invokecc $P26
    ret
.end
.sub _f
    ret
.end
CODE
/^# IMCC does produce b0rken PASM files
# see http://guest@rt.perl.org/rt3/Ticket/Display.html\?id=32392
_main:
 new P(\d+), \d+ # \.Sub
 set_addr I(\d+), _f
 set P\1, I\2
 invokecc P\1
 ret
_f:
 ret/
OUT
