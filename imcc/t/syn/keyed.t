#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 1;

##############################
SKIP: {
  skip("experimental", 1);

pir_output_is(<<'CODE', <<'OUTPUT', "add_keyed");
.sub test @MAIN
    new P0, .Array
    new P1, .Array
    new P2, .Array
    P0 = 1
    P1 = 2
    P2 = 11
    set P1[1],  32
    set P2[10], 10
    add P0[0], P1[1], P2[10]
    set P4, P0[0]
    print P4
    print "\n"
    end
.end
CODE
42
OUTPUT
}
