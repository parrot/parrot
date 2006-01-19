#! perl -w
# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/function.t - LuaFunction

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/function.t

=head1 DESCRIPTION

Tests C<LuaFunction> PMC
(implemented in F<languages/lua/pmc/luafunction.pmc>).

=cut

use Parrot::Test tests => 8;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaFunction"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = isa pmc1, "Sub"
    print bool1
    print "\n"
    bool1 = isa pmc1, "Closure"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaFunction"
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check interface");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaFunction"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "sub"
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
    find_type $I0, "LuaFunction"
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
.sub f1
    print "f1()\n"
    end
.end
CODE
function
function
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "check get_string");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaFunction"
    .local pmc pmc1
    pmc1 = new $I0
    print pmc1
    print "\n"
    end
.end
CODE
/function: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaFunction"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    .const .Sub F1 = "f1"
    pmc1 = F1
    bool1 = istrue pmc1
    print bool1
    print "\n"
#    .local string str1
#    str1 = classname pmc1
#    print str1
#    print "\n"
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check logical_not");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaFunction"
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

TODO: {
local $TODO = "not implemented.";

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaFunction
#    .const .LuaFunction F1 = "f1"
    .const .Sub F1 = "f1"
    pmc1 = F1
    .local int bool1
    bool1 = isa pmc1, "LuaFunction"
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
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL (autoboxing)");
.HLL "Lua", "lua_group"
.sub _main
    .local pmc pmc1
    pmc1 = test()
    .local int bool1
    bool1 = isa pmc1, "LuaFunction"
    print bool1
    print "\n"
.end
.sub test
    .const .Sub T = "test"
    .return (T)
.end
CODE
1
OUTPUT

}

