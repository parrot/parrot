# $Id$

use strict;

use M4::Test tests => 1*2;

output_is( <<'CODE', <<'OUT', 'hello' );

Hello World



Hallo Welt
CODE

Hello World



Hallo Welt
OUT
