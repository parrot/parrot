# $Id$

use strict;

use Parrot::Test tests => 1;

language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
Hello World!
This m4 input contains no macro calls.
This m4 input contains three empty lines.


This m4 input contains a line with only whitespace.
   			
The last line is empty.

CODE
Hello World!
This m4 input contains no macro calls.
This m4 input contains three empty lines.


This m4 input contains a line with only whitespace.
   			
The last line is empty.

OUT
