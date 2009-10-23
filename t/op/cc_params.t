#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/op/cc_params.t - Parrot Calling Conventions parameter matching tests

=head1 SYNOPSIS

% prove t/op/cc_params.t

=head1 DESCRIPTION

Tests Parrot calling conventions for parameter matching and mismatching.

=cut

.sub test_main :main
    .include 'test_more.pir'
    plan(11)
    'call_sig_with_no_args'()
    'call_sig_with_positionals'(1, 2, 3)
    'call_sig_with_named'(4 :named("x"), 5 :named("y"))
.end

.sub call_sig_with_no_args
    .param pmc sig :call_sig
    $S0 = typeof sig
    is('CallSignature', $S0)
    $I0 = elements sig
    is(0, $I0)
.end

.sub call_sig_with_positionals
    .param pmc sig :call_sig
    $S0 = typeof sig
    is('CallSignature', $S0)
    $I0 = elements sig
    is(3, $I0)
    $I1 = sig[0]
    is(1, $I1)
    $I2 = sig[1]
    is(2, $I2)
    $I3 = sig[2]
    is(3, $I3)
.end

.sub call_sig_with_named
    .param pmc sig :call_sig
    $S0 = typeof sig
    is('CallSignature', $S0)
    $I0 = elements sig
    is(0, $I0)
    $I1 = sig["x"]
    is(4, $I1)
    $I2 = sig["y"]
    is(5, $I2)
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
