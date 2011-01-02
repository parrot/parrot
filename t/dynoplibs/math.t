#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/dynoplibs/math.t - Tests for mathematical ops

=head1 SYNOPSIS

        % prove t/dynoblibs/math.t

=head1 DESCRIPTION

Tests math.ops

=cut

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.loadlib 'math_ops'

.sub main :main
    .include 'test_more.pir'
    .include 'fp_equality.pasm'
    plan(66)
    ok(1, "load math_ops")
    rand $I0
    test_2_arg_int()
    test_3_arg_int()
    test_1_arg_num()
    test_2_arg_num()
    test_3_arg_num()
    test_srand()
    test_rand_i_i_i()
    test_rand_i_ic_i()
    test_rand_i_i_ic()
    test_rand_n_n_n()
    test_rand_n_nc_n()
    test_rand_n_n_nc()
    test_rand_n_n()
    test_rand_i_i()
    test_local_nums()
    test_local_nums_2_arg()
    test_local_ints()
    test_exception_cmod_n_n_n_by_zero()
    test_exception_cmod_n_nc_n_by_zero()
    test_exception_cmod_n_n_nc_by_zero()
    test_cmod()
    test_cmod_num()
    test_cmod_p_p_i()
    test_cmod_p_p_p()
    test_cmod_i_i_i_by_zero()
    test_cmod_i_ic_i_by_zero()
    test_cmod_i_i_ic_by_zero()
    test_cmod_i_ic_ic_by_zero()
    test_cmod_float_integer_pmc_nan()
.end

.sub test_2_arg_int
    rand $I0, 5
    lt $I0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $I0, 5, fail2
    ok(1, 'rand returns a number less than or equal to 5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 5')
finish:
.end

.sub test_3_arg_int
    rand $I0, 50, 75
    lt $I0, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt $I0, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_1_arg_num
    rand $N0
    lt $N0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $N0, 1, fail2
    ok(1, 'rand returns a number less than or equal to 1')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 1')
finish:
.end

.sub test_2_arg_num
    rand $N0, 5
    lt $N0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $N0, 5, fail2
    ok(1, 'rand returns a number less than or equal to 5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 5')
finish:
.end

.sub test_3_arg_num
    rand $N0, 50, 75
    lt $N0, 25, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt $N0, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_srand
    srand 42
    ok(1, 'call srand with int')
    srand 42.0
    ok(1, 'call srand with num')

    $I0 = 42
    srand $I0
    ok(1, 'call srand with int')

    $N0 = 42.0
    srand $N0
    ok(1, 'call srand with num')

    rand $N0
    srand 5
    rand $N2
    srand 42.0
    rand $N1
    .fp_eq_ok($N0, $N1, 'having the same seed generates the same numbers')
.end

.sub test_rand_i_i_i
    $I0 = 60
    $I1 = 100
    $I2 = rand $I0, $I1

    lt $I2, 60, fail1
    ok(1, 'rand returns a number greater than or equal to 60')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 60')
upper:
    gt $I2, 100, fail2
    ok(1, 'rand returns a number less than or equal to 100')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 100')
finish:
.end

.sub test_rand_i_ic_i
    $I0 = 60
    $I1 = rand 30, $I0

    lt $I1, 25, fail1
    ok(1, 'rand returns a number greater than or equal to 30')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 30')
upper:
    gt $I1, 50, fail2
    ok(1, 'rand returns a number less than or equal to 60')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 60')
finish:
.end

.sub test_rand_i_i_ic
    $I0 = 25
    $I1 = rand $I0, 50

    lt $I1, 25, fail1
    ok(1, 'rand returns a number greater than or equal to 25')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 25')
upper:
    gt $I1, 50, fail2
    ok(1, 'rand returns a number less than or equal to 50')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 50')
finish:
.end

.sub test_rand_n_n_n
    $N0 = 42.5
    $N1 = 90.5
    $N2 = rand $N0, $N1

    lt $N2, 42.5, fail1
    ok(1, 'rand returns a number greater than or equal to 42.5')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 42.5')
upper:
    gt $N2, 90.5, fail2
    ok(1, 'rand returns a number less than or equal to 90.5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 90.5')
finish:
.end

.sub test_rand_n_nc_n
    $N0 = 44.5
    $N1 = rand 22.25, $N0

    lt $N1, 22.25, fail1
    ok(1, 'rand returns a number greater than or equal to 22.25')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 22.25')
upper:
    gt $N1, 44.5, fail2
    ok(1, 'rand returns a number less than or equal to 44.5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 44.5')
finish:
.end

.sub test_rand_n_n_nc
    $N0 = 15.5
    $N1 = rand $N0, 35.75

    lt $N1, 15.15, fail1
    ok(1, 'rand returns a number greater than or equal to 25')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 25')
upper:
    gt $N1, 35.75, fail2
    ok(1, 'rand returns a number less than or equal to 35.75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 35.75')
finish:
.end

.sub test_rand_n_n
    $N1 = 12.5
    rand $N0, $N1

    lt $N0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $N0, 12.5, fail2
    ok(1, 'rand returns a number less than or equal to 12.5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 12.5')
finish:
.end

.sub test_rand_i_i
    $I1 = 14
    rand $I0, $I1

    lt $I0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $I0, 14, fail2
    ok(1, 'rand returns a number less than or equal to 14')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 14')
finish:
.end

.sub test_local_nums_2_arg
    .local num foo, bar
    foo = rand 50.0, 75.0
    lt foo, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt foo, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_local_nums
    .local num foo, bar
    foo = rand
    lt foo, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt foo, 1, fail2
    ok(1, 'rand returns a number less than or equal to 1')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 1')
finish:
.end

.sub test_local_ints
    .local int foo, bar
    foo = rand 50, 75
    lt foo, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt foo, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_exception_cmod_n_n_n_by_zero
    push_eh handler
    set $N0, 0
    set $N1, 10
    cmod $N2, $N1, $N0
  handler:
    .exception_is( 'Divide by zero' )
.end

.sub test_exception_cmod_n_nc_n_by_zero
    push_eh handler
    set $N0, 0
    cmod $N2, 10, $N0
  handler:
    .exception_is( 'Divide by zero' )
.end

.sub test_exception_cmod_n_n_nc_by_zero
    push_eh handler
    set $N1, 10
    cmod $N2, $N1, 0
  handler:
    .exception_is( 'Divide by zero' )
.end

.sub 'test_cmod'
    $I0 = 5
    $I1 = 3
    $I2 = cmod $I0, $I1
    is($I2, 2, 'cmod_i_i_i')
    is($I0, 5, 'cmod_i_i_i - dividend unchanged')
    is($I1, 3, 'cmod_i_i_i - divisor unchanged')

    $I0 = 12

    $I1 = cmod $I0, 10
    is($I1, 2, 'cmod_i_i_ic')

    $I1 = cmod 14, $I0
    is($I1, 2, 'cmod_i_ic_i')

    $I1 = cmod 13, 11
    is($I1, 2, 'cmod_i_ic_ic')
.end

.sub test_cmod_num
    set     $N0, 5.000
    set     $N1, 3.000
    cmod    $N2, $N0, $N1
    is( $N2, "2", 'cmod_n' )

    $N2 = cmod 7.0, 4.0
    is( $N2, "3", 'cmod_n_nc_nc' )

    $N3 = 4.0
    $N2 = cmod 7.0, $N3
    is( $N2, 3, 'cmod_n_nc_n')

    $N4 = 7.0
    $N2 = cmod $N4, 4.0
    is( $N2, 3, 'cmod_n_n_nc' )

throws_substring(<<"CODE", "Divide by zero", "cmod_n_nc_nc by zero")
    .sub main
        $N2 = cmod 7.0, 0.0
    .end
CODE

    $P0 = new ['Integer']
    $P0 = 7
    $P1 = new ['Integer']
    $P1 = cmod $P0, 4.0
    is($P1, 3, "cmod_p_p_nc")

throws_substring(<<"CODE", "Divide by zero", "cmod_p_p_nc by zero")
    .sub main
	$P2 = cmod $P0, 0.0
    .end
CODE

throws_substring(<<"CODE", "Divide by zero", "cmod_p_p_n by zero")
    .sub main
        $N0 = 0.0
	$P2 = cmod $P0, $N0
    .end
CODE

.end

.sub test_cmod_p_p_i
    $P0 = new ['Integer']
    $P0 = 7
    $P1 = new ['Integer']
    $P1 = cmod $P0, 4
    is($P1, 3, "cmod_p_p_ic")

    $I0 = 4
    $P1 = cmod $P0, $I0
    is($P1, 3, "cmod_p_p_i")

    throws_substring(<<"CODE", "Divide by zero", "cmod_p_p_ic by zero")
    .sub main
        $P1 = cmod $P0, 0
    .end
CODE

    throws_substring(<<"CODE", "Divide by zero", "cmod_p_p_i by zero")
    .sub main
        $I0 = 0
        $P1 = cmod $P0, $I0
    .end
CODE
.end

.sub test_cmod_p_p_p
    $P0 = new ['Integer']
    $P0 = 7

    $P1 = new ['Integer']
    $P1 = 4

    $P2 = new ['Integer']
    $P2 = cmod $P0, $P1

    is($P2, 3, "cmod_p_p_p")

    throws_substring(<<"CODE", "Divide by zero", "cmod_p_p_p by zero")
    .sub main
        $P0 = new ['Integer']
        $P0 = 7

        $P1 = new ['Integer']
        $P1 = 0

        $P2 = new ['Integer']
        $P2 = cmod $P0, $P1
    .end
CODE
.end

.sub 'test_cmod_i_i_i_by_zero'
    $I0 = 0
    $I1 = 10
    push_eh test_cmod_i_i_i_by_zero_catch
    $I2 = cmod $I1, $I0
    pop_eh
    $I3 = 0
    goto test_cmod_i_i_i_by_zero_end

  test_cmod_i_i_i_by_zero_catch:
    $I3 = 1

  test_cmod_i_i_i_by_zero_end:
    ok($I3, 'cmod_i_i_i by zero')
.end

.sub 'test_cmod_i_ic_i_by_zero'
    $I0 = 0
    push_eh test_cmod_i_ic_i_by_zero_catch
    $I2 = cmod 10, $I0
    pop_eh
    $I3 = 0
    goto test_cmod_i_ic_i_by_zero_end

  test_cmod_i_ic_i_by_zero_catch:
    $I3 = 1

  test_cmod_i_ic_i_by_zero_end:
    ok($I3, 'cmod_i_ic_i by zero')
.end

.sub 'test_cmod_i_i_ic_by_zero'
    $I1 = 10
    push_eh test_cmod_i_i_ic_by_zero_catch
    $I2 = cmod $I1, 0
    pop_eh
    $I3 = 0
    goto test_cmod_i_i_ic_by_zero_end

  test_cmod_i_i_ic_by_zero_catch:
    $I3 = 1

  test_cmod_i_i_ic_by_zero_end:
    ok($I3, 'cmod_i_i_ic by zero')
.end

.sub 'test_cmod_i_ic_ic_by_zero'
    push_eh eh
    $I2 = cmod 1, 0
    pop_eh
    $I3 = 0
    goto finally

  eh:
    $I3 = 1

  finally:
    pop_eh
    ok($I3, 'cmod_i_ic_ic by zero')
.end

.sub test_cmod_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    cmod $P1, $P2, $N0
    #is($P1, 'NaN', 'cmod with Float and Integer PMCs and NaN')
    todo(0, 'cmod with Float and Integer PMCs and NaN', 'cmod does not play nicely with PMCs and NaN')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
