#!perl

# $Id$

use strict;

use M4::Test tests => 2*7 + 2*1;

SKIP:
{
  skip( "strange in Parrot and in GNU m4", 2 );

  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-333333333333')
CODE
-333333333332
OUT

  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `5555555555555')
CODE
5555555555556
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-33333')
CODE
-33332
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-1')
CODE
0
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-0')
CODE
1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `0')
CODE
1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `+0')
CODE
1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `1')
CODE
2
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `55555')
CODE
55556
OUT
}
