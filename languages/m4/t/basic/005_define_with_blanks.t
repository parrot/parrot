#!perl

# $Id$

use strict;

use M4::Test tests => 4*2;

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define( `foo',  `Hello World')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define( `foo',  `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World  is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define( `foo',                       `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World  is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define ( `foo',                       `Hello World ')
define(`furcht',       `Hallo Welt')
In German foo is furcht.
CODE
define ( foo,                       Hello World )

In German foo is Hallo Welt.
OUT
}
