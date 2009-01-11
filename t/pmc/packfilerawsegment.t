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

t/pmc/packfilerawsegment.t - test the PackfileRawSegment PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilerawsegment.t

=head1 DESCRIPTION

Tests the PackfileRawSegment PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the value returned by elements() is greater than zero, and that
# get_integer_keyed_int doesn't return all zeroes either.


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


# PackfileRawSegment.elements

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'elements' );
.sub 'test' :main
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    pfseg = pfdir[0]
    $I0   = elements pfseg
    gt $I0, 0, DONE
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
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    pfseg = pfdir[0]
    $I0   = 0
    $I1   = pfseg[0]
    $I0   = $I0 + $I1
    $I1   = pfseg[1]
    $I0   = $I0 + $I1
    $I1   = pfseg[2]
    $I0   = $I0 + $I1
    $I1   = pfseg[3]
    $I0   = $I0 + $I1
    $I1   = pfseg[4]
    $I0   = $I0 + $I1
    gt $I0, 0, DONE
    say 'not '
    DONE:
    say 'greater'
.end
CODE
greater
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
