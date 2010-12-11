#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/integer.t - Integer basic type

=head1 SYNOPSIS

    % prove t/pmc/integer.t

=head1 DESCRIPTION

Tests the Integer PMC.

=cut

.loadlib 'sys_ops'

.sub 'test' :main
    .include 'test_more.pir'

    plan(137)
    test_init()
    test_basic_math()
    test_truthiness_and_definedness()
    test_set_string_native()
    test_isa()
    test_interface()
    test_ne()
    test_gt()
    test_ge()
    test_istrue_isfalse()
    test_if_unless()
    test_add()
    test_sub()
    test_mul()
    test_div()
    test_arithmetic()
    test_mod()
    test_neg()
    test_get_as_base()
    test_get_as_base10()
    test_get_as_base_various()
    test_get_as_base_bounds_check()
    test_cmp_subclass()
    test_cmp_RT59336()
    test_cmp_num()
.end

.sub test_init
    .local pmc i1, i2
    i1 = new ['Integer']
    is(i1, 0, "Default value of Integer is 0")
    i1 = 42
    i2 = new ['Integer'], i1
    is(i2, 42, "Initialize with argument set correct value")
.end

.sub test_get_as_base_bounds_check
    throws_substring(<<'CODE', 'get_as_base: base out of bounds', 'get_as_base lower bound check')
    .sub main
        $P0 = new ['Integer']
        $P0 = 42
        $S0 = $P0.'get_as_base'(1)
        say $S0
    .end
CODE
    throws_substring(<<'CODE', 'get_as_base: base out of bounds', 'get_as_base upper bound check')
    .sub main
        $P0 = new ['Integer']
        $P0 = 42
        $S0 = $P0.'get_as_base'(37)
        say $S0
    .end
CODE
.end

.sub test_basic_math
    .local pmc int_1
    int_1 = new ['Integer']
    is(int_1, 0, 'Integer PMC creation')
    int_1 = 1
    is(int_1, 1, '... set')
    int_1 += 777777
    int_1 -= 777776
    is(int_1, 2, '... add/sub')
    int_1 *= -333333
    int_1 /= -222222
    is(int_1, 3, '... mul/div')
    inc int_1
    inc int_1
    dec int_1
    is(int_1, 4, '... inc/dec')
    neg int_1
    dec int_1
    neg int_1
    is(int_1, 5, '... neg')

    throws_substring(<<'CODE', 'Integer overflow', 'mul integer overflow')
    .sub main
        .include "errors.pasm"
        errorson .PARROT_ERRORS_OVERFLOW_FLAG
        
        $P0 = new ['Integer']
        $P0 = 2048
        $P0 *= 2048
        $P0 *= 2048
        say $P0
    .end
CODE

    .include 'sysinfo.pasm'
    .local pmc bigint_1
    int_1 = new ['Integer']
    bigint_1 = new ['BigInt']
    
    $I0 = sysinfo .SYSINFO_PARROT_INTMIN
    int_1 = $I0
    bigint_1 = int_1 - 1
    
    dec int_1
    $P0 = typeof int_1
    is(int_1, bigint_1, 'dec integer overflow promotion')
    is($P0, 'BigInt', 'dec integer overflow type check')
    
    int_1 = new ['Integer']
    int_1 = -57494
    int_1 = abs int_1
    is(int_1, 57494, 'absolute value, assignment')
    
    int_1 = new ['Integer']
    int_1 = 6
    abs int_1
    is(int_1, 6, 'absolute value, in-place')    
.end

.sub test_truthiness_and_definedness
    .local pmc int_1
    int_1 = new ['Integer']

    nok(int_1, "A newly created Integer is not true")

    .local int is_defined

    is_defined = defined int_1

    nok(int_1, "A newly created Integer is not defined")

    int_1 = -999999999

    ok(int_1, "-999999999 is true")

    is_defined = defined int_1

    ok(int_1, "-999999999 is defined")

.end


.sub test_set_string_native
    .local pmc pmc1
    pmc1 = new ['Integer']
    pmc1 = "-123456789"
    is(pmc1, -123456789)
.end


.sub test_isa
    .local pmc pmc1
    pmc1 = new ['Integer']

    .local int pmc1_is_a
    pmc1_is_a = isa pmc1, "Integer"
    isa_ok(pmc1, "Integer")
.end

.sub test_interface
    .local pmc pmc1
    pmc1 = new ['Integer']
    .local int bool1
    does bool1, pmc1, "scalar"
    is(bool1,1)
    does bool1, pmc1, "integer"
    is(bool1,1)
    does bool1, pmc1, "no_interface"
    is(bool1,0)
.end

.sub test_ne
    .local pmc pmc1
    pmc1 = new ['Integer']
    .local int int1
    pmc1 = 10
    int1 = 20
    ne pmc1, int1, OK1
    ok(0)
    goto next_test
OK1:
    ok(1)

next_test:

    int1 = 10
    ne pmc1, int1, BAD2
    branch OK2
BAD2:
    ok(0)
    goto fin
OK2:
    ok(1)
fin:
.end


.sub test_gt
    .local pmc pmc1
    pmc1 = new ['Integer']
    .local int int1
    pmc1 = 10
    int1 = 5
    gt pmc1, int1, OK1
    ok(0)
    goto next_test1
OK1:
    ok(1)

next_test1:
    int1 = 10
    gt pmc1, int1, BAD2
    branch OK2
BAD2:
    ok(0)
OK2:
    ok(1)

next_test2:
    int1 = 20
    gt pmc1, int1, BAD3
    branch OK3
BAD3:
    ok(0)
    goto fin
OK3:
    ok(1)
fin:
.end


.sub test_ge
    .local pmc pmc1
    pmc1 = new ['Integer']
    .local int int1
    pmc1 = 10
    int1 = 5
    ge pmc1, int1, OK1
    ok(0)
    goto next_test1
OK1:
    ok(1)
    int1 = 10

next_test1:
    ge pmc1, int1, OK2
    ok(0)
    goto next_test2
OK2:
    ok(1)
    int1 = 20
next_test2:
    ge pmc1, int1, BAD3
    branch OK3
BAD3:
    ok(0)
    goto fin
OK3:
    ok(1)
fin:
.end


.sub test_istrue_isfalse
    .local pmc pmc1
    pmc1 = new ['Integer']
    .local int int1
    pmc1 = 10
    istrue int1, pmc1
    is(1,int1)
    isfalse int1, pmc1
    is(0,int1)
    pmc1 = 0
    istrue int1, pmc1
    is(0,int1)
    isfalse int1, pmc1
    is(1,int1)
.end


.sub test_if_unless
      new $P0, ['Integer']
      set $P0, 10
      if $P0, OK1
      ok(0)
      goto test1
OK1:
      ok(1)
test1:
      unless $P0, BAD2
      branch OK2
BAD2:
      ok(0)
      goto test2
OK2:
      ok(1)
      set $P0, 0
test2:
      if $P0, BAD3
      branch OK3
BAD3:
      ok(0)
      goto test3
OK3:
      ok(1)
test3:
      unless $P0, OK4
      ok(0)
      goto fin
OK4:
      ok(1)
fin:
.end

.sub test_add
   new $P0, ['Integer']
   set $P0, 5
   new $P1, ['Integer']
   set $P1, 10
   new $P2, ['Integer']
   add $P2, $P0, $P1
   set $S0, $P2
   is($S0,15)
   set $P0, "20"
   set $P1, "30"
   add $P2, $P1, $P0
   set $S0, $P2
   is($S0,50)

   new $P0, ['Integer']
   set $P0, 1073741824
   add $P0, $P0, 1073741824
   is($P0, 2147483648, 'add integer overflow')

   new $P0, ['Integer']
   new $P1, ['Complex']
   set $P0, 20
   set $P1, 4
   add $P0, $P1
   is($P0, "4+0i", 'add complex number')
   
   new $P0, ['Integer']
   new $P1, ['Float']
   set $P0, 31
   set $P1, 20.1
   add $P0, $P1
   is($P0, 51, 'add DEFAULT')
   
   new $P0, ['Integer']
   set $P0, 2
   add $P0, 3.14159
   add $P0, 5.75
   is($P0, 10, 'add_float')
.end

.sub test_sub
    $P0 = new ['BigInt']
    $P0 = 424124
    $P1 = new ['Integer']
    $P1 = 424125
    sub $P1, $P1, $P0
    is($P1, 1, 'BigInt sub (no exception)')
    
    $P0 = new ['Float']
    $P0 = 3.1
    $P1 = new ['Integer']
    $P1 = 10
    sub $P1, $P1, $P0
    is($P1, 6.9, 'DEFAULT sub')

    $P0 = new ['Integer']
    $P0 = -1073741824
    sub $P0, $P0, 1073741825
    is($P0, -2147483649, 'BigInt sub overflow')
    
    $P0 = new ['Integer']
    $P0 = -1073741824
    sub $P0, 1073741825
    is($P0, -2147483649, 'i_subtract_int overflow')
    
    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P0 = -1073741824
    $P1 = 1073741825
    sub $P0, $P1
    is($P0, -2147483649, 'i_subtract overflow')
    
    $P0 = new ['Integer']
    $P0 = 5
    sub $P0, 4.5
    is($P0, .5, 'i_subtract_float')
    
    $P0 = new ['Integer']
    $P1 = new ['Complex']
    $P0 = 0
    $P1 = "4+2i"
    sub $P0, $P1
    is($P0, "-4-2i", 'subtract Complex number')
    
    $P0 = new ['Integer']
    $P1 = new ['Float']
    $P0 = 5
    $P1 = 4.5
    sub $P0, $P1
    is($P0, .5, 'subtract DEFAULT multimethod')
.end

.sub test_mul
    $P0 = new ['Integer']
    $P1 = new ['String']
    $P0 = 1
    $P1 = "256"
    mul $P0, $P0, $P1
    is($P0, 256, 'multiply Integer PMC by String PMC')
    
    $P1 = new ['Float']
    $P0 = 2
    $P1 = 3.14
    mul $P0, $P0, $P1
    is($P0, 6, 'multiply Integer PMC by Float PMC')
    
    $P1 = new ['Integer']
    $P1 = 4
    mul $P0, $P1
    is($P0, 24, 'i_multiply Integer PMC by Integer PMC')

    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P2 = new ['Integer']
    $P0 = 24
    $P1 = 2
    $P2 = 48
    mul $P0, $P1
    $I0 = iseq $P0, $P2
    todo($I0, 'i_multiply Integer PMC by BigInt PMC', 'unresolved bug, see TT #1887')
    
    $P0 = new ['Integer']
    $P1 = new ['Complex']
    $P2 = new ['Complex']
    $P0 = 2
    $P1 = "2+4i"
    $P2 = "4+8i"
    mul $P0, $P1
    $I0 = iseq $P0, $P2
    todo($I0, 'i_multiply Integer PMC by Complex PMC', 'unresolved bug, see TT #1887')
    
    $P0 = new ['Integer']
    $P1 = new ['Float']
    $P0 = 2
    $P1 = 3.5
    mul $P0, $P1
    is($P0, 7, 'i_multiply Integer PMC by DEFAULT')
    
    $P0 = new ['Integer']
    $P0 = 1073741824
    mul $P0, 2
    $P1 = typeof $P0
    is($P0, 2147483648, 'i_multiply_int overflow promotion')
    is($P1, 'BigInt', 'i_multiple_int overflow type check')
    
    $P0 = new ['Integer']
    $P0 = 2
    mul $P0, 5.5
    is($P0, 11, 'i_multiply_float')
.end

.sub test_div
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 50
    $P1 = 25
    $P2 = div $P0, $P1
    $P3 = typeof $P2
    is($P2, 2, 'divide overflow promotion')
    is($P3, 'BigInt', 'divide overflow type check')
    
    throws_substring(<<'CODE', 'float division by zero', 'divide by 0 (Float PMC)')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 50
        $P1 = 0
        $P2 = div $P0, $P1
        say $P2
    .end
CODE

    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 50
    $P1 = 25
    div $P0, $P1
    $P2 = typeof $P0
    is($P0, 2, 'i_divide overflow promotion')
    is($P2, 'BigInt', 'i_divide overflow type check')
    
    $P0 = new ['Integer']
    $P1 = new ['Float']
    $P0 = 50
    $P1 = .5
    div $P0, $P1
    is($P0, 100, 'i_divide DEFAULT multi')
    
    throws_substring(<<'CODE', 'float division by zero', 'i_divide by 0 (Float PMC)')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 50
        $P1 = 0
        div $P0, $P1
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 10
    $P1 = 7
    $P0 = fdiv $P0, $P1
    $P2 = typeof $P0
    is($P0, 1, 'floor_divide overflow promotion')
    is($P2, 'BigInt', 'floor_divide overflow type check')
    
    throws_substring(<<'CODE', 'float division by zero', 'floor_divide by 0 (Float PMC)')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 50
        $P1 = 0
        $P0 = fdiv $P0, $P1
        say $P0
    .end
CODE

    throws_substring(<<'CODE', 'float division by zero', 'floor_divide by 0 (FLOATVAL)')
    .sub main
        $P0 = new ['Integer']
        $P0 = 50
        $P0 = fdiv $P0, 0.0
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P0 = 22
    $P0 = fdiv $P0, 7
    is($P0, 3, 'floor_divide INTVAL')
    
    throws_substring(<<'CODE', 'float division by zero', 'floor_divide by 0 (INTVAL)')
    .sub main
        $P0 = new ['Integer']
        $P0 = 50
        $P0 = fdiv $P0, 0
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 20
    $P1 = 9
    fdiv $P0, $P1
    $P2 = typeof $P0
    is($P0, 2, 'i_floor_divide overflow promotion')
    is($P2, 'BigInt', 'i_floor_divide overflow type check')
    
    $P0 = new ['Integer']
    $P1 = new ['Float']
    $P0 = 20
    $P1 = 2.3
    fdiv $P0, $P1
    is($P0, 8, 'i_floor_divide DEFAULT multi')
    
    throws_substring(<<'CODE', 'float division by zero', 'i_floor_divide by 0 (DEFAULT)')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 50
        $P1 = 0
        fdiv $P0, $P1
        say $P0
    .end
CODE
    
    $P0 = 20
    fdiv $P0, 7
    is($P0, 2, 'i_floor_divide INTVAL multi')
    
    throws_substring(<<'CODE', 'float division by zero', 'i_floor_divide by 0 INTVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 50
        fdiv $P0, 0
        say $P0
    .end
CODE
    
    $P0 = 20
    fdiv $P0, 2.3
    is($P0, 8, 'i_floor_divide FLOATVAL multi')
    
    throws_substring(<<'CODE', 'float division by zero', 'i_floor_divide by 0 FLOATVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 50
        fdiv $P0, 0.0
        say $P0
    .end
CODE
    
.end

.sub test_arithmetic
    $P0 = new ['Integer']
    $P1 = new ['Integer']
    set $P0, 6
    set $P1, 2

    add $P2, $P0, $P1
    is($P2,8)
    $P2 = add $P0, $P1
    is($P2,8)
    sub $P2, $P0, $P1
    is($P2,4)
    mul $P2, $P0, $P1
    is($P2,12)
    div $P2, $P0, $P1
    is($P2,3)
    mod $P2, $P0, $P1
    is($P2,0)
.end

.sub test_mod
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 7
    $P1 = 5
    $P0 = mod $P0, $P1
    $P2 = typeof $P0
    is($P0, 2, 'modulus overflow promotion')
    is($P2, 'BigInt', 'modulus overflow type check')
    
    throws_substring(<<'CODE', 'int modulus by zero', 'modulus by 0 DEFAULT multi')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 7
        $P1 = 0
        $P0 = mod $P0, $P1
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P0 = 7
    $P0 = mod $P0, 4
    is($P0, 3, 'modulus INTVAL multi')
    
    throws_substring(<<'CODE', 'int modulus by zero', 'modulus by 0 INTVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 7
        $P0 = mod $P0, 0
        say $P0
    .end
CODE
    throws_substring(<<'CODE', 'int modulus by zero', 'modulus by 0 FLOATVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 7
        $P0 = mod $P0, 0.0
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    $P0 = 7
    $P1 = 5
    mod $P0, $P1
    $P2 = typeof $P0
    is($P0, 2, 'i_modulus overflow promotion')
    is($P2, 'BigInt', 'i_modulus overflow type check')
    
    $P0 = new ['Integer']
    $P1 = new ['Float']
    $P0 = 7
    $P1 = 5
    mod $P0, $P1
    is($P0, 2, 'i_modulus DEFAULT multi')
    
    throws_substring(<<'CODE', 'int modulus by zero', 'i_modulus by 0 DEFAULT multi')
    .sub main
        $P0 = new ['Integer']
        $P1 = new ['Float']
        $P0 = 7
        $P1 = 0
        mod $P0, $P1
        say $P0
    .end
CODE
    
    $P0 = new ['Integer']
    $P0 = 7
    mod $P0, 4
    is($P0, 3, 'i_modulus INTVAL multi')
    $P0 = 7
    mod $P0, 3.0
    is($P0, 1, 'i_modulus FLOATVAL multi')
    
    throws_substring(<<'CODE', 'int modulus by zero', 'i_modulus by 0 INTVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 7
        mod $P0, 0
        say $P0
    .end
CODE
    throws_substring(<<'CODE', 'int modulus by zero', 'i_modulus by 0 FLOATVAL multi')
    .sub main
        $P0 = new ['Integer']
        $P0 = 7
        mod $P0, 0.0
        say $P0
    .end
CODE
.end

.sub test_neg
    .include 'sysinfo.pasm'
    
    $P0 = new ['Integer']
    $P1 = new ['BigInt']
    
    $I0 = sysinfo .SYSINFO_PARROT_INTMIN
    
    $P0 = $I0
    $P1 = $I0
    neg $P1
    
    $P0 = neg $P0
    $P2 = typeof $P0
    is($P0, $P1, 'neg integer overflow promotion')
    is($P2, 'BigInt', 'neg integer overflow type check')
    
    $P0 = new ['Integer']
    $P0 = -3
    neg $P0
    is($P0, 3, 'i_neg')
.end


.sub test_get_as_base
    $P0 = new ['Integer']
    $P0 = 42
    $I0 = can $P0, 'get_as_base'
    ok($I0,'Integers can get_as_base')
.end

.sub test_get_as_base10
    $P0 = new ['Integer']
    $P0 = 42

    $S0 = $P0.'get_as_base'(10)
    is($S0,42)
.end

.sub test_get_as_base_various
    $P0 = new ['Integer']
    $P0 = 42

    $S0 = $P0.'get_as_base'(2)
    is($S0,101010)

    $S0 = $P0.'get_as_base'(3)
    is($S0,1120)

    $S0 = $P0.'get_as_base'(5)
    is($S0,132)

    $S0 = $P0.'get_as_base'(7)
    is($S0,60)

    $S0 = $P0.'get_as_base'(11)
    is($S0,39)

    $S0 = $P0.'get_as_base'(13)
    is($S0,33)

    $S0 = $P0.'get_as_base'(17)
    is($S0,28)

    $S0 = $P0.'get_as_base'(19)
    is($S0,24)

    $S0 = $P0.'get_as_base'(23)
    is($S0,'1j')

    $S0 = $P0.'get_as_base'(29)
    is($S0,'1d')

    $S0 = $P0.'get_as_base'(31)
    is($S0,'1b')
.end

.sub test_cmp_subclass
    $P0 = subclass 'Integer', 'Int'

    $P1 = new ['Int']
    $P1 = 1
    $P2 = new ['Int']
    $P2 = 2

    $I0 = cmp $P1, $P2
    is($I0,-1)
    $I0 = cmp $P1, $P1
    is($I0,0)
    $I0 = cmp $P2, $P1
    is($I0,1)
.end

.sub test_cmp_RT59336
    $P0 = new ['Integer']
    $P0 = 2147483600

test_10:
    if $P0 > -10 goto pass
    ok(0)
    goto test_1000
pass:
    ok(1)

test_1000:
    if $P0 > -1000 goto pass2
    ok(0)
    goto fin
pass2:
    ok(1)
fin:
.end

.sub test_cmp_num
    $P0 = new ['Integer']
    $P1 = new ['String']
    $P0 = 23
    $P1 = "23.4"
    
    $I0 = cmp_num $P0, $P1
    is($I0, -1, 'cmp_num 23(Integer PMC), "23.4"(String PMC) = -1')
    $P1 = "23e-2"
    $I0 = cmp_num $P0, $P1
    is($I0, 1, 'cmp_num 23(Integer PMC), "23e-2"(String PMC) = 1')
    $P1 = "23"
    $I0 = cmp_num $P0, $P1
    is($I0, 0, 'cmp_num 23(Integer PMC), "23"(String PMC) = 0')

    $P0 = -32
    $P1 = "0"
    $I0 = cmp_num $P0, $P1
    is($I0, -1, 'cmp_num -32(Integer PMC), "0"(String PMC) = -1')
    $P0 = 0
    $I0 = cmp_num $P0, $P1
    is($I0, 0, 'cmp_num 0(Integer PMC), "0"(String PMC) = 0')
    $P0 = 245
    $I0 = cmp_num $P0, $P1
    is($I0, 1, 'cmp_num 245(Integer PMC), "0"(String PMC) = 1')
    
    $P1 = new ['Float']
    $P1 = 2.6
    $I0 = cmp_num $P0, $P1
    is($I0, 1, 'cmp_num 245(Integer PMC), 2.6(Float PMC) = 1')
    $P1 = 553.2
    $I0 = cmp_num $P0, $P1
    is($I0, -1, 'cmp_num 245(Integer PMC), 553.2(Float PMC) = -1')
    $P1 = 245
    $I0 = cmp_num $P0, $P1
    is($I0, 0, 'cmp_num 245(Integer PMC), 245(Float PMC) = 0')
    
    $P1 = new ['Integer']
    $P1 = 300
    $I0 = cmp_num $P0, $P1
    is($I0, -1, 'cmp_num 245(Integer PMC), 300(Integer PMC) = -1')
    $P1 = 2
    $I0 = cmp_num $P0, $P1
    is($I0, 1, 'cmp_num 245(Integer PMC), 2(Integer PMC) = 1')
    $P1 = 245
    $I0 = cmp_num $P0, $P1
    is($I0, 0, 'cmp_num 245(Integer PMC), 245(Integer PMC) = 0')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
