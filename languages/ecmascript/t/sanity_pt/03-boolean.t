#!/usr/bin/perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

language_output_is( 'JS', <<'CODE', <<'OUT', 'basic booleans' );
print(true == true);
print(false == false);
print(true == false);
print(false == true);
CODE
true
true
false
false
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'basic booleans', todo => 'get_integer on JSBoolean leads to eternal recursion' );
print(true + 1);
print(false + 1);
CODE
2
1
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'printing booleans' );
print(true);
print(false);
CODE
true
false
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

