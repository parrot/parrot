# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 5;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'two valid defines' );
define( `foo',  `Hello World')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'space in substitution' );
define( `foo',  `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World  is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'space in substitution 2' );
define( `foo',                       `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World  is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'not a macro' );
define ( `foo',                       `Hello World ')
CODE
define ( foo,                       Hello World )
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'only one macro' );
define ( `foo',                       `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE
define ( foo,                       Hello World )

In German foo is Hallo Welt.
OUT
}
