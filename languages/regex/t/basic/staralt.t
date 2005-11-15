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
a*|b
INPUT:
hello
OUTPUT:
Match found
0: 0..-1
INPUT:
angry cow
OUTPUT:
Match found
0: 0..0
INPUT:
aardvark
OUTPUT:
Match found
0: 0..1
