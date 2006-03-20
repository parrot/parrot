#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/userdata.t - LuaUserdata

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/userdata.t

=head1 DESCRIPTION

Tests C<LuaUserdata> PMC
(implemented in F<languages/lua/pmc/luauserdata.pmc>).

=cut

use Parrot::Test tests => 9;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaUserdata"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "LuaBase"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaUserdata"
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
    find_type $I0, "LuaUserdata"
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check name");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaUserdata"
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
userdata
userdata
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "check get_string");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaUserdata"
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new $I0, val1
    print pmc1
    print "\n"
    end
.end
CODE
/userdata: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaUserdata"
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new $I0, val1
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
.end
CODE
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check logical_not");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaUserdata"
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new $I0, val1
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new .LuaUserdata, val1
    .local int bool1
    bool1 = isa pmc1, "LuaUserdata"
    print bool1
    print "\n"
    end
.end
CODE
1
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "check tostring");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new .LuaUserdata, val1
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
/userdata: [0-9A-Fa-f]{8}\nuserdata: [0-9A-Fa-f]{8}\nstring/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check tonumber");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc val1
    val1 = new .Array
    .local pmc pmc1
    pmc1 = new .LuaUserdata, val1
    $P0 = pmc1."tonumber"()
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

