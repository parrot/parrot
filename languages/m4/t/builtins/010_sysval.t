# $Id$

use strict;

use Parrot::Test tests => 1 + 1;

SKIP:
{
  skip( "difference between running a process in a fork, or with system()", 1 );

  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`false')
sysval()
CODE

1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`true')
sysval()
CODE

0
OUT
}
