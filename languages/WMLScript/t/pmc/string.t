#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/string.t - WmlsString

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/string.t

=head1 DESCRIPTION

Tests C<WmlsString> PMC
(implemented in F<languages/WMLScript/pmc/wmlsstring.pmc>).

=cut

use Parrot::Test tests => 12;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsString"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "String"
    print bool1
    print "\n"
    bool1 = isa pmc1, "WmlsString"
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
    find_type $I0, "WmlsString"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = does pmc1, "string"
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
    find_type $I0, "WmlsString"
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
WmlsString
WmlsString
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check clone' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsString"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = "str"
    .local pmc pmc2
    pmc2 = clone pmc1
    pmc1 = "STR"
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
WmlsString
str
STR
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsString"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = "str"
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    pmc1 = ""
    bool1 = istrue pmc1
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check embedded zero' );
.sub _main
    loadlib P1, "wmls_group"
    find_type $I0, "WmlsString"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = "embe\0_dd\0_ed\0"
    .local int len1
    len1 = elements pmc1
    print len1
    print "\n"
.end
CODE
13
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .WmlsString
    pmc1 = "simple string"
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "WmlsString"
    print bool1
    print "\n"
    end
.end
CODE
simple string
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsString cst1 = "simple string"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "WmlsString"
    print bool1
    print "\n"
.end
CODE
simple string
1
OUTPUT

TODO: {
local $TODO = 'empty string not handled by PIR.';

pir_output_is( << 'CODE', << 'OUTPUT', '.const & empty string' );
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsString cst1 = ""
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "WmlsString"
    print bool1
    print "\n"
.end
CODE

1
OUTPUT
}

pir_output_is( << 'CODE', << 'OUTPUT', 'check istrue' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsString cst1 = "simple string"
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
simple string
true
WmlsBoolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check typeof' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsString cst1 = "simple string"
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
simple string
2
WmlsInteger
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check defined' );
.loadlib "wmls_ops"
.HLL "WMLScript", "wmls_group"
.sub _main
    .const .WmlsString cst1 = "simple string"
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
simple string
true
WmlsBoolean
OUTPUT

