# $Id$

use strict;

use M4::Test tests => 1*2;

{
  output_is( <<'CODE', <<'OUT', 'simple define' );
ifelse(`equal', `equal', `the first two arguments are equal', `the first two arguments are not equal')
ifelse(`not_equal', `not equal', `the first two arguments are equal', `the first two arguments are not equal')
ifelse(
This 
is
a 
multi 
line 
comment
)no comment
CODE
the first two arguments are equal
the first two arguments are not equal
no comment
OUT
}
