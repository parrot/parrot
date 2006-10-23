#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/thread.t - LuaThread

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/thread.t

=head1 DESCRIPTION

Tests Lua C<thread> type
(implemented in F<languages/lua/lib/thread.pir>).

=cut

use strict;
use warnings;

use Parrot::Test tests => 8;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    .local int bool1
    bool1 = isa pmc1, "Parrot::Coroutine"
    print bool1
    print "\n"
    bool1 = isa pmc1, "thread"
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
1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check name' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    .local string str1
    str1 = classname pmc1
    print str1
    print "\n"
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
thread
OUTPUT

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    print pmc1
    print "\n"
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
/thread: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
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
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    .local pmc pmc2
    pmc2 = new .LuaBoolean
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

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    print pmc1
    print "\n"
    $P0 = pmc1."tostring"()
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
/thread: [0-9A-Fa-f]{8}\nthread: [0-9A-Fa-f]{8}\nstring/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    $P0 = pmc1."tonumber"()
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

TODO: {
local $TODO = 'pb with MMD function';

pir_output_like( << 'CODE', << 'OUTPUT', 'check __add' );
.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'

.sub '__start' :main
  load_bytecode 'languages/lua/lib/thread.pir'
  _main()
.end
.sub '_main'
    .const .LuaNumber cst1 = "3.14"
    .const .Sub F1 = "f1"
    find_type $I0, "thread"
    .local pmc pmc1
    pmc1 = new $I0, F1 
    $P0 = add pmc1, cst1
    end
.end
.sub 'f1'
    print "f1()\n"
    end
.end
CODE
/attempt to perform arithmetic on a thread value/
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

