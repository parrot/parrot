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
    plan(105)

    test_basic_arith()
    test_exp()
    test_sqrt()
    test_sin()
    test_sinh()
    test_asin()
    test_cos()
    test_cosh()
    test_acos()
    test_tan()
    test_tanh()
    test_atan()
    test_cot()
    test_coth()
    test_acot()
    test_sec()
    test_sech()
    test_asec()
    test_ln()
    test_log10()
    test_log2()
    test_neg()
    test_pow()
    test_mix_nan_inf()
    test_rounding_n()
    test_rounding_i()
    test_nan_complex()
    test_fdiv_integer_pmc_nan()
    test_fdiv_float_pmc_nan()
    test_fdiv_float_integer_pmc_nan()
    test_cmod_float_integer_pmc_nan()
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


.sub test_exp
    $N0 = 'Inf'
    $N1 = exp $N0
    is($N1, 'Inf', 'exp: exp Inf')
    $N0 = '-Inf'
    $N1 = exp $N0
    is($N1, 0, '... exp -Inf')
    $N0 = 'NaN'
    $N1 = exp $N0
    is($N1, 'NaN', '... exp NaN')
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

.sub test_sin
    $N0 = 'Inf'
    $N1 = sin $N0
    is($N1, 'NaN', 'sin: sin Inf')
    $N0 = '-Inf'
    $N1 = sin $N0
    is($N1, 'NaN', '... sin -Inf')
    $N0 = 'NaN'
    $N1 = sin $N0
    is($N1, 'NaN', '... sin NaN')
.end

.sub test_sinh
    $N0 = 'Inf'
    $N1 = sinh $N0
    is($N1, 'Inf', 'sinh: sinh Inf')
    $N0 = '-Inf'
    $N1 = sinh $N0
    is($N1, '-Inf', '... sinh -Inf')
    $N0 = 'NaN'
    $N1 = sinh $N0
    is($N1, 'NaN', '... sinh NaN')
.end

.sub test_asin
    $N0 = 'Inf'
    $N1 = asin $N0
    is($N1, 'NaN', 'asin: asin Inf')
    $N0 = '-Inf'
    $N1 = asin $N0
    is($N1, 'NaN', '... asin -Inf')
    $N0 = 'NaN'
    $N1 = asin $N0
    is($N1, 'NaN', '... asin NaN')
    $N0 = '-2'
    $N1 = asin $N0
    is($N1, 'NaN', '... asin -2')
    $N0 = '2'
    $N1 = asin $N0
    is($N1, 'NaN', '... asin 2')
.end

.sub test_cos
    $N0 = 'Inf'
    $N1 = cos $N0
    is($N1, 'NaN', 'cos: cos Inf')
    $N0 = '-Inf'
    $N1 = cos $N0
    is($N1, 'NaN', '... cos -Inf')
    $N0 = 'NaN'
    $N1 = cos $N0
    is($N1, 'NaN', '... cos NaN')
.end

.sub test_cosh
    $N0 = 'Inf'
    $N1 = cosh $N0
    is($N1, 'Inf', 'cosh: cosh Inf')
    $N0 = '-Inf'
    $N1 = cosh $N0
    is($N1, 'Inf', '... cosh -Inf')
    $N0 = 'NaN'
    $N1 = cosh $N0
    is($N1, 'NaN', '... cosh NaN')
.end

.sub test_acos
    $N0 = 'Inf'
    $N1 = acos $N0
    is($N1, 'NaN', 'acos: acos Inf')
    $N0 = '-Inf'
    $N1 = acos $N0
    is($N1, 'NaN', '... acos -Inf')
    $N0 = 'NaN'
    $N1 = acos $N0
    is($N1, 'NaN', '... acos NaN')
    $N0 = '-2'
    $N1 = acos $N0
    is($N1, 'NaN', '... acos -2')
    $N0 = '2'
    $N1 = acos $N0
    is($N1, 'NaN', '... acos 2')
.end

.sub test_tan
    $N0 = 'Inf'
    $N1 = tan $N0
    is($N1, 'NaN', 'tan: tan Inf')
    $N0 = '-Inf'
    $N1 = tan $N0
    is($N1, 'NaN', '... tan -Inf')
    $N0 = 'NaN'
    $N1 = tan $N0
    is($N1, 'NaN', '... tan NaN')
.end

.sub test_tanh
    $N0 = 'Inf'
    $N1 = tanh $N0
    is($N1, 1, 'tanh: tanh Inf')
    $N0 = '-Inf'
    $N1 = tanh $N0
    is($N1, -1, '... tanh -Inf')
    $N0 = 'NaN'
    $N1 = tanh $N0
    is($N1, 'NaN', '... tanh NaN')
.end

.sub test_atan
    $N0 = 'Inf'
    $N1 = atan $N0
    $P1 = new 'Float'
    $P1 = $N1
    is($P1, 1.5707963, 'atan: atan Inf',1e-6)

    $N0 = '-Inf'
    $N1 = atan $N0
    $P1 = new 'Float'
    $P1 = $N1
    is($P1, -1.5707963, '... atan -Inf',1e-6)

    $N0 = 'NaN'
    $N1 = atan $N0
    is($N1, 'NaN', '... atan NaN')
.end

.sub test_cot
    $N0 = 'Inf'
    #$N1 = cot $N0
    #is($N1, 'NaN', 'cot: cot Inf')
    todo(0, 'cot Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = '-Inf'
    #$N1 = cot $N0
    #is($N1, 'NaN', '... cot -Inf')
    todo(0, 'cot -Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = 'NaN'
    #$N1 = cot $N0
    #is($N1, 'NaN', '... cot NaN')
    todo(0, 'cot NaN', 'cot/coth/acot not implemented for real numbers')
.end

.sub test_coth
    $N0 = 'Inf'
    #$N1 = coth $N0
    #is($N1, 1, 'coth: coth Inf')
    todo(0, 'coth Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = '-Inf'
    #$N1 = coth $N0
    #is($N1, -1, '... coth -Inf')
    todo(0, 'coth -Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = 'NaN'
    #$N1 = coth $N0
    #is($N1, 'NaN', '... coth NaN')
    todo(0, 'coth NaN', 'cot/coth/acot not implemented for real numbers')
.end

.sub test_acot
    $N0 = 'Inf'
    #$N1 = acot $N0
    #is($N1, 'NaN', 'acot: acot Inf')
    todo(0, 'acot Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = '-Inf'
    #$N1 = acot $N0
    #is($N1, 'NaN', '... acot -Inf')
    todo(0, 'acot -Inf', 'cot/coth/acot not implemented for real numbers')
    $N0 = 'NaN'
    #$N1 = acot $N0
    #is($N1, 'NaN', '... acot NaN')
    todo(0, 'acot NaN', 'cot/coth/acot not implemented for real numbers')
    $N0 = '-2'
    #$N1 = acot $N0
    #is($N1, 'NaN', '... acot -2')
    todo(0, 'acot -2', 'cot/coth/acot not implemented for real numbers')
    $N0 = '2'
    #$N1 = acot $N0
    #is($N1, 'NaN', '... acot 2')
    todo(0, 'acot 2', 'cot/coth/acot not implemented for real numbers')
.end

.sub test_sec
    $N0 = 'Inf'
    $N1 = sec $N0
    is($N1, 'NaN', 'sec: sec Inf')
    $N0 = '-Inf'
    $N1 = sec $N0
    is($N1, 'NaN', '... sec -Inf')
    $N0 = 'NaN'
    $N1 = sec $N0
    is($N1, 'NaN', '... sec NaN')
.end

.sub test_sech
    $N0 = 'Inf'
    $N1 = sech $N0
    is($N1, 0, 'sech: sech Inf')
    $N0 = '-Inf'
    $N1 = sech $N0
    is($N1, 0, '... sech -Inf')
    $N0 = 'NaN'
    $N1 = sech $N0
    is($N1, 'NaN', '... sech NaN')
.end

.sub test_asec
    $N0 = 'Inf'
    $N1 = asec $N0
    $P1 = new 'Float'
    $P1 = $N1
    is($P1, 1.5707963, 'asec: asec Inf',1e-6)
    $N0 = '-Inf'
    $N1 = asec $N0
    $P1 = $N1
    is($P1, 1.5707963, '... asec -Inf',1e-6)
    $N0 = 'NaN'
    $N1 = asec $N0
    is($N1, 'NaN', 'asec NaN')
.end

.sub test_ln
    $N0 = 'Inf'
    $N1 = ln $N0
    is($N1, 'Inf', 'ln: ln Inf')
    $N0 = '-Inf'
    $N1 = ln $N0
    is($N1, 'NaN', '... ln Inf')
    $N0 = 'NaN'
    $N1 = ln $N0
    is($N1, 'NaN', '... ln NaN')
.end

.sub test_log10
    $N0 = 'Inf'
    $N1 = log10 $N0
    is($N1, 'Inf', 'log10: log10 Inf')
    $N0 = '-Inf'
    $N1 = log10 $N0
    is($N1, 'NaN', '... log10 -Inf')
    $N0 = 'NaN'
    $N1 = log10 $N0
    is($N1, 'NaN', '... log10 NaN')
.end

.sub test_log2
    $N0 = 'Inf'
    $N1 = log2 $N0
    is($N1, 'Inf', 'log2: log2 Inf')
    $N0 = '-Inf'
    $N1 = log2 $N0
    is($N1, 'NaN', '... log2 -Inf')
    $N0 = 'NaN'
    $N1 = log2 $N0
    is($N1, 'NaN', '... log2 -Inf')
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

.sub test_pow
    $N0 = 'Inf'
    pow $N1, $N0, 2
    is($N1, 'Inf', 'pow: Inf ^ 2')
    pow $N1, 2, $N0
    is($N1, 'Inf', '...: 2 ^ Inf')
    $N0 = 'NaN'
    pow $N1, $N0, 2
    is($N1, 'NaN', '...: NaN ^ 2')
    pow $N1, 2, $N0
    is($N1, 'NaN', '...: 2 ^ NaN')
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
    todo(0, 'floor Inf', 'rounding nan/inf gives something like -2147483648')
    $N0 = 'NaN'
    $I0 = floor $N0
    #is($I0, 'NaN', 'floor Inf')
    todo(0, 'floor NaN', 'rounding nan/inf gives something like -2147483648')
    $N0 = 'Inf'
    $I0 = ceil $N0
    #is($I0, 'Inf', 'floor Inf')
    todo(0, 'ceil Inf', 'rounding nan/inf gives something like -2147483648')
    $N0 = 'NaN'
    $I0 = ceil $N0
    #is($I0, 'NaN', 'floor Inf')
    todo(0, 'ceil NaN', 'rounding nan/inf gives something like -2147483648')
.end

.sub test_nan_complex
    $P1 = new ["Complex"]
    $N0 = 'NaN'
    set $P1, "1 + i"
    $P1 += $N0
    #is($P1, 'NaN', '1+i + NaN')
    todo(0, '1+i + NaN should be NaN')
.end

.sub test_fdiv_integer_pmc_nan
    $P1 = new "Integer"
    $P2 = new "Integer"
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN', 'fdiv with Integer PMCs and NaN')
    todo(0, 'fdiv with Integer PMCs and NaN', 'fdiv/mod/cmod do not play nicely with PMCs and NaN')
.end

.sub test_fdiv_float_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Float'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN','fdiv with Float PMCs and NaN')
    todo(0,'fdiv with Float PMCs and NaN', 'fdiv/mod/cmod do not play nicely with PMCs and NaN')
.end

.sub test_fdiv_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    #is($P1, 'NaN', 'fdiv with Float and Integer PMCs and NaN')
    todo(0, 'fdiv with Float and Integer PMCs and NaN', 'fdiv/mod/cmod do not play nicely with PMCs and NaN')
.end

.sub test_cmod_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    cmod $P1, $P2, $N0
    #is($P1, 'NaN', 'cmod with Float and Integer PMCs and NaN')
    todo(0, 'cmod with Float and Integer PMCs and NaN', 'fdiv/mod/cmod do not play nicely with PMCs and NaN')
.end

.sub test_mod_float_integer_pmc_nan
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    mod $P1, $P2, $N0
    #is($P1, 'NaN', 'mod with Float and Integer PMCs and NaN')
    todo(0, 'mod with Float and Integer PMCs and NaN', 'fdiv/mod/cmod do not play nicely with PMCs and NaN')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
