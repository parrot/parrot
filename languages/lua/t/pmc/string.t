#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/string.t - LuaString

=head1 SYNOPSIS

    % perl t/pmc/string.t

=head1 DESCRIPTION

Tests C<LuaString> PMC
(implemented in F<languages/lua/src/pmc/luastring.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 15;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaString'
    .local int bool1
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaString'
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
    pmc1 = new 'LuaString'
    .local int bool1
    bool1 = does pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = does pmc1, 'string'
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
    pmc1 = new 'LuaString'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaString'
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check logical_not' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "str"
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check embedded zero' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "embe\0_dd\0_ed\0"
    .local int len1
    len1 = elements pmc1
    print len1
    print "\n"
.end
CODE
13
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "simple string"
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaString'
    print bool1
    print "\n"
    end
.end
CODE
simple string
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL (autoboxing)' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = test()
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaString'
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaString' cst1 = "simple string"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, 'LuaString'
    print bool1
    print "\n"
.end
CODE
simple string
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', '.const & empty string' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaString' cst1 = ''
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, 'LuaString'
    print bool1
    print "\n"
.end
CODE

1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check box' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    box pmc1, "simple string"
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaString'
    print bool1
    print "\n"
.end
CODE
simple string
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check is_equal (RT #60292)' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    new $P1, 'LuaString'
    set $P1, 'str'
    new $P2, 'LuaString'
    set $P2, 'str'
    $I0 = iseq $P1, $P2
    print $I0
    print "\n"
.end
CODE
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "value"
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
value
value
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "3.14"
    print pmc1
    print "\n"
    $P0 = pmc1.'tonumber'()
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check tobase' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaString'
    pmc1 = "111"
    print pmc1
    print "\n"
    $P0 = pmc1.'tobase'(2)
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

