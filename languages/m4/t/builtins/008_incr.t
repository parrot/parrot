# $Id$

use strict;

use Parrot::Test tests => 7 + 2;

SKIP:
{
  skip( "strange in Parrot and in GNU m4", 2 );

  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-333333333333')
CODE
-333333333332
OUT

  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `5555555555555')
CODE
5555555555556
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-33333')
CODE
-33332
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-1')
CODE
0
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `-0')
CODE
1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `0')
CODE
1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `+0')
CODE
1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `1')
CODE
2
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
incr(  `55555')
CODE
55556
OUT
}
