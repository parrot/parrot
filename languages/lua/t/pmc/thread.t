#! perl
# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/thread.t - Lua thread

=head1 SYNOPSIS

    % perl t/pmc/thread.t

=head1 DESCRIPTION

Tests Lua C<thread> type
(implemented in F<languages/lua/src/pmc/luathread.pmc>).

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 9;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub '__start' :main
    loadlib $P0, 'lua_group'
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    .local int bool1
    bool1 = isa pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaAny'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'LuaThread'
    print bool1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
0
1
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.sub '__start' :main
    loadlib $P0, 'lua_group'
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    .local string str1
    str1 = typeof pmc1
    print str1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
thread
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub '__start' :main
    loadlib $P0, 'lua_group'
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    print pmc1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
/^thread: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub '__start' :main
    loadlib $P0, 'lua_group'
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    .local int bool1
    bool1 = istrue pmc1
    print bool1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check logical_not' );
.HLL 'lua'
.loadlib 'lua_group'

.sub '__start' :main
    loadlib $P0, 'lua_group'
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
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
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
false
boolean
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check HLL' );
.HLL 'lua'
.loadlib 'lua_group'
.sub '__start' :main
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub _main
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    .local int bool1
    bool1 = isa pmc1, 'LuaThread'
    print bool1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
1
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.HLL 'lua'
.loadlib 'lua_group'
.sub '__start' :main
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    print pmc1
    print "\n"
    $P0 = pmc1.'tostring'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
/^
thread:\s[0-9A-Fa-f]{8}\n
thread:\s[0-9A-Fa-f]{8}\n
string\n
/x
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.HLL 'lua'
.loadlib 'lua_group'
.sub '__start' :main
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    $P0 = pmc1.'tonumber'()
    print $P0
    print "\n"
    $S0 = typeof $P0
    print $S0
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
nil
nil
OUTPUT

pir_error_output_like( << 'CODE', << 'OUTPUT', 'check __add' );
.HLL 'lua'
.loadlib 'lua_group'
.sub '__start' :main
    load_bytecode 'Parrot/Coroutine.pbc'
    _main()
.end
.sub '_main'
    .const 'LuaNumber' cst1 = '3.14'
    .const 'Sub' F1 = 'f1'
    .local pmc pmc1
    pmc1 = new 'LuaThread', F1
    $P0 = add pmc1, cst1
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
/^attempt to perform arithmetic on a thread value/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

