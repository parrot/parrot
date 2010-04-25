#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/bigint.t - BigInt PMC

=head1 SYNOPSIS

    % prove t/pmc/bigint.t

=head1 DESCRIPTION

Tests the BigInt PMC.

=cut

.sub main :main

    .include 'test_more.pir'

    plan(34)
    check_libgmp_good()

    set_and_get()
    addition()
    subtraction()
    multiplication()
    division()
    division_by_zero()
    negation()
    absolute_value()
    overflow_coercion()
    interface()
    boolean()
    pi()
    bugfixes()

.end

.include 'iglobals.pasm'
.include 'fp_equality.pasm'
.include 'errors.pasm'

.sub check_libgmp_good
    # check libgmp included in Parrot build
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]

    $P2 = $P1['gmp']
    $I1 = isnull $P2
    if $I1, NoLibGMP
    say '# This Parrot uses GMP'

    # check version is >= 4.1.4
    $P0 = new ['BigInt']
    $S3 = $P0.'version'()
    $P1 = split '.', $S3
    $S0 = $P1[0]
    $I0 = $S0
    gt $I0, 4, Config2
    lt $I0, 4, OldLibGMP
    $S1 = $P1[1]
    $I1 = $S1
    gt $I1, 1, Config2
    lt $I1, 1, OldLibGMP
    $S2 = $P1[2]
    $I2 = $S2
    lt $I2, 4, OldLibGMP

Config2:
    diag( 'Suitable GMP version [', $S3, '] available' )
    goto ret

NoLibGMP:
    diag( 'No BigInt Lib configured' )
    skip(34)
    exit 0

OldLibGMP:
    diag( 'Buggy GMP version [', $S3, '] with huge digit multiply - please upgrade' )
    skip(34)
    exit 0

ret:
.end

.sub set_and_get
    $I1 = 1
    $P0 = new ['BigInt']
    $I0 = 999999
    $P0 = $I0
    $I2 = $P0
    eq $I0, $I2, OK1
    $I1 = 0
    say 'set_int/get_int 999999 wrong'
OK1:

    $P0 = new ['BigInt']
    $I0 = 999999
    $P0 = $I0
    $S0 = get_repr $P0
    $I2 = $S0
    eq $I0, $I2, OK2
    $I1 = 0
    say 'set_int/get_str 999999 wrong'
OK2:

    $P0 = new ['BigInt']
    $P0 = 999999
    $N1 = $P0
    .fp_eq($N1, 999999.0, OK3)
    $I1 = 0
    say 'set_int/get_num 999999 wrong'
OK3:

    $P0 = -999999
    $N1 = $P0
    .fp_eq($N1, -999999.0, OK4)
    $I1 = 0
    say 'set_int/get_num -999999 wrong'
OK4:

    $P0 = 2147483646
    $N1 = $P0
    .fp_eq($N1, 2.147483646e9, OK5)
    $I1 = 0
    say 'set_int/get_num 2^31-1 wrong'
OK5:

    $P0 = -2147483646
    $N1 = $P0
    .fp_eq($N1, -2.147483646e9, OK6)
    $I1 = 0
    say 'set_int/get_num 2-2^31 wrong'
OK6:

    $P0 = new ['BigInt']
    $P0 = 1.23e12
    $S0 = $P0
    eq $S0, '1230000000000', OK7
    $I1 = 0
    say 'set_num/get_str 1230000000000'
OK7:

    $P0 = new ['BigInt']
    $P0 = '1230000000000'
    $S0 = $P0
    eq $S0, '1230000000000', OK8
    $I1 = 0
    say 'set_str/get_str 1230000000000'

OK8:
    ok($I1, 'set and get combinations')
.end

.sub addition
    $I1 = 1
    $P0 = new ['BigInt']
    $P0 = 999999
    $P1 = new ['BigInt']
    $P1 = 1000000
    $P2 = new ['BigInt']
    $P2 = add $P0, $P1
    $S0 = $P2
    eq $S0, '1999999', OK1
    $I1 = 0
    say 'add 999999+1000000 wrong'
OK1:

    $P0 = '12345678987654321'
    $P1 = '10000000000000000'
    $P2 = add $P1, $P0
    $S0 = $P2
    eq $S0,'22345678987654321',OK2
    $I1 = 0
    say 'add 12345678987654321+10000000000000000 wrong'
OK2:
    ok($I1, 'add(bigint,bigint)')

    $I1 = 1
    $P0 = 999999
    $P2 = add $P0, 1000000
    $S0 = $P2
    eq $S0,'1999999',OK3
    $I1 = 0
    say 'add 999999+1000000 wrong'
OK3:

    $P0 = '100000000000000000000'
    $P2 = add $P0, 1000000
    $S0 = $P2
    eq $S0,'100000000000001000000',OK4
    $I1 = 0
    say 'add 100000000000000000000+1000000 wrong'
OK4:
    ok($I1, 'add(bigint,nativeint)')

.end

.sub subtraction
    $I1 = 1
    $P0 = new ['BigInt']
    $P0 = 12345678
    $P1 = new ['BigInt']
    $P1 = 5678
    $P2 = new ['BigInt']
    $P2 = sub $P0, $P1
    $I0 = $P2
    eq $I0, 12340000, OK1
    $I1 = 0
    say 'sub 12345678-5678 wrong'
OK1:

    $P0 = '123456789012345678'
    $P2 = sub $P0, $P1
    $P3 = new ['BigInt']
    $P3 = '123456789012340000'
    eq $P2, $P3, OK2
    $I1 = 0
    say 'sub 123456789012345678-5678 wrong'
OK2:

    $P1 = '223456789012345678'
    $P2 = sub $P0, $P1
    $P3 = '-100000000000000000'
    eq $P2, $P3, OK3
    $I1 = 0
    say 'sub 123456789012345678-(-100000000000000000) wrong'
OK3:
    ok($I1, 'sub(bigint,bigint)')
    $I1 = 1

    $P0 = 12345678
    $P2 = sub $P0, 5678
    $I0 = $P2
    eq $I0, 12340000, OK4
    $I1 = 0
    say 'sub 12345678-5678 wrong'
OK4:

    $P0 = '123456789012345678'
    $P2 = sub $P0, 5678
    $P3 = new ['BigInt']
    $P3 = '123456789012340000'
    eq $P2, $P3, OK5
    $I1 = 0
    say 'sub 123456789012345678-5678 wrong'
OK5:

    $P0 = new ['BigInt']
    $P0 = 12345678
    $P1 = new ['Integer']
    $P1 = 5678
    $P2 = new ['BigInt']
    $P2 = sub $P0, $P1
    $I0 = $P2
    eq $I0, 12340000, OK6
    $I1 = 0
    say 'sub 12345678-5678 wrong'
OK6:

    $P0 = '123456789012345678'
    $P2 = sub $P0, $P1
    $P3 = new ['BigInt']
    $P3 = '123456789012340000'
    eq $P2, $P3, OK7
    $I1 = 0
    say 'sub 123456789012345678-5678 wrong'
OK7:

    $P0 = 9876543
    $P4 = new ['Integer']
    $P4 = 44
    $P2 = sub $P0, $P4
    $I0 = $P2
    eq $I0, 9876499, OK8
    $I1 = 0
    say 'sub 9876543-44 wrong'
OK8:

    $P0 = '9876543219876543'
    $P2 = sub $P0, $P4
    $P3 = '9876543219876499'
    eq $P3, $P2, OK9
    $I1 = 0
    say 'sub 9876543219876543-44 wrong'
OK9:
    ok($I1, 'sub(bigint,integer)')
.end

.sub multiplication
    $P0 = new ['BigInt']
    $P0 = 999999
    $P1 = new ['BigInt']
    $P1 = 1000000
    $P2 = new ['BigInt']
    $P2 = mul $P0, $P1
    $S0 = $P2
    is($S0, '999999000000', 'mul(bigint,bigint)')

    $P0 = new ['BigInt']
    $P0 = 999999
    $P2 = new ['BigInt']
    $P2 = mul $P0, 1000000
    is($P2, '999999000000', 'mul(bigint,nativeint)')
.end

.sub division
    $I1 = 1
    $P0 = new ['BigInt']
    $P0 = '100000000000000000000'
    $P1 = new ['BigInt']
    $P1 = '100000000000000000000'
    $P2 = new ['BigInt']
    $P2 = div $P0, $P1
    $I0 = $P2
    eq $I0, 1, OK1
    $I1 = 0
    say 'div 100000000000000000000/100000000000000000000 wrong'
OK1:

    $P3 = new ['BigInt']
    $P3 = '10000000000000'
    $P1 = 10000000
    $P2 = div $P0, $P1
    eq $P2, $P3, OK2
    $I1 = 0
    say 'div 100000000000000000000/10000000 wrong'
OK2:

    $P1 = 10
    $P3 = '10000000000000000000'
    $P2 = div $P0, $P1
    eq $P2, $P3, OK3
    $I1 = 0
    say 'div 100000000000000000000/10 wrong'
OK3:

    $P1 = -1
    $P3 = '-100000000000000000000'
    $P2 = div $P0, $P1
    eq $P2, $P3, OK4
    $I1 = 0
    say 'div 100000000000000000000/(-1) wrong'
OK4:
    ok($I1, 'div(bigint,bigint)')
    $I1 = 1

    $P0 = new ['BigInt']
    $P0 = '100000000000000000000'
    $P1 = new ['BigInt']
    $P1 = div $P0, 10
    $P2 = new ['BigInt']
    $P2 = '10000000000000000000'
    eq $P1, $P2, OK5
    $I1 = 0
    say 'div 100000000000000000000/10 wrong'
OK5:

    $P0 = '100000000000000'
    $P1 = div $P0, 10000000
    $P2 = 10000000
    eq $P1, $P2, OK6
    $I1 = 0
    say 'div 100000000000000/10000000 wrong'
OK6:
    ok($I1, 'div(bigint,nativeint)')
    $I1 = 1

    $P0 = new ['BigInt']
    $P0 = '100000000000000000000'
    $P1 = new ['BigInt']
    $P3 = new ['Integer']
    $P3 = 10
    $P1 = div $P0, $P3
    $P2 = new ['BigInt']
    $P2 = '10000000000000000000'
    eq $P1, $P2, OK7
    $I1 = 0
    say 'div 100000000000000000000/10 wrong'
OK7:

    $P0 = '100000000000000'
    $P4 = new ['Integer']
    $P4 = 10000000
    $P1 = div $P0, $P4
    $P2 = 10000000
    eq $P1, $P2, OK8
    $I1 = 0
    say 'div 100000000000000/10000000 wrong'
OK8:
    ok($I1, 'div(bigint,integer)')

.end

.sub division_by_zero
    $I1 = 1
    $P0 = new ['BigInt']
    $P0 = '1000000000000000000000'
    $P1 = new ['BigInt']
    ## divide by a zero BigInt
    $P2 = new ['BigInt']
    $P2 = 0
    push_eh E1
        $P1 = div $P0, $P2
        $I1 = 0
        say 'Failed to throw exception'
E1:
    pop_eh
    get_results '0', $P0
    $S0 = $P0
    eq $S0, 'Divide by zero', OK1
    $I1 = 0
    print $S0
    say ' is wrong exception type'
OK1:
    ok($I1, 'div(bigint,bigint 0) throws "Divide by zero" exception')
    $I1 = 1

    $P0 = new ['BigInt']
    $P0 = '1000000000000000000000'
    $P1 = new ['BigInt']
    ## modulus by a zero BigInt
    $P2 = new ['BigInt']
    $P2 = 0
    push_eh E2
        $P1 = mod $P0, $P2
        $I1 = 0
        say 'Failed to throw exception'
E2:
    pop_eh
    get_results '0', $P0
    $S0 = $P0
    eq $S0, 'Divide by zero', OK2
    $I1 = 0
    print $S0
    say ' is wrong exception type'
OK2:
    ok($I1, 'mod(bigint,bigint 0) throws "Divide by zero" exception')
    $I1 = 1

    $P0 = new ['BigInt']
    $P0 = '1000000000000000000000'
    $P1 = new ['BigInt']
    ## divide by a zero Integer
    $P2 = new ['Integer']
    $P2 = 0
    push_eh E3
        $P1 = div $P0, $P2
        $I1 = 0
        say 'Failed to throw exception'
E3:
    pop_eh
    get_results '0', $P0
    $S0 = $P0
    eq $S0, 'Divide by zero', OK3
    $I1 = 0
    print $S0
    say ' is wrong exception type'
OK3:
    ok($I1, 'div(bigint,integer 0) throws "Divide by zero" exception')
    $I1 = 1

    $P0 = new ['BigInt']
    $P0 = '1000000000000000000000'
    $P1 = new ['BigInt']
    ## modulus by a zero Integer
    $P2 = new ['Integer']
    $P2 = 0
    push_eh E4
        $P1 = mod $P0, $P2
        $I1 = 0
        say 'Failed to throw exception'
E4:
    pop_eh
    get_results '0', $S0
    eq $S0, 'Divide by zero', OK4
    $I1 = 0
    print $S0
    say ' is wrong exception type'
OK4:
    ok($I1, 'mod(bigint,integer 0) throws "Divide by zero" exception')

.end

.sub negation
    $I1 = 1
    $P0 = new ['BigInt']
    $P1 = new ['BigInt']
    $P0 = '123456789123456789'
    neg $P0
    $P1 = '-123456789123456789'
    eq $P0, $P1, OK1
    $I1 = 0
OK1:
    $P0 = '-123456789123456789'
    neg $P0
    $P1 = '123456789123456789'
    eq $P0, $P1, OK2
    $I1 = 0
OK2:
    ok($I1, 'negation')
.end

.sub absolute_value
    $P0 = new ['BigInt']
    $P0 = '-1230000000000000000000'
    $P1 = new ['Undef']
    $P1 = abs $P0
    $S0 = $P1
    is($S0,'1230000000000000000000','abs negates negative number')
    $S0 = $P0
    is($S0,'-1230000000000000000000','... and original unchanged with 2-arg form')
    $P1 = abs $P1
    $S0 = $P1
    is($S0,'1230000000000000000000','... does not change to positive number')
    $S0 = $P1
    abs $P0
    $S0 = $P0
    is($S0,'1230000000000000000000','... and in-place works too')
.end

.sub overflow_coercion
    # check libgmp included in Parrot build
    $P0 = getinterp
    $P4 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P4['intvalsize']
    eq $I0, 8, sz8
    eq $I0, 4, sz4
    print 'Cannot cope with sizeof(INTVAL) == '
    say $I0
    skip(43)
    exit 1

sz8:
    $I3 = 0x100000000               # sqrt(2*(MinInt+1))
    $I4 = 9223372036854775806       # MaxInt-1 == 2**63-2
    $I5 = 9223372036854775807       # MaxInt
    $S5 = '9223372036854775807'     # MaxInt
    $S6 = '9223372036854775808'     # MaxInt+1
    $S7 = '9223372036854775809'     # MaxInt+2
    $I8 = -9223372036854775807      # MinInt+1 == 1-2**63
    $I9 = -9223372036854775808      # MinInt
    $S9 = '-9223372036854775808'    # MinInt
    $S10 = '-9223372036854775809'   # MinInt-1
    $S11 = '-9223372036854775810'   # MinInt-2
    goto esz

sz4:
    $I3 = 0x10000                   # sqrt(2*(MinInt+1))
    $I4 = 2147483646                # MaxInt-1 == 2**31-2
    $I5 = 2147483647                # MaxInt
    $S5 = '2147483647'              # MaxInt
    $S6 = '2147483648'              # MaxInt+1
    $S7 = '2147483649'              # MaxInt+2
    $I8 = -2147483647               # MinInt+1 == 1-2**31
    $I9 = -2147483648               # MinInt
    $S9 = '-2147483648'             # MinInt
    $S10 = '-2147483649'            # MinInt-1
    $S11 = '-2147483650'            # MinInt-2
    goto esz

esz:
    print '# Using '
    $I0 = mul $I0, 8
    print $I0
    print '-bit Integers ['
    print $I9
    print '...'
    print $I5
    say ']'

    # Checking upper bound by incremental increase
    $I1 = 1
    $P0 = new ['Integer']
    $P0 = $I4               # MaxInt-1
    $P1 = new ['Integer']
    $P1 = 1
    $P0 = add $P0, $P1
    $S0 = typeof $P0
    eq $S0, 'Integer', k0
    $I1 = 0
    say "typeof != 'Integer'"
k0:
    $S0 = $P0
    eq $S0, $S5, k1         # MaxInt
    $I1 = 0
    say 'value != MaxInt'
k1:
    $P0 = add $P0, $P1
    $S0 = typeof $P0
    eq $S0, 'BigInt', k2
    $I1 = 0
    say "typeof != 'BigInt'"
k2:
    $S0 = $P0
    eq $S0, $S6, k3         # MaxInt+1
    $I1 = 0
    say 'value != MaxInt+1'
k3:
    $P0 = add $P0, $P1
    $S0 = typeof $P0
    eq $S0, 'BigInt', k4
    $I1 = 0
    say "typeof != 'BigInt'"
k4:
    $S0 = $P0
    eq $S0, $S7, k5         # MaxInt+2
    $I1 = 0
    say 'value != MaxInt+2'
k5:

    # Checking upper bound by increased steps
    $P0 = new ['Integer']
    $P0 = $I4               # MaxInt-1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    eq $S0, 'Integer', k6
    $I1 = 0
    say "typeof != 'Integer'"
k6:
    $S0 = $P2
    eq $S0, $S5, k7         # MaxInt
    $I1 = 0
    say 'value != MaxInt'
k7:
    inc $P1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    eq $S0, 'BigInt', k8
    $I1 = 0
    say "typeof != 'BigInt'"
k8:
    $S0 = $P2
    eq $S0, $S6, k9         # MaxInt+1
    $I1 = 0
    say 'value != MaxInt+1'
k9:
    add $P1, 1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    eq $S0, 'BigInt', k10
    $I1 = 0
    say "typeof != 'BigInt'"
k10:
    $S0 = $P2
    eq $S0, $S7, k11         # MaxInt+2
    $I1 = 0
    say 'value != MaxInt+2'
k11:
    ok($I1, 'integer addition converts MaxInt+1 to BigInt')

    # Checking lower bound
    $I1 = 6
    $P0 = new ['Integer']
    $P0 = $I8
    $P1 = -1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'Integer', k12
    dec $I1
k12:
    $S0 = $P2
    ne $S0, $S9, k13
    dec $I1
k13:
    dec $P1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'BigInt', k14
    dec $I1
k14:
    $S0 = $P2
    ne $S0, $S10, k15
    dec $I1
k15:
    sub $P1, 1
    $P2 = new ['Integer']
    $P2 = add $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'BigInt', k16
    dec $I1
k16:
    $S0 = $P2
    ne $S0, $S11, k17
    dec $I1
k17:
    is($I1, 0, 'integer addition converts MinInt+(-1) to BigInt')

    $I1 = 6
    $P0 = new ['Integer']
    $P0 = $I4
    $P1 = -1
    $P2 = new ['Integer']
    $P2 = sub $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'Integer', k18
    dec $I1
k18:
    $S0 = $P2
    ne $S0, $S5, k19
    dec $I1
k19:
    dec $P1
    $P2 = new ['Integer']
    $P2 = sub $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'BigInt', k20
    dec $I1
k20:
    $S0 = $P2
    ne $S0, $S6, k21
    dec $I1
k21:
    sub $P1, 1
    $P2 = new ['Integer']
    $P2 = sub $P0, $P1
    $S0 = typeof $P2
    ne $S0, 'BigInt', k22
    dec $I1
k22:
    $S0 = $P2
    ne $S0, $S7, k23
    dec $I1
k23:
    is($I1, 0, 'integer subtraction converts MaxInt-(-1) to BigInt')

    $I1 = 0
    $P0 = new ['Integer']
    $P0 = $I8   # MinInt
    dec $P0
    neg $P0
    $S0 = typeof $P0
    ne $S0, 'BigInt', k24
    inc $I1
k24:
    $S0 = $P0
    ne $S0, $S6, k25
    inc $I1
k25:
    todo($I1, 'integer negation of MinInt converts MaxInt+1 to BigInt')

    $I1 = 0
    $P0 = new ['Integer']
    $P0 = $I8   # MinInt
    dec $P0
    abs $P0
    $S0 = typeof $P0
    ne $S0, 'BigInt', k26
    inc $I1
k26:
    $S0 = $P0
    ne $S0, $S6, k27
    inc $I1
k27:
    todo($I1, 'integer absolute-value of MinInt converts MaxInt+1 to BigInt')

    $P0 = new ['Integer']
    $P0 = $I3
    $P1 = new ['Integer']
    $P1 = $I3

ex:
.end

.sub interface
    $P0 = new ['BigInt']
    $I0 = does $P0, 'scalar'
    is($I0,1,'Interface does scalar')
    $I0 = does $P0, 'no_interface'
    is($I0,0,'... and does not do bogus')
.end

.sub boolean
    $P0 = new ['BigInt']

    $P0 = '123456789123456789'
    $I0 = 1
    if $P0, OK1
    $I0 = 0
OK1:

    $P0 = 0
    unless $P0, OK2
    $I0 = 0
OK2:

    ok($I0, 'truth and falsehood')
.end

# How this next test was originally written in Python:
#
#   class PI(object):
#       def __iter__(self):
#           k, a, b, a1, b1 = 2, 4, 1, 12, 4
#           while 1:
#               p, q, k = k*k, 2*k+1, k+1
#               a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
#               d, d1 = a//b, a1//b1
#               while d == d1:
#                   yield d
#                   a, a1 = 10*(a%b), 10*(a1%b1)
#                   d, d1 = a//b, a1//b1
#
#   pi = iter(PI())
#   ds = ""
#   for i in xrange(1, 1001):
#       d = pi.next()
#       ds += str(d)
#       im = i % 50
#       if im == 0:
#           print ds
#           ds = ""
#
#   print ds
#

.sub pi_generator
    # k = $P6
    $P6 = new ['Integer']
    $P6 = 2
    # a = $P7
    $P7 = new ['Integer']
    $P7 = 4
    # b = $P8
    $P8 = new ['Integer']
    $P8 = 1
    # a1 = $P9
    $P9 = new ['Integer']
    $P9 = 12
    # b1 = $P10
    $P10 = new ['Integer']
    $P10 = 4
restart:
    # p = $P11
    $P11 = mul $P6, $P6
    # q = $P12
    $P12 = mul $P6, 2
    inc $P12
    inc $P6
    # ta  = $P13
    $P13 = clone $P9
    # tb  = $P14
    $P14 = clone $P10
    $P0 = mul $P11, $P7
    $P1 = mul $P12, $P9
    # ta1 = $P15
    $P15 =  add $P0, $P1
    $P2 = mul $P11, $P8
    $P3 = mul $P12, $P10
    # tb1 = $P16
    $P16 =  add $P2, $P3
    $P7 = $P13
    $P8 = $P14
    $P9 = $P15
    $P10 = $P16
    # d = $P17
    $P17 = fdiv $P7, $P8
    # d1 = $P18
    $P18 = fdiv $P9, $P10
next:
    ne $P17, $P18, restart
    .yield($P17)
    $P4 = mod $P7, $P8
    $P7 = mul $P4, 10
    $P5 = mod $P9, $P10
    $P9 = mul $P5, 10
    $P17 = fdiv $P7, $P8
    $P18 = fdiv $P9, $P10
    goto next
.end

.sub pi
    $S0 = <<'EoN'
31415926535897932384626433832795028841971693993751
05820974944592307816406286208998628034825342117067
98214808651328230664709384460955058223172535940812
84811174502841027019385211055596446229489549303819
64428810975665933446128475648233786783165271201909
14564856692346034861045432664821339360726024914127
37245870066063155881748815209209628292540917153643
67892590360011330530548820466521384146951941511609
43305727036575959195309218611738193261179310511854
80744623799627495673518857527248912279381830119491
29833673362440656643086021394946395224737190702179
86094370277053921717629317675238467481846766940513
20005681271452635608277857713427577896091736371787
21468440901224953430146549585371050792279689258923
54201995611212902196086403441815981362977477130996
05187072113499999983729780499510597317328160963185
95024459455346908302642522308253344685035261931188
17101000313783875288658753320838142061717766914730
35982534904287554687311595628638823537875937519577
81857780532171226806613001927876611195909216420198
EoN

    $I3 = 0
    $I4 = length $S0
loop:
    $P0 = pi_generator()
skip_ws:
    $S1 = substr $S0,$I3,1
    eq $S1, '', stop
    inc $I3
    eq $S1, '.', skip_ws
    eq $S1, ' ', skip_ws
    eq $S1, "\r", skip_ws
    eq $S1, "\n", skip_ws
    $I1 = $S1
    $I0 = $P0
    eq $I0, $I1, loop
stop:
    is($I0, $I1, 'Computed 1000 digits of PI (using coroutine)')
    eq $I0, $I1, ret
        print 'Wrong digit '
        print $I0
        print ' should have been '
        print $S1
        print ' at position '
        print $I3
        say '.'
    ret:
.end

.sub bugfixes

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 1
    gt $P0, 4, OK1
    $I1 = 0
OK1:
    ok($I1, 'BUG #34949 gt')

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 1
    ge $P0, 4, OK2
    $I1 = 0
OK2:
    ok($I1, 'BUG #34949 ge')

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 1
    ne $P0, 4, OK3
    $I1 = 0
OK3:
    ok($I1, 'BUG #34949 ne')

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 0
    eq $P0, 4, NOK4
    $I1 = 1
NOK4:
    ok($I1, 'BUG #34949 eq')

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 0
    lt $P0, 4, NOK5
    $I1 = 1
NOK5:
    ok($I1, 'BUG #34949 le')

    $P0 = new ['BigInt']
    $P0 = 1e10
    $I1 = 0
    lt $P0, 4, NOK6
    $I1 = 1
NOK6:
    ok($I1, 'BUG #34949 lt')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
