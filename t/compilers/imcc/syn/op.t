#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub test :main
    .include 'test_more.pir'
    plan(58)

    test_plus_equal()
    test_minus_equal()
    test_times_equal()
    test_divide_equal()
    test_mod_equal()
    test_dot_equal()
    test_and_equal()
    test_pipe_equal()
    test_tilde_equal()
    test_double_shift_right_equal()
    test_triple_shift_right_equal()
    test_double_shift_left_equal()
    test_x_defined()
    test_x_clone()
    test_x_length()
    test_x_can()
    test_x_isa()
    test_x_add()
    test_x_invoke()
    test_empty_sub()
    test_if_null_x_goto_y()
    test_unless_null_x_goto_y()
    test_if_null_x_goto_y_2()
    test_unless_null_x_goto_y_p0()
    test_x_equal_a_double_equal_b()
    test_x_equal_a_less_than_b()
    test_x_equals_a_greater_than_b()
    test_x_equal_a_greater_than_equal_b()
    test_x_equal_a_less_than_equal_b()
    test_x_equal_a_not_equal_b()
    test_octal_hex_bin_dec_numbers()
.end

.sub test_plus_equal
    $I0 = 10
    $I0 += 20
    is($I0, 30, '+=')

    $I0 += -20
    is($I0, 10, '+=')
.end

.sub test_minus_equal
    $I0 = 10
    $I0 -= 20
    is($I0, -10, '-=')

    $I0 -= -20
    is($I0, 10, '-=')
.end

.sub test_times_equal
    $I0 = 10
    $I0 *= 20
    is($I0, 200, '*=')

    $I0 *= -2
    is($I0, -400, '*=')
.end

.sub test_divide_equal
    $I0 = 20
    $I0 /= 2
    is($I0, 10, '/=')

    $N0 = 20
    $N0 /= .5
    $I0 = $N0
    is($I0, 40, '/=')
.end

.sub test_mod_equal
    $I0 = 20
    $I0 %= 7
    is($I0, 6, '%=')

    $I0 = 200
    $I0 %= 2
    is($I0, 0, '%=')
.end

.sub test_dot_equal
    $S0 = "ab"
    $S0 .= "cd"
    is($S0, 'abcd', '.=')

    $S0 .= ""
    is($S0, 'abcd', '.=')
.end

.sub test_and_equal
    $I0 =  0b1011
    $I0 &= 0b1000
    is($I0, 8, '&=')

    $I0 &= 0b0000
    is($I0, 0, '&=')
.end

.sub test_pipe_equal
    $I0 =  0b1011
    $I0 |= 0b1000
    is($I0, 11, '|=')

    $I0 |= 0b0100
    is($I0, 15, '|=')
.end

.sub test_tilde_equal
    $I0 =  0b1011
    $I0 ~= 0b1000
    is($I0, 3, '~=')

    $I0 ~= 0b0011
    is($I0, 0, '~=')
.end

.sub test_double_shift_right_equal
    $I0 =  0b1011
    $I0 >>= 1
    is($I0, 5, '>>=')
.end

.sub test_triple_shift_right_equal
    $I0 =  0b1011
    $I0 >>>= 1
    is($I0, 5, '>>>=')
.end

.sub test_double_shift_left_equal
    $I0 =  0b1011
    $I0 <<= 1
    is($I0, 22, '<<=')
.end

.sub test_x_defined
    .local pmc a
    a = new 'ResizablePMCArray'
    push a, 10
    $I0 = defined a
    is($I0, 1, 'x = defined')
    $I0 = defined a[0]
    is($I0, 1, 'x = defined')
    $I0 = defined a[1]
    is($I0, 0, 'x = defined')
.end

.sub test_x_clone
    .local pmc a
    a = new 'Integer'
    a = 10
    .local pmc b
    b = clone a
    is(b, 10, 'x = clone')
.end

.sub test_x_length
    .local string s
    s = "abc"
    $I0 = length s
    is($I0, 3, 'x = length')

    s = ""
    $I0 = length s
    is($I0, 0, 'x = length')
.end

.sub test_x_can
    $P0 = new 'FileHandle'
    $I0 = can $P0, "puts"
    is($I0, 1, 'x = can')
.end

.sub test_x_isa
    $P0 = new 'Integer'
    $I0 = isa $P0, "scalar"
    is($I0, 1, 'x = isa')
.end

.sub test_x_add
    $I0 = 10
    $I1 = add $I0, 10
    is($I1, 20, 'x = add')
.end

.sub test_x_invoke
    $P0 = get_global "_s"
    $P0 = invokecc
.end

.sub _s
    ok(1, 'x = invoke')
    returncc
.end

# ticket 32393
.sub test_empty_sub
    lives_ok( <<'CODE', "empty sub" )
.sub _foo
.end

.sub _foo :anon
.end
CODE
.end

.sub test_if_null_x_goto_y
    null $P0
    if null $P0 goto BLAH
    ok(0, 'if null X goto Y')
    .return()
  BLAH:
    ok(1, 'if null X goto Y')
.end

.sub test_unless_null_x_goto_y
    null $P0
    unless null $P0 goto BLAH
    ok(1, 'unless null X goto Y')
    .return()
  BLAH:
    ok(0, 'unless null X goto Y')
.end

.sub test_if_null_x_goto_y_2
    $S0 = "hello"
    if null $S0 goto BLAH
    ok(1, 'if null X goto Y 2')
    .return()
  BLAH:
    ok(0, 'if null X goto Y 2')
.end

.sub test_unless_null_x_goto_y_p0
    $P0 = null
    unless null $P0 goto BLAH
    ok(1, 'unless null X goto Y, $P0 = null')
    .return()
  BLAH:
    ok(0, 'unless null X goto Y, $P0 = null')
.end

.sub test_x_equal_a_double_equal_b
    $I0 = 1 == 1
    is($I0, 1, 'X = A == B')
    $I0 = 1 == 0
    is($I0, 0, 'X = A == B')
.end

.sub test_x_equal_a_less_than_b
    $I0 = 1 < 1
    is($I0, 0, 'X = A < B')
    $I0 = 0 < 1
    is($I0, 1, 'X = A < B')
.end

.sub test_x_equals_a_greater_than_b
    $I0 = 1 > 1
    is($I0, 0, 'X = A > B')
    $I0 = 4 > 1
    is($I0, 1, 'X = A > B')
.end

.sub test_x_equal_a_greater_than_equal_b
    $I0 = 1 >= 1
    is($I0, 1, 'X = A >= B')
    $I0 = 4 >= 1
    is($I0, 1, 'X = A >= B')
    $I0 = 0 >= 1
    is($I0, 0, 'X = A >= B')
.end

.sub test_x_equal_a_less_than_equal_b
    $I0 = 1 <= 1
    is($I0, 1, 'X = A <= B')
    $I0 = 4 <= 1
    is($I0, 0, 'X = A <= B')
    $I0 = 0 <= 1
    is($I0, 1, 'X = A <= B')
.end

.sub test_x_equal_a_not_equal_b
    $I0 = 1 != 1
    is($I0, 0, 'X = A != B')
    $I0 = 4 != 1
    is($I0, 1, 'X = A != B')
.end

.sub test_octal_hex_bin_dec_numbers
    $I0 = 0077
    is($I0, 77, 'Test octal/hex/bin/dec numbers')
    $I0 = 0o77
    is($I0, 63, 'Test octal/hex/bin/dec numbers')
    $I0 = 0xfF
    is($I0, 255, 'Test octal/hex/bin/dec numbers')
    $I0 = 0b1101
    is($I0, 13, 'Test octal/hex/bin/dec numbers')
    $I0 = 0O10
    is($I0, 8, 'Test octal/hex/bin/dec numbers')
    $I0 = 0X10
    is($I0, 16, 'Test octal/hex/bin/dec numbers')
    $I0 = 0B10
    is($I0, 2, 'Test octal/hex/bin/dec numbers')
    $I0 = 10
    is($I0, 10, 'Test octal/hex/bin/dec numbers')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
