# $Id$

use strict;

use Parrot::Test tests => 1;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'simple define' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
undefine(  `foo')
In German foo is furcht.
CODE



In German foo is Hallo Welt.
OUT
}
