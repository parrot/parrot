#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/boolean.t - LuaBoolean

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/boolean.t

=head1 DESCRIPTION

Tests C<LuaBoolean> PMC
(implemented in F<languages/lua/pmc/luaboolean.pmc>).

=cut

use Parrot::Test tests => 9;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaBoolean"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "LuaBase"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaBoolean"
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
    loadlib P1, "lua_group"
    find_type $I0, "LuaBoolean"
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
    loadlib P1, "lua_group"
    find_type $I0, "LuaBoolean"
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
boolean
boolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaBoolean"
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaBoolean
    pmc1 = 1
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaBoolean"
    print bool1
    print "\n"
    end
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL (autoboxing)' );
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = test()
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaBoolean"
    print bool1
    print "\n"
.end
.sub test
    .return (1)
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL "Lua", "lua_group"
.sub _main
    .const .LuaBoolean cst1 = "1"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "LuaBoolean"
    print bool1
    print "\n"
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaBoolean
    pmc1 = 1
    print pmc1
    print "\n"
    $P0 = pmc1."tostring"()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
true
true
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaBoolean
    pmc1 = 1
    print pmc1
    print "\n"
    $P0 = pmc1."tonumber"()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
true
nil
nil
OUTPUT

