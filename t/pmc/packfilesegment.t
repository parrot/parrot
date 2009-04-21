#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfilesegment.t - test the PackfileSegment PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilesegment.t

=head1 DESCRIPTION

Tests the PackfileSegment PMC.

=cut

.sub 'test' :main
.include 'test_more.pir'
    plan(1)

    $P0 = new 'PackfileSegment'
    isa_ok($P0, 'PackfileSegment')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
