#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/complex.t - Complex Numbers

=head1 SYNOPSIS

    % prove t/pmc/complex.t

=head1 DESCRIPTION

Tests the Complex PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    .include 'fp_equality.pasm'
    .include "iglobals.pasm"

    plan(632)

    test_init_pmc()
    string_parsing()
    exception_malformed_string__real_part()
    exception_malformed_string__imaginary_part()
    exception_malformed_string__missing_plus_or_minus()
    test_complex_add()
    test_complex_subtract()
    test_complex_multiply()
    test_complex_divide()
    complex_divide_by_zero_Complex()
    complex_divide_by_zero_Float()
    complex_divide_by_zero_Integer()
    complex_divide_by_zero_intval()
    get_int_or_num_or_bool()
    test_get_keyed()
    exception_get_keyed__invalid_string_key()
    exception_set_keyed__invalid_string_key()
    exception_get_keyed__invalid_numeric_key()
    set_int_or_num()
    set_keyed()
    test_set_pmc()
    exception_set_keyed__invalid_key()
    test_is_equal()
    test_complex_abs()
    check_whether_interface_is_done()
    instantiate__pasm__i()
    instantiate__pir__n()
    instantiate__pir__p()
    instantiate__pir__s()
    test_complex_neg()
    test_clone()
    test_freeze_thaw()
    test_sub()
    test_i_sub()
    sprintf_with_a_complex()
    ln_of_complex_numbers()
    exp_of_complex_numbers()
    sqrt_of_complex_numbers()
    pow_of_complex_numbers()
    sin_of_complex_numbers()
    cos_of_complex_numbers()
    tan_of_complex_numbers()
    cot_of_complex_numbers()
    sec_of_complex_numbers()
    csc_of_complex_numbers()
    asin_of_complex_numbers()
    acos_of_complex_numbers()
    atan_of_complex_numbers()
    acot_of_complex_numbers()
    asec_of_complex_numbers()
    acsc_of_complex_numbers()
    sinh_of_complex_numbers()
    cosh_of_complex_numbers()
    tanh_of_complex_numbers()
    coth_of_complex_numbers()
    sech_of_complex_numbers()
    csch_of_complex_numbers()
    asinh_of_complex_numbers()
    acosh_of_complex_numbers()
    atanh_of_complex_numbers()
    acoth_of_complex_numbers()
    acsch_of_complex_numbers()
    asech_of_complex_numbers()
    add_using_subclass_of_complex_bug_59630()
    provides_complex()

    # END_OF_TESTS

.end

.macro exception_is( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub test_init_pmc
    $P0 = new ['FixedFloatArray'], 2
    set $P0[0], -1.7
    set $P0[1], 1.1
    $P1 = new ['Complex'], $P0
    is( $P1, "-1.7+1.1i", 'init from FixedFloatArray' )

    $P0 = new ['FixedIntegerArray'], 2
    set $P0[0], -1
    set $P0[1], 1
    $P1 = new ['Complex'], $P0
    is( $P1, "-1+1i", 'init from FixedIntegerArray' )

    $P0 = new ['String']
    set $P0, "2+3i"
    $P1 = new ['Complex'], $P0
    is( $P1, "2+3i", 'init from String' )

    push_eh invalid_initializer
    $P4 = new ['Sub']
    $P0 = new ['Complex'], $P4
  invalid_initializer:
    ok(1, 'cannot init from Sub')
    pop_eh
.end

.sub string_parsing
    $P0 = new ['Complex']
    $P1 = new ['String']

    set $P0, "4"
    is( $P0, "4+0i", '"4" parsed as 4+0i' )

    set $P0, "3.14"
    is( $P0, "3.14+0i", '"3.14" parsed as 3.14+0i' )

    set $P0, ".5"
    is( $P0, "0.5+0i", '".5" parsed as 0.5+0i' )

    set $P0, "-13"
    is( $P0, "-13+0i", '"-13" parsed as -13+0i' )

    set $P0, "-.3"
    is( $P0, "-0.3+0i", '"-.3" parsed as -0.3+0i' )

    set $P0, "i"
    is( $P0, "0+1i", '"i" parsed as 0+1i' )

    set $P0, "-i"
    is( $P0, "0-1i", '"-i" parsed as 0-1i' )

    set $P0, ".3i"
    is( $P0, "0+0.3i", '".3i" parsed as 0+0.3i' )

    set $P0, "2 + 3i"
    is( $P0, "2+3i", '"2 + 3i" parsed as 2+3i' )

    set $P0, "4 + 3.5i"
    is( $P0, "4+3.5i", '"4 + 3.5i" parsed as 4+3.5i' )

    set $P0, "2 + .1 i"
    is( $P0, "2+0.1i", '"2 + .1 i" parsed as 2+0.1i' )

    set $P0, "10 - i"
    is( $P0, "10-1i", '"10 - i" parsed as 10-1i' )

    set $P0, "5 - .3i"
    is( $P0, "5-0.3i", '"5 - .3i" parsed as 5-0.3i' )

    set $P1, "-4-i"
    assign $P0, $P1
    is( $P0, "-4-1i", '"-4-i" parsed as -4-1i' )

    set $P1, "- 20 - .5 i"
    assign $P0, $P1
    is( $P0, "-20-0.5i", '"- 20 - .5 i" parsed as -20-0.5i' )

    set $P1, "-13 +2i"
    assign $P0, $P1
    is( $P0, "-13+2i", '"-13 +2i" parsed as -13+2i' )
.end

.sub exception_malformed_string__real_part
    $P0 = new ['Complex']
    push_eh handler
        set $P0, "q + 3i"
    pop_eh
handler:
    .exception_is( "Complex: malformed string" )
.end

.sub exception_malformed_string__imaginary_part
    $P0 = new ['Complex']
    push_eh handler
        set $P0, "1 + ij"
    pop_eh
handler:
    .exception_is( "Complex: malformed string" )
.end

.sub exception_malformed_string__missing_plus_or_minus
    $P0 = new ['Complex']
    push_eh handler
        set $P0, "1 * i"
    pop_eh
handler:
    .exception_is( "Complex: malformed string" )
.end

.sub test_complex_add
    $P0 = new ['Complex']
    $P1 = new ['Complex']
    $P2 = new ['Float']
    $P3 = new ['Integer']

    set $P0, "1 + i"
    add $P0, $P0, $P0
    is( $P0, "2+2i", '1+i plus 1+i' )

    set $P0, "1 - i"
    set $P1, "1 + i"
    add $P0, $P0, $P1
    is( $P0, "2+0i", '1-i plus 1+i' )
    is( $P1, "1+1i", '1+i as text is 1+1i' )

    set $P0, "-i"
    set $P1, "1"
    add $P1, $P0, $P1
    is( $P0, "0-1i", '-i as text is 0-1i' )
    is( $P1, "1-1i", '-i plus 1 is 1-1i' )

    set $P0, "2 + i"
    set $P2, 3.3
    add $P1, $P0, $P2
    is( $P1, "5.3+1i", '2+i plus 3.3 is 5.3+1i' )

    set $P0, "3 + 5i"
    add $P1, $P0, 2
    is( $P1, "5+5i", '3+5i plus literal 2 is 5+5i' )

    set $P0, "2 + 2i"
    add $P1, $P0, -2.0
    is( $P1, "0+2i", '2+2i plus literal -2.0 is 0+2i' )

    set $P0, "3 + 3i"
    set $P3, -3
    add $P1, $P0, $P3
    is( $P1, "0+3i", '3+3i plus -3 is 0+3i' )
    add $P1, $P3, $P0
    is( $P1, "0+3i", '-2 plus 3+3i is 0+3i' )

    set $P0, "2 + 2i"
    set $P1, "1 + 1i"
    add $P0, $P1
    is( $P0, "3+3i", '2+2i plus (in-place) 1+1i is 3+3i' )

    set $P0, "-0.5-2i"
    set $P1, "0.3i"
    add $P0, $P1
    is( $P0, "-0.5-1.7i", '-0.5-2i plus (in-place) 0.3i is -0.5-2i' )

    set $P0, "-0.5-2i"
    set $P2, "5"
    add $P0, $P2
    is( $P0, "4.5-2i", '-0.5-2i plus (in-place) 5 (int pmc) is 4.5-2i' )

    set $P0, "-0.5-2i"
    add $P0, 5
    is( $P0, "4.5-2i", '-0.5-2i plus (in-place) 5 (int) is 4.5-2i' )
.end

.sub test_complex_subtract
    $P0 = new ['Complex']
    $P1 = new ['Complex']
    $P2 = new ['Float']
    $P3 = new ['Integer']

    set $P0, "1 + i"
    sub $P0, $P0, $P0
    is( $P0, "0+0i", '1+i minus 1+i is 0+0i' )

    set $P0, "1 - i"
    set $P1, "1 + i"
    sub $P0, $P0, $P1
    is( $P0, "0-2i", '1-i minus 1+i is 0-2i' )
    is( $P1, "1+1i", '... original $3 is  unchanged' )

    set $P0, "-i"
    set $P1, "1"
    sub $P1, $P0, $P1
    is( $P0, "0-1i", '-i minus 1 is 0-1i' )
    is( $P1, "-1-1i", '... original $3 is unchanged' )

    set $P0, "1 - 4i"
    set $P2, -1.0
    sub $P1, $P0, $P2
    is( $P1, "2-4i", '1-4i minus -1.0 is 2-4i' )

    set $P0, "- 2 - 2i"
    sub $P1, $P0, -4
    is( $P1, "2-2i", '-2-2i minus -4 is 2-2i' )

    set $P0, "3 + i"
    sub $P1, $P0, 1.2
    is( $P1, "1.8+1i", '3+i - literal 1.2 is 1.8+1i' )

    set $P0, "1024 - 3i"
    set $P3, 2048
    sub $P1, $P0, $P3
    is( $P1, "-1024-3i", '1024-3i minus 2048 is -1024-3i' )
    sub $P1, $P3, $P0
    is( $P1, "1024+3i", '2048 minus 1024-3i is 1024+3i' )

    set $P0, "2 + 2i"
    set $P1, "1 + 1i"
    sub $P0, $P1
    is( $P0, "1+1i", '2+2i minus (in-place) 1+1i is 1+1i' )

    set $P0, "-0.5-2i"
    set $P1, "0.3i"
    sub $P0, $P1
    is( $P0, "-0.5-2.3i", '-0.5-2i minus (in-place) 0.3i is -0.5-2.3i' )

    set $P0, "-0.5-2i"
    sub $P0, 5
    is( $P0, "-5.5-2i", '-0.5-2i minus (in-place) 5 (int) is -5.5-2i' )

    set $P0, "-0.5-2i"
    sub $P0, 2.5
    is( $P0, "-3-2i", '-0.5-2i minus (in-place) 2.5 (float) is -3-2i' )
.end

.sub test_complex_multiply
    $P0 = new ['Complex']
    $P1 = new ['Complex']
    $P2 = new ['Float']
    $P3 = new ['Integer']

    set $P0, "2 + 3i"
    mul $P0, $P0, $P0
    is( $P0, "-5+12i", '2+3i x 2+3i = -5+12i' )

    set $P0, "2 + 3i"
    mul $P0, $P0
    is( $P0, "-5+12i", '2+3i x (in-place) 2+3i = -5+12i' )

    set $P0, "5 - 2i"
    set $P1, "5 + 2i"
    mul $P0, $P0, $P1
    is( $P0, "29+0i", '5-2i x 5+2i = 29+0i' )
    is( $P1, "5+2i", '... original $3 is unchanged' )

    set $P0, "3i"
    set $P1, "2 - i"
    mul $P1, $P0, $P1
    is( $P0, "0+3i", '3i x 2-i = 0+3i' )
    is( $P1, "3+6i", '... original $3 is unchanged' )

    set $P0, "2 - 2i"
    set $P2, 0.5
    mul $P1, $P0, $P2
    is( $P1, "1-1i", '2-2i x 0.5 = 1-1i' )

    set $P0, "2 - 2i"
    mul $P0, 0.5
    is( $P0, "1-1i", '2-2i x (in-place) 0.5 = 1-1i' )

    set $P0, "1 - i"
    mul $P1, $P0, 2
    is( $P1, "2-2i", '1-i x literal 2 = 2-2i' )

    set $P0, "1 - i"
    set $P2, "2"
    mul $P0, $P2
    is( $P0, "2-2i", '1-i x (in-place) literal 2 = 2-2i' )

    set $P0, "1 - i"
    mul $P0, 2
    is( $P0, "2-2i", '1-i x (in-place) literal 2 = 2-2i' )

    set $P0, "-1 + i"
    mul $P1, $P0, -1.0
    is( $P1, "1-1i", '-1+i x literal -1.0 = 1-1i' )

    set $P0, "1 + i"
    set $P3, 10
    mul $P1, $P0, $P3
    is( $P1, "10+10i", '1+i x literal 10 = 10+10i' )

    mul $P1, $P3, $P0
    is( $P1, "10+10i", '10 x 1+i is 10+10i' )
 .end

.sub test_complex_divide
    $P0 = new ['Complex']
    $P1 = new ['Complex']
    $P2 = new ['Float']

    set $P0, "2 + 3i"
    div $P0, $P0, $P0
    is( $P0, "1+0i", '2+3i / 2+3i = 1+0i' )

    set $P0, "2 + 3i"
    div $P0, $P0
    is( $P0, "1+0i", '2+3i / (in-place) 2+3i = 1+0i' )

    set $P0, "3 + 5i"
    set $P1, "5 - 3i"
    div $P0, $P0, $P1
    is( $P0, "0+1i", '3+5i / 5-3i = 0+1i' )
    is( $P1, "5-3i", '... original $3 is unchanged' )

    set $P0, "25"
    set $P1, "3 + 4i"
    div $P1, $P0, $P1
    is( $P1, "3-4i", '25 / 3+4i = 3-4i' )
    is( $P0, "25+0i", '... original $2 is unchanged' )

    set $P0, "-3 + 6i"
    set $P2, 3.0
    div $P1, $P0, $P2
    is( $P1, "-1+2i", '-3+6i / 3.0 = -1+2i' )

    set $P0, "-3 + 6i"
    div $P0, 3.0
    is( $P0, "-1+2i", '-3+6i / (in-place) 3.0 = -1+2i' )

    set $P0, "-3 + 6i"
    set $P2, "3.0"
    div $P0, $P2
    is( $P0, "-1+2i", '-3+6i / (in-place) 3.0 = -1+2i' )

    set $P0, "-2 + 3i"
    div $P1, $P0, 2
    is( $P1, "-1+1.5i", '-2+3i / 2 = -1+1.5i' )

    set $P0, "-2 + 3i"
    div $P0, 2
    is( $P0, "-1+1.5i", '-2+3i / (in-place) 2 = -1+1.5i' )

    set $P0, "2 - 3i"
    div $P1, $P0, 0.5
    is( $P1, "4-6i", '2-3i / 0.5 = 4-6i' )

    set $P0, "4 + 0i"
    set $P1, "2 + 0i"
    div $P0, $P0, $P1
    is( $P1, "2+0i", '4+0i / 2+0i = 2+0i' )
.end

.sub complex_divide_by_zero_Complex
    $P0 = new ['Complex']
    set $P0, "4+3.5i"
    $P1 = new ['Complex']
    ## divide by a zero Complex
    $P2 = new ['Complex']
    set $P2, 0
    push_eh handler
        $P1 = $P0 / $P2
    pop_eh
handler:
    .exception_is( 'Divide by zero' )
.end

.sub complex_divide_by_zero_Float
    $P0 = new ['Complex']
    set $P0, "4+3.5i"
    $P1 = new ['Complex']
    ## divide by a zero Float
    $P2 = new ['Float']
    set $P2, 0
    push_eh handler
        $P1 = $P0 / $P2
handler:
    .exception_is( 'Divide by zero' )
.end

.sub complex_divide_by_zero_Integer
    $P0 = new ['Complex']
    set $P0, "4+3.5i"
    $P1 = new ['Complex']
    ## divide by a zero Integer
    $P2 = new ['Integer']
    set $P2, 0
    push_eh handler
        $P1 = $P0 / $P2
handler:
    .exception_is( 'Divide by zero' )
.end

.sub complex_divide_by_zero_intval
    $P0 = new ['Complex']
    set $P0, "4+3.5i"

    push_eh handler
        div $P0, 0
handler:
    .exception_is( 'Divide by zero' )
.end

.sub get_int_or_num_or_bool
        $P0 = new ['Complex']
        set $P0, "2 - 1.5i"
        is( $P0, "2-1.5i", 'Complex "2 - 1.5i" returned ok' )

        set $I0, $P0
        is( $I0, "2", 'Complex -> Int = 2' )

        set $N0, $P0
        .fp_eq_ok( $N0, 2.5, 'Complex -> Num = 2.5')

        ok( $P0, 'Complex(2-1.5i) -> bool = true' )

        set $P0, "0"
        nok( $P0, 'Complex(0) -> bool = true' )
.end

.sub test_get_keyed
        $P0 = new ['Complex']
        $P1 = new ['String']
        set $P0, "- 3.3 + 1.2i"
        set $P1, "imag"

        set $N0, $P0["real"]
        set $N1, $P0["imag"]
        set $N2, $P0[$P1]
        .fp_eq_ok( $N0, -3.3, 'got real part')
        .fp_eq_ok( $N1, 1.2, 'got imag part')
        .fp_eq_ok( $N2, 1.2, 'got imag part using variable' )

        set $P2, $P0["real"]
        set $P3, $P0[$P1]
        is( $P2, "-3.3", 'get real portion of -3.3i1.2i' )
        is( $P3, "1.2", 'get imag portion of -3.3+1.2i' )

        set $I0, $P0["real"]
        set $I1, $P0[$P1]
        is( $I0, "-3", 'get real portion -> Int' )
        is( $I1, "1", 'get imag portion -> Int' )

        set $P4, $P0[0]
        set $P5, $P0[1]
        is( $P4, "-3.3", 'get real portion using get_pmc_keyed')
        is( $P5, "1.2", 'get imag portion using get_pmc_keyed')

        $P2 = box 0
        $P1 = $P0[$P2]
        is( $P1, -3.3, 'get_keyed_pmc' )
.end

.sub exception_get_keyed__invalid_string_key
    $P0 = new ['Complex']
    set $P0, "5 + 3.5i"
    push_eh handler
        set $N0, $P0["Foo55"]
handler:
    .exception_is( "Complex: key is neither 'real' or 'imag'" )
.end

.sub exception_set_keyed__invalid_string_key
    $P0 = new ['Complex']
    set $P0, "5 + 3.5i"
    push_eh handler
        set $P0["Foo55"], 1
handler:
    .exception_is( "Complex: key is neither 'real' or 'imag'" )
.end

.sub exception_get_keyed__invalid_numeric_key
    $P0 = new ['Complex']
    set $P0, "5 + 3.5i"
    push_eh handler
        set $N0, $P0[2]
handler:
    .exception_is( "Complex: key must be 0 or 1" )
.end

.sub set_int_or_num
    $P0 = new ['Complex']

    set $P0, "3 + 4i"
    set $P0, -2
    is( $P0, "-2+0i", '-2 -> Complex = -2+0i' )

    set $P0, "2 + 5i"
    set $P0, .4
    is( $P0, "0.4+0i", '.4 -> Complex = 0.4+0i' )
.end

.sub set_keyed
    $P0 = new ['Complex']
    $P1 = new ['String']
    $P2 = new ['String']
    set $P1, "real"

    set $P0[$P1], 1
    set $P0["imag"], 4
    is( $P0, "1+4i", 'set imag and real portion separately' )

    set $P0[$P1], 3.2
    set $P0["imag"], -2.3
    is( $P0, "3.2-2.3i", '... again' )

    set $P2, ".5"
    set $P0[$P1], $P2
    set $P2, 6
    set $P0["imag"], $P2
    is( $P0, "0.5+6i", '... now using String PMCs' )

    $P2 = box 0
    $P0[$P2] = 0.2
    $P3 = $P0["real"]
    is( $P3, 0.2, 'test set_number_keyed with Integer key' )
.end

.sub test_set_pmc
    $P0 = new ['Complex']
    $P0['real'] = 1
    $P0['imag'] = 4

    $P1 = new ['Complex']
    $P1['real'] = 2
    $P1['imag'] = 3

    assign $P0, $P1
    is( $P0, "2+3i", 'test set_pmc to another Complex PMC' )
.end

.sub exception_set_keyed__invalid_key
    $P0 = new ['Complex']
    push_eh handler
        set $P0[2], 12.5
handler:
    .exception_is( "Complex: key must be 0 or 1" )
.end

.sub test_is_equal
    $P0 = new ['Complex']
    $P1 = new ['Complex']
    $P2 = new ['Float']

    set $P0, "2 + 3j"
    set $P1["real"], 2
    set $P1["imag"], 3

    is( $P0, $P1, 'create new Complex from real/imag and test eq' )
    set $P1, 0
    isnt( $P0, $P1, '... now make sure it ne to 0' )

    set $P2, 2
    isnt( $P0, $P2, 'test ne between Complex (with imag) and Float' )

    set $P0, "2 + 0i"
    is( $P0, $P2, 'test eq between Complex (w/o imag) and Float' )

    eq $P0, $P2, success
  success:
    ok(1, 'test is_equal (with no imag)')
.end

.sub test_complex_abs
    $P0 = new ['Complex']
    set $P0, "4 + 3i"
    $P1 = new ['Undef']
    abs $P1, $P0
    is( $P1, "5", 'abs 4+3j -> 5' )

    abs $P0
    is( $P1, "5", 'abs (in-place) 4+3j -> 5' )
.end

.sub check_whether_interface_is_done
    .local pmc pmc1
    pmc1 = new ['Complex']
    .local int bool1

    does bool1, pmc1, "scalar"
    ok( bool1, 'Complex does scalar' )

    does bool1, pmc1, "no_interface"
    nok( bool1, 'Complex !does no_interface' )
.end

.sub instantiate__pasm__i
    skip( 1, 'instantiate n/y' )
    .return()

    set $I0, 1
    set $I1, 2
    set $I2, 0
    set $I3, 0
    set $I4, 0
    set $I5, 10
    set $I6, 20
    get_class $P2, "Complex"
    # instantiate $P1
    is( $P1, "10+20i", 'instantiate pasm i' )
.end

.sub instantiate__pir__n
    skip( 1, 'instantiate n/y' )
    .return()

    $P0 = get_class "Complex"
    # $P1 = $P0."instantiate"(2.0, 3.0)
    is( $P1, "2+3i", 'instantiate pir n' )
.end

.sub instantiate__pir__p
    skip( 1, 'instantiate n/y' )
    .return()

    $P0 = get_class "Complex"
    $P1 = new ['Float']
    $P1 = 2.0
    $P2 = new ['Float']
    $P2 = 3.0
    # $P1 = $P0."instantiate"($P1, $P2)
    is( $P1, "2+3i", 'instantiate pir p' )
.end

.sub instantiate__pir__s
    skip( 1, 'instantiate n/y' )
    .return()

    $P0 = get_class "Complex"
    # $P1 = $P0."instantiate"("2 + 3i")
    is( $P1, "2+3i", 'instantiate pir s' )
.end

.sub test_complex_neg
     $P0 = new ['Complex']
     set $P0, "1.3 + 1.7i"
     $P1 = new ['Integer']
     neg $P1, $P0
     set $N0, $P1[0]
     set $N1, $P1[1]
     .fp_eq_ok($N0, -1.3, 'test complex negative')
     .fp_eq_ok($N1, -1.7, '... and the imag port')

     neg $P0
     is( $P0, "-1.3-1.7i", 'test in-place neg on 1.3+1.7i' )

     set $P0, "-1.3 - 1.7i"
     neg $P0
     is( $P0, "1.3+1.7i", 'test in-place neg on -1.3-1.7i' )
.end

.sub test_clone
     $P0 = new ['Complex']
     set $P0, "1 - 3i"
     clone $P1, $P0
     is( $P0, $P1, 'clone Complex PMC')

     set $P0, "0 + 0i"
     set $N0, $P1[0]
     set $N1, $P1[1]
     .fp_eq_ok($N0, 1.0, 'no change to cloned after setting orig')
     .fp_eq_ok($N1, -3.0, '... nor to imag portion')
.end

.sub test_freeze_thaw
    $P0 = new ['Complex']
    set $P0, "1 - 3i"
    $S0 = freeze $P0
    $P1 = thaw $S0
    is($P0, $P1, 'roundtrip serialize Complex PMC')
.end

.sub test_sub
    .local pmc d, f, c
    d = new ['Undef']
    f = new ['Float']
    c = new ['Complex']
    f = 2.2
    c = "5+2j"
    d = c - f
    is( d, "2.8+2i", '5+2j - 2.2 = 2.8+i (using d=c-f)' )

    typeof $S0, d
    is( $S0, "Complex", 'd is typeof Complex' )

    d = f - c
    is( d, "-2.8-2i", '2.2 - 5+2j = -2.8-2i' )

    typeof $S0, d
    is( $S0, "Complex", 'typeof still Complex' )
.end

.sub test_i_sub
    .local pmc f, c
    f = new ['Float']
    f = 2.2
    c = new ['Complex']
    c = "5+2j"
    c -= f
    is( c, '2.8+2i', 'Complex -= test' )
    c = new ['Complex']
    c = "5+2j"
    f -= c
    is( f, '-2.8-2i', '... and reverse it' )
.end

.macro sprintf_is(fmt, number, message)
    c = .number
    $S0 = sprintf .fmt, c
    $S1 = .message
    is( $S0, $S1, $S1 )
.endm

.sub sprintf_with_a_complex
    .local pmc c, c2
    c = new ['Complex']
    .sprintf_is( "%d%+di", "1.35+35.1i", "1+35i" )
    .sprintf_is( "%.3f%+.3fi", "0+3.141592653589793i", "0.000+3.142i" )
    .sprintf_is( "%.3f%+.3fi", "0+i", "0.000+1.000i" )
.end

# # The inverse hyperbolic functions are broken wrt -0.0
# # Need to find some formal spec for when to return -0.0.

.macro complex_op_is( val, res, op )
    $P1 = new ['Complex']
    $P2 = new ['Complex']
    set $P1, .val

    set $S0, .val
    set $S1, .res
    set $S2, .op

    #XXX: can't do $P1.'$S2'()
    $P2 = $P1. $S2()
    $S3 = sprintf "%f%+fi", $P2

    concat $S4, $S2, " of "
    concat $S4, $S4, $S0

    is( $S3, $S1, $S4 )
.endm

.macro complex_pow_is( val, res, pow )
    $P1 = new ['Complex']
    $P2 = new ['Complex']
    set $P1, .val

    set $S0, .val
    set $S1, .res
    set $S2, .pow

    $P2 = $P1. 'pow'($S2)
    $S3 = sprintf "%f%+fi", $P2

    concat $S4, $S0, " ^ "
    concat $S4, $S4, $S2

    is( $S3, $S1, $S4 )
.endm

.macro complex_op_todo( val, res, op, todo )
    $P1 = new ['Complex']
    $P2 = new ['Complex']
    set $P1, .val

    set $S0, .val
    set $S1, .res
    set $S2, .op
    set $S3, .todo

    #XXX: can't do $P1.'$S2'()
    $P2 = $P1. $S2()
    $S3 = sprintf "%f%+fi", $P2

    concat $S5, $S2, " of "
    concat $S5, $S5, $S4

    $I0 = iseq $S1, $S3
    todo( $I0, $S4 )
.endm

.macro complex_pow_todo( val, res, pow, todo )
    $P1 = new ['Complex']
    $P2 = new ['Complex']
    set $P1, .val

    set $S0, .val
    set $S1, .res
    set $S2, .pow

    $P2 = $P1. 'pow'($S2)
    $S3 = sprintf "%f%+fi", $P2

    concat $S4, $S0, " ^ "
    concat $S4, $S4, $S2

    $I0 = iseq $S1, $S3
    todo( $I0, $S4 )
.endm

.sub ln_of_complex_numbers
    .complex_op_is("-2+0i", "0.693147+3.141593i", 'ln' )
    .complex_op_is("-1+0i", "0.000000+3.141593i", 'ln' )
    .complex_op_is("-0.5+0i", "-0.693147+3.141593i", 'ln' )
    .complex_op_is("0.5+0i", "-0.693147+0.000000i", 'ln' )
    .complex_op_is("1+0i", "0.000000+0.000000i", 'ln' )
    .complex_op_is("2+0i", "0.693147+0.000000i", 'ln' )
    .complex_op_is("0-2i", "0.693147-1.570796i", 'ln' )
    .complex_op_is("0-1i", "0.000000-1.570796i", 'ln' )
    .complex_op_is("0-0.5i", "-0.693147-1.570796i", 'ln' )
    .complex_op_is("0+0.5i", "-0.693147+1.570796i", 'ln' )
    .complex_op_is("0+1i", "0.000000+1.570796i", 'ln' )
    .complex_op_is("0+2i", "0.693147+1.570796i", 'ln' )
  t_inf:
    skip(1, 'inf is not platform-independent' )
    goto end_inf
    .complex_op_is("0+0i", "-inf+0.000000i", 'ln' )
  end_inf:
    .complex_op_is("2+3i", "1.282475+0.982794i", 'ln' )
    .complex_op_is("2-3i", "1.282475-0.982794i", 'ln' )
    .complex_op_is("-2+3i", "1.282475+2.158799i", 'ln' )
    .complex_op_is("-2-3i", "1.282475-2.158799i", 'ln' )
.end

.sub exp_of_complex_numbers
    .complex_op_is( "-2+0i", "0.135335+0.000000i", 'exp' )
    .complex_op_is( "-1+0i", "0.367879+0.000000i", 'exp' )
    .complex_op_is( "-0.5+0i", "0.606531+0.000000i", 'exp' )
    .complex_op_is( "0.5+0i", "1.648721+0.000000i", 'exp' )
    .complex_op_is( "1+0i", "2.718282+0.000000i", 'exp' )
    .complex_op_is( "2+0i", "7.389056+0.000000i", 'exp' )
    .complex_op_is( "0-2i", "-0.416147-0.909297i", 'exp' )
    .complex_op_is( "0-1i", "0.540302-0.841471i", 'exp' )
    .complex_op_is( "0-0.5i", "0.877583-0.479426i", 'exp' )
    .complex_op_is( "0+0.5i", "0.877583+0.479426i", 'exp' )
    .complex_op_is( "0+1i", "0.540302+0.841471i", 'exp' )
    .complex_op_is( "0+2i", "-0.416147+0.909297i", 'exp' )
    .complex_op_is( "0+0i", "1.000000+0.000000i", 'exp' )
    .complex_op_is( "2+3i", "-7.315110+1.042744i", 'exp' )
    .complex_op_is( "2-3i", "-7.315110-1.042744i", 'exp' )
    .complex_op_is( "-2+3i", "-0.133981+0.019099i", 'exp' )
    .complex_op_is( "-2-3i", "-0.133981-0.019099i", 'exp' )
.end

.sub sqrt_of_complex_numbers
    .complex_op_is( "4", "2.000000+0.000000i", 'sqrt' )
    .complex_op_is( "i", "0.707107+0.707107i", 'sqrt' )
    .complex_op_is( "2i","1.000000+1.000000i", 'sqrt' )
    .complex_op_is( "2+2i", "1.553774+0.643594i", 'sqrt' )
    .complex_op_is( "1+i", "1.098684+0.455090i", 'sqrt' )
    .complex_op_is( "-2+0i", "0.000000+1.414214i", 'sqrt' )
    .complex_op_is( "-1+0i", "0.000000+1.000000i", 'sqrt' )
    .complex_op_is( "-0.5+0i", "0.000000+0.707107i", 'sqrt' )
    .complex_op_is( "0.5+0i", "0.707107+0.000000i", 'sqrt' )
    .complex_op_is( "1+0i", "1.000000+0.000000i", 'sqrt' )
    .complex_op_is( "2+0i", "1.414214+0.000000i", 'sqrt' )
    .complex_op_is( "0-2i", "1.000000-1.000000i", 'sqrt' )
    .complex_op_is( "0-1i", "0.707107-0.707107i", 'sqrt' )
    .complex_op_is( "0-0.5i", "0.500000-0.500000i", 'sqrt' )
    .complex_op_is( "0+0.5i", "0.500000+0.500000i", 'sqrt' )
    .complex_op_is( "0+1i", "0.707107+0.707107i", 'sqrt' )
    .complex_op_is( "0+2i", "1.000000+1.000000i", 'sqrt' )
    .complex_op_is( "0+0i", "0.000000+0.000000i", 'sqrt' )
    .complex_op_is( "2+3i", "1.674149+0.895977i", 'sqrt' )
    .complex_op_is( "2-3i", "1.674149-0.895977i", 'sqrt' )
    .complex_op_is( "-2+3i", "0.895977+1.674149i", 'sqrt' )
    .complex_op_is( "-2-3i", "0.895977-1.674149i", 'sqrt' )
.end

.sub pow_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_pow_is( "2", "1.000000+0.000000i", 0 )
    .complex_pow_is( "2", "2.000000+0.000000i", 1 )
    .complex_pow_is( "2", "4.000000+0.000000i", 2 )
    .complex_pow_is( "2", "8.000000+0.000000i", 3 )
    .complex_pow_is( "2", "5.656854+0.000000i", 2.5 )
    .complex_pow_is( "-2", "1.000000+0.000000i", 0 )
    .complex_pow_is( "-2", "-2.000000+0.000000i", 1 )
    .complex_pow_is( "-2", "-8.000000+0.000000i", 3 )
    .complex_pow_is( "-2", "0.250000+0.000000i", -2 )
    .complex_pow_is( "-2", "0.000000-0.176777i", -2.5 )
    .complex_pow_is( "0.5", "1.000000+0.000000i", 0 )
    .complex_pow_is( "0.5", "0.500000+0.000000i", 1 )
    .complex_pow_is( "0.5", "0.250000+0.000000i", 2 )
    .complex_pow_is( "-0.5", "1.000000+0.000000i", 0 )
    .complex_pow_is( "-0.5", "-0.500000+0.000000i", 1 )
    .complex_pow_is( "-0.5", "4.000000+0.000000i", -2 )
    .complex_pow_is( "-0.5", "0.000000-5.656854i", -2.5 )
    .complex_pow_is( "3i", "1.000000+0.000000i", 0 )
    .complex_pow_is( "3i", "0.000000+3.000000i", 1 )
    .complex_pow_is( "3i", "-9.000000+0.000000i", 2 )
    .complex_pow_is( "3i", "0.000000-0.333333i", -1 )
    .complex_pow_is( "3i", "-0.045361+0.045361i", -2.5 )
    .complex_pow_is( "0.5+2i", "1.000000+0.000000i", 0 )
    .complex_pow_is( "0.5+2i", "0.500000+2.000000i", 1 )
    .complex_pow_is( "0.5+2i", "-3.750000+2.000000i", 2 )
    .complex_pow_is( "0.5+2i", "0.117647-0.470588i", -1 )
    .complex_pow_is( "0.5+2i", "-0.207612-0.110727i", -2 )
    .complex_pow_is( "0.5+2i", "-0.161431+0.028201i", -2.5 )
    .complex_pow_is( "-0.5-0.5i", "-0.500000-0.500000i", 1 )
    .complex_pow_is( "-0.5-0.5i", "-1.000000+1.000000i", -1 )
    .complex_pow_is( "-0.5-0.5i", "2.197368-0.910180i", -2.5 )

    unless has_negative_zero goto todo
    .complex_pow_is( "2", "0.500000-0.000000i", -1 )
    .complex_pow_is( "2", "0.250000-0.000000i", -2 )
    .complex_pow_is( "-0.5", "0.250000-0.000000i", 2 )
    .complex_pow_is( "-0.5", "-2.000000-0.000000i", -1 )
    .complex_pow_is( "-2", "4.000000-0.000000i", 2 )
    .complex_pow_is( "-2", "-0.500000-0.000000i", -1 )
    .complex_pow_is( "0.5", "2.000000-0.000000i", -1 )
    .complex_pow_is( "0.5", "4.000000-0.000000i", -2 )
    .complex_pow_is( "0.5", "5.656854-0.000000i", -2.5 )
    .complex_pow_is( "3i", "-0.111111-0.000000i", -2 )
    .complex_pow_is( "-0.5-0.5i", "1.000000-0.000000i", 0 )
    .complex_pow_is( "-0.5-0.5i", "-0.000000+0.500000i", 2 )
    .complex_pow_is( "-0.5-0.5i", "-0.000000-2.000000i", -2 )
    .return()

todo:
    .complex_pow_todo( "2", "0.500000-0.000000i", -1, 'TT #313' )
    .complex_pow_todo( "2", "0.250000-0.000000i", -2, 'TT #313' )
    .complex_pow_todo( "-0.5", "0.250000-0.000000i", 2, 'TT #313' )
    .complex_pow_todo( "-0.5", "-2.000000-0.000000i", -1, 'TT #313' )
    .complex_pow_todo( "-2", "4.000000-0.000000i", 2, 'TT #313' )
    .complex_pow_todo( "-2", "-0.500000-0.000000i", -1, 'TT #313' )
    .complex_pow_todo( "0.5", "2.000000-0.000000i", -1, 'TT #313' )
    .complex_pow_todo( "0.5", "4.000000-0.000000i", -2, 'TT #313' )
    .complex_pow_todo( "0.5", "5.656854-0.000000i", -2.5, 'TT #313' )
    .complex_pow_todo( "3i", "-0.111111-0.000000i", -2, 'TT #313' )
    .complex_pow_todo( "-0.5-0.5i", "1.000000-0.000000i", 0, 'TT #313' )
    .complex_pow_todo( "-0.5-0.5i", "-0.000000+0.500000i", 2, 'TT #313' )
    .complex_pow_todo( "-0.5-0.5i", "-0.000000-2.000000i", -2, 'TT #313' )
    .return()
.end

.sub sin_of_complex_numbers
    .complex_op_is("-2+0i", "-0.909297+0.000000i", 'sin' )
    .complex_op_is("-1+0i", "-0.841471+0.000000i", 'sin' )
    .complex_op_is("-0.5+0i", "-0.479426+0.000000i", 'sin' )
    .complex_op_is("0.5+0i", "0.479426+0.000000i", 'sin' )
    .complex_op_is("1+0i", "0.841471+0.000000i", 'sin' )
    .complex_op_is("2+0i", "0.909297+0.000000i", 'sin' )
    .complex_op_is("0-2i", "0.000000-3.626860i", 'sin' )
    .complex_op_is("0-1i", "0.000000-1.175201i", 'sin' )
    .complex_op_is("0-0.5i", "0.000000-0.521095i", 'sin' )
    .complex_op_is("0+0.5i", "0.000000+0.521095i", 'sin' )
    .complex_op_is("0+1i", "0.000000+1.175201i", 'sin' )
    .complex_op_is("0+2i", "0.000000+3.626860i", 'sin' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'sin' )
    .complex_op_is("2+3i", "9.154499-4.168907i", 'sin' )
    .complex_op_is("2-3i", "9.154499+4.168907i", 'sin' )
    .complex_op_is("-2+3i", "-9.154499-4.168907i", 'sin' )
    .complex_op_is("-2-3i", "-9.154499+4.168907i", 'sin' )
.end

.sub cos_of_complex_numbers
    .complex_op_is("-2+0i", "-0.416147+0.000000i", 'cos' )
    .complex_op_is("-1+0i", "0.540302+0.000000i", 'cos' )
    .complex_op_is("-0.5+0i", "0.877583+0.000000i", 'cos' )
    .complex_op_is("0.5+0i", "0.877583+0.000000i", 'cos' )
    .complex_op_is("1+0i", "0.540302+0.000000i", 'cos' )
    .complex_op_is("2+0i", "-0.416147+0.000000i", 'cos' )
    .complex_op_is("0-2i", "3.762196+0.000000i", 'cos' )
    .complex_op_is("0-1i", "1.543081+0.000000i", 'cos' )
    .complex_op_is("0-0.5i", "1.127626+0.000000i", 'cos' )
    .complex_op_is("0+0.5i", "1.127626+0.000000i", 'cos' )
    .complex_op_is("0+1i", "1.543081+0.000000i", 'cos' )
    .complex_op_is("0+2i", "3.762196+0.000000i", 'cos' )
    .complex_op_is("0+0i", "1.000000+0.000000i", 'cos' )
    .complex_op_is("2+3i", "-4.189626-9.109228i", 'cos' )
    .complex_op_is("2-3i", "-4.189626+9.109228i", 'cos' )
    .complex_op_is("-2+3i", "-4.189626+9.109228i", 'cos' )
    .complex_op_is("-2-3i", "-4.189626-9.109228i", 'cos' )
.end

.sub tan_of_complex_numbers
    .complex_op_is("-2+0i", "2.185040+0.000000i", 'tan' )
    .complex_op_is("-1+0i", "-1.557408+0.000000i", 'tan' )
    .complex_op_is("-0.5+0i", "-0.546302+0.000000i", 'tan' )
    .complex_op_is("0.5+0i", "0.546302+0.000000i", 'tan' )
    .complex_op_is("1+0i", "1.557408+0.000000i", 'tan' )
    .complex_op_is("2+0i", "-2.185040+0.000000i", 'tan' )
    .complex_op_is("0-2i", "0.000000-0.964028i", 'tan' )
    .complex_op_is("0-1i", "0.000000-0.761594i", 'tan' )
    .complex_op_is("0-0.5i", "0.000000-0.462117i", 'tan' )
    .complex_op_is("0+0.5i", "0.000000+0.462117i", 'tan' )
    .complex_op_is("0+1i", "0.000000+0.761594i", 'tan' )
    .complex_op_is("0+2i", "0.000000+0.964028i", 'tan' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'tan' )
    .complex_op_is("2+3i", "-0.003764+1.003239i", 'tan' )
    .complex_op_is("2-3i", "-0.003764-1.003239i", 'tan' )
    .complex_op_is("-2+3i", "0.003764+1.003239i", 'tan' )
    .complex_op_is("-2-3i", "0.003764-1.003239i", 'tan' )
.end

.sub cot_of_complex_numbers
    .complex_op_is("-2+0i", "0.457658+0.000000i", 'cot' )
    .complex_op_is("-1+0i", "-0.642093+0.000000i", 'cot' )
    .complex_op_is("-0.5+0i", "-1.830488+0.000000i", 'cot' )
    .complex_op_is("0.5+0i", "1.830488+0.000000i", 'cot' )
    .complex_op_is("1+0i", "0.642093+0.000000i", 'cot' )
    .complex_op_is("2+0i", "-0.457658+0.000000i", 'cot' )
    .complex_op_is("0-2i", "0.000000+1.037315i", 'cot' )
    .complex_op_is("0-1i", "0.000000+1.313035i", 'cot' )
    .complex_op_is("0-0.5i", "0.000000+2.163953i", 'cot' )
    .complex_op_is("0+0.5i", "0.000000-2.163953i", 'cot' )
    .complex_op_is("0+1i", "0.000000-1.313035i", 'cot' )
    .complex_op_is("0+2i", "0.000000-1.037315i", 'cot' )
    .complex_op_is("2+3i", "-0.003740-0.996758i", 'cot' )
    .complex_op_is("2-3i", "-0.003740+0.996758i", 'cot' )
    .complex_op_is("-2+3i", "0.003740-0.996758i", 'cot' )
    .complex_op_is("-2-3i", "0.003740+0.996758i", 'cot' )
.end

.sub sec_of_complex_numbers
    .complex_op_is("-2+0i", "-2.402998+0.000000i", 'sec' )
    .complex_op_is("-1+0i", "1.850816+0.000000i", 'sec' )
    .complex_op_is("-0.5+0i", "1.139494+0.000000i", 'sec' )
    .complex_op_is("0.5+0i", "1.139494+0.000000i", 'sec' )
    .complex_op_is("1+0i", "1.850816+0.000000i", 'sec' )
    .complex_op_is("2+0i", "-2.402998+0.000000i", 'sec' )
    .complex_op_is("0-2i", "0.265802+0.000000i", 'sec' )
    .complex_op_is("0-1i", "0.648054+0.000000i", 'sec' )
    .complex_op_is("0-0.5i", "0.886819+0.000000i", 'sec' )
    .complex_op_is("0+0.5i", "0.886819+0.000000i", 'sec' )
    .complex_op_is("0+1i", "0.648054+0.000000i", 'sec' )
    .complex_op_is("0+2i", "0.265802+0.000000i", 'sec' )
    .complex_op_is("0+0i", "1.000000+0.000000i", 'sec' )
    .complex_op_is("2+3i", "-0.041675+0.090611i", 'sec' )
    .complex_op_is("2-3i", "-0.041675-0.090611i", 'sec' )
    .complex_op_is("-2+3i", "-0.041675-0.090611i", 'sec' )
    .complex_op_is("-2-3i", "-0.041675+0.090611i", 'sec' )
.end

.sub csc_of_complex_numbers
    .complex_op_is("-2+0i", "-1.099750+0.000000i", 'csc' )
    .complex_op_is("-1+0i", "-1.188395+0.000000i", 'csc' )
    .complex_op_is("-0.5+0i", "-2.085830+0.000000i", 'csc' )
    .complex_op_is("0.5+0i", "2.085830+0.000000i", 'csc' )
    .complex_op_is("1+0i", "1.188395+0.000000i", 'csc' )
    .complex_op_is("2+0i", "1.099750+0.000000i", 'csc' )
    .complex_op_is("0-2i", "0.000000+0.275721i", 'csc' )
    .complex_op_is("0-1i", "0.000000+0.850918i", 'csc' )
    .complex_op_is("0-0.5i", "0.000000+1.919035i", 'csc' )
    .complex_op_is("0+0.5i", "0.000000-1.919035i", 'csc' )
    .complex_op_is("0+1i", "0.000000-0.850918i", 'csc' )
    .complex_op_is("0+2i", "0.000000-0.275721i", 'csc' )
    .complex_op_is("2+3i", "0.090473+0.041201i", 'csc' )
    .complex_op_is("2-3i", "0.090473-0.041201i", 'csc' )
    .complex_op_is("-2+3i", "-0.090473+0.041201i", 'csc' )
    .complex_op_is("-2-3i", "-0.090473-0.041201i", 'csc' )
.end

.sub asin_of_complex_numbers
    .complex_op_is("-2+0i", "-1.570796+1.316958i", 'asin' )
    .complex_op_is("-1+0i", "-1.570796+0.000000i", 'asin' )
    .complex_op_is("-0.5+0i", "-0.523599+0.000000i", 'asin' )
    .complex_op_is("0.5+0i", "0.523599+0.000000i", 'asin' )
    .complex_op_is("1+0i", "1.570796+0.000000i", 'asin' )
    .complex_op_is("2+0i", "1.570796-1.316958i", 'asin' )
    .complex_op_is("0-2i", "0.000000-1.443635i", 'asin' )
    .complex_op_is("0-1i", "0.000000-0.881374i", 'asin' )
    .complex_op_is("0-0.5i", "0.000000-0.481212i", 'asin' )
    .complex_op_is("0+0.5i", "0.000000+0.481212i", 'asin' )
    .complex_op_is("0+1i", "0.000000+0.881374i", 'asin' )
    .complex_op_is("0+2i", "0.000000+1.443635i", 'asin' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'asin' )
    .complex_op_is("2+3i", "0.570653+1.983387i", 'asin' )
    .complex_op_is("2-3i", "0.570653-1.983387i", 'asin' )
    .complex_op_is("-2+3i", "-0.570653+1.983387i", 'asin' )
    .complex_op_is("-2-3i", "-0.570653-1.983387i", 'asin' )
.end

.sub acos_of_complex_numbers
    .complex_op_is("-2+0i", "3.141593-1.316958i", 'acos' )
    .complex_op_is("-1+0i", "3.141593+0.000000i", 'acos' )
    .complex_op_is("-0.5+0i", "2.094395+0.000000i", 'acos' )
    .complex_op_is("0.5+0i", "1.047198+0.000000i", 'acos' )
    .complex_op_is("1+0i", "0.000000+0.000000i", 'acos' )
    .complex_op_is("2+0i", "0.000000+1.316958i", 'acos' )
    .complex_op_is("0-2i", "1.570796+1.443635i", 'acos' )
    .complex_op_is("0-1i", "1.570796+0.881374i", 'acos' )
    .complex_op_is("0-0.5i", "1.570796+0.481212i", 'acos' )
    .complex_op_is("0+0.5i", "1.570796-0.481212i", 'acos' )
    .complex_op_is("0+1i", "1.570796-0.881374i", 'acos' )
    .complex_op_is("0+2i", "1.570796-1.443635i", 'acos' )
    .complex_op_is("0+0i", "1.570796+0.000000i", 'acos' )
    .complex_op_is("2+3i", "1.000144-1.983387i", 'acos' )
    .complex_op_is("2-3i", "1.000144+1.983387i", 'acos' )
    .complex_op_is("-2+3i", "2.141449-1.983387i", 'acos' )
    .complex_op_is("-2-3i", "2.141449+1.983387i", 'acos' )
.end

.sub atan_of_complex_numbers
    .complex_op_is("-2+0i", "-1.107149+0.000000i", 'atan' )
    .complex_op_is("-1+0i", "-0.785398+0.000000i", 'atan' )
    .complex_op_is("-0.5+0i", "-0.463648+0.000000i", 'atan' )
    .complex_op_is("0.5+0i", "0.463648+0.000000i", 'atan' )
    .complex_op_is("1+0i", "0.785398+0.000000i", 'atan' )
    .complex_op_is("2+0i", "1.107149+0.000000i", 'atan' )
    .complex_op_is("0-2i", "-1.570796-0.549306i", 'atan' )
    .complex_op_is("0-0.5i", "0.000000-0.549306i", 'atan' )
    .complex_op_is("0+0.5i", "0.000000+0.549306i", 'atan' )
    .complex_op_is("0+2i", "-1.570796+0.549306i", 'atan' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'atan' )
    .complex_op_is("2+3i", "1.409921+0.229073i", 'atan' )
    .complex_op_is("2-3i", "1.409921-0.229073i", 'atan' )
    .complex_op_is("-2+3i", "-1.409921+0.229073i", 'atan' )
    .complex_op_is("-2-3i", "-1.409921-0.229073i", 'atan' )
.end

.sub acot_of_complex_numbers
    .complex_op_is("-2+0i", "-0.463648+0.000000i", 'acot' )
    .complex_op_is("-1+0i", "-0.785398+0.000000i", 'acot' )
    .complex_op_is("-0.5+0i", "-1.107149+0.000000i", 'acot' )
    .complex_op_is("0.5+0i", "1.107149+0.000000i", 'acot' )
    .complex_op_is("1+0i", "0.785398+0.000000i", 'acot' )
    .complex_op_is("2+0i", "0.463648+0.000000i", 'acot' )
    .complex_op_is("0-2i", "0.000000+0.549306i", 'acot' )
    .complex_op_is("0-0.5i", "-1.570796+0.549306i", 'acot' )
    .complex_op_is("0+0.5i", "-1.570796-0.549306i", 'acot' )
    .complex_op_is("0+2i", "0.000000-0.549306i", 'acot' )
    .complex_op_is("2+3i", "0.160875-0.229073i", 'acot' )
    .complex_op_is("2-3i", "0.160875+0.229073i", 'acot' )
    .complex_op_is("-2+3i", "-0.160875-0.229073i", 'acot' )
    .complex_op_is("-2-3i", "-0.160875+0.229073i", 'acot' )
.end

.sub asec_of_complex_numbers
    .complex_op_is("-2+0i", "2.094395+0.000000i", 'asec' )
    .complex_op_is("-1+0i", "3.141593+0.000000i", 'asec' )
    .complex_op_is("-0.5+0i", "3.141593-1.316958i", 'asec' )
    .complex_op_is("0.5+0i", "0.000000+1.316958i", 'asec' )
    .complex_op_is("1+0i", "0.000000+0.000000i", 'asec' )
    .complex_op_is("2+0i", "1.047198+0.000000i", 'asec' )
    .complex_op_is("0-2i", "1.570796-0.481212i", 'asec' )
    .complex_op_is("0-1i", "1.570796-0.881374i", 'asec' )
    .complex_op_is("0-0.5i", "1.570796-1.443635i", 'asec' )
    .complex_op_is("0+0.5i", "1.570796+1.443635i", 'asec' )
    .complex_op_is("0+1i", "1.570796+0.881374i", 'asec' )
    .complex_op_is("0+2i", "1.570796+0.481212i", 'asec' )
    .complex_op_is("2+3i", "1.420411+0.231335i", 'asec' )
    .complex_op_is("2-3i", "1.420411-0.231335i", 'asec' )
    .complex_op_is("-2+3i", "1.721182+0.231335i", 'asec' )
    .complex_op_is("-2-3i", "1.721182-0.231335i", 'asec' )
.end

.sub acsc_of_complex_numbers
    .complex_op_is("-2+0i", "-0.523599+0.000000i", 'acsc' )
    .complex_op_is("-1+0i", "-1.570796+0.000000i", 'acsc' )
    .complex_op_is("-0.5+0i", "-1.570796+1.316958i", 'acsc' )
    .complex_op_is("0.5+0i", "1.570796-1.316958i", 'acsc' )
    .complex_op_is("1+0i", "1.570796+0.000000i", 'acsc' )
    .complex_op_is("2+0i", "0.523599+0.000000i", 'acsc' )
    .complex_op_is("0-2i", "0.000000+0.481212i", 'acsc' )
    .complex_op_is("0-1i", "0.000000+0.881374i", 'acsc' )
    .complex_op_is("0-0.5i", "0.000000+1.443635i", 'acsc' )
    .complex_op_is("0+0.5i", "0.000000-1.443635i", 'acsc' )
    .complex_op_is("0+1i", "0.000000-0.881374i", 'acsc' )
    .complex_op_is("0+2i", "0.000000-0.481212i", 'acsc' )
    .complex_op_is("2+3i", "0.150386-0.231335i", 'acsc' )
    .complex_op_is("2-3i", "0.150386+0.231335i", 'acsc' )
    .complex_op_is("-2+3i", "-0.150386-0.231335i", 'acsc' )
    .complex_op_is("-2-3i", "-0.150386+0.231335i", 'acsc' )
.end

.sub sinh_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-2+0i", "-3.626860+0.000000i", 'sinh' )
    .complex_op_is("-1+0i", "-1.175201+0.000000i", 'sinh' )
    .complex_op_is("-0.5+0i", "-0.521095+0.000000i", 'sinh' )
    .complex_op_is("0.5+0i", "0.521095+0.000000i", 'sinh' )
    .complex_op_is("1+0i", "1.175201+0.000000i", 'sinh' )
    .complex_op_is("2+0i", "3.626860+0.000000i", 'sinh' )
    .complex_op_is("0-1i", "0.000000-0.841471i", 'sinh' )
    .complex_op_is("0-0.5i", "0.000000-0.479426i", 'sinh' )
    .complex_op_is("0+0.5i", "0.000000+0.479426i", 'sinh' )
    .complex_op_is("0+1i", "0.000000+0.841471i", 'sinh' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'sinh' )
    .complex_op_is("2+3i", "-3.590565+0.530921i", 'sinh' )
    .complex_op_is("2-3i", "-3.590565-0.530921i", 'sinh' )
    .complex_op_is("-2+3i", "3.590565+0.530921i", 'sinh' )
    .complex_op_is("-2-3i", "3.590565-0.530921i", 'sinh' )

    unless has_negative_zero goto todo
    .complex_op_is("0-2i", "-0.000000-0.909297i", 'sinh' )
    .complex_op_is("0+2i", "-0.000000+0.909297i", 'sinh' )
    .return()

todo:
    .complex_op_todo("0-2i", "-0.000000-0.909297i", 'sinh', 'TT #313' )
    .complex_op_todo("0+2i", "-0.000000+0.909297i", 'sinh', 'TT #313' )
    .return()
.end

.sub cosh_of_complex_numbers
    .complex_op_is("-2+0i", "3.762196+0.000000i", 'cosh' )
    .complex_op_is("-1+0i", "1.543081+0.000000i", 'cosh' )
    .complex_op_is("-0.5+0i", "1.127626+0.000000i", 'cosh' )
    .complex_op_is("0.5+0i", "1.127626+0.000000i", 'cosh' )
    .complex_op_is("1+0i", "1.543081+0.000000i", 'cosh' )
    .complex_op_is("2+0i", "3.762196+0.000000i", 'cosh' )
    .complex_op_is("0-2i", "-0.416147+0.000000i", 'cosh' )
    .complex_op_is("0-1i", "0.540302+0.000000i", 'cosh' )
    .complex_op_is("0-0.5i", "0.877583+0.000000i", 'cosh' )
    .complex_op_is("0+0.5i", "0.877583+0.000000i", 'cosh' )
    .complex_op_is("0+1i", "0.540302+0.000000i", 'cosh' )
    .complex_op_is("0+2i", "-0.416147+0.000000i", 'cosh' )
    .complex_op_is("0+0i", "1.000000+0.000000i", 'cosh' )
    .complex_op_is("2+3i", "-3.724546+0.511823i", 'cosh' )
    .complex_op_is("2-3i", "-3.724546-0.511823i", 'cosh' )
    .complex_op_is("-2+3i", "-3.724546-0.511823i", 'cosh' )
    .complex_op_is("-2-3i", "-3.724546+0.511823i", 'cosh' )
.end

.sub tanh_of_complex_numbers
    .complex_op_is("-2+0i", "-0.964028+0.000000i", 'tanh' )
    .complex_op_is("-1+0i", "-0.761594+0.000000i", 'tanh' )
    .complex_op_is("-0.5+0i", "-0.462117+0.000000i", 'tanh' )
    .complex_op_is("0.5+0i", "0.462117+0.000000i", 'tanh' )
    .complex_op_is("1+0i", "0.761594+0.000000i", 'tanh' )
    .complex_op_is("2+0i", "0.964028+0.000000i", 'tanh' )
    .complex_op_is("0-2i", "0.000000+2.185040i", 'tanh' )
    .complex_op_is("0-1i", "0.000000-1.557408i", 'tanh' )
    .complex_op_is("0-0.5i", "0.000000-0.546302i", 'tanh' )
    .complex_op_is("0+0.5i", "0.000000+0.546302i", 'tanh' )
    .complex_op_is("0+1i", "0.000000+1.557408i", 'tanh' )
    .complex_op_is("0+2i", "0.000000-2.185040i", 'tanh' )
    .complex_op_is("0+0i", "0.000000+0.000000i", 'tanh' )
    .complex_op_is("2+3i", "0.965386-0.009884i", 'tanh' )
    .complex_op_is("2-3i", "0.965386+0.009884i", 'tanh' )
    .complex_op_is("-2+3i", "-0.965386-0.009884i", 'tanh' )
    .complex_op_is("-2-3i", "-0.965386+0.009884i", 'tanh' )
.end

.sub coth_of_complex_numbers
    .complex_op_is("-2+0i", "-1.037315+0.000000i", 'coth' )
    .complex_op_is("-1+0i", "-1.313035+0.000000i", 'coth' )
    .complex_op_is("-0.5+0i", "-2.163953+0.000000i", 'coth' )
    .complex_op_is("0.5+0i", "2.163953+0.000000i", 'coth' )
    .complex_op_is("1+0i", "1.313035+0.000000i", 'coth' )
    .complex_op_is("2+0i", "1.037315+0.000000i", 'coth' )
    .complex_op_is("0-2i", "0.000000-0.457658i", 'coth' )
    .complex_op_is("0-1i", "0.000000+0.642093i", 'coth' )
    .complex_op_is("0-0.5i", "0.000000+1.830488i", 'coth' )
    .complex_op_is("0+0.5i", "0.000000-1.830488i", 'coth' )
    .complex_op_is("0+1i", "0.000000-0.642093i", 'coth' )
    .complex_op_is("0+2i", "0.000000+0.457658i", 'coth' )
    .complex_op_is("2+3i", "1.035747+0.010605i", 'coth' )
    .complex_op_is("2-3i", "1.035747-0.010605i", 'coth' )
    .complex_op_is("-2+3i", "-1.035747+0.010605i", 'coth' )
    .complex_op_is("-2-3i", "-1.035747-0.010605i", 'coth' )
.end

.sub sech_of_complex_numbers
    .complex_op_is("-2+0i", "0.265802+0.000000i", 'sech' )
    .complex_op_is("-1+0i", "0.648054+0.000000i", 'sech' )
    .complex_op_is("-0.5+0i", "0.886819+0.000000i", 'sech' )
    .complex_op_is("0.5+0i", "0.886819+0.000000i", 'sech' )
    .complex_op_is("1+0i", "0.648054+0.000000i", 'sech' )
    .complex_op_is("2+0i", "0.265802+0.000000i", 'sech' )
    .complex_op_is("0-2i", "-2.402998+0.000000i", 'sech' )
    .complex_op_is("0-1i", "1.850816+0.000000i", 'sech' )
    .complex_op_is("0-0.5i", "1.139494+0.000000i", 'sech' )
    .complex_op_is("0+0.5i", "1.139494+0.000000i", 'sech' )
    .complex_op_is("0+1i", "1.850816+0.000000i", 'sech' )
    .complex_op_is("0+2i", "-2.402998+0.000000i", 'sech' )
    .complex_op_is("0+0i", "1.000000+0.000000i", 'sech' )
    .complex_op_is("2+3i", "-0.263513-0.036212i", 'sech' )
    .complex_op_is("2-3i", "-0.263513+0.036212i", 'sech' )
    .complex_op_is("-2+3i", "-0.263513+0.036212i", 'sech' )
    .complex_op_is("-2-3i", "-0.263513-0.036212i", 'sech' )
.end

.sub csch_of_complex_numbers
    .complex_op_is("-2+0i", "-0.275721+0.000000i", 'csch' )
    .complex_op_is("-1+0i", "-0.850918+0.000000i", 'csch' )
    .complex_op_is("-0.5+0i", "-1.919035+0.000000i", 'csch' )
    .complex_op_is("0.5+0i", "1.919035+0.000000i", 'csch' )
    .complex_op_is("1+0i", "0.850918+0.000000i", 'csch' )
    .complex_op_is("2+0i", "0.275721+0.000000i", 'csch' )
    .complex_op_is("0-2i", "0.000000+1.099750i", 'csch' )
    .complex_op_is("0-1i", "0.000000+1.188395i", 'csch' )
    .complex_op_is("0-0.5i", "0.000000+2.085830i", 'csch' )
    .complex_op_is("0+0.5i", "0.000000-2.085830i", 'csch' )
    .complex_op_is("0+1i", "0.000000-1.188395i", 'csch' )
    .complex_op_is("0+2i", "0.000000-1.099750i", 'csch' )
    .complex_op_is("2+3i", "-0.272549-0.040301i", 'csch' )
    .complex_op_is("2-3i", "-0.272549+0.040301i", 'csch' )
    .complex_op_is("-2+3i", "0.272549-0.040301i", 'csch' )
    .complex_op_is("-2-3i", "0.272549+0.040301i", 'csch' )
.end

.sub asinh_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-2+0i", "-1.443635+0.000000i", 'asinh' )
    .complex_op_is("-1+0i", "-0.881374+0.000000i", 'asinh' )
    .complex_op_is("-0.5+0i", "-0.481212+0.000000i", 'asinh' )
    .complex_op_is("0.5+0i", "0.481212+0.000000i", 'asinh' )
    .complex_op_is("1+0i", "0.881374+0.000000i", 'asinh' )
    .complex_op_is("2+0i", "1.443635+0.000000i", 'asinh' )
    .complex_op_is("0-2i", "-1.316958-1.570796i", 'asinh' )
    .complex_op_is("0+2i", "1.316958+1.570796i", 'asinh' )
    .complex_op_is("2+3i", "1.968638+0.964659i", 'asinh' )
    .complex_op_is("2-3i", "1.968638-0.964659i", 'asinh' )
    .complex_op_is("-2+3i", "-1.968638+0.964659i", 'asinh' )
    .complex_op_is("-2-3i", "-1.968638-0.964659i", 'asinh' )
    .complex_op_is("0-1i", "0.000000-1.570796i", 'asinh' )
    .complex_op_is("0+1i", "0.000000+1.570796i", 'asinh' )

    unless has_negative_zero goto todo
    .complex_op_is("0-0.5i", "-0.000000-0.523599i", 'asinh' )
    .complex_op_is("0+0.5i", "-0.000000+0.523599i", 'asinh' )
    .return()

todo:
    .complex_op_todo("0-0.5i", "-0.000000-0.523599i", 'asinh', 'TT #313' )
    .complex_op_todo("0+0.5i", "-0.000000+0.523599i", 'asinh', 'TT #313' )
    .return()
.end

.sub acosh_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-2+0i", "1.316958+3.141593i", 'acosh' )
    .complex_op_is("2+0i", "1.316958+0.000000i", 'acosh' )
    .complex_op_is("0-2i", "1.443635-1.570796i", 'acosh')
    .complex_op_is("0-1i", "0.881374-1.570796i", 'acosh')
    .complex_op_is("0-0.5i", "0.481212-1.570796i", 'acosh')
    .complex_op_is("0+0.5i", "0.481212+1.570796i", 'acosh' )
    .complex_op_is("0+1i", "0.881374+1.570796i", 'acosh' )
    .complex_op_is("0+2i", "1.443635+1.570796i", 'acosh' )
    .complex_op_is("2+3i", "1.983387+1.000144i", 'acosh' )
    .complex_op_is("2-3i", "1.983387-1.000144i", 'acosh')
    .complex_op_is("-2+3i", "1.983387+2.141449i", 'acosh' )
    .complex_op_is("-2-3i", "1.983387-2.141449i", 'acosh')
    .complex_op_is("-1+0i", "0.000000+3.141593i", 'acosh' )
    .complex_op_is("1+0i", "0.000000+0.000000i", 'acosh' )

    unless has_negative_zero goto todo
    .complex_op_is("-0.5+0i", "-0.000000+2.094395i", 'acosh' )
    .complex_op_is("0.5+0i", "-0.000000+1.047198i", 'acosh' )
    .return()

todo:
    .complex_op_todo("-0.5+0i", "-0.000000+2.094395i", 'acosh', 'TT #313' )
    .complex_op_todo("0.5+0i", "-0.000000+1.047198i", 'acosh', 'TT #313' )
    .return()
.end

.sub atanh_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_todo("-2+0i", "-0.549306+1.570796i", 'atanh', "TT #1891" )
    .complex_op_is("-0.5+0i", "-0.549306+0.000000i", 'atanh' )
    .complex_op_is("0.5+0i", "0.549306+0.000000i", 'atanh' )
    .complex_op_is("1+0i", "Inf+0.000000i", 'atanh' )
    .complex_op_is("2+0i", "0.549306-1.570796i", 'atanh' )
    .complex_op_is("2+3i", "0.146947+1.338973i", 'atanh' )
    .complex_op_is("2-3i", "0.146947-1.338973i", 'atanh' )
    .complex_op_is("-2+3i", "-0.146947+1.338973i", 'atanh' )
    .complex_op_is("-2-3i", "-0.146947-1.338973i", 'atanh' )

    .complex_op_is("0-2i", "0.000000-1.107149i", 'atanh' )
    .complex_op_is("0-1i", "0.000000-0.785398i", 'atanh' )
    .complex_op_is("0-0.5i", "0.000000-0.463648i", 'atanh' )
    .complex_op_is("0+0.5i", "0.000000+0.463648i", 'atanh' )
    .complex_op_is("0+1i", "0.000000+0.785398i", 'atanh' )
    .complex_op_is("0+2i", "0.000000+1.107149i", 'atanh' )
    .return()
.end

.sub acoth_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-2+0i", "-0.549306+0.000000i", 'acoth' )
    .complex_op_todo("-0.5+0i", "-0.549306+1.570796i", 'acoth', "TT #1891" )
    .complex_op_is("0.5+0i", "0.549306-1.570796i", 'acoth' )
    .complex_op_is("1+0i", "Inf+0.000000i", 'acoth' )
    .complex_op_is("2+0i", "0.549306+0.000000i", 'acoth' )
    .complex_op_is("2+3i", "0.146947-0.231824i", 'acoth' )
    .complex_op_is("2-3i", "0.146947+0.231824i", 'acoth' )
    .complex_op_is("-2+3i", "-0.146947-0.231824i", 'acoth' )
    .complex_op_is("-2-3i", "-0.146947+0.231824i", 'acoth' )

    .complex_op_is("0-2i", "0.000000+0.463648i", 'acoth' )
    .complex_op_is("0-1i", "0.000000+0.785398i", 'acoth' )
    .complex_op_is("0-0.5i", "0.000000+1.107149i", 'acoth' )
    .complex_op_is("0+0.5i", "0.000000-1.107149i", 'acoth' )
    .complex_op_is("0+1i", "0.000000-0.785398i", 'acoth' )
    .complex_op_is("0+2i", "0.000000-0.463648i", 'acoth' )
    .return()
.end

.sub acsch_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-2+0i", "-0.481212+0.000000i", 'acsch' )
    .complex_op_is("-1+0i", "-0.881374+0.000000i", 'acsch' )
    .complex_op_is("-0.5+0i", "-1.443635+0.000000i", 'acsch' )
    .complex_op_is("0.5+0i", "1.443635+0.000000i", 'acsch' )
    .complex_op_is("1+0i", "0.881374+0.000000i", 'acsch' )
    .complex_op_is("2+0i", "0.481212+0.000000i", 'acsch' )
    .complex_op_is("0-0.5i", "1.316958+1.570796i", 'acsch' )
    .complex_op_is("0+0.5i", "-1.316958-1.570796i", 'acsch' )
    .complex_op_is("2+3i", "0.157355-0.229963i", 'acsch' )
    .complex_op_is("2-3i", "0.157355+0.229963i", 'acsch' )
    .complex_op_is("-2+3i", "-0.157355-0.229963i", 'acsch' )
    .complex_op_is("-2-3i", "-0.157355+0.229963i", 'acsch' )
    .complex_op_is("0+1i", "0.000000-1.570796i", 'acsch' )
    .complex_op_is("0-1i", "0.000000+1.570796i", 'acsch' )

    unless has_negative_zero goto todo
    .complex_op_is("0+2i", "-0.000000-0.523599i", 'acsch' )
    .complex_op_is("0-2i", "-0.000000+0.523599i", 'acsch' )
    .return()

todo:
    .complex_op_todo("0+2i", "-0.000000-0.523599i", 'acsch', 'TT #313' )
    .complex_op_todo("0-2i", "-0.000000+0.523599i", 'acsch', 'TT #313' )
    .return()
.end

.sub asech_of_complex_numbers
    .local pmc config_hash, interp
    .local string has_negative_zero
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    has_negative_zero = config_hash["has_negative_zero"]

    .complex_op_is("-0.5+0i", "1.316958+3.141593i", 'asech' )
    .complex_op_is("0.5+0i", "1.316958+0.000000i", 'asech')
    .complex_op_is("0-2i", "0.481212+1.570796i", 'asech' )
    .complex_op_is("0-1i", "0.881374+1.570796i", 'asech' )
    .complex_op_is("0-0.5i", "1.443635+1.570796i", 'asech' )
    .complex_op_is("0+0.5i", "1.443635-1.570796i", 'asech')
    .complex_op_is("0+1i", "0.881374-1.570796i", 'asech')
    .complex_op_is("0+2i", "0.481212-1.570796i", 'asech')
    .complex_op_is("2+3i", "0.231335-1.420411i", 'asech')
    .complex_op_is("2-3i", "0.231335+1.420411i", 'asech' )
    .complex_op_is("-2+3i", "0.231335-1.721182i", 'asech')
    .complex_op_is("-2-3i", "0.231335+1.721182i", 'asech' )
    .complex_op_is("-1+0i", "0.000000+3.141593i", 'asech' )
    .complex_op_is("1+0i", "0.000000+0.000000i", 'asech' )

    unless has_negative_zero goto todo
    .complex_op_is("-2+0i", "-0.000000+2.094395i", 'asech' )
    .complex_op_is("2+0i", "-0.000000+1.047198i", 'asech' )
    .return()

todo:
    .complex_op_todo("-2+0i", "-0.000000+2.094395i", 'asech', 'TT #313' )
    .complex_op_todo("2+0i", "-0.000000+1.047198i", 'asech', 'TT #313' )
    .return()
.end

.sub add_using_subclass_of_complex_bug_59630
    $P0 = subclass 'Complex', 'MyComplex'
    addattribute $P0, "re"
    addattribute $P0, "im"

    .local pmc a, b, c, expected
    ##   a = 1 + 2i
    a = new ['MyComplex']
    a['real'] = 1
    a['imag'] = 2
    is( a, "1+2i", 'a created' )

    ##   b = 3 + 4i
    b = new ['MyComplex']
    b['real'] = 3
    b['imag'] = 4
    is( b, "3+4i" , 'b created' )

    ##   c = a + b
    c = add a, b
    expected = new ['MyComplex']
    expected['real'] = 4
    expected['imag'] = 6
    $I0 = c == expected
    $S1 = c
    $S0 = concat $S1, ' != '
    $S1 = expected
    $S0 = concat $S0, $S1
    $S0 = concat $S0, ' - subclassing Complex add returns 0+0i - TT #562'
    $I0 = not $I0    # invert $I0 so todo does not pass
    todo( $I0, $S0 )
.end

.sub provides_complex
    $P0 = new 'Complex'
    $I0 = does $P0, 'complex'
    ok($I0)

    # ...And test a subclass, for good measure
    $P0 = new 'MyComplex'
    $I0 = does $P0, 'complex'
    ok($I0)
.end

.namespace ['MyComplex']

.sub 'init' :vtable
    $P1 = new ['Float']
    setattribute self, "re", $P1
    $P2 = new ['Float']
    setattribute self, "im", $P2
.end

.namespace []   # revert to root for next test


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
