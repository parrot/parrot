#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/inf_nan.t - Test math properties of Inf and NaN

=head1 SYNOPSIS

    % prove t/op/inf_nan.t

=head1 DESCRIPTION

Tests for mathematical operations with Inf and Nan.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(37)

    test_basic_arith()
    test_sqrt()
    test_neg()
    test_mix_nan_inf()
    test_rounding_n()
    test_rounding_i()
    test_nan_complex()
    test_fdiv_integer_pmc_nan()
    test_fdiv_float_pmc_nan()
    test_fdiv_float_integer_pmc_nan()
    test_mod_float_integer_pmc_nan()

.end

.sub test_basic_arith
    $N0 = 'Inf'
    is($N0, 'Inf', 'basic arithmetic: =')
    $N0 -= $N0
    is($N0, 'NaN', '... -=')
    $N0 *= -1
    is($N0, 'NaN', '... *= -1')
    $N0 *= 0
    is($N0, 'NaN', '... *= 0')
    $N0 += 5
    is($N0, 'NaN', '... += 5')
    $N0 -= 42
    is($N0, 'NaN', '... -= 42')
    inc $N0
    is($N0, 'NaN', '... inc')
    dec $N0
    is($N0, 'NaN', '... dec')
    $N2 = abs $N0
    is($N2, 'NaN', '... abs NaN')
    $N1 = 'Inf'
    $N3 = abs $N1
    is($N3, 'Inf', '... abs Inf')
    $N1 = '-Inf'
    $N3 = abs $N1
    is($N3, 'Inf', '... abs -Inf')
.end

.sub test_sqrt
    $N0 = 'Inf'
    $N1 =  $N0
    is($N1, 'Inf', 'sqrt: assignment')
    $N0 = '-Inf'
    $N1 = sqrt $N0
    is($N1, 'NaN', '... sqrt -Inf')
    $N0 = 'NaN'
    $N1 = sqrt $N0
    is($N1, 'NaN', '... sqrt NaN')
    $N0 = -1
    $N1 = sqrt $N0
    is($N1, 'NaN', '... sqrt -1')
.end

.sub test_neg
    $N0 = 'Inf'
    $N1 = neg $N0
    is($N1, '-Inf', 'negative: neg Inf')
    $N0 = '-Inf'
    $N1 = neg $N0
    is($N1, 'Inf', '... neg -Inf')
    $N0 = 'NaN'
    $N1 = neg $N0
    is($N1, 'NaN', '... neg NaN')
.end

.sub test_mix_nan_inf
    $N0 = 'NaN'
    $N1 = 'Inf'
    $N0 *= $N1
    is($N0, 'NaN', 'mixing NaN and Inf: NaN * Inf')
    $N0 /= $N1
    is($N0, 'NaN', '... NaN / Inf')
    $N0 -= $N1
    is($N0, 'NaN', '... NaN - Inf')
    $N0 += $N1
    is($N0, 'NaN', '... NaN + Inf')
.end

.sub test_rounding_n
    $N0 = 'NaN'
    $N1 = floor $N0
    is($N1, 'NaN', 'rounding n: floor NaN')
    $N2 = ceil $N0
    is($N2, 'NaN', '... ceil NaN')
    $N0 = 'Inf'
    $N1 = floor $N0
    is($N1, 'Inf', '... floor Inf')
    $N2 = ceil $N0
    is($N2, 'Inf', '... ceil Inf')
    $N0 = '-Inf'
    $N1 = floor $N0
    is($N1, '-Inf', '... floor -Inf')
    $N2 = ceil $N0
    is($N2, '-Inf', '... ceil -Inf')
.end

#pir_output_is(<<'CODE',<<OUTPUT, "TT #370 Rounding inf/nan");
.sub test_rounding_i
    $N0 = 'Inf'
    $I0 = floor $N0
    #is($I0, 'Inf', 'floor Inf')
    skip(1, 'rounding nan/inf gives something like -2147483648')
    $N0 = 'NaN'
    $I0 = floor $N0
    #is($I0, 'NaN', 'floor Inf')
    skip(1, 'rounding nan/inf gives something like -2147483648')
    $N0 = 'Inf'
    $I0 = ceil $N0
    #is($I0, 'Inf', 'floor Inf')
    skip(1, 'rounding nan/inf gives something like -2147483648')
    $N0 = 'NaN'
    $I0 = ceil $N0
    #is($I0, 'NaN', 'floor Inf')
    skip(1, 'rounding nan/inf gives something like -2147483648')
.end

.sub test_nan_complex
    $P1 = new ["Complex"]
    $N0 = 'NaN'
    set $P1, "1 + i"
    $P1 += $N0
    #is($P1, 'NaN', '1+i + NaN')
    skip(1, '1+i + NaN should be NaN')
.end

.sub test_fdiv_integer_pmc_nan
    $P1 = new "Integer"
    $P2 = new "Integer"
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN', 'fdiv with Integer PMCs and NaN')
    skip(1, 'fdiv/mod do not play nicely with PMCs and NaN')
.end

.sub test_fdiv_float_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Float'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN','fdiv with Float PMCs and NaN')
    skip(1, 'fdiv/mod do not play nicely with PMCs and NaN')
.end

.sub test_fdiv_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN', 'fdiv with Float and Integer PMCs and NaN')
    skip(1, 'fdiv/mod do not play nicely with PMCs and NaN')
.end

.sub test_mod_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    mod $P1, $P2, $N0
    #is($P1, 'NaN', 'mod with Float and Integer PMCs and NaN')
    skip(1, 'fdiv/mod do not play nicely with PMCs and NaN')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
