#!perl

# $Id$

use strict;

use M4::Test tests => 2*3;

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
len(`0123SUBSTRINGaaaa')
CODE
17
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
len(`1')
CODE
1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
len(`')
CODE
0
OUT
}
