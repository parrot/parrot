#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/capture.t - Test the Capture PMC

=head1 SYNOPSIS

    % parrot t/pmc/capture.t

=head1 DESCRIPTION

Tests the C<Capture> PMC. Checks integer and key access using
a variety of keys and values.

=cut

.sub 'test' :main
    .include 'test_more.pir'

    test_new_capture()
    empty_capture_tests()
    basic_capture_tests()
    test_defined_delete_exists()
    test_hash_list()
    test_get_integer()
    test_get_number()
    test_keyed_int_delegation()
    test_list_delegation()
    test_set_capture()

    test_freeze_thaw()

    "done_testing"()
.end

.sub 'test_new_capture'
    .local pmc capt

    capt = new ['Capture']
    ok(1, 'new Capture')
.end

.sub 'empty_capture_tests'
    .local pmc capt

    capt = new ['Capture']

    $I0 = elements capt
    is($I0, 0, 'elements on empty Capture')

    $N0 = capt[0]
    is($N0, 0.0, 'get_number_keyed_int on empty Capture')
    $I0 = capt[0]
    is($I0, 0, 'get_integer_keyed_int on empty Capture')
    $S0 = capt[0]
    is($S0, '', 'get_string_keyed_int on empty Capture')

    $N0 = capt['nothing']
    is($N0, 0.0, 'get_number_keyed on empty Capture')

    $S0 = capt
    $S1 = 'get_string on empty Capture - ' . $S0
    substring($S0, 'Capture[', $S1)
.end

.sub 'basic_capture_tests'
    .local pmc capt

    capt = new ['Capture']

    capt[0] = 0
    capt[1] = 1.5
    capt[2] = 'two'
    $P0 = new ['Integer']
    $P0 = 3
    capt[3] = $P0

    push capt, 4
    push capt, 5.5
    push capt, 'six'
    $P0 = new ['Integer']
    $P0 = 7
    push capt, $P0

    unshift capt, 8
    unshift capt, 9.5
    unshift capt, 'ten'
    $P0 = new ['Integer']
    $P0 = 11
    unshift capt, $P0

    capt['alpha'] = 12
    capt['beta'] = 13.5
    capt['gamma'] = 'fourteen'
    $P0 = new ['Integer']
    $P0 = 15
    capt['delta'] = $P0

    $I0 = elements capt
    is($I0, 12, 'elements')

    $I0 = capt[11]
    is($I0, 7, 'get_integer_keyed_int')

    $P0 = capt[10]
    is($P0, 'six', 'get_pmc_keyed_int')

    $N0 = capt[9]
    is($N0, 5.5, 'get_number_keyed_int')

    $S0 = capt[8]
    is($S0, '4', 'get_string_keyed_int')

    $I0 = pop capt
    is($I0, 7, 'pop an integer')

    $P0 = pop capt
    is($P0, 'six', 'pop a PMC')

    $N0 = pop capt
    is($N0, 5.5, 'pop a number')

    $S0 = pop capt
    is($S0, '4', 'pop a string')

    $I0 = elements capt
    is($I0, 8, 'elements after pop')

    $I0 = shift capt
    is($I0, 11, 'shift an integer')

    $P0 = shift capt
    is($P0, 'ten', 'shift a PMC')

    $N0 = shift capt
    is($N0, 9.5, 'shift a number')

    $S0 = shift capt
    is($S0, '8', 'shift a string')

    $I0 = elements capt
    is($I0, 4, 'elements after shift')

    $P0 = pop capt
    is($P0, 3, 'pop 1 out of 4')

    $P0 = pop capt
    is($P0, 'two', 'pop 2 out of 4')

    $P0 = pop capt
    is($P0, 1.5, 'pop 3 out of 4')

    $P0 = pop capt
    is($P0, 0, 'pop 4 out of 4')

    $I0 = capt['delta']
    is($I0, 15, 'get_integer_keyed_str')

    $P0 = capt['gamma']
    is($P0, 'fourteen', 'get_pmc_keyed_str')

    $N0 = capt['beta']
    is($N0, 13.5, 'get_number_keyed_str')

    $S0 = capt['alpha']
    is($S0, '12', 'get_string_keyed_str')
.end

.sub 'test_defined_delete_exists'
    .local pmc capt
    capt = new ['Capture']

    $I0 = defined capt[2]
    nok($I0, 'defined_i initially false')

    $I1 = exists capt[2]
    nok($I1, 'exists_i initially false')

    $I0 = defined capt['alpha']
    nok($I0, 'defined_s initially false')

    $I1 = exists capt['alpha']
    nok($I1, 'exists_s initially false')

    capt[2] = 1
    capt['alpha'] = 1
    $P0 = new ['Undef']
    capt['beta'] = $P0

    $I0 = defined capt[2]
    ok($I0, 'defined_i true after set')

    $I1 = exists capt[2]
    ok($I1, 'exists_i true after set')

    $I0 = defined capt['alpha']
    ok($I0, 'defined_s true after set')

    $I1 = exists capt['alpha']
    ok($I1, 'exists_s true after set')

    $I0 = defined capt[1]
    nok($I0, 'defined_i - no intermediate element created')

    $I1 = exists capt[1]
    nok($I1, 'exists_i - no intermediate element created')

    $I0 = defined capt['beta']
    nok($I0, 'defined_s checks for Undef values...')

    $I1 = exists capt['beta']
    ok($I1, 'but exists_s does not care')

    delete capt[2]
    delete capt['alpha']

    $I0 = defined capt[2]
    nok($I0, 'defined_i false after delete')
    $I1 = exists capt[2]
    nok($I1, 'exists_i false after delete')

    $I0 = defined capt['alpha']
    nok($I0, 'defined_s false after delete')
    $I1 = exists capt['alpha']
    nok($I1, 'exists_s false after delete')
.end

.sub 'test_hash_list'
    .local pmc capt

    capt = new ['Capture']

    $P0 = capt.'list'()
    $P1 = capt.'hash'()

    isa_ok($P0, 'ResizablePMCArray', "capt.'list'")
    isa_ok($P1, 'Hash', "capt.'hash'")
.end

.sub 'test_get_integer'
    .local pmc capt

    capt = new ['Capture']
    push_eh test_get_integer_catch
    $I0 = capt

    nok(1, 'get_integer not implemented')
    .return ()

  test_get_integer_catch:
    pop_eh
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    message = substr message, 0, 29
    is(message, 'get_integer() not implemented', 'get_integer not implemented')
    .return ()
.end

.sub 'test_get_number'
    .local pmc capt

    capt = new ['Capture']
    push_eh test_get_number_catch
    $N0 = capt

    nok(1, 'get_number not implemented')
    .return ()

  test_get_number_catch:
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    message = substr message, 0, 28
    is(message, 'get_number() not implemented', 'get_number not implemented')
    .return ()
.end


.sub 'test_keyed_int_delegation'
    $P99 = subclass ['Capture'], ['Match']
    $P1 = new ['Match']
    $P1[1] = 1
    $I1 = elements $P1
    is($I1, 2, 'elements - delegated to parent class')

    $P99 = subclass ['Match'], ['Exp']
    $P2 = new ['Exp']
    $P2[1] = 1
    $I2 = elements $P2
    is($I2, 2, 'elements - delegated twice')
.end

.sub 'test_list_delegation'
    $P0 = subclass ['Capture'], ['Match2']
    addattribute $P0, '$.abc'
    addattribute $P0, '$.xyz'
    $P1 = new ['Match2']
    $P1[1] = 1

    $P2 = new ['String']
    setattribute $P1, '$.abc', $P2
    $P2 = new ['String']
    setattribute $P1, '$.xyz', $P2

    $P2 = $P1.'list'()
    $P2 = 0
    $I0 = elements $P2
    is($I0, 0, 'list method delegation')
.end

.sub 'test_set_capture'
    .local pmc capt
    .local pmc capt2
    $P1 = new ['String']

    capt = new ['Capture']
    capt2 = new ['Capture']

    capt[0] = 1337

    setref capt2, capt

    $I0 = capt2[0]
    is($I0, 1337, "Set PMC values correct")

    $P0 = new ['Role']
    push_eh set_badpmc
        setref capt, $P0
    pop_eh
    goto finally
    set_badpmc:
        .get_results($P1)
        ok(1, "Bad set_pmc handled properly")
    finally:
.end

.sub 'test_freeze_thaw'
    $P0 = new ["Capture"]
    $P0["foo"] = "foo"
    $P0[0]     = "bar"

    # Sanity check
    $S0 = $P0["foo"]
    "is"($S0, "foo")
    $S0 = $P0[0]
    "is"($S0, "bar")

    $S1 = freeze $P0
    $P0 = thaw $S1

    $S0 = $P0["foo"]
    "is"($S0, "foo", "Hash thawed", "todo" => "TT #2047")
    $S0 = $P0[0]
    "is"($S0, "bar", "Array thawed", "todo" => "TT #2047")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
