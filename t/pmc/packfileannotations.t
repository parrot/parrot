#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$


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
    plan(17)
    test_sanity()
    test_unpack()
    test_pack_unpack()
.end


# Packfile constructor
.sub 'test_sanity'
    .local pmc pf
    pf = new ['PackfileAnnotations']
    $I0 = defined pf
    ok($I0, "PackfileAnnotations created")
.end

# PackfileAnnotations unpack from PBC
.sub 'test_unpack'
    .local pmc pf

    push_eh load_error
    $P0 = new ['FileHandle']
    $P0.'open'('t/native_pbc/annotations.pbc', 'r')
    $P0.'encoding'('binary')
    $S0 = $P0.'readall'()
    pf = new 'Packfile'
    pf = $S0
    pop_eh
    .tailcall '!test_unpack'(pf)
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "PackfileAnnotations unpack failed to load test file")
    skip(7, "PackfileAnnotations unpack tests failed")
    .return()
.end

# Programatically create PBC same as t/native_pbc/annotations.pbc and check unpack of it.
.sub 'test_pack_unpack'
    .local pmc pf, pfdir
    pf = new 'Packfile'
    pfdir = pf.'get_directory'()
    #$P0 = new 'PackfileConstantTable'
    #$P0[0] = 42.0
    $P0 = new 'PackfileFixupTable'
    pfdir["FIXUP_t/pmc/packfileannotations.t"] = $P0

    $P1 = new 'PackfileRawSegment'
    pfdir["BYTECODE_t/pmc/packfileannotations.t"] = $P1

    $P2 = new 'PackfileConstantTable'
    pfdir["CONSTANTS_t/pmc/packfileannotations.t"] = $P2

    .local pmc anns
    anns = new 'PackfileAnnotations'
    # We have to add it to Directory before doing anything to handle Constants properly
    pfdir["BYTECODE_t/pmc/packfileannotations.t_ANN"] = anns

    $P3 = new 'PackfileAnnotation'
    $P3.'set_name'('file')
    $P3 = 'annotations.pir'
    anns[0] = $P3

    $P4 = new 'PackfileAnnotation'
    $P4.'set_name'('creator')
    $P4 = 'Parrot Foundation'
    anns[1] = $P4

    $P5 = new 'PackfileAnnotation'
    $P5.'set_name'('line')
    $P5 = 1
    anns[2] = $P5

    $P6 = new 'PackfileAnnotation'
    $P6.'set_name'('line')
    $P6 = 2
    anns[3] = $P6

    # Pack
    $S0 = pf
    pf = new 'Packfile'
    pf = $S0
    .tailcall '!test_unpack'(pf)
.end

.sub '!test_unpack'
    .param pmc pf
    .local pmc pfdir, pfanns, it

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

    # Test entities
    $I0 = elements pfanns
    is($I0, 4, "Annotations were unpack correctly")

    .local pmc a
    .local pmc constants
    constants = _find_segment_by_type(pf, "PackfileConstantTable")
    # "file"
    a = pfanns[0]
    $S0 = a.'get_name'()
    is($S0, "file", "First annotation's name unpacked")
    $S0 = a
    is($S0, "annotations.pir", "First annotation's value is correct")

    # "creator"
    a = pfanns[1]
    $S0 = a.'get_name'()
    is($S0, "creator", "Second annotation's name unpacked")
    $S0 = a
    is($S0, "Parrot Foundation", "Second annotation's value is correct")

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
    skip(7, "PackfileAnnotations tests failed")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
