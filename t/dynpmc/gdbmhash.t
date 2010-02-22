#! parrot
# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/gdbmhash.t - test the GDBMHash PMC

=head1 SYNOPSIS

    % parrot t/dynpmc/gdbmhash.t

=head1 DESCRIPTION

Tests the C<GDBMHash> PMC.

=cut

.sub main
    .include 'test_more.pir'
    .include 'iglobals.pasm'
    .local pmc config_hash, interp

    plan(48)
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['has_gdbm']
    unless $S0 goto no_gdbm

    test_typeof()
    test_interface()
    test_get_integer()
    test_get_bool()
    test_modify_an_entry()
    test_exists_keyed()
    test_set_string_with_string_key()
    test_set_string_with_pmc_key()
    test_set_pmc_with_string_key()
    test_set_pmc_with_pmc_key()
    test_set_intval_with_string_key()
    test_set_floatval_with_pmc_key()
    test_delete_keyed()
    .return()
  no_gdbm:
    skip(48, 'No gdbm library available')
.end

.sub unlink
    .param string filename
    new $P0, 'OS'
    $P0.'rm'(filename)
.end

.sub test_typeof
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    .local string type
    type = typeof hash_1
    is(type, 'GDBMHash', 'typeof')
.end

.sub test_interface
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    .local int bool1
    does bool1, hash_1, "scalar"
    is(bool1, 0, 'check whether interface is done')
    does bool1, hash_1, "hash"
    is(bool1, 1, 'check whether interface is done')
    does bool1, hash_1, "no_interface"
    is(bool1, 0, 'check whether interface is done')
.end

.sub test_get_integer
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    .local int hash_size
    hash_size = hash_1
    is(hash_size, 0, 'An unitialized GDBMHash has size 0')

    hash_1 = "gdbm_hash_1"
    hash_size = hash_1
    is(hash_size, 0, 'An GDBMHash for a new file has size 0')

    hash_1["key1"] = "val1"
    hash_size = hash_1
    is(hash_size, 1, 'After one assignment GDBMHash has size 1')

    hash_1["key2"] = "val2"
    hash_size = hash_1
    is(hash_size, 2, 'After two assignments GDBMHash has size 2')

    hash_1["key3"] = "val3"
    hash_1["key4"] = "val4"
    hash_1["key5"] = "val5"
    hash_1["key6"] = "val6"
    hash_1["key7"] = "val7"
    hash_1["key8"] = "val8"
    hash_1["key9"] = "val9"
    hash_1["key10"] = "val10"
    hash_1["key11"] = "val11"
    hash_1["key12"] = "val12"
    hash_1["key13"] = "val13"
    hash_1["key14"] = "val14"
    hash_1["key15"] = "val15"
    hash_size = hash_1
    is(hash_size, 15, 'After 15 assignments GDBMHash has size 15')

    delete hash_1["key7"]
    delete hash_1["key9"]

    hash_size = hash_1
    is(hash_size, 13, 'After 15 assignments and 2 deletes GDBMHash has size 13')

    unlink('gdbm_hash_1')
.end

.sub test_get_bool
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    if hash_1 goto HASH1_IS_1
    ok(1, 'An uninitialized GDBMHash is not')
HASH1_IS_1:

    hash_1 = "gdbm_hash_1"
    if hash_1 goto HASH1_IS_2
    ok(1, 'A GDBMHash for a new file is not')
HASH1_IS_2:

    hash_1["key1"] = "val1"
    if hash_1 goto HASH1_IS_3
    ok(0, 'After one insert the GDBMHash is not')
HASH1_IS_3:
    ok(1, 'After one insert the GDBMHash is')

    unlink('gdbm_hash_1')
.end

# The value is a STRING, with umlaut
# The key used for insertion is a STRING.
.sub test_modify_an_entry
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local pmc    val_pmc

    hash_1["Schluessel"] = "Wert urspruenglich"
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert urspruenglich', 'modify an entry')
    hash_1["Schluessel"] = "Wert geaendert"
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert geaendert', 'modify an entry')
    hash_1["Schluessel"] = "Wert nocheinmal geaendert"
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert nocheinmal geaendert', 'modify an entry')
    hash_1["Schluessel"] = "Wert urspruenglich"
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert urspruenglich', 'modify an entry')

    unlink('gdbm_hash_1')
.end

# The value is a STRING.
# The key used for insertion is a STRING.
.sub test_exists_keyed
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    hash_1["Schluessel"] = "Wert"

    .local int exist_flag
    exist_flag = exists hash_1["a"]
    is(exist_flag, 0, 'exists keyed')
    exist_flag = exists hash_1["Schluessel"]
    is(exist_flag, 1, 'exists keyed')

    .local pmc key_out
    key_out = new 'String'
    key_out = "b"
    exist_flag = exists hash_1[key_out]
    is(exist_flag, 0, 'exists keyed')
    key_out = "Schluessel"
    exist_flag = exists hash_1[key_out]
    is(exist_flag, 1, 'exists keyed')

    unlink('gdbm_hash_1')
.end

# The value is a STRING.
# The key used for insertion is a STRING.
.sub test_set_string_with_string_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    hash_1["Schluessel"] = "Wert"

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, 'Wert', 'set string with string key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert', 'set string with string key')
    .local pmc key_out
    key_out = new 'String'
    key_out = "Schluessel"
    val_string = hash_1[key_out]
    is(val_string, 'Wert', 'set string with string key')
    val_pmc = hash_1[key_out]
    is(val_pmc, 'Wert', 'set string with string key')

    unlink('gdbm_hash_1')
.end

# The value is a STRING.
# The key used for insertion is a PMC.
.sub test_set_string_with_pmc_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local pmc key_pmc
    key_pmc = new 'String'
    key_pmc = "Schluessel"
    hash_1[key_pmc] = "Wert"

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, 'Wert', 'set string with pmc key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert', 'set string with pmc key')
    .local pmc key2
    key2 = new 'String'
    key2 = "Schluessel"
    val_string = hash_1[key2]
    is(val_string, 'Wert', 'set string with pmc key')
    val_pmc = hash_1[key2]
    is(val_pmc, 'Wert', 'set string with pmc key')

    unlink('gdbm_hash_1')
.end

# The value is a PMC.
# The key used for insertion is a STRING.
.sub test_set_pmc_with_string_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local pmc val
    val = new 'String'
    val = "Wert"
    hash_1["Schluessel"] = val

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, 'Wert', 'set pmc with string key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert', 'set pmc with string key')
    .local pmc key_out
    key_out = new 'String'
    key_out = "Schluessel"
    val_string = hash_1[key_out]
    is(val_string, 'Wert', 'set pmc with string key')
    val_pmc = hash_1[key_out]
    is(val_pmc, 'Wert', 'set pmc with string key')

    unlink('gdbm_hash_1')
.end

# The value is a PMC.
# The key used for insertion is a PMC.
.sub test_set_pmc_with_pmc_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local pmc val
    val = new 'String'
    val = "Wert"
    .local pmc key_pmc
    key_pmc = new 'String'
    key_pmc = "Schluessel"
    hash_1[key_pmc] = val

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, 'Wert', 'set pmc with pmc key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, 'Wert', 'set pmc with pmc key')
    .local pmc key2
    key2 = new 'String'
    key2 = "Schluessel"
    val_string = hash_1[key2]
    is(val_string, 'Wert', 'set pmc with pmc key')
    val_pmc = hash_1[key2]
    is(val_pmc, 'Wert', 'set pmc with pmc key')

    unlink('gdbm_hash_1')
.end

# The value is an INTVAL
# The key used for insertion is a STRING.
.sub test_set_intval_with_string_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    hash_1["Schluessel"] = -11012005

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, -11012005, 'set intval with a string key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, -11012005, 'set intval with a string key')
    .local pmc key_out
    key_out = new 'String'
    key_out = "Schluessel"
    val_string = hash_1[key_out]
    is(val_string, -11012005, 'set intval with a string key')
    val_pmc = hash_1[key_out]
    is(val_pmc, -11012005, 'set intval with a string key')

    unlink('gdbm_hash_1')
.end

# The value is a FLOATVAL.
# The key used for insertion is a PMC.
.sub test_set_floatval_with_pmc_key
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local pmc key_pmc
    key_pmc = new 'String'
    key_pmc = "Schluessel"
    hash_1[key_pmc] = -1101.2005

    .local pmc    val_pmc
    .local string val_string

    val_string = hash_1["Schluessel"]
    is(val_string, -1101.2005, 'set float with a pmc key')
    val_pmc = hash_1["Schluessel"]
    is(val_pmc, -1101.2005, 'set float with a pmc key')
    .local pmc key2
    key2 = new 'String'
    key2 = "Schluessel"
    val_string = hash_1[key2]
    is(val_string, -1101.2005, 'set float with a pmc key')
    val_pmc = hash_1[key2]
    is(val_pmc, -1101.2005, 'set float with a pmc key')

    unlink('gdbm_hash_1')
.end

.sub test_delete_keyed
    .local pmc gdbmhash_lib
    gdbmhash_lib = loadlib "gdbmhash"
    .local pmc hash_1
    hash_1 = new "GDBMHash"
    hash_1 = "gdbm_hash_1"

    .local int exist_flag
    .local int hash_size

    exist_flag = exists hash_1["a"]
    is(exist_flag, 0, 'delete keyed')

    hash_1["a"] = "A"
    exist_flag = exists hash_1["a"]
    is(exist_flag, 1, 'delete keyed')

    delete hash_1["a"]
    exist_flag = exists hash_1["a"]
    is(exist_flag, 0, 'delete keyed')

    unlink('gdbm_hash_1')
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 filetype=pir:
