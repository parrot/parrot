#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/parrotrunningthread.t - test the ParrotRunningThread PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotrunningthread.t

=head1 DESCRIPTION

Tests the ParrotRunningThread PMC.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(2)

    new $P0, ['ParrotRunningThread']
    ok(1, 'Instantiated .ParrotRunningThread')

    test_set_integer_native($P0)
.end

.sub 'test_set_integer_native'
    .param pmc thread

    .local string desc
    desc   = 'setting invalid thread id should throw exception'

    push_eh invalid_thread_id_handler
    thread = -1
    pop_eh

    ok(0, desc)

  invalid_thread_id_handler:
    .local pmc e, c
    .get_results( e )

    .local string message
    message   = e

    is( message, 'Attempt to set invalid thread id -1', desc )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
