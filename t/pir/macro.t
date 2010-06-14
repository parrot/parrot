#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pir/macro.t - Tests for macros in PIR

=head1 SYNOPSIS

    % prove t/pir/macro.t

=head1 DESCRIPTION

Tests for macros in PIR.

=cut

.macro foo()
    ok(1, 'basic macro')
.endm

.macro bar(x)
    ok(.x, 'basic macro with argument')
.endm

.macro_const PI_APPROX 4

.sub main :main
    .include 'test_more.pir'
    plan(3)
    .foo()
    .bar(42)
    is(.PI_APPROX, 4, '.macro_const')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

