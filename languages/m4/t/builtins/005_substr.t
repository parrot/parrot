#!perl

# $Id$

use strict;

use M4::Test tests => 2*4;

{
  output_is( <<'CODE', <<'OUT', 'substring at end of string' );
substr(`012345SUB', `6')
CODE
SUB
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
substr(`012345SUB', `0')
CODE
012345SUB
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
substr(`012345SUB', `1', `1')
CODE
1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
substr(`012345SUB', `1', `2')
CODE
12
OUT
}

