#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/integer.t - Integer basic type

=head1 SYNOPSIS

    % prove t/pmc/integer.t

=head1 DESCRIPTION

Tests the Integer PMC.

=cut

.sub 'test' :main
    .include 'test_more.pir'

    plan(61)
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
    test_arithmetic()
    test_get_as_base()
    test_get_as_base10()
    test_get_as_base_various()
    test_get_as_base_bounds_check()
    test_cmp_subclass()
    test_cmp_RT59336()
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
    is(int_1,0)
    int_1 = 1
    is(int_1,1)
    int_1 += 777777
    int_1 -= 777776
    is(int_1,2)
    int_1 *= -333333
    int_1 /= -222222
    is(int_1,3)
    inc int_1
    inc int_1
    dec int_1
    is(int_1,4)
    neg int_1
    dec int_1
    neg int_1
    is(int_1,5)
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
