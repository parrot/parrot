# $Id$

use strict;

use Parrot::Test tests => 5;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'simple substitution' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')

In German foo is furcht.
CODE



In German Hello World is Hallo Welt.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'simple chars' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World is Hallo Welt.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'digits in front of words' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German 1foo is 2furcht.
CODE


In German 1Hello World is 2Hallo Welt.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'a comment in line' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
A commented out define # define(`no comment', `Kein Kommentar')
In German 1foo is #2furcht.
CODE


A commented out define # define(`no comment', `Kein Kommentar')
In German 1Hello World is #2furcht.
OUT
}
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'hiding a define' );
#define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German 1foo is #2furcht.
CODE
#define(`foo', `Hello World')

In German 1foo is #2furcht.
OUT
}
