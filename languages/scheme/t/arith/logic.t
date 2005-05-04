#! perl -w
# $Id$

use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 42;

###
### Zero?
###

output_is(<<'CODE', 1, 'write (zero? 0)');
(write (zero? 0))
CODE

output_is(<<'CODE', 0, 'write (zero? 2)');
(write (zero? 1))
CODE

###
### Positive?
###

output_is(<<'CODE', 0, 'write (positive? 0)');
(write (positive? 0))
CODE

output_is(<<'CODE', 1, 'write (positive? 2)');
(write (positive? 2))
CODE

output_is(<<'CODE', 0, 'write (positive? -3)');
(write (positive? -3))
CODE

###
### Negative?
###

output_is(<<'CODE', 0, 'write (negative? 0)');
(write (negative? 0))
CODE

output_is(<<'CODE', 0, 'write (negative? 2)');
(write (negative? 2))
CODE

output_is(<<'CODE', 1, 'write (negative? -3)');
(write (negative? -3))
CODE

###
### Odd?
###

output_is(<<'CODE', 0, 'write (odd? 0)');
(write (odd? 0))
CODE

output_is(<<'CODE', 1, 'write (odd? 1)');
(write (odd? 1))
CODE

output_is(<<'CODE', 0, 'write (odd? 2)');
(write (odd? 2))
CODE

output_is(<<'CODE', 1, 'write (odd? -3)');
(write (odd? -3))
CODE

###
### Even?
###

output_is(<<'CODE', 1, 'write (even? 0)');
(write (even? 0))
CODE

output_is(<<'CODE', 0, 'write (even? 1)');
(write (even? 1))
CODE

output_is(<<'CODE', 1, 'write (even? 2)');
(write (even? 2))
CODE

output_is(<<'CODE', 0, 'write (even? -3)');
(write (even? -3))
CODE

###
### Max
###

output_is(<<'CODE', 3, 'write (max 1 3))');
(write (max 1 3))
CODE

output_is(<<'CODE', 9, 'write (max 9 3 5))');
(write (max 9 3 5))
CODE

output_is(<<'CODE', 3, 'write (max 3 1))');
(write (max 3 1))
CODE

output_is(<<'CODE', 9, 'write (max 1 9 3))');
(write (max 1 9 3))
CODE

###
### Min
###

output_is(<<'CODE', 1, 'write (min 1 3))');
(write (min 1 3))
CODE

output_is(<<'CODE', 3, 'write (min 9 3 5))');
(write (min 9 3 5))
CODE

output_is(<<'CODE', 1, 'write (min 3 1))');
(write (min 3 1))
CODE

output_is(<<'CODE', 1, 'write (min 1 9 3))');
(write (min 1 9 3))
CODE

###
### Equal (=)
###

output_is(<<'CODE', 1, 'write (= 0 0))');
(write (= 0 0))
CODE

output_is(<<'CODE', 0, 'write (= 1 0))');
(write (= 1 0))
CODE

output_is(<<'CODE', 0, 'write (= 0 1))');
(write (= 0 1))
CODE

output_is(<<'CODE', 1, 'write (= 0 0 0))');
(write (= 0 0))
CODE

output_is(<<'CODE', 0, 'write (= 1 2 3))');
(write (= 1 0))
CODE

output_is(<<'CODE', 0, 'write (= 0 1 1))');
(write (= 0 1))
CODE

###
### Less (<)
###

output_is(<<'CODE', 1, 'write (< 0 1))');
(write (< 0 1))
CODE

output_is(<<'CODE', 0, 'write (< 1 1))');
(write (< 1 1))
CODE

output_is(<<'CODE', 1, 'write (< 0 1 2))');
(write (< 0 1 2))
CODE

output_is(<<'CODE', 0, 'write (< 1 1 1))');
(write (< 1 1 2))
CODE

###
### Greater (>)
###

output_is(<<'CODE', 1, 'write (> 1 0))');
(write (> 1 0))
CODE

output_is(<<'CODE', 0, 'write (> 1 1))');
(write (> 1 1))
CODE

output_is(<<'CODE', 1, 'write (> 2 1 0))');
(write (> 2 1 0))
CODE

#output_is(<<'CODE', 0, 'write (> 2 1 1))');
#(write (> 2 1 1))
#CODE

###
### LEQ (<=)
###

output_is(<<'CODE', 1, 'write (<= 0 0))');
(write (<= 0 0))
CODE

output_is(<<'CODE', 0, 'write (<= 1 0))');
(write (<= 1 0))
CODE

output_is(<<'CODE', 1, 'write (<= 1 2))');
(write (<= 1 2))
CODE

output_is(<<'CODE', 0, 'write (<= 2 1 0))');
(write (<= 2 1 0))
CODE

output_is(<<'CODE', 0, 'write (<= 2 1 1))');
(write (<= 2 1 1))
CODE

###
### GEQ (>=)
###
