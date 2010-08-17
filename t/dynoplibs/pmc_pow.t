#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/pmc_pow.t - Test C<pow> on PMCs

=head1 SYNOPSIS

    % prove t/dynoplibs/pmc_pew.t

=head1 DESCRIPTION

Test handling 3-arg C<pow> on PMCs.

=cut

.loadlib 'trans_ops'

.sub main :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'

    plan (4)

    # Don't check BigInt or BigNum without gmp
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local string gmp
    gmp = config['gmp']

    test_pow('Integer')
    test_pow('Float')

    if gmp goto do_big_ones
        skip( 2, "will not test BigInt or BigNum without gmp" )
        goto end

  do_big_ones:
    test_pow('BigInt')
    test_pow('BigNum')

  end:
.end

.sub test_pow
    .param pmc type

    $P0 = new type
    $P0 = 40
    $P1 = new type
    $P1 = 2
    $P2 = new type
    $P2 = 115200

    $P99 = $P2

    $S0 = "original dest is untouched in pow for "
    $S1 = type
    concat $S0, $S1

    # ignore exceptions
    push_eh done
    pow $P2, $P0, $P1

    $I0 = cmp $P99, 115200

    is( $I0, 0, $S0 )
    goto end

  done:
    ok(1, 'ignoring exceptions')
  end:
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
