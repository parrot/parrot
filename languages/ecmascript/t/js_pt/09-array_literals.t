#!/usr/bin/perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 2;

language_output_is( 'JS', <<'CODE', <<'OUT', 'array literal of strings', todo => 'NOTIMPLEMENTED' );
var digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
print(digits);
CODE
0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
OUT
language_output_is( 'JS', <<'CODE', <<'OUT', 'array literal of strings', todo => 'elision' );
var a = [,,,,1,2,,,,,,3,4,,,,,];
CODE
0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
