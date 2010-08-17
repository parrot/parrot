#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfiledirectory.t - test the PackfileDirectory PMC


=head1 SYNOPSIS

    % prove t/pmc/packfiledirectory.t

=head1 DESCRIPTION

Tests the PackfileDirectory PMC.

=cut

.include 't/pmc/testlib/packfile_common.pir'

.sub 'main' :main
.include 'test_more.pir'
    plan(20)

    'test_create'()
    'test_typeof'()
    'test_elements'()
    'test_get_iter'()
    'test_set_pmc_keyed_str'()
.end


# Test creation of fresh directory
.sub 'test_create'
    .local pmc dir, seg
    dir = new 'PackfileDirectory'
    isa_ok(dir, 'PackfileDirectory')

    seg = new 'PackfileRawSegment'
    # We should set owner
    $P0 = seg.'get_directory'()
    $I0 = defined $P0
    $I0 = not $I0
    ok($I0, "Owner of fresh segment unknown")

    dir['RAWSEGMENT'] = seg

    # We should set owner
    $P0 = seg.'get_directory'()
    $I0 = defined $P0
    ok($I0, "Owner of segment set correctly")
.end

# PackfileDirectory.typeof
.sub 'test_typeof'
    .local pmc pf
    pf = new ['Packfile']
    $P1 = pf.'get_directory'()
    isa_ok($P1, 'PackfileDirectory', 'PackfileDirectory.get_directory')
.end

# PackfileDirectory.elements
.sub 'test_elements'
    .local pmc pf, pfdir
    push_eh load_error
    pf    = _pbc()
    pop_eh
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    is($I0, 4, 'PackfileDirectory.elements')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'PackfileDirectory.elements')
    .return()
.end


# PackfileDirectory.get_iter
.sub 'test_get_iter'
    .local pmc pf, pfdir, it, expected
    .local string name

    # expected contains all expected segment "prefixes" with count
    expected = new 'Hash'
    expected["BYTECODE"] = 2
    expected["FIXUP"]    = 1
    expected["CONSTANT"] = 1

    push_eh load_error
    pf    = _pbc()
    pop_eh
    pfdir = pf.'get_directory'()
    $I0   = elements pfdir
    it    = iter pfdir
  loop:
    unless it goto done
    name = shift it

    # Get prefix
    $P0 = split '_', name
    $S0 = shift $P0
    $I0 = expected[$S0]
    ok($I0, $S0)
    # Decrease expectation count
    dec $I0
    expected[$S0] = $I0

    $P1 = pfdir[name]
    isa_ok($P1, 'PackfileSegment')
    $P2 = $P1.'get_directory'()
    $I0 = defined $P2
    ok($I0, "Loaded Segment has proper directory")
    goto loop
  done:
    .return ()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "can't run get_iter tests")
    skip(11, "can't run get_iter tests")
    .return()
.end

## PackfileDirectory.set_pmc_keyed_str
.sub 'test_set_pmc_keyed_str'
    .local pmc pf, pfdir, seg
    push_eh load_error
    pf    = _pbc()
    pop_eh
    pfdir = pf.'get_directory'()
    seg   = new [ 'PackfileRawSegment' ]

    # Adding segment with same name replaces old one
    $I0 = elements pfdir
    $P0 = iter pfdir
    $S0 = shift $P0
    pfdir[$S0] = seg
    $I1   = elements pfdir
    is($I0, $I1, "Segment with old name was added")

    # Add segment with new name
  add_new:
    seg = new [ 'PackfileRawSegment' ]
    $S0 = 'BYTECODE_foo'
    pfdir[$S0] = seg
    $I1   = elements pfdir
    inc $I0
    is($I0, $I1, "New segment added")

    # Remove that segment again
  delete_seg:
    delete pfdir[$S0]
    dec $I0
    $I1 = elements pfdir
    is($I0, $I1, "segment deleted")

  done:
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "Segment with old name was added")
    report_load_error($P0, "New segment added")
    report_load_error($P0, "segment deleted")
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
