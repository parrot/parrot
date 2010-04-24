#! parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/gziphandle.t - test the GzipHandle PMC

=head1 SYNOPSIS

        % parrot t/dynpmc/gziphandle.t

=head1 DESCRIPTION

Tests the C<GzipHandle> PMC, a zlib wrapper.

=cut

.sub 'main' :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'
    .local pmc config_hash, interp
    .local int num_tests

    num_tests = 3
    plan(num_tests)
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['has_zlib']
    unless $S0 goto no_zlib

    $P0 = loadlib 'gziphandle'
    test_handle()
    test_version()
    .return()

  no_zlib:
    skip(num_tests, 'No zlib library available')
    .return()
.end


.sub 'test_handle'
    $P0 = new 'GzipHandle'
    $S0 = typeof $P0
    is($S0, 'GzipHandle', 'GzipHandle typeof')
    $I0 = does $P0, 'Handle'
    ok($I0, 'does Handle')
.end

.sub 'test_version'
    $P0 = new 'GzipHandle'
    $S0 =$P0.'version'()
    diag($S0)
    $I0 = index $S0, '1.'
    is($I0, 0, 'zlib version')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:


