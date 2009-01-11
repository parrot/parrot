#!perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config;

=head1 NAME

t/pmc/packfileconstanttable.t - test the PackfileConstantTable PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileconstanttable.t

=head1 DESCRIPTION

Tests the PackfileConstantTable PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned from get_type look right, and that the corresponding
# fetches for the found types don't crash.


# common setup code for later tests

my $get_uuid_pbc = <<'EOF';

.sub _pbc
    .include "stat.pasm"
    .include "interpinfo.pasm"
    .local pmc pf, pio
    pf   = new ['Packfile']
    $S0  = interpinfo .INTERPINFO_RUNTIME_PREFIX
    $S0 .= "/runtime/parrot/library/uuid.pbc"
    $I0  = stat $S0, .STAT_FILESIZE
    pio  = open $S0, 'r'
    $S0  = read pio, $I0
    close pio
    pf   = $S0
    .return(pf)
.end
EOF


# PackfileConstantTable.elements

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'elements' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable
    .local int size
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[2]
    size    = elements pftable
    gt size, 0, DONE
    say 'not '
    DONE:
    say 'greater'
.end
CODE
greater
OUT


# PackfileRawSegment.get_integer_keyed_int

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'get_integer_keyed_int' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable
    .local int size, this, type
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[2]
    size    = elements pftable
    this    = 0
    LOOP:
    type = pftable.'get_type'(this)
    eq type, 0x00, NEXT
    eq type, 0x6E, CONST_NUM
    eq type, 0x73, CONST_STR
    eq type, 0x70, CONST_PMC
    eq type, 0x6B, CONST_KEY
    goto BAD
    CONST_NUM:
    $N0 = pftable[this]
    goto NEXT
    CONST_STR:
    $S0 = pftable[this]
    goto NEXT
    CONST_PMC:
    $P0 = pftable[this]
    goto NEXT
    CONST_KEY:
    $P0 = pftable[this]
    $S0 = typeof $P0
    eq $S0, 'Key', NEXT
    print 'constant Key with wrong type: '
    say $S0
    goto BAD
    NEXT:
    this = this + 1
    ge this, size, DONE
    goto LOOP
    gt size, 0, DONE
    BAD:
    say 'unknown constant type found!'
    DONE:
    say 'done.'
.end
CODE
done.
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
