#!perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;
use Parrot::Config;

=head1 NAME

t/pmc/packfilefixuptable.t - test the PackfileFixupTable PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilefixuptable.t

=head1 DESCRIPTION

Tests the PackfileFixupTable PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned have the right types.


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


# sanity check we have a PackfileFixupTable

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'sanity' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable
    .local string name
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[1]
    name    = typeof pftable
    say name
.end
CODE
PackfileFixupTable
OUT


# PackfileFixupTable.elements

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'elements' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable
    .local int size
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[1]
    size    = elements pftable
    gt size, 0, DONE
    say 'not '
    DONE:
    say 'greater'
.end
CODE
greater
OUT


# PackfileFixupTable.get_pmc_keyed_int

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'get_pmc_keyed_int' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable, pfentry
    .local int size, this
    .local string type
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[1]
    size    = elements pftable
    this    = 0
    LOOP:
    pfentry = pftable[this]
    type    = typeof pfentry
    eq type, "PackfileFixupEntry", NEXT
    print "PackfileFixupTable["
    print this
    print "] returned an object of type: "
    say type
    goto DONE
    NEXT:
    this = this + 1
    ge this, size, DONE
    goto LOOP
    gt size, 0, DONE
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
