#!parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

t/pmc/packfileannotationkeys.t - test the PackfileAnnotationKeys PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileannotationkeys.t

=head1 DESCRIPTION

Tests the PackfileAnnotationKeys PMC.

=cut

.include 'packfile_annotation_key_type.pasm'
.include 't/pmc/testlib/packfile_common.pir'

# Packfile constructor
.sub 'test' :main
.include 'test_more.pir'
    plan(14)
    
    test_sanity()
    test_pack_unpack()

.end

# Sanity test for creating PackfileAnnotationKeys
.sub 'test_sanity'
    .local pmc pf
    pf = new ['PackfileAnnotationKeys']
    $I0 = defined pf
    ok($I0, "PackfileAnnotationKeys created")
.end

# Pack PackfileAnnotationKeys
.sub 'test_pack_unpack'
    .local pmc pf, pfdir, ctable, annotations, keys

    pf = new 'Packfile'
    pfdir = pf.'get_directory'()

    # Fixup table and Bytecode is mandatory
    $P0 = new 'PackfileFixupTable'
    pfdir["FIXUP_t/pmc/packfileannotationkeys.t"] = $P0
    $P1 = new 'PackfileRawSegment'
    pfdir["BYTECODE_t/pmc/packfileannotationkeys.t"] = $P1

    ctable = new 'PackfileConstantTable'
    pfdir["CONSTANT_t/pmc/packfileannotationkeys.t"] = ctable

    # Annotation associated with bytecode by interesting
    annotations = new 'PackfileAnnotations'
    pfdir["BYTECODE_t/pmc/packfileannotationkeys.t_ANN"] = annotations

    # Initialize kyes
    keys = annotations.'get_key_list'()
    keys[0] = "line"
    keys[0] = .PF_ANNOTATION_KEY_TYPE_INT
    
    # Set couple of annotations
    $P0 = new 'PackfileAnnotation'
    $P0.'set_key_id'(0)
    $P0.'set_offset'(0)
    $P0 = 1
    annotations[0] = $P0

    $P1 = new 'PackfileAnnotation'
    $P1.'set_key_id'(0)
    $P1.'set_offset'(1)
    $P1 = 42
    annotations[1] = $P1

    # Pack/unpack
    $S0 = pf
    $I0 = length $S0
    ok($I0, "Packfile with annotations packed")

    pf = $S0
    annotations = _find_segment_by_type(pf, 'PackfileAnnotations')
    $I0 = defined annotations
    ok($I0, "PackfileAnnotations was unpacked successfully")

    # Check unpacked keys
    keys = annotations.'get_key_list'()
    $I0 = elements keys
    is($I0, 1, "Got 1 unpacked key")
    $S0 = keys[0]
    is($S0, "line", "With expected name")
    $I0 = keys[0]
    is($I0, .PF_ANNOTATION_KEY_TYPE_INT, "With expected type")

    # Check unpacked entries
    $P0 = annotations[0]
    isa_ok($P0, "PackfileAnnotation")
    $I0 = $P0.'get_key_id'()
    is($I0, 0, "First key_id is correct")
    $I0 = $P0.'get_offset'()
    is($I0, 0, "First offset is correct")
    $I0 = $P0
    is($I0, 1, "First value is correct")

    $P0 = annotations[1]
    isa_ok($P0, "PackfileAnnotation")
    $I0 = $P0.'get_key_id'()
    is($I0, 0, "Second key_id is correct")
    $I0 = $P0.'get_offset'()
    is($I0, 1, "Second offset is correct")
    $I0 = $P0
    is($I0, 42, "Second value is correct")


.end

