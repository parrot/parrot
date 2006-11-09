#! perl -w
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/table.t - Lua Table

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/table.t

=head1 DESCRIPTION

Tests C<table> type
(implemented in F<languages/lua/lib/table.pir>).

=cut

use strict;
use warnings;

use Parrot::Test tests => 11;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'check inheritance' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isa pmc1, 'scalar'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'base_lua'
    print bool1
    print "\n"
    bool1 = isa pmc1, 'table'
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
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
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
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
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

pir_output_like( << 'CODE', << 'OUTPUT', 'check get_string' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    print pmc1
    print "\n"
    end
.end
CODE
/table: [0-9A-Fa-f]{8}/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check get_bool' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
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
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, 'LuaBoolean'
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

pir_output_is( << 'CODE', << 'OUTPUT', 'check key PMC' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, 'LuaString'
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    .local pmc val2
    val2 = new $I0
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

pir_output_like( << 'CODE', << 'OUTPUT', 'check key nil' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, 'LuaString'
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    find_type $I0, 'LuaNil'
    .local pmc nil
    nil = new $I0
    pmc1[nil] = val1
    end
.end
CODE
/table index is nil/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check deletion by assignment of nil' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
    find_type $I0, 'LuaString'
    .local pmc val1
    val1 = new $I0
    val1 = "value1"
    .local pmc val2
    val2 = new $I0
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
    find_type $I0, 'LuaNil'
    .local pmc nil
    nil = new $I0
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

pir_output_like( << 'CODE', << 'OUTPUT', 'check tostring' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
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
/table: [0-9A-Fa-f]{8}\ntable: [0-9A-Fa-f]{8}\nstring/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'check tonumber' );
.sub _main
    load_bytecode 'languages/lua/type/table.pbc'
    find_type $I0, 'table'
    .local pmc pmc1
    pmc1 = new $I0
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

