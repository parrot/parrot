#! parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/obscure.t - Tests for obscure mathematical functions

=head1 SYNOPSIS

        % prove t/dynoblibs/obscure.t

=head1 DESCRIPTION

Tests obscure.ops

=cut

.loadlib 'obscure_ops'
.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'
    plan(17)
    ok(1,"load obscure_ops")

    test_covers()
    test_vers()
    test_hav()
    test_exsec()
.end

.sub test_covers
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    covers x, 0
    .fp_eq_ok(x, 1, "covers of 0")
    covers x, halfpi
    .fp_eq_ok(x, 0, 'covers of pi/2')
    covers x, pi
    .fp_eq_ok(x, 1, 'covers of pi')
    covers x, y
    .fp_eq_ok(x, 0.292893218813453, 'covers of pi/4')
.end

.sub test_vers
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    vers x, 0
    .fp_eq_ok(x, 0, "vers of 0")
    vers x, halfpi
    .fp_eq_ok(x, 1, 'vers of pi/2')
    vers x, pi
    .fp_eq_ok(x, 2, 'vers of pi')
    vers x, y
    .fp_eq_ok(x, 0.292893218813453, 'covers of pi/4')
.end

.sub test_hav
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    hav x, 0
    .fp_eq_ok(x, 0, "hav of 0")
    hav x, halfpi
    .fp_eq_ok(x, 0.5, 'hav of pi/2')
    hav x, pi
    .fp_eq_ok(x, 1, 'hav of pi')
    hav x, y
    .fp_eq_ok(x, 0.146446609406726, 'hav of pi/4')
.end

.sub test_exsec
    .local num x, pi, halfpi, y
    y      = atan 1.0, 1.0
    halfpi = y
    halfpi *= 2
    pi     = halfpi
    pi     *= 2
    hav x, 0
    .fp_eq_ok(x, 0, "exsec of 0")
    exsec x, halfpi
    .fp_eq_ok(x, 'nan', 'exsec of pi/2')
    exsec x, pi
    .fp_eq_ok(x, -2, 'exsec of pi')
    exsec x, y
    .fp_eq_ok(x, 0.414213562373095, 'exsec of pi/4')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
