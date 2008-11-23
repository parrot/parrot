#! parrot
# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/closure.t - test Closure PMC


=head1 SYNOPSIS

    % prove t/pmc/closure.t

=head1 DESCRIPTION

Tests the Closure PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(3)

    new_closure()
    sweep_closures()
.end

.sub new_closure
    new $P0, 'Closure'
    ok( 1, 'Created new Closure' )
    isa_ok( $P0, 'Closure' )
.end

.sub sweep_closures
## This is a regression test for a bug in which Closure:mark expected
## sub->outer_ctx to be initialized, regardless of whether the closure
## had ever been called.
    .lex "X", $P40
    $P40 = new 'Integer'
    $P40 = 22
    .const 'Sub' $P43 = "___internal_test_1_0_"
    newclosure $P44, $P43
    sweep 1
    ok( 1, 'we lived' )
.end

.sub ___internal_test_1_0_ :outer('sweep_closures')
    ok( 0, 'we should never get here' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
