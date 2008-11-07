#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/function.t - LuaFunction

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/function.t

=head1 DESCRIPTION

Tests C<LuaFunction> PMC
(implemented in F<languages/lua/src/pmc/luafunction.pmc>).

=cut

use strict;
use warnings;

use Parrot::Test tests => 11;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    .local int bool1
    bool1 = isa pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'Sub'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'Closure'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaFunction'
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check interface' );
.sub _main
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    .local int bool1
    bool1 = does pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = does pmc1, 'sub'
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
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
.sub f1
    print "f1()\n"
    end
.end
CODE
function
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    print pmc1
    print "\n"
    end
.end
CODE
/^function: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    .const 'Sub' F1 = 'f1'
    pmc1 = F1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    end
.end
.sub f1
    print "f1()\n"
    end
.end
CODE
1
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check logical_not' );
.sub _main
    loadlib P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
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
.HLL 'Lua', 'lua_group'
.sub _main
#    .const 'LuaFunction' F1 = 'f1'
    .const 'Sub' pmc1 = 'f1'
    .local int bool1
    bool1 = isa pmc1, 'LuaFunction'
    print bool1
    print "\n"
    pmc1()
    end
.end
.sub f1
    print "f1()\n"
    .return ()
.end
CODE
1
f1()
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL (autoboxing)' );
.HLL 'Lua', 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = test()
    .local int bool1
    bool1 = isa pmc1, 'LuaFunction'
    print bool1
    print "\n"
.end
.sub test
    .const 'Sub' T = 'test'
    .return (T)
.end
CODE
1
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'Lua', 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    print pmc1
    print "\n"
    $P0 = pmc1.'tostring'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
/^
function:\s[0-9A-Fa-f]{8}\n
function:\s[0-9A-Fa-f]{8}\n
string\n
/x
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'Lua', 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaFunction'
    $P0 = pmc1.'tonumber'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
nil
nil
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'load from pbc' );
.HLL 'Lua', 'lua_group'
.sub __start :main
    load_bytecode 'languages/lua/src/lib/luaaux.pbc'
    load_bytecode 'languages/lua/src/lib/luabasic.pbc'
    $P0 = get_hll_global ['basic'], 'luaopen_basic'
    $P0()
    _main()
.end
.sub _main :anon
    .local pmc tmp_0
    tmp_0 = get_hll_global '_G'
    .const 'LuaString' cst_1 = 'print'
    .local pmc tmp_1
    tmp_1 = tmp_0[cst_1]
    tmp_1(tmp_1)
.end
CODE
/^function: [0-9A-Fa-f]{8}/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

