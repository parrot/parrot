#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/string.t - LuaString

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/string.t

=head1 DESCRIPTION

Tests C<LuaString> PMC
(implemented in F<languages/lua/pmc/luastring.pmc>).

=cut

use Parrot::Test tests => 13;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "LuaBase"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaString"
    print bool1
    print "\n"
    end
.end
CODE
1
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check interface");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check name");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
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
string
string
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
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
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check logical_not");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1 = "str"
    find_type $I0, "LuaBoolean"
    .local pmc pmc2
    pmc2 = new $I0
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check embedded zero");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaString
    pmc1 = "simple string"
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaString"
    print bool1
    print "\n"
    end
.end
CODE
simple string
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL (autoboxing)");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = test()
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaString"
    print bool1
    print "\n"
.end
.sub test
    .return ("simple string")
.end
CODE
simple string
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL & .const");
.HLL "Lua", "lua_group"
.sub _main
    .const .LuaString cst1 = "simple string"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "LuaString"
    print bool1
    print "\n"
.end
CODE
simple string
1
OUTPUT

TODO: {
local $TODO = "empty string not handled by PIR.";

pir_output_is(<< 'CODE', << 'OUTPUT', ".const & empty string");
.HLL "Lua", "lua_group"
.sub _main
    .const .LuaString cst1 = ""
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, "LuaString"
    print bool1
    print "\n"
.end
CODE

1
OUTPUT
}

pir_output_is(<< 'CODE', << 'OUTPUT', "check tostring");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaString
    pmc1 = "value"
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
value
value
string
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check tonumber");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaString
    pmc1 = "3.14"
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
3.14
3.14
number
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check tobase");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaString
    pmc1 = "111"
    print pmc1
    print "\n"
    $P0 = pmc1."tobase"(2)
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
.end
CODE
111
7
number
OUTPUT

