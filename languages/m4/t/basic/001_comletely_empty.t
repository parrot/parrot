#!perl

use strict;

use M4::Test tests => 2;

output_is( <<'CODE', <<'OUT', 'hello' );
CODE
OUT
