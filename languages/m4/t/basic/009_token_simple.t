#!perl

# $Id$

use strict;

use M4::Test tests => 10;

{
  output_is( <<'CODE', <<'OUT', 'simple substitution' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')

In German foo is furcht.
CODE



In German Hello World is Hallo Welt.
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'simple chars' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
ßßäö
In German foo is furcht.
CODE


ßßäö
In German Hello World is Hallo Welt.
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'digits in front of words' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
ßßäö
In German 1foo is 2furcht.
CODE


ßßäö
In German 1Hello World is 2Hallo Welt.
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'a comment in line' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
ßßäö
In German 1foo is #2furcht.
CODE


ßßäö
In German 1Hello World is #2furcht.
OUT
}
{
  output_is( <<'CODE', <<'OUT', 'hiding a define' );
#define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
ßßäö
In German 1foo is #2furcht.
CODE
#define(`foo', `Hello World')

ßßäö
In German 1foo is #2furcht.
OUT
}
