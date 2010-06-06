#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfile.t - test the Packfile PMC


=head1 SYNOPSIS

    % prove t/pmc/packfile.t

=head1 DESCRIPTION

Tests the Packfile PMC.

=cut

.include 't/pmc/testlib/packfile_common.pir'

.sub main :main
.include 'test_more.pir'

    plan(36)
    'test_new'()
    'test_get_string'()
    'test_set_string'()
    'test_get_integer'()
    'test_set_integer'()
    'test_get_directory'()
    'test_load'()
    'test_pack_fresh_packfile'()
    'test_pack'()

    skip(2, "test_synonyms crash on many platforms. See TT #545")
    # 'test_synonyms'()

.end


# Packfile constructor
.sub 'test_new'
    .local pmc pf
    pf = new ['Packfile']
    $I0 = defined pf
    ok($I0, 'new')
    .tailcall _check_header(pf)
.end


.sub 'test_get_string'
    .local pmc pf
    pf = new ['Packfile']
    $S0 = pf["uuid"]
    ok(1, 'get_string(uuid)')

    # Requesting unknown key should throw exception
    push_eh unknown_key
    $S0 = pf["foo"]
    ok(0, "get_string_keyed_int return unknown key")
    .return ()

  unknown_key:
    pop_eh
    ok(1, "get_string_keyed_int handle unknown key properly")
    .return ()
.end

.sub 'test_set_string'
    .local pmc pf
    pf = new ['Packfile']
    pf["uuid"] = "fe9ab64082e0f6bbbd7b1e8264127908"
    ok(1, 'set_string(uuid)')

    # Special check for 0
    $S0 = "\0"
    $I0 = length $S0
    is($I0, 1, "Length is 1")
    pf["uuid"] = $S0
    $S1 = pf["uuid"]
    $I1 = length $S1
    is($I1, 1, "Fetched length is 1")

    # Requesting unknown key should throw exception
    push_eh unknown_key
    pf["foo"] = "fe9ab64082e0f6bbbd7b1e8264127908"
    ok(0, "set_string_keyed_int set unknown key")
    .return ()

  unknown_key:
    pop_eh
    ok(1, "set_string_keyed_int handle unknown key properly")
    .return ()
.end


.sub 'test_get_integer'
    .local pmc pf
    push_eh load_error
    pf  = _pbc()
    pop_eh
    $I0 = pf["version_major"]
    ok(1, "get_integer_keyed_str(version_major)")

    $I1 = pf["version_minor"]
    ok(1, "get_integer_keyed_str(version_minor)")

    $I2 = pf["version_patch"]
    ok(1, "get_integer_keyed_str(version_patch)")

    # Requesting unknown key should throw exception
    push_eh unknown_key
    $I3 = pf["foo"]
    ok(0, "get_integer_keyed_str return unknown key")
    .return ()

  unknown_key:
    pop_eh
    ok(1, "get_integer_keyed_str handle unknown key properly")
    .return ()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "get_integer_keyed_str(version_major)")
    report_load_error($P0, "get_integer_keyed_str(version_minor)")
    report_load_error($P0, "get_integer_keyed_str(version_patch)")
    report_load_error($P0, "get_integer_keyed_str unknown key")
    .return()
.end


# Packfile.set_integer_keyed_str
.sub 'test_set_integer'
    .local pmc pf
    push_eh load_error
    pf  = _pbc()
    pop_eh
    $S1 = 'version_major'
    $I0 = pf[$S1]
    $I1 = $I0
    inc $I1
    pf[$S1] = $I1
    $I2 = pf[$S1]
    $I3 = cmp $I0, $I2
    $I3 = cmp $I3, 0
    ok($I3, 'set_integer_keyed_str version bumped')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'set_integer_keyed_str version bumped')
    .return()
.end

# Packfile.get_directory
.sub 'test_get_directory'
    .local pmc pf
    pf = new ['Packfile']
    $P0 = pf.'get_directory'()
    isa_ok($P0, 'PackfileDirectory')
.end


# PackfileSegment.pack (via subclass PackfileDirectory)
.sub 'test_get_directory'
    .local pmc pf, pfdir
    push_eh load_error
    pf    = _pbc()
    pop_eh
    pfdir = pf.'get_directory'()
    $S0   = pfdir.'pack'()
    $I0   = length $S0
    $I1 = cmp $I0, 0
    ok($I1, 'get_directory')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'get_directory')
    .return()
.end


# Packfile.set_string_native
# Check that packfile was loaded properly and set various attributes
.sub 'test_load'
    .local pmc pf
    push_eh load_error
    pf = _pbc()
    pop_eh

    .tailcall _check_header(pf)
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "Wordsize set")
    report_load_error($P0, "version_major set")
    report_load_error($P0, "bytecode_major set")
    .return()
.end

# Helper sub to check fields in Packfile header
.sub '_check_header'
    .param pmc pf

    # wordsize always greater than 0
    $I0 = pf["wordsize"]
    ok($I0, "Wordsize set")

    # We are living in post-1.0 era.
    $I0 = pf["version_major"]
    ok($I0, "version_major set")

    $I0 = pf["bytecode_major"]
    ok($I0, "bytecode_major set")
.end

# Create very simple Packfile and pack it
.sub 'test_pack_fresh_packfile'
    .local pmc pf, pfdir
    pf = new 'Packfile'
    pfdir = pf.'get_directory'()
    #$P0 = new 'PackfileConstantTable'
    #$P0[0] = 42.0
    $P0 = new 'PackfileFixupTable'
    $P1 = new 'PackfileFixupEntry'
    $P1 = 42
    $P1.'set_type'(1)
    $P1 = "The fixup"
    $P0[0] = $P1
    pfdir["FIXUP_t/pmc/packfile.t"] = $P0

    $P1 = new 'PackfileRawSegment'
    pfdir["BYTECODE_t/pmc/packfile.t"] = $P1

    $P2 = new 'PackfileConstantTable'
    $P2[0] = 42.0
    $P2[1] = "42"
    $P3 = new 'Integer'
    $P3 = 42
    $P2[2] = $P3
    $P4 = new 'Key'
    $P4 = 42
    $P2[3] = $P4
    pfdir["CONSTANTS_t/pmc/packfile.t"] = $P2

    # Set uuid_type
    pf['uuid_type'] = 1
    $S0 = pf

    # Pack it
    ok(1, "PackFile packed")

    #$P1 = open "/tmp/1.pbc", "w"
    #$P1.'puts'($S0)
    #close $P1

    pf = new 'Packfile'
    pf = $S0
    ok(1, "PackFile unpacked after pack")

    $I0 = pf['uuid_type']
    is($I0, 1, "uuid_type preserved")

    # Check that FixupTable contains our Entry.
    $P0 = _get_fixup_table(pf)
    $I1 = elements $P0
    is($I1, 1, "FixupTable contains one element")
    $P1 = $P0[0]
    isa_ok($P1, "PackfileFixupEntry")
    $I0 = $P1
    is($I0, 42, "FixupEntry offset preserved")
    $S0 = $P1
    is($S0, "The fixup", "FixupEntry name preserved")

    # Check unpacked ConstTable
    $P0 = _find_segment_by_type(pf, "PackfileConstantTable")
    $I0 = defined $P0
    ok($I0, "ConstantTable unpacked")
    $I0 = elements $P0
    is($I0, 4, "    and contains 4 elements")
    $N0 = $P0[0]
    is($N0, 42.0, "    first is number")
    $S0 = $P0[1]
    is($S0, "42", "    second is string")
    $P1 = $P0[2]
    isa_ok($P1, "Integer")
    $I0 = $P1
    is($I0, 42, "    with proper value")
    $P1 = $P0[3]
    isa_ok($P1, "Key")
.end

# Packfile.pack.
# Check that unpack-pack produce correct result.
.sub 'test_pack'
    .local string filename, first
    push_eh load_error
    $S0 = '_filename'()
    $P0 = new ['FileHandle']
    $P0.'open'($S0, 'r')

    first = $P0.'readall'()

    .local pmc packfile
    packfile = new 'Packfile'
    packfile = first
    pop_eh

    # Packed file should be exactly the same as loaded
    .local string second
    # Pack
    second = packfile

    $I0 = cmp first, second
    $I0 = not $I0
    todo($I0, 'pack produced same result twice: TT #1614')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'pack produced same result twice')
    .return()
.end

# Test pack/set_string unpack/get_string equivalency
.sub 'test_synonyms'
    .local pmc pf
    push_eh load_error
    pf = '_pbc'()
    pop_eh

    $S0 = pf
    $S1 = pf.'pack'()
    $I0 = cmp $S0, $S1
    is($I0, 0, "pack and get_string are synonyms")

    # Unpack data in two ways
    $P0 = new ['Packfile']
    $P0 = $S0
    $P1 = new ['Packfile']
    $P1.'unpack'($S0)

    $S0 = $P0
    $S1 = $P1
    $I0 = cmp $S0, $S1
    is($I0, 0, "unpack and set_string are synonyms")
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "pack and get_string are synonyms")
    report_load_error($P0, "unpack and set_string are synonyms")
    .return()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
