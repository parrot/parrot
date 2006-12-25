#! perl
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

use warnings;
use t::pmc;

pir_output_is( << 'CODE', << 'OUTPUT', "a sub ought to be PugsCode" );
.HLL "Perl6", "pugs_group"

.sub main :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $S0 = typeof $P0
    print $S0
    print "\n"
    .const .Sub f = "foo"
    $S0 = typeof f
    print $S0
    print "\n"
    foo()
.end

.sub foo :outer('main')
    print "ok\n"
.end
CODE
Sub
PugsCode
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
