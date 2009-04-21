#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

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

.include 't/pmc/testlib/packfile_common.pir'
.sub 'main' :main
.include 'test_more.pir'
    plan(2)
    test_elements()
    test_get_integer()
.end

# PackfileRawSegment.elements
.sub 'test_elements'
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $P0   = iter pfdir
    $S0   = shift $P0
    pfseg = pfdir[$S0]
    $I0   = elements pfseg
    ok($I0, 'PackfileRawSegment contains some data')
.end

# PackfileRawSegment.get_integer_keyed_int
.sub 'test_get_integer'
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    $P0   = iter pfdir
    $S0   = shift $P0
    pfseg = pfdir[$S0]

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
    ok($I0, "PackfileRawSegment.get_integer_keyed_int returns some data")
.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
