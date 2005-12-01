#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: table.t  $

=head1 NAME

t/pmc/table.t - LuaTable

=head1 SYNOPSIS    

	% perl -I../../lib t/pmc/table.t

=head1 DESCRIPTION

Tests C<LuaTable> PMC. 

=cut

use Parrot::Test tests => 4;
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


