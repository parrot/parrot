#!parrot
# Copyright (C) 2009-2010, Parrot Foundation.
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
    plan(21)
    'call_sig_with_no_args'()
    'call_sig_with_positionals'(1, 2, 3)
    'call_sig_with_named'(4 :named("x"), 5 :named("y"))

    $P0 = newclass ['OMGClass']
    $P1 = new $P0
    $P1.'lolmethod'()
    $P1.'wtfmethod'(1, 2, 3 :named("beer"), 4 :named("borovicka"))
.end

.sub call_sig_with_no_args
    .param pmc sig :call_sig
    $S0 = typeof sig
    is('CallContext', $S0)
    $I0 = elements sig
    is(0, $I0)
.end

.sub call_sig_with_positionals
    .param pmc sig :call_sig
    $S0 = typeof sig
    is('CallContext', $S0)
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
    is('CallContext', $S0)
    $I0 = elements sig
    is(0, $I0)
    $I1 = sig["x"]
    is(4, $I1)
    $I2 = sig["y"]
    is(5, $I2)
.end


.namespace ['OMGClass']
.sub 'lolmethod' :method
    .param pmc sig :call_sig

    # Self is set up correctly.
    $S0 = typeof self
    is('OMGClass', $S0)

    # Have call sig.
    $S0 = typeof sig
    is('CallContext', $S0)

    # First element is self.
    $P0 = sig[0]
    $I0 = 1
    eq_addr $P0, self, sig_ok
    $I0 = 0
  sig_ok:
    ok($I0)
.end


.sub 'wtfmethod' :method
    .param pmc sig :call_sig

    # Self is set up correctly.
    $S0 = typeof self
    is('OMGClass', $S0)

    # Have call sig.
    $S0 = typeof sig
    is('CallContext', $S0)

    # First element is self.
    $P0 = sig[0]
    $I0 = 1
    eq_addr $P0, self, sig_ok
    $I0 = 0
  sig_ok:
    ok($I0)

    # Positionals OK.
    $I0 = sig[1]
    is(1, $I0)
    $I0 = sig[2]
    is(2, $I0)

    # Nameds OK.
    $I0 = sig['beer']
    is(3, $I0)
    $I0 = sig['borovicka']
    is(4, $I0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
