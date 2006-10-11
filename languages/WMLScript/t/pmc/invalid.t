#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/invalid.t - WmlsInvalid

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/invalid.t

=head1 DESCRIPTION

Tests C<WmlsInvalid> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinvalid.pmc>).

=cut

use strict;
use warnings;
use Parrot::Test tests => 9;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInvalid"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "Undef"
    print bool1
    print "\n"
    bool1 = isa pmc1, "WmlsInvalid"
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
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInvalid"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = does pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInvalid"
    .local pmc pmc1
    pmc1 = new $I0
    .local string str1
    str1 = classname pmc1
    print str1
    print "\n"
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
WmlsInvalid
WmlsInvalid
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInvalid"
    .local pmc pmc1
    pmc1 = new $I0
    print pmc1
    print "\n"
    end
.end
CODE
invalid
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check clone' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInvalid"
    .local pmc pmc1
    pmc1 = new $I0
    .local pmc pmc2
    pmc2 = clone pmc1
    .local string str1
    str1 = classname pmc2
    print str1
    print "\n"
    .local string str2
    str2 = pmc2
    print str2
    print "\n"
    end
.end
CODE
WmlsInvalid
invalid
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .WmlsInvalid
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "WmlsInvalid"
    print bool1
    print "\n"
    end
.end
CODE
invalid
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check istrue' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc cst1
    cst1 = new .WmlsInvalid
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
invalid
invalid
WmlsInvalid
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc cst1
    cst1 = new .WmlsInvalid
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
invalid
4
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check defined' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc cst1
    cst1 = new .WmlsInvalid
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
invalid
false
WmlsBoolean
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

