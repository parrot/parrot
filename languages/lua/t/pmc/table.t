#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/table.t - LuaTable

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/table.t

=head1 DESCRIPTION

Tests C<LuaTable> PMC
(implemented in F<languages/lua/pmc/luatable.pmc>).

=cut

use Parrot::Test tests => 10;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = isa pmc1, "Hash"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaTable"
    print bool1
    print "\n"
    end
.end
CODE
0
1
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check interface");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "hash"
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
    find_type $I0, "LuaTable"
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
table
table
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "check get_string");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    pmc1["key"] = "value"
    print pmc1
    print "\n"
    end
.end
CODE
/table: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    pmc1["key"] = "value"
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
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check key PMC");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, "LuaString"
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    .local pmc val2
    val2 = new $I0
    val2 = "value2"
    pmc1[val1] = val1
    pmc1[val2] = val2
    .local pmc ret
    ret = pmc1[val1]
    print ret
    print "\n"
    ret = pmc1[val2]
    print ret
    print "\n"
    ret = pmc1[pmc1]
    print ret
    print "\n"
    end
.end
CODE
value1
value2
nil
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "check key nil");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, "LuaString"
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    find_type $I0, "LuaNil"
    .local pmc nil
    nil = new $I0
    pmc1[nil] = val1
    end
.end
CODE
/table index is nil/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check deletion by assignment of nil");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaTable"
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, "LuaString"
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    .local pmc val2
    val2 = new $I0
    val2 = "value2"
    .local int nb1
    nb1 = elements pmc1
    print nb1
    print "\n"
    pmc1[val1] = val1
    nb1 = elements pmc1
    print nb1
    print "\n"
    pmc1[val2] = val2
    nb1 = elements pmc1
    print nb1
    print "\n"
    find_type $I0, "LuaNil"
    .local pmc nil
    nil = new $I0
    pmc1[val1] = nil
    nb1 = elements pmc1
    print nb1
    print "\n"
    end
.end
CODE
0
1
2
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaTable
    .local int bool1
    bool1 = isa pmc1, "LuaTable"
    print bool1
    print "\n"
    end
.end
CODE
1
OUTPUT
