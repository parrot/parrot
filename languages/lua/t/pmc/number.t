#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: number.t  $

=head1 NAME

t/pmc/number.t - LuaNumber

=head1 SYNOPSIS    

    % perl -I../../lib t/pmc/number.t

=head1 DESCRIPTION

Tests C<LuaNumber> PMC. 

=cut

use Parrot::Test tests => 6;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNumber"
    .local pmc pmc1
    pmc1 = new $I0                         
    .local int bool1
    bool1 = isa pmc1, "scalar"
    print bool1
    print "\n"
    bool1 = isa pmc1, "Float"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaNumber"
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
    find_type $I0, "LuaNumber"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "float"
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
    find_type $I0, "LuaNumber"
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
number
number
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNumber"
    .local pmc pmc1
    pmc1 = new $I0
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

pir_output_is(<< 'CODE', << 'OUTPUT', "check HLL");
.HLL "Lua", "lua_group"            
.sub _main
    .local pmc pmc1
    pmc1 = new .LuaNumber
    pmc1 = 3.14
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaNumber"
    print bool1
    print "\n"
    end
.end
CODE
3.14
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
    bool1 = isa pmc1, "LuaNumber"
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

