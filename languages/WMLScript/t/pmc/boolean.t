#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: boolean.t 12840 2006-05-30 15:08:05Z coke $

=head1 NAME

t/pmc/boolean.t - WmlsBoolean

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/boolean.t

=head1 DESCRIPTION

Tests C<WmlsBoolean> PMC
(implemented in F<languages/WMLScript/pmc/wmlsboolean.pmc>).

=cut

use Parrot::Test tests => 9;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsBoolean"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "Boolean"
    print bool1
    print "\n"
    bool1 = isa pmc1, "WmlsBoolean"
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
    find_type $I0, "WmlsBoolean"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = does pmc1, "boolean"
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
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsBoolean"
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
WmlsBoolean
WmlsBoolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsBoolean"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = 0
    print pmc1
    print "\n"
    pmc1 = 1
    print pmc1
    print "\n"
    end
.end
CODE
false
true
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check clone' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsBoolean"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = 1
    .local pmc pmc2
    pmc2 = clone pmc1
    pmc1 = 0
    .local string str1
    str1 = classname pmc2
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
WmlsBoolean
true
false
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .WmlsBoolean
    pmc1 = 1
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "WmlsBoolean"
    print bool1
    print "\n"
    end
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check istrue' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsBoolean cst1 = "1"
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
true
true
WmlsBoolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsBoolean cst1 = "1"
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
true
3
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check defined' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsBoolean cst1 = "1"
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
true
true
WmlsBoolean
OUTPUT
