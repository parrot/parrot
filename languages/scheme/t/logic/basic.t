#! perl -w
# $Id$

use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 7;

###
### If
###

output_is(<<'CODE', 1,'basic if - Fail');
(write (if (= 1 1) 1 0))
CODE

output_is(<<'CODE', 1,'basic if - Pass');
(write (if (= 0 1) 0 1))
CODE

output_is(<<'CODE', 7,'slightly more complex if');
(write (if (= 9 9) 7 -23))
CODE

###
### And
###

output_is(<<'CODE', 1,'basic and - Pass');
(write (and 1 1))
CODE

output_is(<<'CODE', 0,'basic and - Fail');
(write (and 0 1))
CODE

###
### Or
###

output_is(<<'CODE', 1,'basic or - Pass');
(write (or 1 1))
CODE

output_is(<<'CODE', 0,'basic or - Fail');
(write (or 0 0))
CODE

