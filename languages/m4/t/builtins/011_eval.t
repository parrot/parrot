# $Id$

use strict;

use M4::Test tests => 1*2;

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
eval(   `4')
eval(   `0')
eval(   `-4')
eval(   `-0')
eval(   ` 1 + 1 ' )
eval(   ` 42 + -43 ' )
CODE
4
0
-4
0
2
-1
OUT
}

