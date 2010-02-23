#! parrot
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/removeparent.t - Test OO inheritance

=head1 SYNOPSIS

    % prove t/oo/removeparent.t

=head1 DESCRIPTION

Tests OO features related to the removeparent opcode.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(4)

    remove_1()
    remove_2()
    remove_Y()
    remove_diamond()
.end

.sub remove_1
    $P1 = newclass "Foo"
    $P2 = newclass "Bar"
    $I1 = isa $P2, $P1
    if $I1, fail
    addparent $P2, $P1
    $I1 = isa $P2, $P1
    unless $I1, fail
    removeparent $P2, $P1
    $I1 = isa $P2, $P1
    if $I1, fail
    $I1 = 1
    ok( $I1, 'simple')
fail:
.end

.sub remove_2
    $P1 = newclass "Foo2_1"
    $P2 = newclass "Foo2_2"
    $P3 = newclass "Bar2"
    $I1 = isa $P3, $P1
    if $I1, fail
    $I1 = isa $P3, $P2
    if $I1, fail
    addparent $P3, $P1
    $I1 = isa $P3, $P1
    unless $I1, fail
    $I1 = isa $P3, $P2
    if $I1, fail
    addparent $P3, $P2
    $I1 = isa $P3, $P2
    unless $I1, fail
    removeparent $P3, $P1
    $I1 = isa $P3, $P1
    if $I1, fail
    $I1 = isa $P3, $P2
    unless $I1, fail
    removeparent $P3, $P2
    $I1 = isa $P3, $P1
    if $I1, fail
    $I1 = isa $P3, $P2
    if $I1, fail
    $I1 = 1
    ok( $I1, 'multiple')
fail:
.end

.sub remove_Y
    $P1 = newclass "FooY_1"
    $P2 = newclass "FooY_2"
    $P3 = newclass "BarY_1"
    $P4 = newclass "BarY_2"
    addparent $P3, $P1
    addparent $P3, $P2
    $I1 = isa $P4, $P1
    if $I1, fail
    $I1 = isa $P4, $P2
    if $I1, fail
    addparent $P4, $P3
    $I1 = isa $P4, $P1
    unless $I1, fail
    $I1 = isa $P4, $P2
    unless $I1, fail
    removeparent $P4, $P3
    $I1 = isa $P4, $P1
    if $I1, fail
    $I1 = isa $P4, $P2
    if $I1, fail
    $I1 = 1
    ok( $I1, 'Y')
fail:
.end

.sub remove_diamond
    $P1 = newclass "FooD1"
    $P2 = newclass "FooD2"
    $P3 = newclass "FooD3"
    $P4 = newclass "BarD1"
    addparent $P2, $P1
    addparent $P3, $P1
    addparent $P4, $P2
    addparent $P4, $P3
    $I1 = isa $P4, $P1
    unless $I1, fail
    removeparent $P4, $P2
    $I1 = isa $P4, $P1
    unless $I1, fail
    removeparent $P4, $P3
    $I1 = isa $P4, $P1
    if $I1, fail
    $I1 = 1
    ok( $I1, 'diamond')
fail:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
