#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/boolean.t - LuaBoolean

=head1 SYNOPSIS

    % perl t/pmc/boolean.t

=head1 DESCRIPTION

Tests C<LuaBoolean> PMC
(implemented in F<languages/lua/src/pmc/luaboolean.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 8;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
    .local int bool1
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaBoolean'
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
    pmc1 = new 'LuaBoolean'
    .local int bool1
    bool1 = does pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = does pmc1, 'boolean'
    print bool1
    print "\n"
    bool1 = does pmc1, 'integer'
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
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
boolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib $P1, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
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
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
    pmc1 = 1
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, 'LuaBoolean'
    print bool1
    print "\n"
    end
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL & .const' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .const 'LuaBoolean' cst1 = "1"
    print cst1
    print "\n"
    .local int bool1
    bool1 = isa cst1, 'LuaBoolean'
    print bool1
    print "\n"
.end
CODE
true
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
    pmc1 = 1
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
true
true
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaBoolean'
    pmc1 = 1
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
true
nil
nil
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

