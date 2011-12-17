#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/packfile.t - test the Packfile PMC


=head1 SYNOPSIS

    % make test_prep
    % prove t/pmc/packfile.t

=head1 DESCRIPTION

Tests the Packfile PMC.

=cut

.include 't/pmc/testlib/packfile_common.pir'
.include 'except_types.pasm'

.sub main :main
.include 'test_more.pir'

    plan(45)
    'test_new'()
    'test_set_string_native'()
    'test_get_string'()
    'test_set_string'()
    'test_get_integer_keyed_str'()
    'test_set_integer_keyed_str'()
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

    # Make sure the mark vtable function is exercised
    sweep 1

    .tailcall _check_header(pf)
.end


.sub 'test_set_string_native'
    .local pmc pf, eh
    .local int result

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_MALFORMED_PACKFILE)
    set_label eh, catch
    push_eh eh
    pf = new ['Packfile']
    pf = 'This is not data with a valid packfile format'
    result = 0
    goto end
  catch:
    result = 1
  end:
    pop_eh
    is(result, 1, 'set_string_native with invalid data throws')
.end


.sub 'test_get_string'
    .local pmc pf, eh
    pf = new ['Packfile']
    $S0 = pf["uuid"]
    ok(1, 'get_string(uuid)')

    # Requesting unknown key should throw exception
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_KEY_NOT_FOUND)
    set_label eh, unknown_key
    push_eh eh
    $S0 = pf["foo"]
    pop_eh
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
    pop_eh
    ok(0, "set_string_keyed_int set unknown key")
    .return ()

  unknown_key:
    pop_eh
    ok(1, "set_string_keyed_int handle unknown key properly")
    .return ()
.end

# Compose the message for the given key
.sub 'keyed_str_msg'
    .param string key
    .local string msg
    msg = 'get_integer_keyed_str('
    msg = concat msg, key
    msg = concat msg, ')'
    .return(msg)
.end
.sub 'set_keyed_str_msg'
    .param string key
    .local string msg
    msg = 'set_integer_keyed_str('
    msg = concat msg, key
    msg = concat msg, ')'
    .return(msg)
.end

# Check the given key in the Packfile pf
.sub 'do_get_integer_keyed_str'
    .param pmc pf
    .param string key
    .local string msg
    .local int result
    msg = 'keyed_str_msg'(key)
    result = 0
    push_eh fail

    $I0 = pf[key]
    result = 1
    goto end
  fail:
    .get_results($P0)
    pop_eh
  end:
    ok(result, msg)
.end

# Create a list of the keys for the integer attributes
.sub 'integer_keys'
    .local pmc keys
    keys = new ['ResizableStringArray']
    push keys, 'wordsize'
    push keys, 'byteorder'
    push keys, 'fptype'
    push keys, 'version_major'
    push keys, 'version_minor'
    push keys, 'version_patch'
    push keys, 'bytecode_major'
    push keys, 'bytecode_minor'
    push keys, 'uuid_type'
    .return(keys)
.end

# Some keys are still not handled in set_integer_keyed_str
# Use this list for its test
.sub 'integer_keys_s'
    .local pmc keys
    keys = new ['ResizableStringArray']
    push keys, 'version_major'
    push keys, 'version_minor'
    push keys, 'version_patch'
    push keys, 'uuid_type'
    .return(keys)
.end


.sub 'test_get_integer_keyed_str'
    .local pmc pf, keys
    .local int nkeys, i

    keys = 'integer_keys'()
    nkeys = elements keys

    push_eh load_error
    pf  = _pbc()
    pop_eh

    i = 0
  nextkey:
    $S0 = keys[i]
    do_get_integer_keyed_str(pf, $S0)
    inc i
    if i < nkeys goto nextkey

    # Requesting unknown key should throw exception
    push_eh unknown_key
    $I3 = pf["foo"]
    ok(0, "get_integer_keyed_str return unknown key")
    .return ()

  unknown_key:
    pop_eh
    ok(1, "get_integer_keyed_str handle unknown key properly")
    .return ()

    # On load error report a failure for each test
load_error:
    .get_results($P0)
    pop_eh

    i = 0
  nexterr:
    $S0 = keys[i]
    $S0 = keyed_str_msg($S0)
    report_load_error($P0, $S0)
    inc i
    if i < nkeys goto nexterr

    report_load_error($P0, "get_integer_keyed_str unknown key")
    .return()
.end


.sub 'test_set_integer_keyed_str'
    .local pmc pf, keys, saved
    .local int nkeys, i, value, check
    .local string skey, msg
    keys = 'integer_keys_s'()
    nkeys = elements keys
    pf = new ['Packfile']
    saved = new ['FixedIntegerArray'], nkeys

    # For each key get its value, set it modified and save the new value
    # The modified value may be invalid, but we are not going to pack it,
    # so it shouldn't fail here.
    i = 0
  set_next:
    skey = keys[i]
    value = pf[skey]
    inc value
    pf[skey] = value
    saved[i] = value
    inc i
    if i < nkeys goto set_next

    # Read new values and compare with the saved ones
    i = 0
  get_next:
    skey = keys[i]
    value = pf[skey]
    check = saved[i]
    msg = 'set_keyed_str_msg'(skey)
    is(value, check, msg)
    inc i
    if i < nkeys goto get_next

    i = 0
    push_eh unknown_key
    pf["foo"] = value
    goto done
  unknown_key:
    i = 1
  done:
    pop_eh
    is(i, 1, "set_integer_keyed_str handle unknown key properly")
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

    $P1 = new 'PackfileRawSegment'
    pfdir["BYTECODE_t/pmc/packfile.t"] = $P1

    $P2 = new 'PackfileConstantTable'
    # float constants
    $P2[0] = 42.0
    # string constants
    $P2[0] = "42"
    # PMC constants
    $P3 = new 'Integer'
    $P3 = 42
    $P2[0] = $P3
    $P4 = new 'Key'
    $P4 = 42
    $P2[1] = $P4
    pfdir["CONSTANTS_t/pmc/packfile.t"] = $P2

    # Set uuid_type
    pf['uuid_type'] = 1
    $S0 = pf

    # Pack it
    ok(1, "PackFile packed")

    # $P1 = new ['FileHandle']
    # $P1.'open'("/tmp/1.pbc", "w")
    # $P1.'print'($S0)
    # $P1.'close'()

    pf = new 'Packfile'
    pf = $S0
    ok(1, "PackFile unpacked after pack")

    $I0 = pf['uuid_type']
    is($I0, 1, "uuid_type preserved")

    # Check unpacked ConstTable
    $P0 = _find_segment_by_type(pf, "PackfileConstantTable")
    $I0 = defined $P0
    ok($I0, "ConstantTable unpacked")

    $I0 = $P0.'num_count'()
    is($I0, 1, "    and contains 1 number constants")
    $I0 = $P0.'str_count'()
    is($I0, 1, "    and contains 1 string constant")
    $I0 = $P0.'pmc_count'()
    is($I0, 2, "    and contains 2 pmc constants")

    $N0 = $P0[0]
    is($N0, 42.0, "    first number")
    $S0 = $P0[0]
    is($S0, "42", "    first string")
    $P1 = $P0[0]
    isa_ok($P1, "Integer")
    $I0 = $P1
    is($I0, 42, "    with proper value")
    $P1 = $P0[1]
    isa_ok($P1, "Key")
.end

# Packfile.pack.
# Check that unpack-pack produce correct result.
.sub 'test_pack'
    .local string filename, orig
    push_eh load_error
    $S0 = '_filename'()
    $P0 = new ['FileHandle']
    $P0.'open'($S0, 'rb')

    orig = $P0.'readall'()

    .local pmc packfile
    packfile = new 'Packfile'
    packfile = orig
    pop_eh

    # Loaded packfile can be from different platform/config,
    # packing and unpacking again to avoid that differences.
    .local string first, second
    # Pack
    first = packfile
    .local pmc packfilesecond
    packfilesecond = new 'Packfile'
    packfilesecond = first
    second = packfilesecond

    is(first, second, 'pack produced same result twice: TT #1614')
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
