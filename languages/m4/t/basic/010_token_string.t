# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 2;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')

In German `foo' is furcht.
CODE



In German foo is Hallo Welt.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In `German foo is furcht.
another line in a string'
CODE


In German foo is furcht.
another line in a string
OUT
}
