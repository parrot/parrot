#! perl -w
# $Id$

use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 22;

###
### Add
###

output_is(<<'CODE', 0, 'write (+)');
(write (+))
CODE

output_is(<<'CODE', 0, 'write (+ 0)');
(write (+ 0))
CODE

output_is(<<'CODE', 1, 'write (+ 1)');
(write (+ 1))
CODE

output_is(<<'CODE', 0, 'write (+ 0 0)');
(write (+ 0 0))
CODE

output_is(<<'CODE', 1, 'write (+ 0 1)');
(write (+ 0 1))
CODE

output_is(<<'CODE', 2, 'write (+ 0 1 1)');
(write (+ 0 1 1))
CODE

###
### Subtract
###

output_is(<<'CODE', 0, 'write (-)');
(write (-))
CODE

output_is(<<'CODE', 0, 'write (- 0)');
(write (- 0))
CODE

output_is(<<'CODE', -1, 'write (- 1)');
(write (- 1))
CODE

output_is(<<'CODE', 0, 'write (- 0 0)');
(write (- 0 0))
CODE

output_is(<<'CODE', -1, 'write (- 0 1)');
(write (- 0 1))
CODE

output_is(<<'CODE', -2, 'write (- 0 1 1)');
(write (- 0 1 1))
CODE

###
### Multiply
###

output_is(<<'CODE', 0, 'write (*)');
(write (*))
CODE

output_is(<<'CODE', 0, 'write (* 0)');
(write (* 0))
CODE

output_is(<<'CODE', 1, 'write (* 1)');
(write (* 1))
CODE

output_is(<<'CODE', 0, 'write (* 0 0)');
(write (* 0 0))
CODE

output_is(<<'CODE', 0, 'write (* 0 1)');
(write (* 0 1))
CODE

output_is(<<'CODE', 0, 'write (* 0 1 1)');
(write (* 0 1 1))
CODE

###
### Divide
###

output_is(<<'CODE', 1, 'reciprocal');
(write (/ 1))
CODE

output_is(<<'CODE', 1, '1/1');
(write (/ 1 1))
CODE

###
### Abs
###

output_is(<<'CODE', 5, 'abs 5');
(write (abs 5))
CODE

output_is(<<'CODE', 7, 'abs -7');
(write (abs -7))
CODE
