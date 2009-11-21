#!parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/op/bitwise.t - Bitwise Ops

=head1 SYNOPSIS

        % prove t/op/bitwise.t

=head1 DESCRIPTION

Tests various bitwise logical operations.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(68)

    test_shr_i_i_i_shift_rt_()
    test_shr_i_i_shift_rt_()
    test_shr_i_i_ic_shift_rt_()
    test_shr_i_ic_i_shift_rt_()
    test_shr_i_ic_ic_shift_rt_()
    test_lsr_i_ic_ic_shift_rt_()
    test_lsr_i_ic_shift_rt()
    test_lsr_i_i_i_shift_rt()
    test_lsr_i_i_ic_shift_rt()
    test_shr_i_i_ic_shift_rt_negative()
    test_shl_i_i_i_shift_lt()
    test_shl_i_i_ic_shift_lt()
    test_shl_i_ic_i_shift_lt()
    test_shl_i_ic_ic_shift_lt()
    test_shl_i_i_shift_lt()
    test_bxor_i_i_i_xor()
    test_bxor_i_i_ic_xor()
    test_bxor_i_ic_xor()
    test_band_i_i_i_and()
    test_band_i_i_ic_and()
    test_band_i_i_ic_and_2()
    test_bor_i_i_i()
    test_bor_i_i_ic()
    test_bor_i_i_ic_2()
    test_bnot_i_i_2()
    test_rot_i_i_ic_ic()
    test_i_reg_shl_and_pmc_shl_are_consistent()
    # END_OF_TESTS
.end

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub test_shr_i_i_i_shift_rt_
    set $I0, 0b001100
    set $I1, 0b010100
    set $I2, 1
    set $I3, 2
    shr $I4, $I0, $I2
    shr $I2, $I0, $I2
    shr $I1, $I1, $I3
    is( $I4, "6", 'shr_i_i_i (>>)' )
    is( $I2, "6", 'shr_i_i_i (>>)' )
    is( $I1, "5", 'shr_i_i_i (>>)' )
    is( $I0, "12", 'shr_i_i_i (>>)' )
.end

.sub test_shr_i_i_shift_rt_
    set $I0, 0b001100
    set $I1, 0b010100
    set $I2, 1
    set $I3, 2
    shr $I0, $I2
    shr $I1, $I3
    is( $I0, "6", 'shr_i_i (>>)' )
    is( $I1, "5", 'shr_i_i (>>)' )
.end

.sub test_shr_i_i_ic_shift_rt_
    set     $I0, 0b001100
    set     $I1, 0b010100
    shr     $I2, $I0, 1
    shr     $I1, $I1, 2
    is( $I2, "6", 'shr_i_i_ic (>>)' )
    is( $I1, "5", 'shr_i_i_ic (>>)' )
    is( $I0, "12", 'shr_i_i_ic (>>)' )
.end

.sub test_shr_i_ic_i_shift_rt_
    set $I0, 1
    set $I1, 2
    shr $I2, 0b001100, $I0
    shr $I1, 0b010100, $I1
    is( $I2, "6", 'shr_i_ic_i (>>)' )
    is( $I1, "5", 'shr_i_ic_i (>>)' )
.end

.sub test_shr_i_ic_ic_shift_rt_
    shr $I2, 0b001100, 1
    shr $I1, 0b010100, 2
    is( $I2, "6", 'shr_i_ic_ic (>>)' )
    is( $I1, "5", 'shr_i_ic_ic (>>)' )
.end

# The crux of this test is that a proper logical right shift
# will clear the most significant bit, so the shifted value
# will be a positive value on any 2's or 1's complement CPU
.sub test_lsr_i_ic_ic_shift_rt_
    lsr $I2, -40, 1
    lt $I2, 0, BAD
    ok( 1, 'lsr_i_ic_ic (>>)' )
    goto END
  BAD:
    ok( 0, 'lsr_i_ic_ic (>>)' )
  END:
.end

.sub test_lsr_i_ic_shift_rt
    set $I2, -100
    lsr $I2, 1
    lt $I2, 0, BAD
    ok( 1, 'lsr_i_ic (>>) OK')
    goto END
  BAD:
    ok( 0, 'lsr_i_ic (>>)')
  END:
.end

.sub test_lsr_i_i_i_shift_rt
    set $I0, -40
    set $I1, 1
    lsr $I2, $I0, $I1
    lt $I2, 0, BAD
    ok( 1, 'lsr_i_i_i (>>) OK')
    goto END
  BAD:
    ok( 0, 'lsr_i_i_i (>>)')
  END:
.end

# ... and the missing op signature was untested and wrong in JIT/i386
.sub test_lsr_i_i_ic_shift_rt
    set $I0, -40
    lsr $I2, $I0, 1
    lt $I2, 0, BAD
    ok( 1, 'lsr_i_i_ic (>>) OK')
    goto END
  BAD:
    ok( 0, 'lsr_i_i_ic (>>)')
  END:
.end

.sub test_shr_i_i_ic_shift_rt_negative
    set $I0, -40
    shr $I2, $I0, 1
    ge $I2, 0, BAD
    ok( 1, 'shr_i_i_ic (>>) negative OK')
    goto END
  BAD:
    ok( 0, 'shr_i_i_ic (>>) negative')
  END:
.end

.sub test_shl_i_i_i_shift_lt
    set $I0, 0b001100
    set $I1, 0b010100
    set $I2, 2
    set $I3, 1
    shl $I4, $I0, $I2
    shl $I2, $I0, $I2
    shl $I1, $I1, $I3
    is( $I4, "48", 'shl_i_i_i (<<)' )
    is( $I2, "48", 'shl_i_i_i (<<)' )
    is( $I1, "40", 'shl_i_i_i (<<)' )
    is( $I0, "12", 'shl_i_i_i (<<)' )
.end

.sub test_shl_i_i_ic_shift_lt
    set $I0, 0b001100
    set $I1, 0b010100
    shl $I2, $I0, 2
    shl $I1, $I1, 1
    is( $I2, "48", 'shl_i_i_ic (<<)' )
    is( $I1, "40", 'shl_i_i_ic (<<)' )
    is( $I0, "12", 'shl_i_i_ic (<<)' )
.end

.sub test_shl_i_ic_i_shift_lt
    set $I0, 2
    set $I1, 1
    shl $I2, 0b001100, $I0
    shl $I1, 0b010100, $I1
    is( $I2, "48", 'shl_i_ic_i (<<)' )
    is( $I1, "40", 'shl_i_ic_i (<<)' )
.end

.sub test_shl_i_ic_ic_shift_lt
    shl $I2, 0b001100, 2
    shl $I1, 0b010100, 1
    is( $I2, "48", 'shl_i_ic_ic (<<)' )
    is( $I1, "40", 'shl_i_ic_ic (<<)' )
.end

.sub test_shl_i_i_shift_lt
    set $I0, 0b001100
    set $I1, 0b010100
    set $I2, 1
    set $I3, 2
    shl $I0, $I2
    shl $I1, $I3
    is( $I0, "24", 'shl_i_i (<<)' )
    is( $I1, "80", 'shl_i_i (<<)' )
.end

.sub test_bxor_i_i_i_xor
    set     $I0, 0b001100
    set     $I1, 0b100110
    bxor    $I2, $I0, $I1
    is( $I2, "42", 'bxor_i_i_i (^)' )
    bxor    $I1, $I0, $I1
    is( $I1, "42", 'bxor_i_i_i (^)' )
    is( $I0, "12", 'bxor_i_i_i (^)' )
.end

.sub test_bxor_i_i_ic_xor
    set $I0, 0b001100
    bxor $I2, $I0, 0b100110
    is( $I2, "42", 'bxor_i_i_ic (^)' )
    is( $I0, "12", 'bxor_i_i_ic (^)' )
    bxor $I0, $I0, 0b100110
    is( $I0, "42", 'bxor_i_i_ic (^)' )
.end

.sub test_bxor_i_ic_xor
    set $I0, 0b001100
    set $I2, 0b000011
    bxor $I2, $I0
    is( $I2, "15", 'bxor_i|ic (^)' )
    set $I2, 0b001100
    bxor  $I2, $I0
    is( $I2, "0", 'bxor_i|ic (^)' )
    set $I2, 0b101010
    bxor $I2, $I2
    is( $I2, "0", 'bxor_i|ic (^)' )
    set $I2, 0b010101
    bxor $I2, 0b000011
    is( $I2, "22", 'bxor_i|ic (^)' )
.end

.sub test_band_i_i_i_and
    set     $I0, 0b001100
    set     $I1, 0b010110
    band    $I2, $I0,$I1
    is( $I2, "4", 'band_i_i_i (&)' )
    band    $I1,$I0,$I1
    is( $I1, "4", 'band_i_i_i (&)' )
    is( $I0, "12", 'band_i_i_i (&)' )
.end

.sub test_band_i_i_ic_and
    set $I0, 0b001100
    band $I2, $I0,0b010110
    is( $I2, "4", 'band_i_i_ic (&)' )
    is( $I0, "12", 'band_i_i_ic (&)' )
    band $I0,$I0,0b010110
    is( $I0, "4", 'band_i_i_ic (&)' )
.end

.sub test_band_i_i_ic_and_2
    set $I0, 0b001100
    set $I2, 0b000011
    band $I2, $I0
    is( $I2, "0", 'band_i_i|ic (&)' )

    set $I2, 0b001100
    band  $I2, $I0
    is( $I2, "12", 'band_i_i|ic (&)' )

    set $I2, 0b101010
    band $I2, $I2
    is( $I2, "42", 'band_i_i|ic (&)' )
    
    set $I2, 0b010101
    band $I2, 0b000011
    is( $I2, "1", 'band_i_i|ic (&)' )
.end

.sub test_bor_i_i_i
    set $I0, 0b001100
    set $I1, 0b010110
    bor $I2, $I0,$I1
    is( $I2, "30", 'bor_i_i_i (|)' )
    bor $I1,$I0,$I1
    is( $I1, "30", 'bor_i_i_i (|)' )
    is( $I0, "12", 'bor_i_i_i (|)' )
.end

.sub test_bor_i_i_ic
    set $I0, 0b001100
    bor $I2, $I0,0b010110
    is( $I2, "30", 'bor_i_i_ic (|)' )
    is( $I0, "12", 'bor_i_i_ic (|)' )
    bor $I0,$I0,0b010110
    is( $I0, "30", 'bor_i_i_ic (|)' )
.end

.sub test_bor_i_i_ic_2
    set $I0, 0b001100
    set $I2, 0b000011
    bor $I2, $I0
    is( $I2, "15", 'bor_i_i|ic (|) 2' )
    set $I2, 0b001100
    bor  $I2, $I0
    is( $I2, "12", 'bor_i_i|ic (|) 2' )
    set $I2, 0b101010
    bor $I2, $I2
    is( $I2, "42", 'bor_i_i|ic (|) 2' )
    set $I2, 0b010101
    bor $I2, 0b000011
    is( $I2, "23", 'bor_i_i|ic (|) 2' )
.end

.sub test_bnot_i_i_2
    set     $I0, 0b001100
    set     $I1, 0b001100
    set     $I31, 0b111111
    bnot    $I2, $I0
    band    $I2, $I2, $I31
    is( $I2, "51", 'bnot_i_i (~) 2' )
    bnot    $I1, $I1
    band    $I1, $I1, $I31
    is( $I1, "51", 'bnot_i_i (~) 2' )
    is( $I0, "12", 'bnot_i_i (~) 2' )
.end

.sub test_rot_i_i_ic_ic
    .include "iglobals.pasm"
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int intvalsize 
    intvalsize = config['intvalsize']

    .local int int_bits
    int_bits = intvalsize * 8

    set $I0, 0b001100

    gt intvalsize, 4, do64bit

    rot $I1, $I0, 1, 32         # 1 left
    is( $I1, "24", 'rot_i_i_ic_ic' )
    rot $I1, $I0, -1, 32        # 1 right
    is( $I1, "6", 'rot_i_i_ic_ic' )
    goto END

  do64bit:
    rot $I1, $I0, 1, 64         # 1 left
    is( $I1, "24", 'rot_i_i_ic_ic' )
    rot $I1, $I0, -1, 64        # 1 right
    is( $I1, "6", 'rot_i_i_ic_ic' )
    
  END:
.end

## The PMC shl op will promote Integer to Bigint when needed.  We can't stuff a
## BigInt in an I register, but we can produce the same result modulo wordsize.
## [Only we cheat by using the word size minus one, so that we don't have to
## deal with negative numbers.  -- rgr, 2-Jun-07.]
.sub test_i_reg_shl_and_pmc_shl_are_consistent

    .include "iglobals.pasm"
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int gmp
    gmp = config['gmp']
    
    if gmp, runtest
    skip( 2, 'no BigInt lib found' )
    goto END

  runtest:

    ## Figure out the wordsize.  We need integer_modulus because assigning a
    ## too-big BigInt throws an error otherwise.
    .include 'sysinfo.pasm'
    .local int i_bytes_per_word, i_bits_per_word_minus_one
    .local pmc bits_per_word_minus_one, integer_modulus
    i_bytes_per_word = sysinfo .SYSINFO_PARROT_INTSIZE
    i_bits_per_word_minus_one = 8 * i_bytes_per_word
    dec i_bits_per_word_minus_one
    bits_per_word_minus_one = new 'Integer'
    bits_per_word_minus_one = i_bits_per_word_minus_one
    integer_modulus = new 'BigInt'
    integer_modulus = 1
    integer_modulus <<= bits_per_word_minus_one

    ## Test shifting a positive number.
    new $P0, 'Integer'
    set $P0, 1000001
    test_shift($P0, integer_modulus)

    ## Test shifting a negative number.
    set $P0, -1000001
    test_shift($P0, integer_modulus)
  END:
.end

.sub test_shift
    .param pmc number
    .param pmc integer_modulus
    new $P1, 'Integer'
    set $P1, 1
    .local int i_number
    i_number = number

    ## Start the loop.
  loop:
    if $P1 > 100 goto done
    ## shift number and i_number into $P2 and $I2.
    shl $P2, number, $P1
    $I1 = $P1
    shl $I2, i_number, $I1
    ## compare in I registers.
    $P3 = mod $P2, integer_modulus
    $I3 = $P3
    if $I2 >= 0 goto pos_check
    ## The register op gave a negative result, but the modulus will always be
    ## positive.  If the truncated result is correct, then the difference will
    ## be the most negative INTVAL, which is the only number for which -x==x.
    $I4 = $I3 - $I2
    $I5 = - $I4
    if $I4 == $I5 goto ok
    goto bad
  pos_check:
    if $I2 == $I3 goto ok
  bad:
    ok( 0, "oops; not ok: " )
    diag( i_number )
    diag( ' << ' )
    diag( $I1 )
    diag( ' gives I ' )
    diag( $I2 )
    diag( ' vs. P ' )
    diag( $P3 )
    diag( ".\n" )
    diag( $I5 )
    diag( "\n" )
  ok:
    ## set up for the next one
    inc $P1
    goto loop
  done:
    ok( 1, 'finished ok' )
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
