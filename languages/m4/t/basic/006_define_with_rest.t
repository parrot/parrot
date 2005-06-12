# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 2;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
define(`foo', `Hello World, heute ist der 15. August')
define(`furcht', `Hallo Welt')sagt regina und fangt Fliegen
In German foo is furcht.
CODE

sagt regina und fangt Fliegen
In German Hello World, heute ist der 15. August is Hallo Welt.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
:::asdf
define(`foo', `Hello World, heute ist der 15. August')
define(`furcht', `Hallo Welt')sagt regina und fangt Fliegen
In German foo is furcht.
CODE
:::asdf

sagt regina und fangt Fliegen
In German Hello World, heute ist der 15. August is Hallo Welt.
OUT
}
