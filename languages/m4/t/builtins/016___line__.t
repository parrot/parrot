# $Id$

use strict;

use Parrot::Test tests => 1;

SKIP:
{
  skip( "builtin macro __line__ is not implemented yet", 1 );
  language_output_is( 'm4', <<'CODE', <<'OUT', '__line__' );
1
2
__line__
4
CODE
1
2
3
4
OUT
}
