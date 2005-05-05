# $Id$

use FindBin;
use lib "$FindBin::Bin/../lib";

use URM::Test tests => 3;

output_is(<< 'CODE', << 'OUT', 'echo single arg', 42);
in(r17); out(r17);
CODE
42
OUT

output_is(<< 'CODE', << 'OUT', 'echo 0', 0);
in(r17); out(r17);
CODE
0
OUT

# URM seems to have only a single output register
output_is(<< 'CODE', << 'OUT', 'echo 6 args ', 00, 11, 22, 33, 44, 55);
in(r17,r18,r19,r20,r21,r22);
out(r22);
CODE
55
OUT
