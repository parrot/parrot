#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
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
.include 'packfile_segments.pasm'
.sub 'main' :main
.include 'test_more.pir'
    plan(7)
    test_elements()
    test_get_integer()
    test_push_integer()
    test_type()
.end

# PackfileRawSegment.elements
.sub 'test_elements'
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    pfseg = '_find_segment_by_prefix'(pf, 'BYTECODE')
    $I0   = elements pfseg
    ok($I0, 'PackfileRawSegment contains some data')
.end

# PackfileRawSegment.get_integer_keyed_int
.sub 'test_get_integer'
    .local pmc pf, pfdir, pfseg
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    pfseg = '_find_segment_by_prefix'(pf, 'BYTECODE')

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

# PackfileRawSegment.push_integer
.sub 'test_push_integer'
    .local pmc pfseg
    pfseg = new ['PackfileRawSegment']

    push pfseg, 0x1d1
    push pfseg, 0x002
    $I0 = pfseg[0]
    is($I0, 0x1d1, "PackfileRawSegment.push_integer (1)")
    $I0 = pfseg[1]
    is($I0, 0x002, "PackfileRawSegment.push_integer (2)")
.end

# PackfileRawSegment.type
.sub 'test_type'
    .local pmc pf, pfdir, pfseg, hash, it
    pf    = _pbc()
    pfdir = pf.'get_directory'()
    hash  = new ['Hash']
    # annotations.pbc contains all available segments. -1 for directory and unknown.
    # So, in hash we should have 5 elements.
    it = iter pfdir
  loop:
    unless it goto done
    $S0 = shift it
    $P0 = pfdir[$S0]
    $I0 = $P0.'type'()
    hash[$I0] = 1
    goto loop

  done:
    $I0 = elements hash
    is($I0, 4, "Got all types of Packfile segments")

    # Now create RawSegment and set type.
    $P0 = new ['PackfileRawSegment']
    $I0 = $P0.'type'()
    is($I0, .PF_BYTEC_SEG, "Default type is PF_BYTEC_SEG")

    $P0.'type'(.PF_DEBUG_SEG)
    $I0 = $P0.'type'()
    is($I0, .PF_DEBUG_SEG, "Type successfully changed")

.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
