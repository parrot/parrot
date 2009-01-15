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

t/pmc/packfilefixupentry.t - test the PackfileFixupEntry PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilefixupentry.t

=head1 DESCRIPTION

Tests the PackfileFixupEntry PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned seem sane.

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


# sanity check we start with a PackfileFixupTable

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'sanity1' );
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


# sanity check we end up with a PackfileFixupTable

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'sanity2' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable, pfentry
    .local string name
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[1]
    pfentry = pftable[0]
    name    = typeof pfentry
    say name
.end
CODE
PackfileFixupEntry
OUT


# PackfileFixupEntry methods .get_string(), .get_integer(), .get_type()

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'sanity' );
.sub 'test' :main
    .local pmc pf, pfdir, pftable, pfentry
    .local int size, this, data
    .local string name, label
    pf      = _pbc()
    pfdir   = pf.'get_directory'()
    pftable = pfdir[1]
    size    = elements pftable
    this    = 0
    LOOP:
    pfentry = pftable[this]
    name    = typeof pfentry
    eq name, "PackfileFixupEntry", NEXT
    print "PackfileFixupTable["
    print this
    print "] returned an object of type: "
    say name
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
