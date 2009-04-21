#!parrot
# Copyright (C) 2006-2009, Parrot Foundation.


=head1 NAME

t/pmc/packfileannotations.t - test the PackfileAnnotations PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileannotations.t

=head1 DESCRIPTION

Tests the PackfileAnnotations PMC.

=cut

.include 't/pmc/testlib/packfile_common.pir'

.sub 'main' :main
.include 'test_more.pir'
    plan(14)
    test_sanity()
    test_handling_directory()
    test_unpack()
.end


# Packfile constructor
.sub 'test_sanity'
    .local pmc pf
    pf = new ['PackfileAnnotations']
    $I0 = defined pf
    ok($I0, "PackfileAnnotations created")
.end

# Annotations should propogate ConstantTable to Keys.
.sub 'test_handling_directory'
    .local pmc keys, anns, pfdir

    anns = new 'PackfileAnnotations'
    keys = anns.'get_key_list'()
    $I0 = defined keys
    ok($I0, "Keys created")
    $P0 = keys.'get_constant_table'()
    $I0 = defined $P0
    is($I0, 0, "    without ConstantTable")

    pfdir = new 'PackfileDirectory'
    $P0 = new 'PackfileConstantTable'
    # Order does matter
    pfdir['CONSTANTS'] = $P0
    pfdir['ANNOTATIONS'] = anns
    $P0 = keys.'get_constant_table'()
    $I0 = defined $P0
    ok($I0, 'PackfileConstantTable found and propogated to Keys')
.end

# PackfileAnnotations unpack from PBC
.sub 'test_unpack'
    .local pmc pf, pfdir, pfanns, it

    $P0 = open 't/native_pbc/annotations.pbc'
    $S0 = $P0.'readall'()
    pf = new 'Packfile'
    pf = $S0

    # Find annotations
    pfdir = pf.'get_directory'()
    it = iter pfdir
  loop:
    unless it goto fail
    $S0 = shift it
    $P0 = pfdir[$S0]
    $I0 = isa $P0, 'PackfileAnnotations'
    unless $I0 goto loop
    ok(1, "PackfileAnnotations unpacked")
    pfanns = $P0

    # Check keys
    .local pmc keys
    keys = pfanns.'get_key_list'()
    $I0 = elements keys
    is($I0, 3, 'Keys were successfully unpacked')

    $S0 = keys[0]
    is($S0, "file", "First key is correct")
    $S0 = keys[1]
    is($S0, "creator", "Second key is correct")
    $S0 = keys[2]
    is($S0, "line", "Third key is correct")

    # Test entities
    $I0 = elements pfanns
    is($I0, 4, "Annotations were unpack correctly")

    .local pmc a
    .local pmc constants
    constants = _find_segment_by_type(pf, "PackfileConstantTable")
    # "file"
    a = pfanns[0]
    $I0 = a
    $S0 = constants[$I0]
    is($S0, "annotations.pir", "First annotation is correct")

    # "creator"
    a = pfanns[1]
    $I0 = a
    $S0 = constants[$I0]
    is($S0, "Parrot Foundation", "Second annotation is correct")

    # Two "line"
    a = pfanns[2]
    $I0 = a
    is($I0, 1, "Third annotation is correct")
    a = pfanns[3]
    $I0 = a
    is($I0, 2, "Forth annotation is correct")


    .return()

  fail:
    nok(1, "PackfileAnnotations wasn't found in Directory")
    # BAIL_OUT
    skip(9, "PackfileAnnotations tests failed")
.end
