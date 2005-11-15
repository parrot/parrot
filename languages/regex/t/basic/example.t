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
(a*a|(aaa))a
INPUT:
xxxxxxxxaaabb
OUTPUT:
Match found
0: 8..10
1: 8..9
INPUT:
aaaaaaaaaaaa
OUTPUT:
Match found
0: 0..11
1: 0..10
INPUT:
xyz
OUTPUT:
Match failed
