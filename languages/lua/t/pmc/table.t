#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/table.t - Lua Table

=head1 SYNOPSIS

    % perl t/pmc/table.t

=head1 DESCRIPTION

Tests C<table> type
(implemented in F<languages/lua/src/pmc/luatable.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 14;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local int bool1
    bool1 = isa pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaTable'
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
    pmc1 = new 'LuaTable'
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
0
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
CODE
table
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    print pmc1
    print "\n"
    end
.end
CODE
/^table: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
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
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check key PMC' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local pmc val1
    val1 = new 'LuaString'
    val1 = "value1"
    .local pmc val2
    val2 = new 'LuaString'
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

pir_error_output_like( << 'CODE', << 'OUTPUT', 'check key nil' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local pmc val1
    val1 = new 'LuaString'
    val1 = "value1"
    .local pmc nil
    nil = new 'LuaNil'
    pmc1[nil] = val1
    end
.end
CODE
/^table index is nil/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check deletion by assignment of nil' );
.sub _main
    loadlib $P0, 'lua_group'
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local pmc val1
    val1 = new 'LuaString'
    val1 = "value1"
    .local pmc val2
    val2 = new 'LuaString'
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
    .local pmc nil
    nil = new 'LuaNil'
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local int bool1
    bool1 = isa pmc1, 'LuaTable'
    print bool1
    print "\n"
    end
.end
CODE
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check len' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local pmc key1
    key1 = new 'LuaNumber'
    set key1, 1
    .local pmc val1
    val1 = new 'LuaString'
    set val1, "value1"
    pmc1[key1] = val1
    inc key1
    .local pmc val2
    val2 = new 'LuaString'
    set val2, "value2"
    pmc1[key1] = val2
    inc key1
    .local pmc val3
    val3 = new 'LuaString'
    set val3, "value3"
    pmc1[key1] = val3
    inc key1
    .local pmc val4
    val4 = new 'LuaString'
    set val4, "value4"
    pmc1[key1] = val4
    .local pmc len
    len = pmc1.'len'()
    print len
    print "\n"
    val3 = new 'LuaNil'
    dec key1
    pmc1[key1] = val3
    len = pmc1.'len'()
    print len
    print "\n"
    end
.end
CODE
4
2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check next' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaTable'
    .local pmc key1
    key1 = new 'LuaNumber'
    set key1, 1
    .local pmc val1
    val1 = new 'LuaString'
    set val1, "value1"
    pmc1[key1] = val1
    inc key1
    .local pmc val2
    val2 = new 'LuaString'
    set val2, "value2"
    pmc1[key1] = val2
    inc key1
    .local pmc val3
    val3 = new 'LuaString'
    set val3, "value3"
    pmc1[key1] = val3
    .local pmc nil
    nil = new 'LuaNil'
    .local pmc pmc2, key
    $P0 = pmc1.'next'(nil)
    key = $P0[0]
    pmc2 = $P0[1]
    print pmc2
    print "\n"
    $P0 = pmc1.'next'(key)
    key = $P0[0]
    pmc2 = $P0[1]
    print pmc2
    print "\n"
    $P0 = pmc1.'next'(key)
    key = $P0[0]
    pmc2 = $P0[1]
    print pmc2
    print "\n"
    $P0 = pmc1.'next'(key)
    print $P0
    print "\n"
    end
.end
CODE
value1
value2
value3
nil
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaTable'
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
table:\s[0-9A-Fa-f]{8}\n
table:\s[0-9A-Fa-f]{8}\n
string\n
/x
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'Lua'
.loadlib 'lua_group'
.sub _main
    .local pmc pmc1
    pmc1 = new 'LuaTable'
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

