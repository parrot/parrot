#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/hashiterator.t - Test the HashIterator PMC

=head1 SYNOPSIS

    % prove t/pmc/hashiterator.t

=head1 DESCRIPTION

Tests the C<HashIterator> PMC. Checks key access with various types of
normal and potentially hazardous keys. Does a bit of stress testing as
well.

=cut

.include 'hash_key_type.pasm'
.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(14)

    iter_over_empty_hash()
    iter_over_single_element()
    iter_over_single_element_with_checks()
    iter_invalid_type()
    iter_hash_keyed_int()
    iter_clone()
    iter_and_delete()
.end

.sub 'iter_over_empty_hash'
    .local pmc hash, it
    hash = new 'Hash'
    it   = new 'HashIterator', hash
    $I0  = isfalse it
    ok($I0, "Iterator for empty Hash is empty")

    $I0  = elements it
    is($I0, 0, "Iterator for empty Hash has 0 elements")

    # shift_pmc throws on empty Hash but shift_string doesn't.

    $S0 = shift it
    is($S0, '', 'shift string for empty hash gives empty string')

    .local pmc eh
    .local int i
    i = 1
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_label eh, catch
    push_eh catch
    $P0 = shift it
    i = 0
    goto report
  catch:
    finalize eh
  report:
    pop_eh
    ok(i, 'shift pmc for empty hash throws')
.end

.sub 'iter_over_single_element'
    .local pmc hash, it
    hash = new 'Hash'
    hash["foo"] = "bar"
    it   = new 'HashIterator', hash
    $I0  = istrue it
    ok($I0, "Iterator for non empty Hash is not empty")
    $P0  = shift it
    $I0  = isfalse it
    ok($I0, "And contains one element")
.end

.sub 'iter_over_single_element_with_checks'
    .local pmc hash, it
    hash = new 'Hash'
    hash["foo"] = "bar"

    it   = new 'HashIterator', hash
    $P0  = shift it
    $I0  = isa $P0, 'HashIteratorKey'
    ok($I0, "HashIteratorKey fetched successfully")

    $S0  = $P0 # Get key
    is($S0, "foo", "Key fetched successfully")
    $S1  = hash[$P0]
    is($S1, "bar", "Value fetched successfully")

.end

.sub 'iter_invalid_type'
    .local pmc hash, it
    hash = new 'Hash'
    it   = new 'HashIterator', hash
    .local pmc eh
    .local int i
    i = 1
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_label eh, catch
    push_eh catch
    it = 987 # Arbitrary value, let's hope we never use
    i = 0
    goto report
  catch:
    finalize eh
  report:
    pop_eh
    ok(i, 'setting invalid type throws')
.end

.sub iter_hash_keyed_int
    .local pmc hash, it, value
    .local int check
    hash = new ['Hash']
    hash = .Hash_key_type_int
    hash[0] = 'a'
    hash[1] = 'b'
    hash['0'] = 'x'
    it = iter hash
    value = shift it
    value = shift it
    check = 0
    if it goto report
    check = 1
  report:
    is(check, 1, 'iterate over hash with int key type')
.end

.sub iter_clone
    .local pmc oh, it, cl
    .local int result
    oh = new ['Hash']
    it = iter oh

    # This checks the de facto behavior for code coverage purposes.
    cl = clone it
    result = isnull cl
    ok(result, 'clone of HashIterator gives null')
.end

.sub iter_and_delete
    .local pmc hash, it, value
    .local int check

    # Make sure we get used memory with garbage content and not fresh
    # zeroed pages
    sweep 1

    hash = new ['Hash']
    hash = .Hash_key_type_int
    hash[1] = 'a'
    hash[2] = 'b'
    hash[3] = 'c'
    it = iter hash
    delete hash[1]
    delete hash[2]
    delete hash[3]
    check = 0
    push_eh catch_int
    value = shift it
    goto report_int
  catch_int:
    check = 1
  report_int:
    ok(check, 'iterate over int hash with deleted keys')
    pop_eh

    hash = new ['Hash']
    hash['x'] = 'a'
    hash['y'] = 'b'
    hash['z'] = 'c'
    it = iter hash
    delete hash['x']
    delete hash['y']
    delete hash['z']
    check = 0
    push_eh catch
    value = shift it
    goto report
  catch:
    check = 1
  report:
    ok(check, 'iterate over string hash with deleted keys')
    pop_eh
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
