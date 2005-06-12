# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 7 + 2;

SKIP:
{
  skip( "strange in Parrot and in GNU m4", 2 );

  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-333333333333')
CODE
-333333333334
OUT

  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `5555555555555')
CODE
5555555555554
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-33333')
CODE
-33334
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-1')
CODE
-2
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `-0')
CODE
-1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `0')
CODE
-1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `+0')
CODE
-1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `1')
CODE
0
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
decr(  `55555')
CODE
55554
OUT
}
