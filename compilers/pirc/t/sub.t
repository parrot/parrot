#!perl

use strict;
use warnings;
use lib qw( . ../../../lib);
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 2;

pir_output_is( <<'CODE', <<'OUTPUT', "simple sub" );
.sub test :main

.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "simple sub with flag" );
.sub test :main

.end
CODE
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
