# $Id$

use strict;
use warnings;
use lib qw( lib ../lib ../../lib m4/lib );

use Parrot::Test tests => 3;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
len(`0123SUBSTRINGaaaa')
CODE
17
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
len(`1')
CODE
1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
len(`')
CODE
0
OUT
}
