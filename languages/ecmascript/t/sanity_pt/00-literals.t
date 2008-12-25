#!/usr/bin/perl
# Copyright (C) 2008, The Perl Foundation.
# $Id: 03-boolean.t 33314 2008-11-28 16:28:50Z bernhard $

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

language_output_is( 'JS', <<'CODE', <<'OUT', 'number literals' );
print(1);
print(-1);
print(100);
print(-100);
print(0);
CODE
1
-1
100
-100
0
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'string literals' );
print("Hello");
print("Bye");
CODE
Hello
Bye
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', 'float literals' );
print(1.0);
print(1.1);
CODE
1
1.1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

