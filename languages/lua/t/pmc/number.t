#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/number.t - LuaNumber

=head1 SYNOPSIS

    % perl t/pmc/number.t

=head1 DESCRIPTION

Tests C<LuaNumber> PMC
(implemented in F<languages/lua/src/pmc/luanumber.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 13;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    .local int bool1
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaNumber'
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
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    .local int bool1
    bool1 = does pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = does pmc1, 'float'
    print bool1
    print "\n"
    bool1 = does pmc1, 'no_interface'
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
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
number
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check set_integer_native' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    .local string str1
    pmc1 = new 'LuaNumber'
    pmc1 = 3.14
    str1 = typeof pmc1
    print str1
    print "\n"
    print pmc1
    print "\n"
    pmc1 = 2
    str1 = typeof pmc1
    print str1
    print "\n"
    print pmc1
    print "\n"
    end
.end
CODE
number
3.14
number
2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    pmc1 = 3.14
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    pmc1 = 0.0
    bool1 = istrue pmc1
    print bool1
    print "\n"
    end
.end
CODE
1
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check logical_not' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    pmc1 = 3.14
    .local pmc pmc2
    pmc2 = new 'LuaBoolean'
    pmc2 = not pmc1
    print pmc2
    print "\n"
    .local string str1
    str1 = typeof pmc2
    print str1
    print "\n"
    end
.end
CODE
false
boolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaNumber'
    pmc1 = 3.14
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaNumber'
    print bool1
    print "\n"
    end
.end
CODE
3.14
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL (autoboxing)' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = test()
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaNumber'
    print bool1
    print "\n"
.end
.sub test
    .return (3.14)
.end
CODE
3.14
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaNumber' cst1 = '3.14'
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, 'LuaNumber'
    print bool1
    print "\n"
.end
CODE
3.14
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check box float' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    box pmc1, 3.14
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaNumber'
    print bool1
    print "\n"
.end
CODE
3.14
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check box integer' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    box pmc1, -2
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaNumber'
    print bool1
    print "\n"
.end
CODE
-2
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaNumber' cst1 = '3.14'
    print cst1
    print "\n"
    $P0 = cst1.'tostring'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
3.14
3.14
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaNumber' cst1 = '3.14'
    print cst1
    print "\n"
    $P0 = cst1.'tonumber'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
3.14
3.14
number
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

