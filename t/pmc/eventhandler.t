#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

t/pmc/eventhandler.t - Parrot Event Handling

=head1 SYNOPSIS

    % prove t/pmc/eventhandler.t

=head1 DESCRIPTION

Tests the EventHandler PMC used by the event system.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(8)

    create_an_event_and_set_attributes()
    exception_initializer_arg_type()
    exception_invoke_without_code()
    get_string_null()
    mark()
    # Invoke broken, see below.
    #invoke_eventhandler()
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

    sweep 1

    eh  = new ['EventHandler'], init
    $S0 = typeof eh
    is( $S0, 'EventHandler', 'Created EventHandler with args' )

    $S1 = eh
    is( $S1, 'cool event', 'Event type confirmed' )

    # Test set_integer_native, but no way to confirm.
    eh = 5

    push_eh bad_args
        eh = new ['EventHandler'], code
    pop_eh

    ok( 1, 'No exception from initializer' )

    push_eh bad_args
        eh = new ['EventHandler'], type
    pop_eh

    .return()

  bad_args:
    ok( 1, 'Exception with bad initializer' )

.end

.sub exception_initializer_arg_type
    .local pmc eh
    $P0 = new ['String']
    $P0 = 'foo'

  push_eh E1
    eh = new ['EventHandler'], $P0
    $I1 = 0
    say 'Failed to throw exception'
  E1:
    pop_eh
    get_results '0', $P0
    $S0 = $P0
    eq $S0, "EventHandler initializer must be Sub or Hash", OK1
    $I1 = 0
    print $S0
    say ' is wrong exception type'
  OK1:
    ok($I1, 'Expected exception from initializer with invalid arg type')
    $I1 = 1
.end

.sub exception_invoke_without_code
    .local pmc eh
    eh = new ['EventHandler'], $P0

  push_eh E1
    eh()
    $I1 = 0
    say 'Failed to throw exception'
  E1:
    pop_eh
    get_results '0', $P0
    $S0 = $P0
    eq $S0, "No code object to execute in EventHandler", OK1
    $I1 = 0
    print $S0
    say ' is wrong exception type'
  OK1:
    ok($I1, 'Expected exception on invoke without code')
    $I1 = 1
.end

.sub mark
    .local pmc eh
    eh = new ['EventHandler']

    # Exercise mark vtable
    sweep 1
.end

.sub get_string_null
    .local pmc eh
    eh  = new ['EventHandler']

    $S0 = eh
    is( $S0, '', 'Event type confirmed (as null)' )
.end

#.sub invoke_eventhandler
#    .local pmc eh
#    .local pmc code
#
#    code = get_global 'test_handler'
#    eh   = new ['EventHandler'], code
#
#    print "Invoking eh\n"
#    # Unsure of the arguments that should be passed, but seems to crash regardless
#    # EventHandler's VTABLE_invoke() broken?
#    # See ticket http://trac.parrot.org/parrot/ticket/1894
#    eh()
#.end

.sub my_handler
.end

#.sub test_handler
#    ok ( 1, 'Invoked Exception handler.' )
#.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
