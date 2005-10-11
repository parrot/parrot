#!perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 1;

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
