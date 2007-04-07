#!perl

use strict;
use warnings;
use lib qw( . ../../../lib);
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 4;

pir_output_is( <<'CODE', <<'OUTPUT', "simple sub" );
.sub test
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "sub with flags" );
.sub test :main
.end

.sub test :main :load :init
.end

.sub test :main, :load, :init
.end


.sub X :anon
.end

CODE
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "parameters" );
.sub main
.end

.sub test
	.param int i
	.param num n
	.param pmc p
	.param string s
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "parameters and flags" );
.sub main
.end
.sub test
	.param int i :optional
	.param int o :opt_flag
	.param pmc args :slurpy
	.param pmc n :named('x')
	.param pmc m :named("y")
.end
CODE
OUTPUT




# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
