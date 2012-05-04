#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

t/pmc/resizablefloatarray.t - ResizableFloatArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizablefloatarray.t

=head1 DESCRIPTION

Tests C<ResizableFloatArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.const int TESTS = 63
.const num PRECISION = 1e-6

.sub 'test' :main
    .include 'test_more.pir'
    .include 'fp_equality.pasm'

    plan(TESTS)

    creation()
    setting_size()
    negative_size()
    setting_first_element()
    setting_second_element()
    setting_negative_index()
    getting_negative_index()
    setting_out_of_bounds()
    getting_out_of_bounds()
    set_pmc_get_int()
    set_int_get_pmc()
    basic_push()
    push_many_values()
    basic_pop()
    pop_many_values()
    push_pop()
    pop_empty()
    shift_empty()
    push_float()
    shift_float()
    unshift_float()
    check_interface()
    get_iter()
    'clone'()
    method_reverse()
.end

.sub 'creation'
    $P0 = new ['ResizableFloatArray']
    ok(1, 'creation')
.end

.sub 'setting_size'
    $P0 = new ['ResizableFloatArray']

    $I0 = $P0
    is($I0, 0, 'size is initially 0')

    $P0 = 1
    $I0 = $P0
    is($I0, 1, 'setting size to 1')

    $P0 = 5
    $I0 = $P0
    is($I0, 5, 'resizing to 5')

    $P0 = 9
    $I0 = $P0
    is($I0, 9, 'resizing to 9')

    $P0 = 7
    $I0 = $P0
    is($I0, 7, 'resizing to 7')
.end

.sub 'negative_size'
    $P0 = new ['ResizableFloatArray']

    push_eh negative_size_handler
    $P0 = -100
    pop_eh
    nok(1, 'setting negative array size')
    .return()

  negative_size_handler:
    pop_eh
    ok(1, "cannot set negative array size")
.end

.sub 'setting_first_element'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    $P0[0] = -7
    $I0 = $P0[0]
    is($I0, -7, 'setting first element from int')

    $P0[0] = 3.7
    $N0 = $P0[0]
    is($N0, 3.7, 'setting first element from number')

    $P0[0] = "17.2"
    $S0 = $P0[0]
    is($S0, "17.2", 'setting first element from string')
.end

.sub 'setting_second_element'
    $P0 = new ['ResizableFloatArray']

    $P0[1] = -7
    $I0 = $P0[1]
    is($I0, -7, 'setting second element from int')

    $P0[1] = 3.7
    $N0 = $P0[1]
    is($N0, 3.7, 'setting second element from number')

    $P0[1] = "17.1"
    $S0 = $P0[1]
    is($S0, "17.1", 'setting second element from string')
.end

.sub 'setting_negative_index'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    push_eh setting_negative_index_handler
    $P0[-1] = -7
    pop_eh
    nok(1, 'setting negatively indexed elements')
    .return ()

  setting_negative_index_handler:
    ok(1, 'setting negatively indexed elements')
.end

.sub 'getting_negative_index'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    push_eh getting_negative_index_handler
    $I0 = $P0[-1]
    pop_eh
    nok(1, 'getting negatively indexed elements')
    .return ()

  getting_negative_index_handler:
    ok(1, 'getting negatively indexed elements')
.end

.sub 'setting_out_of_bounds'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    $P0[1] = -7
    ok(1, 'setting out-of-bounds elements')
.end

.sub 'getting_out_of_bounds'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    $I0 = $P0[1]
    ok(1, 'getting out-of-bounds elements')
.end

.sub 'set_pmc_get_int'
    $P0 = new ['ResizableFloatArray']
    $P1 = new ['Key']

    $P1 = 0
    $P0[$P1] = 25

    $P1 = 1
    $P0[$P1] = 2.5

    $P1 = 2
    $P0[$P1] = "17.32"

    $I0 = $P0[0]
    is($I0, 25, 'Set via PMC keys, access via INTs (1)')

    $N0 = $P0[1]
    is($N0, 2.5, 'Set via PMC keys, access via INTs (2)', PRECISION)

    $S0 = $P0[2]
    is($S0, "17.32", 'Set via PMC keys, access via INTs (3)')
.end

.sub 'set_int_get_pmc'
    $P0 = new ['ResizableFloatArray']
    $P0 = 1

    $P0[25] = 125
    $P0[128] = 10.2
    $P0[513] = "17.3"
    $P1 = new ['Integer']
    $P1 = 123456
    $P0[1023] = $P1

    $P2 = new ['Key']

    $P2 = 25
    $I0 = $P0[$P2]
    is($I0, 125, 'Set via INTs, access via PMC Keys (1)')

    $P2 = 128
    $N0 = $P0[$P2]
    is($N0, 10.2, 'Set via INTs, access via PMC Keys (2)', PRECISION)

    $P2 = 513
    $S0 = $P0[$P2]
    is($S0, "17.3", 'Set via INTs, access via PMC Keys (3)')

    $P2 = 1023
    $I0 = $P0[$P2]
    is($I0, 123456, 'Set via INTs, access via PMC Keys (4)')
.end

.sub 'basic_push'
    $P0 = new ['ResizableFloatArray']
    push $P0, 1.0
    push $P0, 2.0
    push $P0, 3.0

    $N0 = $P0[0]
    is($N0, 1.0, 'basic push (1)', PRECISION)

    $N0 = $P0[1]
    is($N0, 2.0, 'basic push (2)', PRECISION)

    $N0 = $P0[2]
    is($N0, 3.0, 'basic push (3)', PRECISION)
.end

.sub 'push_many_values'
    $P0 = new ['ResizableFloatArray']

    $I0 = 0
  push_many_values_fill:
    $N0 = $I0
    push $P0, $N0
    inc $I0
    if $I0 < 100000 goto push_many_values_fill

  push_many_values_test:
    dec $I0
    $N0 = $I0
    $N1 = $P0[$I0]
    .fp_ne($N0, $N1, push_many_values_evil)
    if $I0 > 0 goto push_many_values_test

    ok(1, 'push many values')
    .return ()

  push_many_values_evil:
    nok(1, 'push many values is evil')
.end

.sub 'basic_pop'
    $P0 = new ['ResizableFloatArray']
    $P0[0] = 1.0
    $P0[1] = 2.0
    $P0[2] = 3.0

    $N0 = pop $P0
    is($N0, 3.0, 'basic pop (1)', PRECISION)

    $N0 = pop $P0
    is($N0, 2.0, 'basic pop (2)', PRECISION)

    $N0 = pop $P0
    is($N0, 1.0, 'basic pop (3)', PRECISION)
.end

.sub 'pop_many_values'
    $P0 = new ['ResizableFloatArray']

    $I0 = 0
  pop_many_values_fill:
    $N0 = $I0
    $P0[$I0] = $N0
    inc $I0
    if $I0 < 100000 goto pop_many_values_fill

  pop_many_values_test:
    dec $I0
    $N0 = $I0
    $N1 = pop $P0
    .fp_ne($N0, $N1, pop_many_values_evil)
    if $I0 > 0 goto pop_many_values_test

    ok(1, 'pop many values')
    .return ()

  pop_many_values_evil:
    nok(1, 'pop many values is evil')
.end

.sub 'push_pop'
    $P0 = new ['ResizableFloatArray']
    push $P0, 1.0
    push $P0, 2.0
    push $P0, 3.0

    $N0 = pop $P0
    is($N0, 3.0, 'push/pop (1)')

    $N0 = pop $P0
    is($N0, 2.0, 'push/pop (2)')

    $N0 = pop $P0
    is($N0, 1.0, 'push/pop (3)')
.end

.sub 'pop_empty'
    $P0 = new ['ResizableFloatArray']

    push_eh pop_empty_handler
    $N0 = pop $P0
    pop_eh
    nok(1, 'pop from empty array')
    .return()

  pop_empty_handler:
    pop_eh
    ok(1, "cannot pop from empty array")
.end

.sub 'shift_empty'
    $P0 = new ['ResizableFloatArray']

    push_eh shift_empty_handler
    $N0 = shift $P0
    pop_eh
    nok(1, 'shift from empty array')
    .return()

  shift_empty_handler:
    pop_eh
    ok(1, "cannot shift from empty array")
.end

.sub 'check_interface'
    $P0 = new ['ResizableFloatArray']

    $I0 = does $P0, 'scalar'
    nok($I0, 'ResizableFloatArray does not scalar')

    $I0 = does $P0, 'array'
    ok($I0, 'ResizableFloatArray does array')

    $I0 = does $P0, 'no_interface'
    nok($I0, 'ResizableFloatArray does not no_interface')
.end

.sub 'push_float'
    $P0 = new ['ResizableFloatArray']
    $P0[9999] = 10000.10000
    push $P0, 123.123

    $I0 = elements $P0
    is($I0, 10001, 'push float: size')

    $N0 = $P0[10000]
    is($N0, 123.123, 'push float: test pushed element', PRECISION)
.end

.sub 'shift_float'
    $P0 = new ['ResizableFloatArray']
    $P0[0] = 10.1
    $P0[1] = 20.2

    $I0 = elements $P0
    is($I0, 2, 'shift float: size')

    $N0 = shift $P0
    is($N0, 10.1, 'shift float: first element', PRECISION)

    $N0 = shift $P0
    is($N0, 20.2, 'shift float: second element', PRECISION)

    $I0 = elements $P0
    is($I0, 0, 'shift float: array now empty')
.end

.sub 'unshift_float'
    $P0 = new ['ResizableFloatArray']
    unshift $P0, 10.1
    unshift $P0, 20.2

    $I0 = elements $P0
    is($I0, 2, 'unshift float: size')

    $N0 = $P0[0]
    is($N0, 20.2, 'unshift float: first element', PRECISION)

    $N0 = $P0[1]
    is($N0, 10.1, 'unshift float: second element', PRECISION)
.end

.sub 'get_iter'
    $P0 = new ['ResizableFloatArray']
    $P0[0] = 1.1
    $P0[1] = 99.99
    $P0[2] = -345.001

    $P1 = iter $P0

    $N0 = shift $P1
    is($N0, 1.1, 'get_iter: first element ok', PRECISION)

    $N0 = shift $P1
    is($N0, 99.99, 'get_iter: second element ok', PRECISION)

    $N0 = shift $P1
    is($N0, -345.001, 'get_iter: third element ok', PRECISION)

    nok($P1, 'get_iter: iterator emptied')
.end

.sub 'clone'
    .local int i
    $P0 = new ['ResizableFloatArray']

    $I30 = 3000
    i = 0
  clone_fill:
    unless i < $I30 goto clone_filled
    $N0 = i + 0.01
    $P0[i] = $N0
    inc i
    goto clone_fill

  clone_filled:
    $P1 = clone $P0
    $I0 = $P0
    $I1 = $P1
    is($I0, $I1, 'clones have the same size')

  clone_iter_loop:
    dec $I0
    $N0 = $P1[$I0]
    $N1 = $I0 + 0.01
    .fp_ne($N0, $N1, clone_evil)
    if $I0 > 0 goto clone_iter_loop

    ok(1, 'clone make a good clone')
    .return()

  clone_evil:
    nok(0, 'clone made an evil clone')
.end

.sub method_reverse
    .local pmc array
    array = new ['ResizableFloatArray']
    array."reverse"()
    $I0 = elements array
    is($I0, 0, "method_reverse - reverse of empty array")
    push array, 3.
    array."reverse"()
    $S0 = array[0]
    is($S0, "3", "method_reverse - reverse of array with one element")
    push array, 1.
    array."reverse"()
    array."reverse"()
    array."reverse"()
    $S0 = array[0]
    is($S0, "1", "method_reverse - reverse of array with two elements")
    $S0 = array[1]
    is($S0, "3", "method_reverse - reverse of array with two elements second element")
    push array, 4.5
    array."reverse"()
    push array, 5.
    array."reverse"()
    $S0 = join "", array
    is($S0, "5134.5", "method_reverse - four elements")
    array."reverse"()
    $S0 = join "", array
    is($S0, "4.5315", "method_reverse - four elements second reverse")
    push array, 6.
    array."reverse"()
    $S0 = join "", array
    is($S0, "65134.5", "method_reverse - five elements")
    array."reverse"()
    $S0 = join "", array
    is($S0, "4.53156", "method_reverse - five elements second reverse")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
