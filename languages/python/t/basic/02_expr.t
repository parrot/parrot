# $Id$

use strict;

use Parrot::Test tests => 5;

language_output_is( 'python', <<'CODE', '', 'subtract' );
print 1-2-3-4
CODE

language_output_is( 'python', <<'CODE', '', 'add' );
print 1+2+3+4
CODE

language_output_is( 'python', <<'CODE', '', 'add P' );
a=41
print a+1
CODE

language_output_is( 'python', <<'CODE', '', 'add P, sub' );
a=41
print a+1-2-3
CODE

language_output_is( 'python', <<'CODE', '', 'assign twice' );
a=41
a=1-2-3
print a
CODE
