# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Parrot::Test::Regex;
use Regex;
use Regex::Driver;

use Test::More;

Parrot::Test::Regex::run_spec( \*DATA );


__END__
a+?
INPUT:
x
OUTPUT:
Match failed
INPUT:
a
OUTPUT:
Match found
0: 0..0
INPUT:
aaaaax
OUTPUT:
Match found
0: 0..4
INPUT:
aaaaa
OUTPUT:
Match found
0: 0..4
INPUT:
yaaaaaay!!!
OUTPUT:
Match found
0: 1..6
