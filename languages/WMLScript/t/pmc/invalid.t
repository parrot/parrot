#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: invalid.t 12840 2006-05-30 15:08:05Z coke $

=head1 NAME

t/pmc/invalid.t - WmlsInvalid

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/invalid.t

=head1 DESCRIPTION

Tests C<WmlsInvalid> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinvalid.pmc>).

=cut

use Parrot::Test tests => 7;
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc cst1
    cst1 = new .WmlsInvalid
    print cst1
    print "\n"
    $P0 = cst1.typeof()
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check isvalid' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc cst1
    cst1 = new .WmlsInvalid
    print cst1
    print "\n"
    $P0 = cst1.isvalid()
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
