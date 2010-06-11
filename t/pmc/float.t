#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/float.t - Floating-point Numbers

=head1 SYNOPSIS

    % prove t/pmc/float.t

=head1 DESCRIPTION

Tests the Float PMC.

=cut

.const int TESTS = 161
.const num PRECISION = 0.000001

.sub 'test' :main
    .include 'test_more.pir'

    plan(TESTS)
    basic_assignment()
    add_number_to_self()
    sub_number_from_self()
    multiply_number_by_self()
    divide_number_by_self()
    divide_by_zero()
    truth_positive_float()
    truth_negative_float()
    truth_positive_integer()
    truth_negative_integer()
    falseness_0()
    'falseness_0.000'()
    integer_addition()
    integer_substraction()
    integer_multiplication()
    integer_division()
    number_addition()
    number_substraction()
    number_multiplication()
    number_division()
    increment_decrement()
    'neg'()
    negative_zero()
    equality()
    is_interface_done()
    'abs'()
    'lt'()
    'lt_num'()
    'le'()
    'le_num'()
    'gt'()
    'gt_num'()
    'ge'()
    'ge_num'()
    cmp_p_n()
    'isgt'()
    'isge'()
    'islt'()
    'isle'()
    'iseq'()
    'isne'()
    instantiate_str()
    cmp_subclasses()
    acos_method()
    cos_method()
    asec_method()
    asin_method()
    atan_method()
    atan2_method()
    cosh_method()
    exp_method()
    ln_method()
    log10_method()
    log2_method()
    sec_method()
    sech_method()
    sin_method()
    sinh_method()
    tan_method()
    tanh_method()
    sqrt_method()
.end

.include 'fp_equality.pasm'

.sub 'basic_assignment'
    $P0 = new ['Float']

    $P0 = 0.001
    is($P0, 0.001, 'basic float assignment 1', PRECISION)

    $P0 = 12.5
    is($P0, 12.5, 'basic assignment 2', PRECISION)

    $P0 = 1000
    is($P0, 1000.0, 'basic integer assignment', PRECISION)

    $P0 = 'Twelve point five'
    is($P0, 0.0, 'basic string assignment', PRECISION)

    $P0 = 123.45
    $I0 = $P0
    is($I0, 123, 'rounding to integer')

    $P0 = 123.45
    $N0 = $P0
    is($N0, 123.45, 'get_float_value', PRECISION)

    $P0 = 123.45
    $S0 = $P0
    is($S0, '123.45', 'get string')

    $P0 = "12.49"
    is($P0, 12.49, 'setting value from String', PRECISION)
.end

.sub 'add_number_to_self'
    $P0 = new ['Float']
    $P0 = 0.001
    $P0 = $P0 + $P0

    is($P0, 0.002, 'add number to self', PRECISION)
.end

.sub 'sub_number_from_self'
    $P0 = new ['Float']
    $P0 = -1000.2
    $P0 = $P0 - $P0

    is($P0, 0.0, 'sub number from self', PRECISION)
.end

.sub 'multiply_number_by_self'
    $P0 = new ['Float']
    $P0 = 123.4
    $P0 = $P0 * $P0

    is($P0, 15227.56, 'multiply number by self', PRECISION)
.end

.sub 'divide_number_by_self'
    $P0 = new ['Float']
    $P0 = 1829354.988
    $P0 = $P0 / $P0

    is($P0, 1.0, 'divide number by self', PRECISION)
.end

.sub 'divide_by_zero'
    $P0 = new ['Float']
    $P0 = 12.0

    $P1 = new ['Float']

    $P2 = new ['Float']
    $P2 = 0.0

    push_eh divide_by_zero_handler
    $P1 = $P0 / $P2
    pop_eh
    nok(1, 'divide by zero')
    .return ()

  divide_by_zero_handler:
    ok(1, "divide by zero throws exception")
.end

.sub 'truth_positive_float'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = 123.123
    ok(float_1, 'Truth of a positive float')
.end

.sub 'truth_negative_float'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = -123.123
    ok(float_1, 'Truth of a negative float')
.end

.sub 'truth_positive_integer'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = 1
    ok(float_1, 'Truth of a positive integer')
.end

.sub 'truth_negative_integer'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = -1
    ok(float_1, 'Truth of a negative integer')
.end

.sub 'falseness_0'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = 0
    nok(float_1, 'Falseness of 0')
.end

.sub 'falseness_0.000'
    .local pmc float_1
    float_1 = new ['Float']
    float_1 = 0.000
    nok(float_1, 'Falseness of 0.000')
.end

.sub 'integer_addition'
    $P0 = new ['Float']

    $P0 = 0.001
    $P0 += 1
    is($P0, 1.001, 'Basic integer arithmetic: addition (1)', PRECISION)

    $P0 += -2
    is($P0, -0.999, 'Basic integer arithmetic: addition (2)', PRECISION)
.end

.sub 'integer_substraction'
    $P0 = new ['Float']

    $P0 = 103.45
    $P0 -= 77
    is($P0, 26.45, 'Basic integer arithmetic: subtraction (1)', PRECISION)

    $P0 -= -24
    is($P0, 50.45, 'Basic integer arithmetic: subtraction (2)', PRECISION)
.end

.sub 'integer_multiplication'
    $P0 = new ['Float']

    $P0 = 0.001
    $P0 *= 10000
    is($P0, 10.0, 'Basic integer arithmetic: multiplication (1)', PRECISION)

    $P0 *= -1
    is($P0, -10.0, 'Basic integer arithmetic: multiplication (2)', PRECISION)

    $P0 *= 0
    is($P0, 0.0, 'Basic integer arithmetic: multiplication (3)', PRECISION)
.end

.sub 'integer_division'
    $P0 = new ['Float']

    $P0 = 1e8
    $P0 /= 10000
    is($P0, 10000.0, 'Basic integer arithmetic: division (1)', PRECISION)

    $P0 /= 1000000
    is($P0, 0.01, 'Basic integer arithmetic: division (2)', PRECISION)
.end

.sub 'number_addition'
    $P0 = new ['Float']

    $P0 = 0.001
    $P0 += 1.2
    is($P0, 1.201, 'Basic numeric arithmetic: addition (1)', PRECISION)

    $P0 += -2.4
    is($P0, -1.199, 'Basic numeric arithmetic: addition (2)', PRECISION)
.end

.sub 'number_substraction'
    $P0 = new ['Float']

    $P0 = 103.45
    $P0 -= 3.46
    is($P0, 99.99, 'Basic numeric arithmetic: subtraction (1)', PRECISION)

    $P0 -= -0.01
    is($P0, 100.0, 'Basic numeric arithmetic: subtraction (2)', PRECISION)
.end

.sub 'number_multiplication'
    $P0 = new ['Float']

    $P0 = 0.001
    $P0 *= 123.5
    is($P0, 0.1235, 'Basic numeric arithmetic: multiplication (1)', PRECISION)

    $P0 *= -2.6
    is($P0, -0.3211, 'Basic numeric arithmetic: multiplication (2)', PRECISION)

    $P0 *= 0.0
    is($P0, 0.0, 'Basic numeric arithmetic: multiplication (3)', PRECISION)
.end

.sub 'number_division'
    $P0 = new ['Float']

    $P0 = 1e8
    $P0 /= 0.5
    is($P0, 2e8, 'Basic numeric arithmetic: division (1)', PRECISION)

    $P0 /= 4000.0
    is($P0, 50000.0, 'Basic numeric arithmetic: division (2)', PRECISION)
.end

.sub 'increment_decrement'
    $P0 = new ['Float']

    $P0 = 0.5
    inc $P0
    is($P0, 1.5, 'increment (1)', PRECISION)
    dec $P0
    is($P0, 0.5, 'decrement (1)', PRECISION)
    dec $P0
    is($P0, -.5, 'decrement (2)', PRECISION)
    inc $P0
    is($P0, 0.5, 'increment (2)', PRECISION)
.end

.sub 'neg'
    $P0 = new ['Float']
    $P0 = 0.5
    neg $P0
    is($P0, -0.5, 'Neg', PRECISION)

    $P1 = new ['Float']
    $P1 = - $P0
    is($P1, 0.5, 'Neg is involutive', PRECISION)
.end

.sub 'negative_zero'
    load_bytecode 'config.pbc'
    $P1 = _config()
    $P2 = $P1['has_negative_zero']
    unless $P2 goto negative_zero_todoed

    $P0 = new ['Float']
    $P0 = 0.0
    neg $P0

    $S0 = $P0
    is($S0, "-0", "negative 0.0 to string")
    .return ()

  negative_zero_todoed:
    todo(0, '-0.0 not implemented, TT #313')
.end

.sub 'equality'
    $P0 = new ['Float']
    $P0 = 1e8

    $P1 = new ['Float']
    $P1 = 1e8

    $P2 = new ['Float']
    $P2 = 2.4

    $I0 = 1
    if $P0 == $P1 goto equality_1
    $I0 = 0
  equality_1:
    ok($I0, 'equal floats')

    $I0 = 0
    if $P0 == $P2 goto equality_2
    $I0 = 1
  equality_2:
    ok($I0, 'different floats are not equal')

    $I0 = 1
    if $P0 != $P2 goto equality_3
    $I0 = 0
  equality_3:
    ok($I0, "different floats are different")

    $I0 = 0
    if $P0 != $P1 goto equality_4
    $I0 = 1
  equality_4:
    ok($I0, "equal floats aren't different")

    $I0 = 1
    eq_num $P0, $P1, equality_5
    $I0 = 0
  equality_5:
    ok($I0, "equal floats are eq_num")

    $I0 = 0
    eq_num $P0, $P2, equality_6
    $I0 = 1
  equality_6:
    ok($I0, "different floats aren't eq_num")

    $I0 = 1
    ne_num $P0, $P2, equality_7
    $I0 = 0
  equality_7:
    ok($I0, "different floats are ne_num")

    $I0 = 0
    ne_num $P0, $P1, equality_8
    $I0 = 1
  equality_8:
    ok($I0, "equal floats aren't ne_num")
.end

.sub 'is_interface_done'
    .local pmc pmc1
    .local int bool1
    pmc1 = new ['Float']

    bool1 = does pmc1, "scalar"
    ok(bool1, 'Float does "scalar"')

    bool1 = does pmc1, "float"
    ok(bool1, 'Float does "float"')

    bool1 = does pmc1, "no_interface"
    nok(bool1, 'Float does not "no_interface"')
.end

.sub 'abs'
    $P0 = new ['Float']
    $P0 = 1.0
    abs $P0
    is($P0, $P0, 'abs does not change positive floats')

    $P0 = -1.0
    abs $P0
    is($P0, 1.0, 'abs of -1.0', PRECISION)

    $P0 = -5.0
    abs $P0
    is($P0, 5.0, 'abs of -5.0', PRECISION)

    $P0 = -6.0
    $P1 = abs $P0
    is($P1, 6.0, 'abs two operands from -6.0', PRECISION)
    is($P0, -6.0, 'abs two operands source unchanged', PRECISION)
.end

.sub 'lt'
    $P1 = new ['Float']
    $P1 = 111.11
    $N1 = $P1

    $I0 = 1
    lt $P1, 111.12, lt_1
    $I0 = 0
  lt_1:
    ok($I0, 'lt ok')

    $I0 = 0
    lt $P1, $N1, lt_2
    $I0 = 1
  lt_2:
    ok($I0, 'lt irreflexive')

    $I0 = 0
    lt $P1, 111.0, lt_3
    $I0 = 1
  lt_3:
    ok($I0, 'not lt')
.end

.sub 'lt_num'
    $P1 = new ['Float']
    $P1 = 1.1

    $P2 = new ['Float']
    $P2 = 1.2

    $P3 = new ['Float']
    $P3 = 1.0

    $P4 = new ['Float']
    $P4 = $P1

    $I0 = 1
    lt_num $P1, $P2, lt_num_1
    $I0 = 0
  lt_num_1:
    ok($I0, 'lt_num true')

    $I0 = 0
    lt_num $P1, $P4, lt_num_2
    $I0 = 1
  lt_num_2:
    ok($I0, 'lt_num irreflexive')

    $I0 = 0
    lt_num $P1, $P3, lt_num_3
    $I0 = 1
  lt_num_3:
    ok($I0, 'lt_num false')
.end

.sub 'le'
    $P1 = new ['Float']
    $P1 = 111.1
    $N1 = $P1

    $I0 = 1
    le $P1, 111.2, le_1
    $I0 = 0
  le_1:
    ok($I0, 'le_p_nc')

    $I0 = 1
    le $P1, $N1, le_2
    $I0 = 0
  le_2:
    ok($I0, 'le_p_n')

    $I0 = 0
    le $P1, 111.0, le_3
    $I0 = 1
  le_3:
    ok($I0, 'le_p_nc false')

    $I0 = 1
    le $P1, $P1, le_4
    $I0 = 0
  le_4:
    ok($I0, 'le reflexive')
.end

.sub 'le_num'
    $P1 = new ['Float']
    $P1 = 1.1

    $P2 = new ['Float']
    $P2 = 1.2

    $P3 = new ['Float']
    $P3 = 1.0

    $P4 = new ['Float']
    $P4 = $P1

    $I0 = 1
    le_num $P1, $P2, le_num_1
    $I0 = 0
  le_num_1:
    ok($I0, 'le_num true')

    $I0 = 1
    le_num $P1, $P4, le_num_2
    $I0 = 0
  le_num_2:
    ok($I0, 'le_num reflexive')

    $I0 = 0
    le_num $P1, $P3, le_num_3
    $I0 = 1
  le_num_3:
    ok($I0, 'le_num false')
.end

.sub 'gt'
    $P1 = new ['Float']
    $P1 = 111.1
    $N1 = $P1

    $I0 = 0
    gt $P1, 111.2, gt_1
    $I0 = 1
  gt_1:
    ok($I0, 'comparison ops: gt nok')

    $I0 = 1
    gt $P1, $N1, gt_2
    $I0 = 0
  gt_2:
    nok($I0, 'comparison ops: gt irreflexive')

    $I0 = 1
    gt $P1, 111.0, gt_3
    $I0 = 0
  gt_3:
    ok($I0, 'comparison ops: gt ok')
.end

.sub 'gt_num'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Float']

    $P1 = 1.1
    $P2 = 1.2
    $P3 = 1.0
    $P4 = $P1

    $I0 = 0
    gt_num $P1, $P2, gt_num_1
    $I0 = 1
  gt_num_1:
    ok($I0, 'comparison ops: gt_num nok')

    $I0 = 0
    gt_num $P1, $P4, gt_num_2
    $I0 = 1
  gt_num_2:
    ok($I0, 'comparison ops: gt_num irreflexive')

    $I0 = 1
    gt_num $P1, $P3, gt_num_3
    $I0 = 0
  gt_num_3:
    ok($I0, 'comparison ops: gt_num ok')
.end

.sub 'ge'
    $P1 = new ['Float']
    $P1 = 111.1
    $N1 = $P1

    $I0 = 0
    ge $P1, 111.2, ge_1
    $I0 = 1
  ge_1:
    ok($I0, 'comparison ops: ge nok')

    $I0 = 1
    ge $P1, $N1, ge_2
    $I0 = 0
  ge_2:
    ok($I0, 'comparison ops: ge reflexive')

    $I0 = 1
    ge $P1, 111.0, ge_3
    $I0 = 0
  ge_3:
    ok($I0, 'comparison ops: ge ok')
.end

.sub 'ge_num'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Float']

    $P1 = 1.1
    $P2 = 1.2
    $P3 = 1.0
    $P4 = $P1

    $I0 = 0
    ge_num $P1, $P2, ge_num_1
    $I0 = 1
  ge_num_1:
    ok($I0, 'comparison ops: ge_num nok')

    $I0 = 1
    ge_num $P1, $P4, ge_num_2
    $I0 = 0
  ge_num_2:
    ok($I0, 'comparison ops: ge_num reflexive')

    $I0 = 1
    ge_num $P1, $P3, ge_num_3
    $I0 = 0
  ge_num_3:
    ok($I0, 'comparison ops: ge_num ok')
.end

.sub 'cmp_p_n'
    $P1 = new ['Float']
    $P1 = 123.45
    $N1 = 123.45
    $N2 = -1.0
    $N3 = 123.54

    $I0 = cmp $P1, $N1
    is($I0, 0, 'comparison ops: cmp_p_n: equality')

    $I0 = cmp $P1, $N2
    is($I0, 1, 'comparison ops: cmp_p_n: gt')

    $I0 = cmp $P1, $N3
    is($I0, -1, 'comparison ops: cmp_p_n: lt')
.end

.sub 'isgt'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']
    $P5 = new ['Integer']
    $P6 = new ['Float']

    $P1 = 10.0
    $P2 = 20.0
    $P3 = 5.0
    $P4 = 3
    $P5 = 12
    $P6 = 10.0

    $I0 = isgt $P1, $P2
    nok($I0, 'comparison ops: isgt nok')

    $I0 = isgt $P1, $P1
    nok($I0, 'comparison ops: isgt irreflexive')

    $I0 = isgt $P1, $P3
    ok($I0, 'comparison ops: isgt ok')

    $I0 = isgt $P1, $P4
    ok($I0, 'comparison ops: isgt ok with Float and Integer')

    $I0 = isgt $P1, $P5
    nok($I0, 'comparison ops: isgt nok with Float and Integer')

    $I0 = isgt $P1, $P6
    nok($I0, 'comparison ops: isgt irreflexive (different PMCs)')
.end

.sub 'isge'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']
    $P5 = new ['Integer']
    $P6 = new ['Float']

    $P1 = 10.0
    $P2 = 20.0
    $P3 = 5.0
    $P4 = 3
    $P5 = 12
    $P6 = 10.0

    $I0 = isge $P1, $P2
    nok($I0, 'comparison ops: isge nok')

    $I0 = isge $P1, $P1
    ok($I0, 'comparison ops: isge reflexive')

    $I0 = isge $P1, $P3
    ok($I0, 'comparison ops: isge ok')

    $I0 = isge $P1, $P4
    ok($I0, 'comparison ops: isge ok with Float and Integer')

    $I0 = isge $P1, $P5
    nok($I0, 'comparison ops: isge nok with Float and Integer')

    $I0 = isge $P1, $P6
    ok($I0, 'comparison ops: isge reflexive (different PMCs)')
.end

.sub 'islt'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']
    $P5 = new ['Integer']
    $P6 = new ['Float']

    $P1 = 10.0
    $P2 = 20.0
    $P3 = 5.0
    $P4 = 3
    $P5 = 12
    $P6 = 10.0

    $I0 = islt $P1, $P2
    ok($I0, 'comparison ops: islt ok')

    $I0 = islt $P1, $P1
    nok($I0, 'comparison ops: islt irreflexive')

    $I0 = islt $P1, $P3
    nok($I0, 'comparison ops: islt nok')

    $I0 = islt $P1, $P4
    nok($I0, 'comparison ops: islt nok with Float and Integer')

    $I0 = islt $P1, $P5
    ok($I0, 'comparison ops: islt ok with Float and Integer')

    $I0 = islt $P1, $P6
    nok($I0, 'comparison ops: islt irreflexive (different PMCs)')
.end

.sub 'isle'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']
    $P5 = new ['Integer']
    $P6 = new ['Float']

    $P1 = 10.0
    $P2 = 20.0
    $P3 = 5.0
    $P4 = 3
    $P5 = 12
    $P6 = 10.0

    $I0 = isle $P1, $P2
    ok($I0, 'comparison ops: isle ok')

    $I0 = isle $P1, $P1
    ok($I0, 'comparison ops: isle reflexive')

    $I0 = isle $P1, $P3
    nok($I0, 'comparison ops: isle nok')

    $I0 = isle $P1, $P4
    nok($I0, 'comparison ops: isle nok with Float and Integer')

    $I0 = isle $P1, $P5
    ok($I0, 'comparison ops: isle ok with Float and Integer')

    $I0 = isle $P1, $P6
    ok($I0, 'comparison ops: isle reflexive (different PMCs)')
.end

.sub 'iseq'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']

    $P1 = 2.5
    $P2 = 2.6
    $P3 = 2.5
    $P4 = 2

    $I0 = iseq $P1, $P1
    ok($I0, 'iseq reflexive, same PMC')

    $I0 = iseq $P1, $P3
    ok($I0, 'iseq reflexive, different PMCs')

    $I0 = iseq $P1, $P2
    nok($I0, 'iseq nok with two Floats')

    $I0 = iseq $P1, $P4
    nok($I0, 'iseq nok between an Integer and a Float')
.end

.sub 'isne'
    $P1 = new ['Float']
    $P2 = new ['Float']
    $P3 = new ['Float']
    $P4 = new ['Integer']

    $P1 = 2.5
    $P2 = 2.6
    $P3 = 2.5
    $P4 = 2

    $I0 = isne $P1, $P1
    nok($I0, 'isne irreflexive, same PMC')

    $I0 = isne $P1, $P3
    nok($I0, 'isne irreflexive, different PMCs')

    $I0 = isne $P1, $P2
    ok($I0, 'isne ok with two Floats')

    $I0 = isne $P1, $P4
    ok($I0, 'isne ok between an Integer and a Float')
.end

.sub 'instantiate_str'
    .const 'Float' pi = "3.1"
    $P1 = get_class ['Float']
    isa_ok(pi, $P1)
    is(pi, 3.1, 'instantiate_str', PRECISION)
.end

.sub 'cmp_subclasses'
    $P0 = subclass 'Float', 'Flt'

    $P1 = new ['Flt']
    $P1 = 1.5

    $P2 = new ['Flt']
    $P2 = 2.73

    $I0 = cmp $P1, $P2
    is(-1, $I0, 'cmp functions for subclasses (lt)')

    $I0 = cmp $P1, $P1
    is(0, $I0, 'cmp functions for subclasses (eq)')

    $I0 = cmp $P2, $P1
    is(1, $I0, 'cmp functions for subclasses (gt)')
.end

.sub 'test_method'
    .param string method
    .param num number
    .param num expected

    .local pmc array
    array = new 'FixedPMCArray'
    array = 3
    array[0] = method
    array[1] = number
    array[2] = expected

    $P0 = new ['Float']
    $P0 = number
    $P1 = $P0.method()

    $S0 = sprintf '%s(%.1f) is %.9f', array
    is($P1, expected, $S0, PRECISION)
.end

.sub 'acos_method'
    test_method('acos', 0.0, 1.570796327)
    test_method('acos', 0.5, 1.047197551)
.end

.sub 'cos_method'
    test_method('cos', 0.0, 1.0)
    test_method('cos', 0.5, 0.877582562)
.end

.sub 'asec_method'
    test_method('asec', 1.0, 0.0)
    test_method('asec', 3.0, 1.230959417)
.end

.sub 'asin_method'
    test_method('asin', 0.0, 0.0)
    test_method('asin', 0.5, 0.523598776)
.end

.sub 'atan_method'
    test_method('atan', 0.0, 0.0)
    test_method('atan', 0.5, 0.463647609)
.end

.sub 'atan2_method'
    $P0 = new ['Float']
    $P1 = new ['Float']

    $P0 = 0.7
    $P1 = 0.5

    $P2 = $P0.'atan2'($P1)
    is($P2, 0.950546841, 'atan2 as a method', PRECISION)
.end

.sub 'cosh_method'
    test_method('cosh', 0.0, 1.0)
    test_method('cosh', 0.5, 1.127625965)
.end

.sub 'exp_method'
    test_method('exp', 0.0, 1.0)
    test_method('exp', 0.5, 1.648721271)
.end

.sub 'ln_method'
    test_method('ln', 1.0, 0.0)
    test_method('ln', 45.0, 3.806662490)
    test_method('ln', 0.5, -0.693147181)
.end

.sub 'log10_method'
    test_method('log10', 1000.0, 3.0)
    test_method('log10', 0.5, -0.301029996)
.end

.sub 'log2_method'
    test_method('log2', 32.0, 5.0)
    test_method('log2', 0.5, -1.0)
.end

.sub 'sec_method'
    test_method('sec', 0.0, 1.0)
    test_method('sec', 0.5, 1.139493927)
.end

.sub 'sech_method'
    test_method('sech', 0.0, 1.0)
    test_method('sech', 0.5, 0.886818884)
.end

.sub 'sin_method'
    test_method('sin', 0.0, 0.0)
    test_method('sin', 0.5, 0.479425539)
.end

.sub 'sinh_method'
    test_method('sinh', 0.0, 0.0)
    test_method('sinh', 0.5, 0.521095305)
.end

.sub 'tan_method'
    test_method('tan', 0.0, 0.0)
    test_method('tan', 0.5, 0.546302490)
.end

.sub 'tanh_method'
    test_method('tanh', 0.0, 0.0)
    test_method('tanh', 0.5, 0.462117157)
.end

.sub 'sqrt_method'
    test_method('sqrt', 16.0, 4.0)
    test_method('sqrt', 2.0, 1.414213562)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
