#! perl
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/integer.t - WmlsInteger

=head1 SYNOPSIS

    % perl t/pmc/integer.t

=head1 DESCRIPTION

Tests C<WmlsInteger> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinteger.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 11;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P1, "wmls_group"
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    .local int bool1
    bool1 = isa pmc1, "Integer"
    print bool1
    print "\n"
    bool1 = isa pmc1, "WmlsInteger"
    print bool1
    print "\n"
    end
.end
CODE
1
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check interface' );
.sub _main
    loadlib $P1, "wmls_group"
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    .local int bool1
    bool1 = does pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = does pmc1, "integer"
    print bool1
    print "\n"
    bool1 = does pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib $P1, "wmls_group"
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check clone' );
.sub _main
    loadlib $P1, "wmls_group"
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    pmc1 = 10
    .local pmc pmc2
    pmc2 = clone pmc1
    pmc1 = -5
    .local string str1
    str1 = typeof pmc2
    print str1
    print "\n"
    .local string str2
    str2 = pmc2
    print str2
    print "\n"
    str1 = pmc1
    print str1
    print "\n"
    end
.end
CODE
WmlsInteger
10
-5
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib $P1, "wmls_group"
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    pmc1 = 42
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    pmc1 = 0
    bool1 = istrue pmc1
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL "WMLScript"
.loadlib "wmls_group"
.sub _main
    .local pmc pmc1
    pmc1 = new "WmlsInteger"
    pmc1 = 42
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "WmlsInteger"
    print bool1
    print "\n"
    end
.end
CODE
42
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL "WMLScript"
.loadlib "wmls_group"
.sub _main
    .const "WmlsInteger" cst1 = "42"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "WmlsInteger"
    print bool1
    print "\n"
.end
CODE
42
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check istrue' );
.HLL "WMLScript"
.loadlib "wmls_group"
.loadlib "wmls_ops"
.sub _main
    .const "WmlsInteger" cst1 = "42"
    print cst1
    print "\n"
    $P0 = istrue cst1
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
42
true
WmlsBoolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.HLL "WMLScript"
.loadlib "wmls_group"
.loadlib "wmls_ops"
.sub _main
    .const "WmlsInteger" cst1 = "42"
    print cst1
    print "\n"
    $P0 = typeof cst1
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
42
0
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check defined' );
.HLL "WMLScript"
.loadlib "wmls_group"
.loadlib "wmls_ops"
.sub _main
    .const "WmlsInteger" cst1 = "42"
    print cst1
    print "\n"
    $P0 = defined cst1
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
42
true
WmlsBoolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check box' );
.HLL "WMLScript"
.loadlib "wmls_group"
.loadlib "wmls_ops"
.sub _main
    $P0 = box 42
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
42
WmlsInteger
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

