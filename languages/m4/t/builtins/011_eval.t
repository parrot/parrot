# $Id$

use strict;

use Parrot::Test tests => 1;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
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

