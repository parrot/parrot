#!perl

# $Id$

use strict;

use M4::Test tests => 4;

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')

In German `foo' is furcht.
CODE



In German foo is Hallo Welt.
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'hello' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
ßßäö
In `German foo is furcht.
another line in a string'
CODE


ßßäö
In German foo is furcht.
another line in a string
OUT
}
