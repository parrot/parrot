#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/integer.t - Integer Registers

=head1 SYNOPSIS

    % prove t/op/integer.t

=head1 DESCRIPTION

Tests the use of Parrot integer registers.

=cut

.const int TESTS = 150

.sub 'test' :main
    .include 'test_more.pir'

    plan(TESTS)
    test_set_ic()
    test_set()
    test_add_i_i_i()
    test_add_i_i()
    test_abs()
    test_sub()
    test_mul()
    test_div()
    test_mod()
    mod_negative_zero_rest()
    test_eq()
    test_ne()
    test_lt()
    test_le()
    test_gt()
    test_ge()
    test_not()
    test_and()
    test_or()
    test_xor()
    test_inc()
    test_dec()
    test_sub_i_i()
    test_set_n()
    test_neg()
    test_mul_i_i()
    test_null()
    test_div_i_i_by_zero()
    test_div_i_ic_by_zero()
    test_div_i_i_i_by_zero()
    test_div_i_ic_i_by_zero()
    test_div_i_i_ic_by_zero()
    test_fdiv_i_i_by_zero()
    test_fdiv_i_ic_by_zero()
    test_fdiv_i_i_i_by_zero()
    test_fdiv_i_ic_i_by_zero()
    test_fdiv_i_i_ic_by_zero()
    test_mod_i_i_i_by_zero()
    test_mod_i_ic_i_by_zero()
    test_mod_i_i_ic_by_zero()
.end

.sub 'test_set_ic'
    $I0 = 0
    $I1 = 1
    $I2 = 2
    $I3 = 3
    $I4 = 4
    $I5 = 5
    $I6 = 6
    $I7 = 7
    $I8 = 8
    $I9 = 9
    $I10 = 10
    $I11 = 11
    $I12 = 12
    $I13 = 13
    $I14 = 14
    $I15 = 15
    $I16 = 16
    $I17 = 17
    $I18 = 18
    $I19 = 19
    $I20 = 20
    $I21 = 21
    $I22 = 22
    $I23 = 23
    $I24 = 24
    $I25 = 25
    $I26 = 26
    $I27 = 27
    $I28 = 28
    $I29 = 29
    $I30 = 30
    $I31 = 31

    $S0 = $I0
    is($S0, "0", "set_i_ic with 0")
    $S0 = $I1
    is($S0, "1", "set_i_ic with 1")
    $S0 = $I2
    is($S0, "2", "set_i_ic with 2")
    $S0 = $I3
    is($S0, "3", "set_i_ic with 3")
    $S0 = $I4
    is($S0, "4", "set_i_ic with 4")
    $S0 = $I5
    is($S0, "5", "set_i_ic with 5")
    $S0 = $I6
    is($S0, "6", "set_i_ic with 6")
    $S0 = $I7
    is($S0, "7", "set_i_ic with 7")
    $S0 = $I8
    is($S0, "8", "set_i_ic with 8")
    $S0 = $I9
    is($S0, "9", "set_i_ic with 9")
    $S0 = $I10
    is($S0, "10", "set_i_ic with 10")
    $S0 = $I11
    is($S0, "11", "set_i_ic with 11")
    $S0 = $I12
    is($S0, "12", "set_i_ic with 12")
    $S0 = $I13
    is($S0, "13", "set_i_ic with 13")
    $S0 = $I14
    is($S0, "14", "set_i_ic with 14")
    $S0 = $I15
    is($S0, "15", "set_i_ic with 15")
    $S0 = $I16
    is($S0, "16", "set_i_ic with 16")
    $S0 = $I17
    is($S0, "17", "set_i_ic with 17")
    $S0 = $I18
    is($S0, "18", "set_i_ic with 18")
    $S0 = $I19
    is($S0, "19", "set_i_ic with 19")
    $S0 = $I20
    is($S0, "20", "set_i_ic with 20")
    $S0 = $I21
    is($S0, "21", "set_i_ic with 21")
    $S0 = $I22
    is($S0, "22", "set_i_ic with 22")
    $S0 = $I23
    is($S0, "23", "set_i_ic with 23")
    $S0 = $I24
    is($S0, "24", "set_i_ic with 24")
    $S0 = $I25
    is($S0, "25", "set_i_ic with 25")
    $S0 = $I26
    is($S0, "26", "set_i_ic with 26")
    $S0 = $I27
    is($S0, "27", "set_i_ic with 27")
    $S0 = $I28
    is($S0, "28", "set_i_ic with 28")
    $S0 = $I29
    is($S0, "29", "set_i_ic with 29")
    $S0 = $I30
    is($S0, "30", "set_i_ic with 30")
    $S0 = $I31
    is($S0, "31", "set_i_ic with 31")
.end

.sub 'test_set'
    $I0 = 42
    $I1 = $I0
    $S0 = $I1
    is($S0, '42', 'set_i')
.end

.sub 'test_add_i_i_i'
    $I0 = 0x11223344
    $I1 = $I0 + $I0
    is($I1, 574908040, 'add_i_i - first')

    $I2 = $I0 + $I1
    is($I2, 862362060, 'add_i_i - second')

    $I2 = $I2 + $I2
    is($I2, 1724724120, 'add_i_i - third')
.end

.sub 'test_add_i_i'
    $I0 = 0
    $I1 = 2
    $I2 = -2

    add $I0, $I1
    is($I0, 2, 'add_i_i - zero is neutral')

    add $I0, $I2
    is($I0, 0, 'add_i_i - inverse')

    $I0 = 0
    add $I0, 5
    is($I0, 5, 'add_i_ic - zero is neutral')

    add $I0, -10
    is($I0, -5, 'add_i_ic')
.end

.sub 'test_abs'
    $I0 = abs 1

    $I1 = 1
    $I1 = abs $I1

    $I2 = abs -1

    $I3 = -1
    $I3 = abs $I3

    is($I0, 1, 'abs_i_ic')
    is($I1, 1, 'abs_i_i')
    is($I2, 1, 'abs_i_nc')
    is($I3, 1, 'abs_i_n')
.end

.sub 'test_sub'
    $I0 = 0x12345678
    $I1 = 0x01234567
    $I2 = $I0 - $I1
    is($I2, 286331153, 'sub_i_i_i')

    $I1 = 1234

    $I0 = $I1 - 1230
    is($I0, 4, 'sub_i_i_ic')

    $I0 = 1244 - $I1
    is($I0, 10, 'sub_i_ic_i')

    $I0 = 13 - 12
    is($I0, 1, 'sub_i_ic_ic')
.end

.sub 'test_mul'
    $I0 = 7
    $I1 = 29

    $I2 = $I0 * $I1
    is($I2, 203, 'mul_i_i_i')

    $I2 = $I0 * 29
    is($I2, 203, 'mul_i_i_ic')
.end

.sub 'test_div'
    $I0 = 0x33333333
    $I1 = 0x11111111
    $I2 = $I0 / $I1
    is($I2, 3, 'div_i_i_i - exact')

    $I0 = 11
    $I1 = 2
    $I2 = $I0 / $I1
    is($I2, 5, 'div_i_i_i - quotient with positive integers')

    $I0 = 9
    $I1 = -4
    $I2 = $I0 / $I1
    is($I2, -2, 'div_i_i_i - quotient with negative divisor')

    $I0 = 12

    $I1 = 144 / $I0
    is($I1, 12, 'div_i_ic_i')

    $I1 = $I0 / 3
    is($I1, 4, 'div_i_i_ic')

    $I1 = 120 / 12
    is($I1, 10, 'div_i_ic_ic')
.end

.sub 'test_mod'
    $I0 = 5
    $I1 = 0
    $I2 = mod $I0, $I1
    is($I2, 5, 'mod_i_i_i by 0')

    $I0 = 0
    $I1 = 3
    $I2 = mod $I0, $I1
    is($I2, 0, 'mod_i_i_i of 0')

    $I0 = 5
    $I1 = 3
    $I2 = mod $I0, $I1
    is($I2, 2, 'mod_i_i_i - remainder of 5 / 3')

    $I0 = 5
    $I1 = -3
    $I2 = mod $I0, $I1
    is($I2, -1, 'mod_i_i_i - remainder of 5 / -3')

    $I0 = -5
    $I1 = 3
    $I2 = mod $I0, $I1
    is($I2, 1, 'mod_i_i_i - remainder of -5 / 3')

    $I0 = -5
    $I1 = -3
    $I2 = mod $I0, $I1
    is($I2, -2, 'mod_i_i_i - remainder of -5 / -3')

    $I0 = 12

    $I1 = mod $I0, 10
    is($I1, 2, 'mod_i_i_ic')

    $I1 = mod 14, $I0
    is($I1, 2, 'mod_i_ic_i')

    $I1 = mod 13, 11
    is($I1, 2, 'mod_i_ic_ic')
.end

.sub 'mod_negative_zero_rest'
    $I1 = mod 3, 3
    is($I1, 0, 'mod - negative, zero rest (#36003), 3 mod 3 = 0')

    $I1 = mod -3, 3
    is($I1, 0, 'mod - negative, zero rest (#36003), -3 mod 3 = 0')

    $I1 = mod 3, -3
    is($I1, 0, 'mod - negative, zero rest (#36003), 3 mod -3 = 0')

    $I1 = mod -3, -3
    is($I1, 0, 'mod - negative, zero rest (#36003), -3 mod -3 = 0')
.end

.sub 'test_eq'
    $I0 = 0x12345678
    $I1 = 0x12345678
    $I2 = 0x76543210

    $I3 = 1
    if $I0 == $I1 goto test_eq_1
    $I3 = 0
  test_eq_1:
    ok($I3, 'eq_i_i - equal')

    $I3 = 1
    unless $I1 == $I2 goto test_eq_2
    $I3 = 0
  test_eq_2:
    ok($I3, 'eq_i_i - different')

    $I0 = -42
    $I3 = 0
    if $I0 == 42 goto test_eq_3
    $I3 = 1
  test_eq_3:
    ok($I3, 'eq_i_ic - different')

    $I3 = 0
    unless $I0 == -42 goto test_eq_4
    $I3 = 1
  test_eq_4:
    ok($I3, 'eq_i_ic - equal')

    $I0 = 12
    $I3 = 0
    unless $I0 == 12 goto test_eq_5
    $I3 = 1
  test_eq_5:
    ok($I3, 'eq_i_ic - 12 == 12')

    $I3 = 0
    unless 12 == 12 goto test_eq_6
    $I3 = 1
  test_eq_6:
    ok($I3, 'eq_ic_ic - equal')

    $I3 = 1
    unless 12 == 21 goto test_eq_7
    $I3 = 0
  test_eq_7:
    ok($I3, 'eq_ic_ic - different')
.end

.sub 'test_ne'
    $I0 = 0xa0b0c0d
    $I1 = 0xa0b0c0d
    $I2 = 0

    $I3 = 0
    unless $I0 != $I2 goto test_ne_1
    $I3 = 1
  test_ne_1:
    ok($I3, 'ne_i_i - different')

    $I3 = 0
    if $I0 != $I1 goto test_ne_2
    $I3 = 1
  test_ne_2:
    ok($I3, 'ne_i_i - equal')

    $I0 = 427034409
    $I3 = 0
    if $I0 != 427034409 goto test_ne_3
    $I3 = 1
  test_ne_3:
    ok($I3, 'ne_i_ic - equal')

    $I3 = 0
    unless $I0 != 427034408 goto test_ne_4
    $I3 = 1
  test_ne_4:
    ok($I3, 'ne_i_ic - different')
.end

.sub 'test_lt'
    $I0 = 2147483647
    $I1 = -2147483648
    $I2 = 0
    $I3 = 0

    $I4 = 0
    unless $I1 < $I0 goto test_lt_1
    $I4 = 1
  test_lt_1:
    ok($I4, 'lt_i_i - true inequality')

    $I4 = 0
    if $I0 < $I1 goto test_lt_2
    $I4 = 1
  test_lt_2:
    ok($I4, 'lt_i_i - false inequality')

    $I4 = 0
    if $I2 < $I3 goto test_lt_3
    $I4 = 1
  test_lt_3:
    ok($I4, 'lt_i_i - irreflexivity')

    $I4 = 0
    if $I0 < -2147483648 goto test_lt_4
    $I4 = 1
  test_lt_4:
    ok($I4, 'lt_i_ic - false inequality')

    $I4 = 0
    unless $I1 < 2147483647 goto test_lt_5
    $I4 = 1
  test_lt_5:
    ok($I4, 'lt_i_ic - true inequality')

    $I4 = 0
    if $I0 < 0 goto test_lt_6
    $I4 = 1
  test_lt_6:
    ok($I4, 'lt_i_ic - irreflexivity')
.end

.sub 'test_le'
    $I0 = 2147483647
    $I1 = -2147483648
    $I2 = 0
    $I3 = 0

    $I4 = 0
    unless $I1 <= $I0 goto test_le_1
    $I4 = 1
  test_le_1:
    ok($I4, 'le_i_i - true inequality')

    $I4 = 0
    if $I0 <= $I1 goto test_le_2
    $I4 = 1
  test_le_2:
    ok($I4, 'le_i_i - false inequality')

    $I4 = 0
    unless $I2 <= $I3 goto test_le_3
    $I4 = 1
  test_le_3:
    ok($I4, 'le_i_i - reflexive')

    $I4 = 0
    if $I0 <= -2147483648 goto test_le_4
    $I4 = 1
  test_le_4:
    ok($I4, 'le_i_ic - false inequality')

    $I4 = 0
    unless $I1 <= 2147483647 goto test_le_5
    $I4 = 1
  test_le_5:
    ok($I4, 'le_i_ic - true inequality')

    $I4 = 0
    unless $I2 <= 0 goto test_le_6
    $I4 = 1
  test_le_6:
    ok($I4, 'le_i_ic - reflexivity')
.end

.sub 'test_gt'
    $I0 = -2147483648
    $I1 = 2147483647
    $I2 = 0
    $I3 = 0

    $I4 = 0
    unless $I1 > $I0 goto test_gt_1
    $I4 = 1
  test_gt_1:
    ok($I4, 'gt_i_i - true inequality')

    $I4 = 0
    if $I0 > $I1 goto test_gt_2
    $I4 = 1
  test_gt_2:
    ok($I4, 'gt_i_i - false inequality')

    $I4 = 0
    if $I2 > $I3 goto test_gt_3
    $I4 = 1
  test_gt_3:
    ok($I4, 'gt_i_i - irreflexive')

    $I4 = 0
    if $I0 > 2147483647 goto test_gt_4
    $I4 = 1
  test_gt_4:
    ok($I4, 'gt_i_ic - false inequality')

    $I4 = 0
    unless $I1 > -2147483648 goto test_gt_5
    $I4 = 1
  test_gt_5:
    ok($I4, 'gt_i_ic - true inequality')

    $I4 = 0
    if $I0 > 0 goto test_gt_6
    $I4 = 1
  test_gt_6:
    ok($I4, 'gt_i_ic - another false inequality')
.end

.sub 'test_ge'
    $I0 = -2147483648
    $I1 = 2147483647
    $I2 = 0
    $I3 = 0

    $I4 = 0
    unless $I1 >= $I0 goto test_ge_1
    $I4 = 1
  test_ge_1:
    ok($I4, 'ge_i_i - true inequality')

    $I4 = 0
    if $I0 >= $I1 goto test_ge_2
    $I4 = 1
  test_ge_2:
    ok($I4, 'ge_i_i - false inequality')

    $I4 = 0
    unless $I2 >= $I3 goto test_ge_3
    $I4 = 1
  test_ge_3:
    ok($I4, 'ge_i_i - reflexive')

    $I4 = 0
    if $I0 >= 2147483647 goto test_ge_4
    $I4 = 1
  test_ge_4:
    ok($I4, 'ge_i_ic - false inequality')

    $I4 = 0
    unless $I1 >= -2147483648 goto test_ge_5
    $I4 = 1
  test_ge_5:
    ok($I4, 'ge_i_ic - true inequality')

    $I4 = 0
    unless $I2 >= 0 goto test_ge_6
    $I4 = 1
  test_ge_6:
    ok($I4, 'ge_i_ic - reflexivity')
.end

.sub 'test_not'
    $I0 = 1
    $I1 = not $I0
    is($I1, 0, 'not_i_i - not 1')

    $I2 = not $I1
    is($I2, 1, 'not_i_i - not (not 1)')

    $I3 = 12345
    $I4 = not $I3
    is($I4, 0, 'not_i_i of a positive integer')

    $I5 = -1
    $I6 = not $I5
    is($I6, 0, 'not_i_i of a negative integer')

    $I7 = 1
    $I7 = not 1
    is($I7, 0, 'not_i_ic')
.end

.sub 'test_and'
    $I0 = 0
    $I1 = 10

    $I2 = 1
    $I2 = and $I1, $I0
    is($I2, 0, 'and - zero is right absorbing')

    $I2 = 1
    $I2 = and $I0, $I1
    is($I2, 0, 'and - zero is left absorbing')

    $I2 = 1
    $I2 = and $I0, $I0
    is($I2, 0, 'and - diagonal zero')

    $I2 = 1
    $I2 = and $I2, $I1
    is($I2, 10, 'and - true operands')
.end

.sub 'test_or'
    $I0 = 0
    $I1 = 10

    $I2 = 42
    $I2 = or $I1, $I0
    is($I2, 10, 'or_i_i')

    $I2 = 42
    $I2 = or $I0, $I1
    is($I2, 10, 'or_i_i - symmetric case')

    $I2 = or $I0, $I0
    is($I2, 0, 'or_i_i - false arguments')

    $I2 = or $I2, $I1
    is($I2, 10, 'or_i_i - reflexive')
.end

.sub 'test_xor'
    $I0 = 0
    $I1 = 2

    $I2 = 42
    $I2 = xor $I1, $I0
    is($I2, 2, 'xor - zero is right neutral')

    $I2 = 42
    $I2 = xor $I0, $I1
    is($I2, 2, 'xor - zero is left neutral')

    $I2 = xor $I0, $I0
    is($I2, 0, 'xor - nilpotent on zero')

    $I2 = xor $I1, $I1
    is($I2, 0, 'xor - nilpotent on 2')

    $I2 = xor $I2, $I2
    is($I2, 0, 'xor - nilpotent on other')
.end

.sub 'test_inc'
    $I0 = 0
    inc $I0
    is($I0, 1, 'inc_i (first)')
    inc $I0
    inc $I0
    inc $I0
    inc $I0
    is($I0, 5, 'inc_i (second)')
.end

.sub 'test_dec'
    $I0 = 0
    dec $I0
    is($I0, -1, 'dec_i (first)')
    dec $I0
    dec $I0
    dec $I0
    dec $I0
    is($I0, -5, 'dec_i (second)')
.end

.sub 'test_sub_i_i'
    $I0 = 0
    $I1 = 3
    $I2 = -3

    sub $I0, $I1
    is($I0, -3, 'sub_i_i')

    sub $I0, $I2
    is($I0, 0, 'sub_i_i - inverse')

    $I0 = 0
    sub $I0, 5
    is($I0, -5, 'sub_i_ic - first')

    sub $I0, -10
    is($I0, 5, 'sub_i_ic - second')
.end

.sub 'test_set_n'
    $I0 = 0
    $N0 = $I0
    is($N0, 0.0, 'set_n_i -zero')

    $I1 = 2147483647
    $N1 = $I1
    is($N1, 2147483647.0, 'set_n_i - positive integer')

    $I2 = -2147483648
    $N2 = $I2
    is($N2, -2147483648.0, 'set_n_i - negative integer')
.end

.sub 'test_neg'
    $I0 = neg 3
    $I0 = neg $I0
    neg $I0

    is($I0, -3, 'neg_i')
.end

.sub 'test_mul_i_i'
    $I0 = 3
    $I1 = 4
    mul $I0, $I1

    is($I0, 12, 'mul_i_i')
.end

.sub 'test_null'
    $I1 = 1000
    is($I1, 1000, 'null_i - before null')
    null $I1
    is($I1, 0, 'null_i - after null')
.end

.sub 'test_div_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    push_eh test_div_i_i_by_zero_catch
    div $I1, $I0
    pop_eh
    $I2 = 0
    goto test_div_i_i_by_zero_end

  test_div_i_i_by_zero_catch:
    $I2 = 1

  test_div_i_i_by_zero_end:
    ok($I2, 'div_i_i by zero')
.end

.sub 'test_div_i_ic_by_zero'
    $I1 = 10
    push_eh test_div_i_ic_by_zero_catch
    div $I1, 0
    pop_eh
    $I2 = 0
    goto test_div_i_ic_by_zero_end

  test_div_i_ic_by_zero_catch:
    $I2 = 1

  test_div_i_ic_by_zero_end:
    ok($I2, 'div_i_ic by zero')
.end

.sub 'test_div_i_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    push_eh test_div_i_i_i_by_zero_catch
    $I2 = div $I1, $I0
    pop_eh
    $I3 = 0
    goto test_div_i_i_i_by_zero_end

  test_div_i_i_i_by_zero_catch:
    $I3 = 1

  test_div_i_i_i_by_zero_end:
    ok($I3, 'div_i_i_i by zero')
.end

.sub 'test_div_i_ic_i_by_zero'
    $I0 = 0
    push_eh test_div_i_ic_i_by_zero_catch
    $I2 = div 10, $I0
    pop_eh
    $I3 = 0
    goto test_div_i_ic_i_by_zero_end

  test_div_i_ic_i_by_zero_catch:
    $I3 = 1

  test_div_i_ic_i_by_zero_end:
    ok($I3, 'div_i_ic_i by zero')
.end

.sub 'test_div_i_i_ic_by_zero'
    $I1 = 10
    push_eh test_div_i_i_ic_by_zero_catch
    $I2 = div $I1, 0
    pop_eh
    $I3 = 0
    goto test_div_i_i_ic_by_zero_end

  test_div_i_i_ic_by_zero_catch:
    $I3 = 1

  test_div_i_i_ic_by_zero_end:
    ok($I3, 'div_i_i_ic by zero')
.end

.sub 'test_fdiv_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    push_eh test_fdiv_i_i_by_zero_catch
    fdiv $I1, $I0
    pop_eh
    $I2 = 0
    goto test_fdiv_i_i_by_zero_end

  test_fdiv_i_i_by_zero_catch:
    $I2 = 1

  test_fdiv_i_i_by_zero_end:
    ok($I2, 'fdiv_i_i by zero')
.end

.sub 'test_fdiv_i_ic_by_zero'
    $I1 = 10
    push_eh test_fdiv_i_ic_by_zero_catch
    fdiv $I1, 0
    pop_eh
    $I2 = 0
    goto test_fdiv_i_ic_by_zero_end

  test_fdiv_i_ic_by_zero_catch:
    $I2 = 1

  test_fdiv_i_ic_by_zero_end:
    ok($I2, 'fdiv_i_ic by zero')
.end

.sub 'test_fdiv_i_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    push_eh test_fdiv_i_i_i_by_zero_catch
    $I2 = fdiv $I1, $I0
    pop_eh
    $I3 = 0
    goto test_fdiv_i_i_i_by_zero_end

  test_fdiv_i_i_i_by_zero_catch:
    $I3 = 1

  test_fdiv_i_i_i_by_zero_end:
    ok($I3, 'fdiv_i_i_i by zero')
.end

.sub 'test_fdiv_i_ic_i_by_zero'
    $I0 = 0
    push_eh test_fdiv_i_ic_i_by_zero_catch
    $I2 = fdiv 10, $I0
    pop_eh
    $I3 = 0
    goto test_fdiv_i_ic_i_by_zero_end

  test_fdiv_i_ic_i_by_zero_catch:
    $I3 = 1

  test_fdiv_i_ic_i_by_zero_end:
    ok($I3, 'fdiv_i_ic_i by zero')
.end

.sub 'test_fdiv_i_i_ic_by_zero'
    $I1 = 10
    push_eh test_fdiv_i_i_ic_by_zero_catch
    $I2 = fdiv $I1, 0
    pop_eh
    $I3 = 0
    goto test_fdiv_i_i_ic_by_zero_end

  test_fdiv_i_i_ic_by_zero_catch:
    $I3 = 1

  test_fdiv_i_i_ic_by_zero_end:
    ok($I3, 'fdiv_i_i_ic by zero')
.end

.sub 'test_mod_i_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    $I2 = mod $I1, $I0
    is($I2, 10, 'mod_i_i_i by zero')
.end

.sub 'test_mod_i_ic_i_by_zero'
    $I0 = 0
    $I2 = mod 10, $I0
    is($I2, 10, 'mod_i_ic_i by zero')
.end

.sub 'test_mod_i_i_ic_by_zero'
    $I1 = 10
    $I2 = mod $I1, 0
    is($I2, 10, 'mod_i_i_ic by zero')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
