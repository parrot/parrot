#!perl

# $Id$

use strict;

use M4::Test tests => 2*3;

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
format(`012345SUB')
CODE
012345SUB
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
format( `The string "%s" is "%d" codepoints long.', `012345', `6')
CODE
The string "012345" is "6" codepoints long.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
format(`Pi is about %3.3f', `3.14')
CODE
Pi is about 3.140
OUT
}
