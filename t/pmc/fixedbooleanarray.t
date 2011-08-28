#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/fixedbooleanarray.t - FixedBooleanArray PMC

=head1 SYNOPSIS

    % prove t/pmc/fixedbooleanarray.t

=head1 DESCRIPTION

Tests C<FixedBooleanArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.sub 'test' :main
    .include 'test_more.pir'

    plan(41)

    setting_array_size()
    resizing_not_allowed()
    setting_first_element()
    setting_second_element()
    setting_out_of_bounds()
    getting_out_of_bounds()
    set_pmc_access_int()
    set_int_access_pmc()
    interface()
    truth()
    pmc_keys_and_values()
    freeze_thaw()
    test_clone()
    get_iter()
    fill()
    test_new_style_init()
    test_invalid_init_tt1509()
.end

.sub 'setting_array_size'
    $P0 = new ['FixedBooleanArray']
    $I0 = $P0
    is($I0, 0, 'size is initially zero')

    $P0 = 1
    $I0 = $P0
    is($I0, 1, 'size set to 1')

    # Make sure destroy is exercised
    null $P0
    sweep 1
.end

.sub 'resizing_not_allowed'
    $P0 = new ['FixedBooleanArray']

    push_eh resizing_not_allowed_handler
    $P0 = 1
    $P0 = 2
    nok(1, 'resizing should not have succeeded')
    pop_eh
    .return()

  resizing_not_allowed_handler:
    pop_eh
    ok(1, 'resizing does not work on a fixed-size array')
.end

.sub 'setting_first_element'
    $P0 = new ['FixedBooleanArray']
    $P0 = 1

    $P0[0] = -7
    $I0 = $P0[0]
    is($I0, 1, 'setting first element to a true int value')

    $P0[0] = 3.7
    $N0 = $P0[0]
    is($N0, 1.0, 'setting first element to a true num value')

    $P0[0] = "17"
    $S0 = $P0[0]
    is($S0, "1", 'setting first element to a true string value')
.end

.sub 'setting_second_element'
    $P0 = new ['FixedBooleanArray']
    $P0 = 2

    $P0[1] = -7
    $I0 = $P0[1]
    is($I0, 1, 'setting second element to a true int value')

    $P0[1] = 3.7
    $N0 = $P0[1]
    is($N0, 1.0, 'setting second element to a true num value')

    $P0[1] = "17"
    $S0 = $P0[1]
    is($S0, "1", 'setting second element to a true string value')
.end

.sub 'setting_out_of_bounds'
    $P0 = new ['FixedBooleanArray']
    $P0 = 1

    push_eh setting_out_of_bounds_handler
    $P0[1] = -7
    pop_eh
    nok(1, "Setting out-of-bounds element wrongly succeeded")
    .return()

  setting_out_of_bounds_handler:
    pop_eh
    ok(1, "Setting out-of-bounds element did not succeed")
.end

.sub 'getting_out_of_bounds'
    $P0 = new ['FixedBooleanArray']
    $P0 = 1

    push_eh getting_out_of_bounds_handler
    $I0 = $P0[1]
    pop_eh
    nok(1, "Getting out-of-bounds element wrongly succeeded")
    .return()

  getting_out_of_bounds_handler:
    pop_eh
    ok(1, "Getting out-of-bounds element does not succeed")
.end

.sub 'set_pmc_access_int'
    $P0 = new ['FixedBooleanArray']
    $P0 = 3
    $P1 = new ['Key']

    $P1 = 0
    $P0[$P1] = 25

    $P1 = 1
    $P0[$P1] = 2.5

    $P1 = 2
    $P0[$P1] = "17"

    $I0 = $P0[0]
    is($I0, 1, "Set via PMC keys, access via INTs: int value")

    $N0 = $P0[1]
    is($N0, 1.0, "Set via PMC keys, access via INTs: num value")

    $S0 = $P0[0]
    is($S0, "1", "Set via PMC keys, access via INTs: string value")
.end

.sub 'set_int_access_pmc'
    $P0 = new ['FixedBooleanArray']
    $P0 = 1024

    $P0[25] = 125
    $P0[128] = 10.2
    $P0[513] = "17"
    $P1 = new ['Integer']
    $P1 = 123456
    $P0[1023] = $P1

    $P2 = new ['Key']

    $P2 = 25
    $I0 = $P0[$P2]
    is($I0, 1, 'Set via INTs, access via PMC Keys: int value')

    $P2 = 128
    $N0 = $P0[$P2]
    is($N0, 1.0, 'Set via INTs, access via PMC Keys: num value')

    $P2 = 513
    $S0 = $P0[$P2]
    is($S0, '1', 'Set via INTs, access via PMC Keys: string value')

    $P2 = 1023
    $P3 = $P0[$P2]
    is($P3, 1, 'Set via INTs, access via PMC Keys: PMC value')
.end

.sub 'interface'
    $P0 = new ['FixedBooleanArray']

    $I0 = does $P0, 'scalar'
    nok($I0, 'FixedBooleanArray does not scalar')
    $I0 = does $P0, 'array'
    ok($I0, 'FixedBooleanArray does array')
    $I0 = does $P0, 'no_interface'
    nok($I0, 'FixedBooleanArray does not no_interface')
.end

.sub 'truth'
    $P0 = new ['FixedBooleanArray']

    nok($P0, 'Empty FixedBooleanArray is false')

    $P0 = 1
    ok($P0, 'Non-empty FixedBooleanArray is true')

    $P0[0] = 0
    ok($P0, 'FixedBooleanArray is true, no matter what its values are')
.end

.sub 'pmc_keys_and_values'
    $P0 = new ['FixedBooleanArray']
    $P0 = 2

    $P1 = new ['Key']
    $P1 = 1
    $P2 = new ['Integer']
    $P2 = 1
    $P0[$P1] = $P2

    $I0 = $P0[$P1]
    is($I0, 1, 'PMC keys & values')
.end

.sub 'freeze_thaw'
    .local pmc fba
    .local int i
    .local string s

    fba = new ['FixedBooleanArray']
    fba = 17

    fba[1]  = 1
    fba[4]  = 1
    fba[8]  = 1
    fba[12] = 1
    fba[15] = 1

    $S0 = fba
    is($S0, '01001000100010010', 'FixedBooleanArray before freeze')
    s = freeze fba
    fba.'fill'(0)
    fba = thaw s
    $S0 = fba
    is($S0, '01001000100010010', 'FixedBooleanArray after thaw')
.end

.sub test_clone
    .local pmc fba1, fba2
    .local int i
    .local string s

    fba1 = new ['FixedBooleanArray']
    fba1 = 17

    fba1[1]  = 1
    fba1[4]  = 1
    fba1[8]  = 1
    fba1[12] = 1
    fba1[15] = 1

    $S0 = fba1
    is($S0, '01001000100010010', 'FixedBooleanArray before clone')
    fba2 = clone fba1
    $S1 = fba2
    is($S0, $S1, "clones have the same string representation")
.end

.sub 'get_iter'
    $P0 = new ['FixedBooleanArray']
    $P0 = 3
    $P0[0] = 1
    $P0[1] = 0
    $P0[2] = 1

    $P1 = iter $P0
    $I2 = shift $P1
    is($I2, 1, 'get_iter: first element')
    $I2 = shift $P1
    is($I2, 0, 'get_iter: second element')
    $I2 = shift $P1
    is($I2, 1, 'get_iter: third element')

    nok($P1, 'iterator exhausted')
.end

.sub 'fill'
    $P0 = new ['FixedBooleanArray']
    $P0.'fill'(0)
    ok(1, 'Filling empty array')

    .local int result, i, size
    size = 1564
    $P0 = size

    # Fresh array is empty.
    i = 0
    result = 0
  initial_false_loop:
    unless i < size goto initial_false_end
    $I0 = $P0[i]
    result = or result, $I0
    inc i
    goto initial_false_loop
  initial_false_end:
    nok(result, "Fresh array filled with 0")

    $P0.'fill'(1)
    i = 0
    result = 1
    $I1 = 0
  fill_true_loop:
    unless i < size goto fill_true_end
    $I0 = $P0[i]
    result = and result, $I0
    inc i
    goto fill_true_loop
  fill_true_end:
    ok(result, "Fill with 1")

    $P0.'fill'(0)
    i = 0
    result = 0
    $I1 = 0
  fill_false_loop:
    unless i < size goto fill_false_end
    $I0 = $P0[i]
    result = or result, $I0
    inc i
    goto fill_false_loop
  fill_false_end:
    nok(result, "Fill with 0")

.end

.sub test_new_style_init
    $P0 = new 'FixedBooleanArray', 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements")

    $P0 = new ['FixedBooleanArray'], 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements for a key constant")
.end

.sub test_invalid_init_tt1509
    throws_substring(<<'CODE', 'FixedBooleanArray: Cannot set array size to a negative number (-10)', 'New style init does not dump core for negative array lengths')
    .sub main :main
        $P0 = new ['FixedBooleanArray'], -10
    .end
CODE

    throws_substring(<<'CODE', 'FixedBooleanArray: Cannot set array size to a negative number (-10)', 'New style init (key constant) does not dump core for negative array lengths')
    .sub main :main
        $P0 = new 'FixedBooleanArray', -10
    .end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
