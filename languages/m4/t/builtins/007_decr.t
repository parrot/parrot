#!perl

# $Id$

use strict;

use M4::Test tests => 2*7 + 2*1;

SKIP:
{
  skip( "strange in Parrot and in GNU m4", 2 );

  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-333333333333')
CODE
-333333333334
OUT

  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `5555555555555')
CODE
5555555555554
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-33333')
CODE
-33334
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-1')
CODE
-2
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-0')
CODE
-1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `0')
CODE
-1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `+0')
CODE
-1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `1')
CODE
0
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `55555')
CODE
55554
OUT
}
