# $Id$

use strict;

use M4::Test tests => 2*1 + 1*1;

SKIP:
{
  skip( "difference between running a process in a fork, or with system()", 1 );

  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`false')
sysval()
CODE

1
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`true')
sysval()
CODE

0
OUT
}
