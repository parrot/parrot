#!/usr/bin/perl
# Copyright (C) 2008, The Perl Foundation.
# $Id: 03-boolean.t 33314 2008-11-28 16:28:50Z bernhard $

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

language_output_is( 'JS', <<'CODE', <<'OUT', 'number var' );
var a = 1;
print(a);
CODE
1
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'string var' );
var b = "Hello";
print(b);
CODE
Hello
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'printing booleans' );
var c = 1.1;
print(c);
CODE
1.1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

