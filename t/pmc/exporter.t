#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/exporter.t - test the Exporter PMC

=head1 SYNOPSIS

    % prove t/pmc/exporter.t

=head1 DESCRIPTION

Tests the Exporter PMC.

=cut

# L<PDD17/Exporter PMC>
# TODO fix smartlinks once this is specced
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new .Exporter
    say 'ok 1 - $P0 = new .Exporter'

    $I0 = isa $P0, 'Exporter'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'Exporter'"
.end
CODE
ok 1 - $P0 = new .Exporter
ok 2 - isa $P0, 'Exporter'
OUT


pir_output_is( <<'CODE', <<'OUT', 'globals' );
.sub 'test' :main
    $P0 = new .Exporter

    $P1 = $P0.'globals'()
.end
CODE
OUT


## TODO add more tests as this is documented and implemented

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
