#! perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/pmc/delegate.t - Method Delegation

=head1 SYNOPSIS

    % prove t/pmc/delegate.t

=head1 DESCRIPTION

Tests method delegation.

=cut

# basic functionality - setting and getting types

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate set_integer_native" );
    new P0, ['delegate']
    set P0, 42
    end
.namespace ["delegate"]
.pcc_sub :vtable set_integer_native:
    get_params "0,0", P2, I5
    # need a private store to keep state - we dont have that yet
    # for now check param passing
    print I5
    print "\n"
    # just return
    returncc
CODE
42
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate get_integer" );
    new P0, ['delegate']
    set I0, P0
    print I0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub :vtable get_integer:
    get_params "0", P2
    set I5, 42
    set_returns "0", I5
    returncc
CODE
42
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate set_string_native" );
    new P0, ['delegate']
    set P0, "fortytwo"
    end
.namespace ["delegate"]
.pcc_sub :vtable set_string_native:
    get_params "0,0", P2, S5
    print S5
    print "\n"
    returncc
CODE
fortytwo
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate get_string" );
    new P0, ['delegate']
    set S0, P0
    print S0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub :vtable get_string:
    get_params "0", P2
    set S5, "fortytwo"
    set_returns "0", S5
    returncc
CODE
fortytwo
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate set_number_native" );
    new P0, ['delegate']
    set P0, 47.11
    end
.namespace ["delegate"]
.pcc_sub :vtable set_number_native:
    get_params "0,0", P2,N5
    print N5
    print "\n"
    returncc
CODE
47.11
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate get_number" );
    new P0, ['delegate']
    set N0, P0
    print N0
    print "\n"
    end
.namespace ["delegate"]
.pcc_sub :vtable get_number:
    get_params "0", P2
    set N5, 47.11
    set_returns "0", N5
    returncc
CODE
47.11
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "delegate assign_pmc" );
    new P0, ['delegate']
    new P1, ['Integer']
    set P1, 42
    assign P0, P1
    end
.namespace ["delegate"]
.pcc_sub :vtable assign_pmc:
    get_params "0,0", P2, P5
    print P5
    print "\n"
    # just return
    returncc
CODE
42
OUTPUT

# math
pir_output_is( <<'CODE', <<'OUTPUT', "delegate add_p_p_i" );
.sub main
    $P0 = new ['delegate']
    set $P0, 1
    $P2 = new ['Integer']
    add $P2, $P0, 1
    print $P2   # yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub set_integer_native :vtable :method
    .param int i
    # just return
    print i
    print "\n"
    returncc
.end
.sub add_int :multi(pmc, int, pmc)
    .param pmc l
    .param int r
    .param pmc d
    print r
    print "\n"
    d = new ['Integer']
    d =  3
    .return(d)
.end
CODE
1
1
3
OUTPUT

# math
pir_output_is( <<'CODE', <<'OUTPUT', "delegate add_p_p_p" );
.sub main
    $P0 = new ['delegate']
    set $P0, 1
    $P1 = new ['Integer']
    set $P1, 1
    $P2 = new ['Integer']
    set $P2, 777
    add $P2, $P0, $P1
    print $P2   # yeah 1+1 = 3
    print "\n"
    end
.end
.namespace ["delegate"]
.sub set_integer_native :vtable :method
    .param int i
    # cant keep state yet
    # just print arg and return
    print i
    print "\n"
.end
.sub add :multi(delegate, pmc)
    .param pmc l
    .param pmc r
    .param pmc d
    print "in add\n"
    print l
    print "\n"
    print r
    print "\n"
    print d
    print "\n"
    d = 3
    .return (d)
.end
.sub get_string :vtable :method
    .return("one")
.end
CODE
1
in add
one
1
777
3
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
