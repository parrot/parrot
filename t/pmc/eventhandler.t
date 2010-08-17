#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/eventhandler.t - Parrot Event Handling

=head1 SYNOPSIS

    % prove t/pmc/eventhandler.t

=head1 DESCRIPTION

Tests the EventHandler PMC used by the event system.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(4)

    create_an_event_and_set_attributes()
.end

.sub create_an_event_and_set_attributes
    .local pmc eh
    eh  = new ['EventHandler']
    $S0 = typeof eh
    is( $S0, 'EventHandler', 'Created EventHandler' )

    .local pmc init
    init = new ['Hash']

    .local pmc type
    type         = new ['String']
    type         = 'cool event'
    init['type'] = type

    .local pmc priority
    priority         = new ['Integer']
    priority         = 10
    init['priority'] = priority

    .local pmc code
    code         = get_global 'my_handler'
    init['code'] = code

    eh  = new ['EventHandler'], init
    $S0 = typeof eh
    is( $S0, 'EventHandler', 'Created EventHandler with args' )

    $S1 = eh
    is( $S1, 'cool event', 'Event type confirmed' )

    push_eh bad_args
        eh = new ['EventHandler'], code
    pop_eh

    ok( 1, 'No exception from initializer' )
    .return()

  bad_args:
    ok( 0, 'Exception with bad initializer' )

.end

.sub my_handler
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
