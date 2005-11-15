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
a?
INPUT:

OUTPUT:
Match found
0: 0..-1
INPUT:
a
OUTPUT:
Match found
0: 0..0
INPUT:
aa
OUTPUT:
Match found
0: 0..0
INPUT:
disappear
OUTPUT:
Match found
0: 0..-1
