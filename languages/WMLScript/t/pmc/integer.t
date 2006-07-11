#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: integer.t 12840 2006-05-30 15:08:05Z coke $

=head1 NAME

t/pmc/integer.t - WmlsInteger

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/integer.t

=head1 DESCRIPTION

Tests C<WmlsInteger> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinteger.pmc>).

=cut

use Parrot::Test tests => 8;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInteger"
    .local pmc pmc1
    pmc1 = new $I0
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
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInteger"
    .local pmc pmc1
    pmc1 = new $I0
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
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInteger"
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
WmlsInteger
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsInteger"
    .local pmc pmc1
    pmc1 = new $I0
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
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .WmlsInteger
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
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsInteger cst1 = "42"
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsInteger cst1 = "42"
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
42
0
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check isvalid' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsInteger cst1 = "42"
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
42
true
WmlsBoolean
OUTPUT

