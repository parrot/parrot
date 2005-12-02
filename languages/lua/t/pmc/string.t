#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: string.t  $

=head1 NAME

t/pmc/string.t - LuaString

=head1 SYNOPSIS    

    % perl -I../../lib t/pmc/string.t

=head1 DESCRIPTION

Tests C<LuaString> PMC. 

=cut

use Parrot::Test tests => 6;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
    .local pmc pmc1
    pmc1 = new $I0                         
    .local int bool1
    bool1 = isa pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = isa pmc1, "String"
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
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check interface");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaString"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
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


