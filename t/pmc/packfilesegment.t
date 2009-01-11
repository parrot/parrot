#!perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/pmc/packfilesegment.t - test the PackfileSegment PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilesegment.t

=head1 DESCRIPTION

Tests the PackfileSegment PMC.

=cut


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


# PackfileSegment.pack (via subclass PackfileDirectory)

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'set_integer_keyed_str' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $S0   = pfdir.'pack'()
    $I0   = length $S0
    eq $I0, 0, OUT1
    print "not "
    OUT1:
    say "equal"
.end
CODE
not equal
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
