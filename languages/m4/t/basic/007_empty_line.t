# $Id$

use strict;

use Parrot::Test tests => 1;

language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );

Hello World



Hallo Welt
CODE

Hello World



Hallo Welt
OUT
