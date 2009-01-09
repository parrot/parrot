#!perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;
use Parrot::Config;

=head1 NAME

t/pmc/packfiledirectory.t - test the PackfileDirectory PMC


=head1 SYNOPSIS

    % prove t/pmc/packfiledirectory.t

=head1 DESCRIPTION

Tests the PackfileDirectory PMC.

=cut


# PackfileDirectory.typeof

pir_output_is( <<'CODE', <<'OUT', 'get_directory' );
.sub 'test' :main
    .local pmc pf
    pf = new 'Packfile'
    $P1 = pf.'get_directory'()
    $S0 = typeof $P1
    say $S0
.end
CODE
PackfileDirectory
OUT


# common setup code for later tests

my $get_uuid_pbc = <<'EOF';

.sub _pbc
    .include "stat.pasm"
    .include "interpinfo.pasm"
    .local pmc pf, pio
    pf   = new 'Packfile'
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


# PackfileDirectory.elements

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'PackfileDirectory.elements' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    say $I0
.end
CODE
5
OUT


# PackfileDirectory.get_pmc_keyed_int

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'PackfileDirectory.get_pmc_keyed_int' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    $I1   = 0
    LOOP:
    $P0   = pfdir[$I1]
    $I2   = defined $P0
    eq $I2, 0, ERROR
    inc $I1
    eq $I0, $I1, DONE
    goto LOOP
    DONE:
    say "done"
    .return()
    ERROR:
    say "error"
.end
CODE
done
OUT


# PackfileDirectory.get_string_keyed_int
{
    my $EXPECTED = <<EXPECTED;
BYTECODE_runtime/parrot/library/uuid.pir
FIXUP_runtime/parrot/library/uuid.pir
CONSTANT_runtime/parrot/library/uuid.pir
PIC_idx_runtime/parrot/library/uuid.pir
BYTECODE_runtime/parrot/library/uuid.pir_DB
EXPECTED

    $EXPECTED =~ s/\//\\/g
        if $^O eq 'MSWin32';

    pir_output_is( <<'CODE' . $get_uuid_pbc, $EXPECTED, 'PackfileDirectory.get_string_keyed_int' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    $I1   = 0
    LOOP:
    $S0   = pfdir[$I1]
    say $S0
    inc $I1
    eq $I0, $I1, DONE
    goto LOOP
    DONE:
    .return()
.end
CODE
}


# PackfileDirectory.get_pmc_keyed_str

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'PackfileDirectory.get_pmc_keyed_str' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    $I1   = 0
    LOOP:
    $P0 = pfdir[$I1]
    $S1 = pfdir[$I1]
    $P1 = pfdir[$S1]
    $S0 = typeof $P0
    $S1 = typeof $P1
    eq $S0, $S1, GOOD
    goto ERROR
    GOOD:
    inc $I1
    eq $I0, $I1, DONE
    goto LOOP
    DONE:
    say 'good'
    .return()
    ERROR:
    say 'mismatch'
.end
CODE
good
OUT


# PackfileDirectory.set_pmc_keyed_str

pir_output_is( <<'CODE' . $get_uuid_pbc, <<'OUT', 'PackfileDirectory.set_pmc_keyed_str', todo => 'implement this' );
.sub 'test' :main
    .local pmc pf, pfdir
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $P0   = pfdir[0]
    $S0   = 'BYTECODE_foo'
    pfdir[$S0] = $P0
    $I0   = elements pfdir
    $I1   = 0
    LOOP:
    $S0   = pfdir[$I1]
    say $S0
    inc $I1
    eq $I0, $I1, DONE
    goto LOOP
    DONE:
    .return()
.end
CODE
BYTECODE_runtime/parrot/library/uuid.pir
FIXUP_runtime/parrot/library/uuid.pir
CONSTANT_runtime/parrot/library/uuid.pir
PIC_idx_runtime/parrot/library/uuid.pir
BYTECODE_runtime/parrot/library/uuid.pir_DB
BYTECODE_foo
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
