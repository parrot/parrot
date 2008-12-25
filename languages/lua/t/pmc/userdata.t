#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/userdata.t - Lua Userdata

=head1 SYNOPSIS

    % perl t/pmc/userdata.t

=head1 DESCRIPTION

Tests C<userdata> type
(implemented in F<languages/lua/src/pmc/luauserdata.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 9;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    .local int bool1
    bool1 = isa pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaUserdata'
    print bool1
    print "\n"
    end
.end
CODE
0
1
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check interface' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    .local int bool1
    bool1 = does pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = does pmc1, 'no_interface'
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
userdata
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
    print pmc1
    print "\n"
    end
.end
CODE
/^userdata: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
.end
CODE
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check logical_not' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
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
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
    .local int bool1
    bool1 = isa pmc1, 'LuaUserdata'
    print bool1
    print "\n"
    end
.end
CODE
1
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
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
userdata:\s[0-9A-Fa-f]{8}\n
userdata:\s[0-9A-Fa-f]{8}\n
string\n
/x
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'lua'
.loadlib 'lua_group'
.sub _main
    .local pmc val1
    val1 = new 'Array'
    .local pmc pmc1
    pmc1 = new 'LuaUserdata'
    setattribute pmc1, 'data', val1
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

