# $Id$

use strict;

use M4::Test tests => 1*2;

{
  output_is( <<'CODE', <<'OUT', 'simple define' );
define(`foo', `Hello World')
ifdef(`foo', `f o o is defined', `f o o is not defined')
ifdef(`foo2', `f o o 2 is defined', `f o o 2 is not defined')
CODE

f o o is defined
f o o 2 is not defined
OUT
}
