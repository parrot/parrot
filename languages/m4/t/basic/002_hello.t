# $Id$

use strict;

use M4::Test tests => 2*1;

output_is( <<'CODE', <<'OUT', 'hello' );
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
