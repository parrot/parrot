#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: nil.t  $

=head1 NAME

t/pmc/nil.t - LuaNil

=head1 SYNOPSIS    

    % perl -I../../lib t/pmc/nil.t

=head1 DESCRIPTION

Tests C<LuaNil> PMC. 

=cut

use Parrot::Test tests => 8;
use Test::More;

pir_output_is(<< 'CODE', << 'OUTPUT', "check inheritance");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0                         
    .local int bool1
    bool1 = isa pmc1, "None"
    print bool1
    print "\n"
    bool1 = isa pmc1, "LuaNil"
    print bool1
    print "\n"
    end
.end
CODE
1
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check interface");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = does pmc1, "scalar"
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
    find_type $I0, "LuaNil"
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
nil
nil
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_string");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0
    print pmc1
    print "\n"
    end
.end
CODE
nil
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_repr");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0
    .local string str1
    str1 = get_repr pmc1
    print str1
    print "\n"
    end
.end
CODE
nil
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check get_bool");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0
    .local int bool1
    bool1 = isfalse pmc1
    print bool1
    print "\n"
    end
.end
CODE
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check singleton");
.sub _main
    loadlib P1, "lua_group"
    find_type $I0, "LuaNil"
    .local pmc pmc1
    pmc1 = new $I0
    .local pmc pmc2
    pmc2 = new $I0
    .local int bool1
    bool1 = iseq pmc1, pmc2
    print bool1
    print "\n"
    bool1 = issame pmc1, pmc2
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
    pmc1 = new .LuaNil
    print pmc1
    print "\n"
    .local int bool1
    bool1 = isa pmc1, "LuaNil"
    print bool1
    print "\n"
    end
.end
CODE
nil
1
OUTPUT


