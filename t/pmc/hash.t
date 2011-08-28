#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/hash.t - Test the Hash PMC

=head1 SYNOPSIS

    % prove t/pmc/hash.t

=head1 DESCRIPTION

Tests the C<Hash> PMC. Checks key access with various types of
normal and potentially hazardous keys. Does a bit of stress testing as
well.

=cut

.include 'except_types.pasm'
.include 'datatypes.pasm'
.include 'hash_key_type.pasm'

.sub main :main
    .include 'test_more.pir'

    initial_hash_tests()
    more_than_one_hash()
    hash_key_type()
    hash_value_type()
    null_key()
    hash_keys_with_nulls_in_them()
    nearly_the_same_hash_keys()
    the_same_hash_keys()
    key_that_hashes_to_zero()
    size_of_the_hash()
    stress_test_loop_set_check()
    stress_test_lots_of_keys()
    stress_test_loop_set_loop_check()
    testing_two_hash_indices_with_integers_at_a_time()
    testing_two_hash_indices_with_numbers_at_a_time()
    testing_two_hash_indices_with_strings_at_a_time()
    setting_and_getting_scalar_pmcs()
    setting_scalar_pmcs_and_getting_scalar_values()
    getting_values_from_undefined_keys()
    setting_and_getting_non_scalar_pmcs()
    testing_clone()
    clone_doesnt_crash_on_deleted_keys()
    clone_preserves_order()
    freeze_thaw_preserves_order()
    compound_keys()
    getting_pmcs_from_compound_keys()
    getting_pmcs_from_string_int_compound_keys()
    if_hash()
    unless_hash()
    defined_hash()
    exists_hash_key()
    delete_hash_key()
    cloning_keys()
    cloning_pmc_vals()
    delete_and_free_list()
    exists_with_constant_string_key()
    hash_in_pir()
    setting_with_compound_keys()
    mutating_the_lookup_string()
    check_whether_interface_is_done()
    iter_over_hash()
    broken_delete()
    unicode_keys_register_rt_39249()
    unicode_keys_literal_rt_39249()

    integer_keys()
    value_types_convertion()
    elements_in_hash()
    equality_tests()

    pmc_keys()

    'done_testing'()
.end

.sub initial_hash_tests
    new	$P0, 'Hash'

    set	$P0["foo"], -7
    set	$P0["bar"], 3.5
    set	$P0["baz"], "value"

    set	$I0, $P0["foo"]
    set	$N0, $P0["bar"]
    set	$S0, $P0["baz"]

    is( $I0, -7,       'lookup Int in hash' )
    is( $N0, 3.500000, 'lookup Num in hash' )
    is( $S0, "value",  'lookup Str in hash' )

    set $S1, "oof"
    set $S2, "rab"
    set $S3, "zab"

    set	$P0[$S1], 7
    set	$P0[$S2], -3.5
    set	$P0[$S3], "VALUE"

    set	$I0, $P0[$S1]
    set	$N0, $P0[$S2]
    set	$S0, $P0[$S3]

    is( $I0, 7,         'lookup Int in hash via Str' )
    is( $N0, -3.500000, 'lookup Num in hash via Str' )
    is( $S0, "VALUE",   'lookup Str in hash via Str' )

.end

.sub more_than_one_hash
    new $P0, ['Hash']
    set $S0, "key"
    set $P0[$S0], 1

    new $P1, ['Hash']
    set $S1, "another_key"
    set $P1[$S1], 2

    set $I0, $P0[$S0]
    set $I1, $P1[$S1]

    is( $I0, 1, 'two hashes: lookup Int from hash via Str' )
    is( $I1, 2, 'two hashes: lookup Int from hash via Str in second' )
.end

.sub hash_key_type
    .local pmc h
    .local int i
    h = new ['Hash']
    h = .Hash_key_type_int
    h['01'] = 42
    i = h[1]
    is(i, 42, 'key type int')

    # Use the method here to check it at the same time.
    h.'set_key_type'(.Hash_key_type_STRING)
    h[1] = 42
    i = h['01']
    isnt(i, 42, 'key type STRING')
    i = h.'get_key_type'()
    is(i, .Hash_key_type_STRING, 'method get_key_type return type STRING')

    push_eh invalid_type
    h = -973 # Let's hope it will never become a valid type
    pop_eh
    ok(0, "Setting invalid type should throw")
    goto end
invalid_type:
    pop_eh
    ok(1, 'Setting invalid type throws')
end:
.end

.sub hash_value_type
    .local pmc h, eh
    .local int r
    h = new ['Hash']

    h.'set_value_type'(.DATATYPE_INTVAL)
    r  = h.'get_value_type'()
    is(r, .DATATYPE_INTVAL, 'get/set _value_type')

    r = 1
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_UNIMPLEMENTED)
    set_label eh, catch
    push_eh eh
    h.'set_value_type'(999999)
    r = 0
  catch:
    is(r, 1, 'set_value_type with invalid type throws')
.end

.sub null_key
    new $P0, ['Hash']
    $P0['yum'] = 5
    null $S0
    $I0 = 0

    $P2 = new ['ExceptionHandler']
    $P2.'handle_types'(.EXCEPTION_UNEXPECTED_NULL)
    set_label $P2, null_ex_eh
    push_eh $P2

    $P1 = $P0[$S0]

    goto check

null_ex_eh:
    $I0 = 1

check:
    pop_eh
    is( $I0, 1, 'using null string as key throws' )
.end

.sub hash_keys_with_nulls_in_them
    new $P0, ['Hash']
    set $S0, "parp\0me"
    set $S1, "parp\0you"

    set $P0[$S0], 1		# $P0{parp\0me} = 1
    set $P0[$S1], 2		# $P0{parp\0you} = 2

    set $I0, $P0[$S0]
    set $I1, $P0[$S1]

    is( $I0, 1, 'hash key with null 1' )
    is( $I1, 2, 'hash key will null 2' )
.end

.sub nearly_the_same_hash_keys
    new $P0, ['Hash']
    set $S0, "a\0"
    set $S1, "\0a"

    set $P0[$S0], 1
    set $P0[$S1], 2

    set $I0, $P0[$S0]
    set $I1, $P0[$S1]

    is( $I0, 1, 'hash key with null' )
    is( $I1, 2, 'almost identical hash key with null' )
.end

.sub the_same_hash_keys
    new $P0, ['Hash']
    set $S0, "Happy"
    set $S1, "Happy"

    set $P0[$S0], 1
    set $I0, $P0[$S0]
    is( $I0, 1, 'lookup by $S0' )

    set $P0[$S1], 2
    set $I1, $P0[$S1]

    is( $I1, 2, 'set and lookup by $S1 (identical to $S0)' )
.end

# NB Next test depends on "key2" hashing to zero, which it does with
# the current algorithm; if the algorithm changes, change the test!
# XXX - really?

.sub key_that_hashes_to_zero
        new $P0, ['Hash']
        set $S0, "key2"
        set $P0[$S0], 1
        set $I0, $P0[$S0]

        is( $I0, 1, 'key that hashes to zero XXX' )
.end

.sub size_of_the_hash
    new $P0, ['Hash']

    set $P0["0"], 1
    set $I0, $P0
    is( $I0, 1, 'hash size of 1' )

    set $P0["1"], 1
    set $I0, $P0
    is( $I0, 2, 'hash size of 2' )

    set $P0["0"], 1
    set $I0, $P0
    is( $I0, 2, 'hash size of 2' )

    $I1 = elements $P0
    is( $I1, $I0, "'elements' gives the same result" )
.end

.sub stress_test_loop_set_check
    new	$P0, 'Hash'

        set $I0, 200
        set $S0, "mikey"
        set $P0[$S0], "base"
        concat $S1, $S0, "s"
        set $P0[$S1], "bases"
        set $S2, $I0
        concat $S1, $S0, $S2
        set $P0[$S1], "start"
        set $S3, $P0["mikey"]
        is( $S3, 'base',  'setup: lookup mikey' )
        set $S3, $P0["mikeys"]
        is( $S3, 'bases', 'setup: lookup mikeys' )
        set $S3, $P0["mikey200"]
        is( $S3, 'start', 'setup: lookup mikey200' )
LOOP:
        eq $I0, 0, DONE
        sub $I0, $I0, 1
        set $S2, $I0
        concat $S1, $S0, $S2
        concat $S4, $S0, $S2
        eq $S1, $S4, L1
        ##  this should be fail(), but it is not implemented yet
        ok( 0, 'concat mismatch' )
L1:
        set $P0[$S1], $I0
        set $I1, $P0[$S1]
        eq $I0, $I1, L2
        ##  this should be fail(), but it is not implemented yet
        ok( 0, 'lookup mismatch' )
L2:
        branch LOOP
DONE:
        set $I0, $P0["mikey199"]
        is( $I0, 199, 'lookup: mikey199' )
        set $I0, $P0["mikey117"]
        is( $I0, 117, 'lookup: mikey117' )
        set $I0, $P0["mikey1"]
        is( $I0, 1, 'lookup: mikey1' )
        set $I0, $P0["mikey23"]
        is( $I0, 23, 'lookup: miky23' )
        set $I0, $P0["mikey832"]
        is( $I0, 0, 'lookup: mikey832 (never set)' )
.end

## stuff them in, and check periodically that we can pull selected ones out.
##   *_multiple_keys are used by stress_test_lots_of_keys

.sub set_multiple_keys
    .param pmc hash
    .param int key_index
    .param int step
    .param int count

again:
    if count <= 0 goto ret
    $S0 = key_index
    $S1 = concat "key", $S0
    $S2 = concat "value", $S0
    hash[$S1] = $S2
    key_index = key_index + step
    count = count - 1
    goto again
ret:
.end

.sub delete_multiple_keys
    .param pmc hash
    .param int key_index
    .param int step
    .param int count

again:
    if count <= 0 goto ret
    $S0 = key_index
    $S1 = concat "key", $S0
    delete hash[$S1]
    key_index = key_index + step
    count = count - 1
    goto again
ret:
.end

.sub check_key
    .param pmc hash
    .param int index

    $S10 = index
    $S0 = concat "key", $S10
    $S1 = concat "value", $S10

    $S2 = hash[$S0]
    $S3 = concat "correct value for key ", $S10
    is( $S2, $S1, $S3 )
.end

.sub stress_test_lots_of_keys
    new	$P30, 'Hash'
    $I29 = 1
    $I30 = 1000
    $I31 = 1000

    # round 1
    set_multiple_keys($P30, $I29, $I30, $I31)
    check_key( $P30, 1 )
    check_key( $P30, 1001 )
    check_key( $P30, 2001 )

    # round 2
    $I21 = 100000
    set_multiple_keys($P30, $I21, $I30, $I31)
    check_key( $P30, 1 )
    check_key( $P30, 1001 )
    check_key( $P30, 2001 )
    check_key( $P30, 100000 )
    check_key( $P30, 101000 )
    check_key( $P30, 102000 )

    # round 3
    $I22 = 50000
    set_multiple_keys($P30, $I22, $I29, $I22)
    check_key( $P30, 1 )
    check_key( $P30, 1001 )
    check_key( $P30, 2001 )
    check_key( $P30, 500000 )
    check_key( $P30, 510000 )
    check_key( $P30, 520000 )

    # round 4
    delete_multiple_keys($P30, $I22, $I29, $I22)
    check_key( $P30, 1001 )
    check_key( $P30, 2001 )
    $I50 = exists $P30['key50000']
    $I51 = exists $P30['key51000']
    $I52 = exists $P30['key52000']
    is( $I50, 0, 'key50000 does not exist after delete' )
    is( $I51, 0, 'key51000 does not exist after delete' )
    is( $I52, 0, 'key52000 does not exist after delete' )
.end

# Check all values after setting all of them
.sub stress_test_loop_set_loop_check
    new	$P0, 'Hash'

        set $I0, 200
        set $S0, "mikey"
SETLOOP:
        eq $I0, 0, DONE
        sub $I0, $I0, 1
        set $S2, $I0
        concat $S1, $S0, $S2
        set $P0[$S1], $I0
        branch SETLOOP

        set $I0, 200
GETLOOP:
        eq $I0, 0, DONE
        sub $I0, $I0, 1
        set $S2, $I0
        concat $S1, $S0, $S2
        set $I1, $P0[$S1]
        eq $I0, $I1, L2
          is( $I0, $I1, 'lookup mismatch in stress test loop' )
          .return()
L2:
        branch GETLOOP
DONE:
        ok( 1, 'stress test: loop set with loop check' )
.end

.sub testing_two_hash_indices_with_integers_at_a_time
      new $P0, ['Hash']

      set $P0["foo"],37
      set $P0["bar"],-15

      set $I0,$P0["foo"]
      is( $I0, 37, 'lookup int in foo' )

      set $I0,$P0["bar"]
      is( $I0, -15, 'lookup int in bar' )

      set $S1,"foo"
      set $I0,$P0[$S1]
      is( $I0,37, 'lookup int in foo via var' )

      set $S1,"bar"
      set $I0,$P0[$S1]
      is( $I0,-15, 'lookup int in bar via var' )
.end

.sub testing_two_hash_indices_with_numbers_at_a_time
      new $P0, ['Hash']

      set $P0["foo"],37.100000
      set $P0["bar"],-15.100000

      set $N0,$P0["foo"]
      is( $N0,37.100000, 'lookup num in foo' )

      set $N0,$P0["bar"]
      is( $N0,-15.100000, 'lookup num in bar' )

      set $S1,"foo"
      set $N0,$P0[$S1]
      is( $N0,37.100000, 'lookup num in foo via var' )

      set $S1,"bar"
      set $N0,$P0[$S1]
      is( $N0,-15.100000, 'lookup num in bar via var' )

.end

.sub testing_two_hash_indices_with_strings_at_a_time
      new $P0, ['Hash']

      set $P0["foo"],"baz"
      set $P0["bar"],"qux"

      set $S0,$P0["foo"]
      is( $S0,"baz", 'lookup str in foo' )

      set $S0,$P0["bar"]
      is( $S0,"qux", 'lookup str in bar' )

      set $S1,"foo"
      set $S0,$P0[$S1]
      is( $S0,"baz", 'lookup str in foo via var' )

      set $S1,"bar"
      set $S0,$P0[$S1]
      is( $S0,"qux", 'lookup str in bar via var' )

.end

# So far, we have only used INTVALs, FLOATVALs and STRINGs as values
# and/or keys. Now we try PMCs.

.sub setting_and_getting_scalar_pmcs
      new $P0, ['Hash']
      new $P1, ['Integer']
      new $P2, ['Integer']

      set $S0, "non-PMC key"

      set $P1, 10
      set $P0[$S0], $P1
      set $P2, $P0[$S0]
      is( $P2, $P1, 'lookup PMC Integer' )

      set $P1, -1234.000000
      set $P0[$S0], $P1
      set $P2, $P0[$S0]
      is( $P2, $P1, 'lookup num after PMC Integer in slot' )

      set $P1, "abcdefghijklmnopq"
      set $P0[$S0], $P1
      set $P2, $P0[$S0]
      is( $P2, $P1, 'lookup string' )

      new $P1, ['Undef']
      set $P0[$S0], $P1
      set $P2, $P0[$S0]
      typeof $S1, $P2
      is( $S1, "Undef", 'lookup Undef PMC' )

.end

.sub setting_scalar_pmcs_and_getting_scalar_values
      new $P0, ['Hash']
      new $P1, ['Integer']

      set $S0, "A rather large key"

      set $I0, 10
      set $P1, $I0
      set $P0[$S0], $P1
      set $I1, $P0[$S0]
      is( $I1, $I0, 'lookup PMC and get scalar Int' )

      set $N0, -1234.000000
      set $P1, $N0
      set $P0[$S0], $P1
      set $N1, $P0[$S0]
      is( $N1, $N0, 'lookup PMC and get scalar Num' )

      set $S1, "abcdefghijklmnopq"
      set $P1, $S1
      set $P0[$S0], $P1
      set $S2, $P0[$S0]
      is( $S2, $S1, 'lookup PMC and get scalar Str' )

.end

.sub getting_values_from_undefined_keys
      new $P2, ['Hash']

      set $I0, $P2["qwerty"]
      set $N0, $P2["asdfgh"]
      set $S0, $P2["zxcvbn"]
      set $P0, $P2["123456"]

      is( $I0,   0, 'undefined key returns Int 0' )
      is( $N0, 0.0, 'undefined key returns Num 0.0' )
      is( $S0,  "", 'undefined key returns Str ""' )

      $I1 = 1
      if_null $P0, P0_is_null
        $I1 = 0
    P0_is_null:
      ok( $I1, 'undefined key returns null PMC' )
.end

.sub setting_and_getting_non_scalar_pmcs
        new $P0, ['Hash']
        new $P1, ['ResizablePMCArray']
        new $P2, ['ResizablePMCArray']
        set $P1[4],"string"
        set $P0["one"],$P1
        set $P2,$P0["one"]
        set $S0,$P2[4]
        is( $S0, 'string', 'set and get non-scalar PMCs' )
.end

.sub testing_clone
    new $P0, ['Hash']
    set $S0, "a"
    set $P0[$S0], $S0
    new $P2, ['ResizablePMCArray']
    set $P2, 2
    set $P0["b"], $P2

    # $P0 = { a => "a", b => [undef, undef] }

    clone $P1, $P0
    set $P0["c"], 4
    set $P3, $P0["b"]
    set $P3, 3
    set $P0["b"], $P3
    set $P1["a"], "A"

    # $P0 = { a => "a", b => [undef, undef, undef], c => 4 }
    # $P1 = { a => "A", b => [undef, undef] }

    set $S0, $P0["a"]
    is( $S0, "a", 'original hash lookup pre-clone value' )

    set $P5, $P0["b"]
    set $I0, $P5
    is( $I0, 3, 'original hash lookup post-clone value' )

    set $I0, $P0["c"]
    is( $I0, 4, 'original hash lookup post-clone value in new slot' )

    set $S0, $P1["a"]
    is( $S0, "A", 'cloned hash lookup post-clone value' )

    set $P5, $P1["b"]
    set $I0, $P5
    is( $I0, 2, 'cloned hash lookup pre-clone complex value' )

# XXX: this should return undef or something, but it dies instead.
#     set $P3, $P0["c"]
#     unless $P3, ok6
#     print "not "
# ok6:
#     print "ok 6\n"
.end

.sub clone_doesnt_crash_on_deleted_keys
    .local pmc hash1, hash2
    .local string key1, key2
    hash1 = new 'Hash'
    key1 = 'foo'
    key2 = 'bar'
    hash1[key1] = 1
    hash1[key2] = 2
    delete hash1[key1]
    hash2 = clone hash1
    ok( 1, "clone doesn't crash on deleted keys" )
.end

# TT #116
# This test failure depends on the value if the hash seed, which is randomized.
# To try to ensure that the test fails reliably if there's a regression, it's
# run 3 times with different hash keys.
.sub clone_preserves_order
    .local pmc h, cloned
    .local string s1, s2
    .local int all_ok

    all_ok = 1
    h      = new ['Hash']

    h['a'] = 1
    h['b'] = 2
    h['c'] = 3
    h['d'] = 4
    h['e'] = 5
    h['f'] = 6
    h['g'] = 7
    h['h'] = 8
    h['i'] = 9
    h['j'] = 10
    h['k'] = 11
    h['l'] = 12

    cloned = clone h
    #If the bug is present, the order of elements in the get_repr string will
    #be different.
    s1 = get_repr h
    s2 = get_repr cloned

    if s1 != s2 goto fail

    h = new ['Hash']

    h['aa'] = 1
    h['bb'] = 2
    h['cc'] = 3
    h['dd'] = 4
    h['ee'] = 5
    h['ff'] = 6
    h['gg'] = 7
    h['hh'] = 8
    h['ii'] = 9
    h['jj'] = 10
    h['kk'] = 11
    h['ll'] = 12

    cloned = clone h
    s1 = get_repr h
    s2 = get_repr cloned
    if s1 != s2 goto fail

    h = new ['Hash']

    h['one']    = 1
    h['two']    = 2
    h['three']  = 3
    h['four']   = 4
    h['five']   = 5
    h['six']    = 6
    h['seven']  = 7
    h['eight']  = 8
    h['nine']   = 9
    h['ten']    = 10
    h['eleven'] = 11
    h['twelve'] = 12

    cloned = clone h
    s1 = get_repr h
    s2 = get_repr cloned
    if s1 != s2 goto fail

    goto end
fail:
    all_ok = 0
end:
    ok(all_ok, "clone preserves hash internal order")
.end

.sub freeze_thaw_preserves_order
    .local pmc h, cloned
    .local string s1, s2
    .local int all_ok

    all_ok = 1
    h      = new ['Hash']

    h['a'] = 1
    h['b'] = 2
    h['c'] = 3
    h['d'] = 4
    h['e'] = 5
    h['f'] = 6
    h['g'] = 7
    h['h'] = 8
    h['i'] = 9
    h['j'] = 10
    h['k'] = 11
    h['l'] = 12

    $S0 = freeze h
    cloned = thaw $S0
    s1 = get_repr h
    s2 = get_repr cloned

    if s1 != s2 goto fail

    h = new ['Hash']

    h['aa'] = 1
    h['bb'] = 2
    h['cc'] = 3
    h['dd'] = 4
    h['ee'] = 5
    h['ff'] = 6
    h['gg'] = 7
    h['hh'] = 8
    h['ii'] = 9
    h['jj'] = 10
    h['kk'] = 11
    h['ll'] = 12

    $S0 = freeze h
    cloned = thaw $S0
    s1 = get_repr h
    s2 = get_repr cloned
    if s1 != s2 goto fail

    h = new ['Hash']

    h['one']    = 1
    h['two']    = 2
    h['three']  = 3
    h['four']   = 4
    h['five']   = 5
    h['six']    = 6
    h['seven']  = 7
    h['eight']  = 8
    h['nine']   = 9
    h['ten']    = 10
    h['eleven'] = 11
    h['twelve'] = 12

    $S0 = freeze h
    cloned = thaw $S0
    s1 = get_repr h
    s2 = get_repr cloned
    if s1 != s2 goto fail

    goto end
fail:
    all_ok = 0
end:
    ok(all_ok, "freeze/thaw preserves hash internal order")
.end

.sub compound_keys
    new $P0, ['Hash']
    new $P1, ['Hash']
    new $P2, ['ResizablePMCArray']
    set $P1["b"], "ab"
    set $P0["a"], $P1
    set $S0, $P0["a";"b"]
    is( $S0, "ab", 'Str from compound key' )

    set $P2[20], 77
    set $P1["n"], $P2
    set $I0, $P0["a";"n";20]
    is( $I0, 77, 'Int from compound key^2' )

    set $S0, "a"
    set $S1, "n"
    set $I0, 20
    set $I0, $P0[$S0;$S1;$I0]
    is( $I0, 77, 'Int from indirect compound key^2' )

    set $P0["c"], $P2
    set $P2[33], $P1
    set $S0, $P0["c";33;"b"]
    is( $S0, "ab", 'Str from indirect/direct compound key^2' )

    set $S0, "c"
    set $I1, 33
    set $S2, "b"
    set $S0, $P0[$S0;$I1;$S2]
    is( $S0, "ab", 'Str from indirect compound key^2' )

    set $P1["b"], 47.11
    set $N0, $P0["c";$I1;$S2]
    is( $N0, 47.11, 'Num from indirect compound key^2' )
.end

.sub getting_pmcs_from_compound_keys
    new $P0, ['Hash']
    new $P1, ['Hash']
    new $P2, ['Integer']
    set $P2, 12
    set $P1["b"], $P2
    set $P0["a"], $P1
    set $P3, $P0["a";"b"]
    set $S0, $P3
    is( $S0, "12", "lookup PMC from compound key" )
.end
# 12

.sub getting_pmcs_from_string_int_compound_keys
    new $P0, ['Hash']
    new $P1, ['Hash']
    new $P2, ['Integer']
    set $P2, 4
    set $P1[9], $P2
    set $I0, $P1[9]
    is( $I0, 4, 'lookup Int PMC from hash' )

    set $P0["a"], $P1
    set $I0, $P0["a";9]
    is( $I0, 4, 'lookup Inc PMC from compound hash' )
.end

# A hash is only false if it has size 0

.sub if_hash
    new $P0, ['Hash']

    ## Could just use Test::More tests directly, but then we are really
    ## checking casting to Int then testing value (I think)
    ## ie. ok( $P0, '...' )

    $I1 = 0
    if $P0, L1
      $I1 = 1
  L1:
    ok( $I1, 'Empty hash is false' )

    set $P0["key"], "value"
    $I1 = 1
    if $P0, L2
      $I1 = 0
  L2:
    ok( $I1, 'Hash with one slot is true' )

    set $P0["key"], ""
    $I1 = 1
    if $P0, L3
      $I1 = 0
  L3:
    ok( $I1, 'Hash with one value ("") is true' )

    new $P1, ['Undef']
    set $P0["key"], $P1
    $I1 = 1
    if $P0, L4
      $I1 = 0
  L4:
    ok( $P0, 'Hash with one value (Undef PMC) is true' )

.end

.sub unless_hash
    new $P0, ['Hash']

    $I0 = 1
    unless $P0, L1
      $I0 = 0
  L1:
    ok( $I0, 'Empty hash is false in unless' )

    $I0 = 0
    set $P0["key"], "value"
    unless $P0, L2
      $I0 = 1
  L2:
    ok( $I0, 'Hash with one value is true' )

    $I0 = 0
    set $P0["key"], "\0"
    unless $P0, L3
      $I0 = 1
  L3:
    ok( $I0, 'Hash with one value ("\0") is true' )

    $I0 = 0
    new $P1, ['Undef']
    set $P0["key"], $P1
    unless $P0, L4
      $I0 = 1
  L4:
    ok( $I0, 'Hash with one value (Undef PMC) is true' )

.end

.sub defined_hash
    new $P0, ['Hash']

    defined $I0, $P0
    ok( $I0, 'Empty has is defined' )

    ## nok() had not been (correctly) implemented when this test was written

    defined $I0, $P1
    $I0 = not $I0
    ok( $I0, 'Unassigned var is undefined' )

    set $P0["a"], 1
    defined $I0, $P0["a"]
    ok( $I0, 'Int in hash value is defined' )

    defined $I0, $P0["b"]
    $I0 = not $I0
    ok( $I0, 'Unassigned hash slot is undefined' )

    new $P1, ['Undef']
    set $P0["c"], $P1
    defined $I0, $P0["c"]
    $I0 = not $I0
    ok( $I0, 'Undef PMC in hash slot is undefined' )
.end

.sub exists_hash_key
    new $P0, ['Hash']

    set $P0["a"], 1
    exists $I0, $P0["a"]
    ok( $I0, 'assigned hash key exists' )

    exists $I0, $P0["b"]
    $I0 = not $I0
    ok( $I0, 'unassigned hash key does not exist' )

    new $P1, ['Undef']
    set $P0["c"], $P1
    exists $I0, $P0["c"]
    ok( $I0, 'hash key assigned Undef PMC exists' )
.end

.sub delete_hash_key
    new $P0, ['Hash']

    set $P0["a"], 1
    exists $I0, $P0["a"]
    ok( $I0, 'assigned hash key exists' )

    delete $P0["a"]
    exists $I0, $P0["a"]
    $I0 = not $I0
    ok( $I0, 'delete hash key does not exist' )
.end

.sub cloning_keys
    new $P10, ['Hash']
    new $P1, ['Key']

    set $P1, "Bar"
    set $P10[$P1], "Food"
    clone $P2, $P1
    set $S0, $P10[$P2]
    is( $S0, "Food", 'cloned key looks up same value' )

    set $S1, "Baa"
    set $P10[$S1], "Sheep"
    clone $S2, $S1
    set $S0, $P10[$S2]
    is( $S0, "Sheep", 'cloned key again look up same value' )
.end

.sub cloning_pmc_vals
    new $P10, ['Hash']

    new $P1, ['Undef']
    set $P1, "value"
    set $P10["str"], $P1

    new $P1, ['Undef']
    set $P1, 42
    set $P10["int"], $P1

    clone $P2, $P10
    set $P0, $P2["int"]
    is( $P0, 42, 'cloned hash contained pre-clone set int' )
    set $P0, $P2["str"]
    is( $P0, 'value', 'cloned hash contains pre-clone set str' )
.end

.sub delete_and_free_list
    set $I2, 10
    set $I1, 1
    new $P0, ['FixedPMCArray']
    set $P0, 1
    new $P1, ['Hash']
outer:
    set $P0[0], $I1
    sprintf $S0, "ok %vd\n", $P0
    set $P1[$S0], $S0

    ## set $P1[key]=1 then delete it 100 times
    set $I0, 100
lp:
    set $P1["key"], 1
    delete $P1["key"]
    dec $I0
    if $I0, lp

    set $S1, $P1[$S0]
    # print $S1
    inc $I1
    le $I1, $I2, outer

    set $I0, $P1
    is( $I0, 10, 'hash has size 10' )
.end

## XXX already tested?
.sub exists_with_constant_string_key
    new $P16, ['Hash']

    set $P16["key1"], "value for key1"
    set $S16, $P16["key1"]
    is( $S16, "value for key1" , 'set and lookup value for const str key' )

    exists $I17, $P16["key1"]
    ok( $I17, 'exists with constant string key' )

    exists $I17, $P16["no such"]
    $I17 = not $I17
    ok( $I17, 'does not exist with unassigned const string key' )
.end

.sub hash_in_pir
    .local pmc hash1
    hash1 = new ['Hash']
    hash1['X'] = 'U'
    .local string val1
    val1 = hash1['X']
    is( val1, "U", 'hash in PIR' )
.end

.sub setting_with_compound_keys
    .local pmc outer_hash
    outer_hash = new ['Hash']
    .local pmc inner_hash
    inner_hash = new ['Hash']
    .local pmc inner_array
    inner_array = new ['ResizablePMCArray']
    .local string elem_string
    .local int    elem_int
    .local pmc    elem_pmc
    .local num    elem_num

    # setting and retrieving strings in an inner ResizablePMCArray
    inner_array[128] = 'inner_array:128'
    outer_hash['inner_array'] = inner_array
    elem_string = outer_hash['inner_array';128]
    is( elem_string, 'inner_array:128', 'string in inner ResizeablePMCArray' )
    outer_hash['inner_array';128] = 'changed inner_array:128'
    elem_string = outer_hash['inner_array';128]
    is( elem_string, 'changed inner_array:128', 'string in inner ResizeablePMCArray' )

    # setting and retrieving strings in an inner Hash
    inner_hash['129'] = 'inner_hash:129'
    outer_hash['inner_hash'] = inner_hash
    elem_string = outer_hash['inner_hash';'129']
    is( elem_string, 'inner_hash:129', 'string in inner Hash' )
    outer_hash['inner_hash';'129'] = 'changed inner_hash:129'
    elem_string = outer_hash['inner_hash';'129']
    is( elem_string, 'changed inner_hash:129', 'string in inner Hash' )

    # setting and retrieving integer in an inner ResizablePMCArray
    inner_array[130] = 130
    outer_hash['inner_array'] = inner_array
    elem_int = outer_hash['inner_array';130]
    is( elem_int, 130, 'int in inner ResizablePMCArray' )
    outer_hash['inner_array';130] = -130
    elem_int = outer_hash['inner_array';130]
    is( elem_int, -130, 'int in inner ResizablePMCArray' )

    # setting and retrieving integer in an inner Hash
    inner_hash['131'] = 131
    outer_hash['inner_hash'] = inner_hash
    elem_int = outer_hash['inner_hash';'131']
    is( elem_int, 131, 'int in inner Hash' )
    outer_hash['inner_hash';'131'] = -131
    elem_int = outer_hash['inner_hash';'131']
    is( elem_int, -131, 'int in inner Hash' )

    # setting and retrieving a PMC in an inner ResizablePMCArray
    .local pmc in_pmc
    in_pmc = new ['String']
    in_pmc = 'inner_array:132'
    inner_array[132] = in_pmc
    outer_hash['inner_array'] = inner_array
    elem_pmc = outer_hash['inner_array';132]
    is( elem_pmc, 'inner_array:132', 'PMC in inner ResizablePMCArray' )
    in_pmc = 'changed inner_array:132'
    outer_hash['inner_array';132] = in_pmc
    elem_pmc = outer_hash['inner_array';132]
    is( elem_pmc, 'changed inner_array:132', 'PMC in inner ResizablePMCArray' )

    # setting and retrieving a PMC in an inner Hash
    in_pmc = 'inner_array:133'
    inner_hash['133'] = in_pmc
    outer_hash['inner_hash'] = inner_hash
    elem_string = outer_hash['inner_hash';'133']
    is( elem_string, 'inner_array:133', 'PMC in inner Hash' )
    in_pmc = 'changed inner_hash:133'
    outer_hash['inner_hash';'133'] = in_pmc
    elem_string = outer_hash['inner_hash';'133']
    is( elem_string, 'changed inner_hash:133', 'PMC in inner Hash' )

    # setting and retrieving a float in an inner ResizablePMCArray
    inner_array[134] = 134.134
    outer_hash['inner_array'] = inner_array
    elem_num = outer_hash['inner_array';134]
    is( elem_num, 134.134000, 'float in inner ResizablePMCArray' )
    outer_hash['inner_array';134] = -134.134
    elem_num = outer_hash['inner_array';134]
    is( elem_num, -134.134000, 'float in inner ResizablePMCArray' )

    # setting and retrieving a float in an inner Hash
    inner_hash['135'] = 135.135
    outer_hash['inner_hash'] = inner_hash
    elem_num = outer_hash['inner_hash';'135']
    is( elem_num, 135.135000, 'float in inner Hash' )
    outer_hash['inner_hash';'135'] = -135.135
    elem_num = outer_hash['inner_hash';'135']
    is( elem_num, -135.135000, 'float in inner Hash' )

.end

.sub mutating_the_lookup_string
    new $P0, ['Hash']
    set $P0["a"], "one"
    set $P0["ab"], "two"
    set $P0["abc"], "three"

    set $S0, "a"
    set $S1, $P0[$S0]
    is( $S1, "one", 'lookup via str in reg' )

    $S0 = concat $S0, "b"
    set $S1, $P0[$S0]
    is( $S1, "two", 'lookup via concated str in reg' )

    $S0 = concat $S0, "c"
    set $S1, $P0[$S0]
    is( $S1, "three", 'lookup via concated^2 str in reg' )
.end

.sub check_whether_interface_is_done
    .local pmc pmc1
    pmc1 = new ['Hash']
    .local int bool1

    does bool1, pmc1, "scalar"
    bool1 = not bool1
    ok( bool1, 'Hash PMC does not do scalar' )

    does bool1, pmc1, "hash"
    ok( bool1, 'Hash PMC does hash' )

    does bool1, pmc1, "no_interface"
    bool1 = not bool1
    ok( bool1, 'Hash PMC does not do no_interface' )
.end

.sub iter_over_hash
    new $P0, ['Hash']
    set $P0['a'], 'x'

    iter $P1, $P0
    $I0 = 1
    if $P1 goto L1
      $I0 = 0
  L1:
    ok( $I0, 'iterator is true' )

    shift $P2, $P1
    is( $P2, 'a', 'shifting iterator give the key' )

    $I0 = 0
    if $P1 goto L2
      $I0 = 1
  L2:
    ok( $I0, 'iterator is now false' )
.end

## thx to azuroth on irc
.sub broken_delete
  .include "iterator.pasm"
  .local string result
  result = ""

  .local pmc thash

  # just put in some dummy data...
  thash = new ['Hash']
  thash["a"] = "b"
  thash["c"] = "d"
  thash["e"] = "f"

  .local pmc it
  it = iter thash
  it = .ITERATE_FROM_START

  .local pmc keys, key
  keys = new ['ResizablePMCArray']

  # go through the hash, print out all the keys: should be a c and e
preit_loop:
  unless it goto preit_end

  key = shift it
  $S0 = key
  push keys, $S0

  branch preit_loop
preit_end:

  keys.'sort'()
  result = join '', keys
  is( result, 'ace', 'iterated through keys successfully' )

  # get rid of the c element?
  delete thash["c"]
  keys = new ['ResizablePMCArray']

  # what do we have after deletion?
  result = ""

  it = iter thash
  it = .ITERATE_FROM_START

  # go through the hash, print out all the keys... I believe it should be a and e?
  # it actually outputs a, c and e.
postit_loop:
  unless it goto postit_end

  key = shift it
  $S0 = key
  push keys, $S0


  branch postit_loop
postit_end:

  keys.'sort'()
  result = join '', keys
  is( result, 'ae', 'the c key was no longer iterated over' )
.end

.sub unicode_keys_register_rt_39249
  $P1 = new ['Hash']

  $S99 = utf8:"\u7777"
  $P1[$S99] = "ok"
  $S1 = $P1[$S99]
  is( $S1, 'ok', 'unicode key' )
.end

.sub unicode_keys_literal_rt_39249
  $P1 = new ['Hash']

  $P1[utf8:"\u7777"] = "ok"
  $S1 = $P1[utf8:"\u7777"]
  is( $S1, 'ok', 'literal unicode key' )

  $S2 = utf8:"\u7777"
  $S1 = $P1[$S2]
  is( $S1, 'ok', 'literal unicode key lookup via var' )
.end

# Switch to use integer keys instead of strings.
.sub integer_keys
    .include "hash_key_type.pasm"
    .local pmc hash
    hash = new ['Hash']
    hash = .Hash_key_type_int

    hash[0]   = 'foo'
    hash[42]  = 'bar'
    $S0       = 'foo'
    hash[$S0] = 'BAZ'

    $S0       = '42 parrots'
    hash[$S0] = 'Wins!'

    # 'foo' numifies to '0'. So check it
    $S0 = hash[0]
    is($S0, 'BAZ', 'Key was numified')

    # '42 parrots' numifies to '42'. So check it
    $S0 = hash[42]
    is($S0, 'Wins!', 'Key was numified again')

    # delete key 0
    delete hash[0]
    $S0 = hash[0]
    is($S0, '', 'Item with key 0 deleted')
.end

# Check that we can set various value types and they properly converted
.sub value_types_convertion
    .local pmc hash
    hash = new ['Hash']

    # PMC is first value type
    hash.'set_value_type'(.DATATYPE_PMC)
    $P0 = new 'Env' # arbitrary choice. Just to prevent possible casting.
    hash['env'] = $P0
    hash['foo'] = 42
    hash['bar'] = 21285.06
    hash['baz'] = 'forty two'

    # Check that original value preserved
    $P1 = hash['env']
    $I0 = isa $P1, 'Env'
    ok($I0, 'Env PMC preserved')
    $I0 = hash['foo']
    is($I0, 42, 'Intval preserved')
    $N0 = hash['bar']
    is($N0, 21285.06, 'Number preserved')
    $S0 = hash['baz']
    is($S0, 'forty two', 'String preserved')

    # Clear the Hash and set INTVAL as stored values.
    hash.'set_value_type'(.DATATYPE_INTVAL)
    hash['foo'] = 42            # Use as-is
    hash['bar'] = 21285.06      # Truncate to int
    hash['baz'] = 'forty two'   # Cast to int

    $I0 = hash['foo']
    is($I0, 42, 'Intval preserved with datatype int')
    $I0 = hash['bar']
    is($I0, 21285, 'Floatval trunkated to int')
    $I0 = hash['baz']
    is($I0, 0, 'String casted to int')

    # TODO Add tests for String.
.end

# Check number of elements in Hash
.sub 'elements_in_hash'
    .local pmc hash
    hash = new ['Hash']

    $I0 = elements hash
    is($I0, 0, "Empty hash has 0 items")

    hash['foo'] = 'FOO'
    $I0 = elements hash
    is($I0, 1, "Hash has 1 item")

    hash['foo'] = 'BAR'
    $I0 = elements hash
    is($I0, 1, "Hash still has 1 item after update")

    hash['bar'] = 'BAR'
    $I0 = elements hash
    is($I0, 2, "Hash has 2 items")

    delete hash['foo']
    $I0 = elements hash
    is($I0, 1, "Hash has 1 item after delete")

    delete hash['bar']
    $I0 = elements hash
    is($I0, 0, "Hash has 0 items after delete")

.end

.sub 'equality_tests'
    .local pmc hash1, hash2, hash3, hash4, hash5
    hash1 = new ['Hash']
    hash2 = new ['Hash']
    hash3 = new ['Hash']
    hash4 = new ['Hash']

    hash1['one'] = "Hello Parrot!"
    hash1['two'] = 1664
    hash1['three'] = 2.718

    hash2['ONE'] = "Hello Parrot!"
    hash2['TWO'] = 1664
    hash2['THREE'] = 2.718

    $P0 = box "Hello Parrot!"
    hash3['one'] = $P0
    $P0 = box 1664
    hash3['two'] = $P0
    $P0 = box 2.718
    hash3['three'] = $P0

    hash4['one'] = "Goodbye Parrot!"
    hash4['two'] = 1664
    hash4['three'] = 2.718

    hash5 = clone hash1

    isnt(hash1, hash2, 'Hashes with different keys')
    is(hash1, hash3, 'Equal hashes, physically disjoint')
    isnt(hash1, hash4, 'Different hash values')
    is(hash1, hash5, 'Clones are equal')
.end

# Switch to use PMC keys instead of strings.
.sub 'pmc_keys'
    .include "hash_key_type.pasm"
    .local pmc hash
    hash = new ['Hash']
    hash = .Hash_key_type_PMC

    $P0 = new ['ResizableStringArray']
    push $P0, "foo"
    hash[$P0] = 'FOO'
    # Autoconvert INTVAL to Integer
    hash[42]  = 'bar'
    $S0       = 'foo'
    # Autoconvert STRING to String
    hash[$S0] = 'BAZ'

    $I0 = elements hash
    is($I0, 3, "Got 3 elements in Hash")

    # Iterate over keys and get types. We should have 3 different types:
    # ResizableStringArray, Integer and String
    .local pmc types, it
    types = new ['Hash']
    it = iter hash
  loop:
    unless it goto done
    $P0 = shift it
    $P1 = $P0.'key'()
    $S0 = typeof $P1
    types[$S0] = 1
    goto loop
  done:

    $I0 = elements types
    is($I0, 3, "Got 3 different types of PMC keys")
    $I0 = types['ResizableStringArray']
    ok($I0, "Including ResizableStringArray")


    # Check custom hashvalue vtable.
    $P0 = newclass ['Foo']
    addattribute $P0, "invoked"

    $P0 = new ['Foo']
    hash[$P0] = "answer"
    $P1 = getattribute $P0, "invoked"
    is ($P1, 42, "hashvalue was invoked")
.end

.namespace ['Foo']
.sub '' :method :vtable('hashvalue')
    $P0 = box 42
    setattribute self, "invoked", $P0
    .return (42)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
