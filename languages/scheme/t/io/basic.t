#! perl -w
# $Id$

use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 2;

output_is(<<'CODE', '0', "basic write");
(write 0)
CODE

output_is(<<'CODE', '01', "basic write");
(write 0 1)
CODE
