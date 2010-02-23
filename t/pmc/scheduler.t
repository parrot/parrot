#! parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/scheduler.t - Concurrency Scheduler

=head1 SYNOPSIS

    % prove t/pmc/scheduler.t

=head1 DESCRIPTION

Tests the concurrency scheduler PMC.

=cut


.sub main :main
    .include 'test_more.pir'
    plan(6)

    create_and_set_attributes()
    create_concurrent_scheduler_with_init()
    add_event_and_handler_to_scheduler()
.end

.sub create_and_set_attributes
    $P0 = new ['Scheduler']
    $P1 = new ['Task']

    push $P0, $P1

    $P2 = pop $P0

    if null $P2 goto no_task
      $P3 = getattribute $P2, 'status'
      $S0 = $P3
      is($S0, "created", "got task")
      goto got_task

no_task:
      ok(0,"no task to retrieve")

got_task:

      ok(1, "didn't explode")
.end

.sub create_concurrent_scheduler_with_init
    .local pmc data
    data       = new ['Hash']

    .local pmc id
    id         = new ['Integer']
    id         = 128
    data['id'] = id

    $P0 = new ['Scheduler'], data
    $P1 = new ['Task']

    push $P0, $P1

    $P2 = pop $P0

    if null $P2 goto no_task
      $P3 = getattribute $P2, 'status'
      $S0 = $P3
      is($S0, "created", "status is ok")
      goto got_task

no_task:
      ok(0, 'no task to retrieve')

got_task:
    ok(1, "got a task")

    push_eh bad_initializer
      $P0 = new ['Scheduler'], id
    pop_eh

    ok(0, "No exception on invalid initializer?  Uh oh!")
    end

bad_initializer:
    ok(1, "Caught exception on bad initializer")
.end


.sub add_event_and_handler_to_scheduler
    .local pmc handler, handler_init, handler_sub
    .local pmc event, event_init
    handler_init = new ['Hash']
    handler_init['type'] = 'myevent'
    handler_sub = get_global 'my_event_handler'
    handler_init['code'] = handler_sub
    handler = new ['EventHandler'], handler_init

    addhandler handler

    event_init = new ['Hash']
    event_init['type'] = 'event'
    event_init['subtype'] = 'myevent'
    event = new ['Task'], event_init

    schedule event

.end

.sub my_event_handler
    .param pmc handler
    .param pmc handledtask
    ok(1, "called event handler")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
