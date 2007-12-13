#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/scheduler.t - Concurrency Scheduler

=head1 SYNOPSIS

    % prove t/pmc/scheduler.t

=head1 DESCRIPTION

Tests the concurrency scheduler PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', "create a concurrency scheduler and set attributes" );
  .sub main :main
    $P0 = new "Scheduler"
    $P1 = new "Task"

    push $P0, $P1

    $P2 = pop $P0

    if null $P2 goto no_task
      $P3 = getattribute $P2, 'status'
      print $P3
      print "\n"
      goto got_task

    no_task:
      print "no task to retrieve\n"

    got_task:

    print 1
    print "\n"
    end
  .end
CODE
created
1
OUT

pir_output_is( <<'CODE', <<'OUT', "create a concurrency scheduler with initializer" );
  .sub main :main
    .local pmc data
    data       = new 'Hash'

    .local pmc id
    id         = new 'Integer'
    id         = 128
    data['id'] = id

    $P0 = new 'Scheduler', data
    $P1 = new 'Task'

    push $P0, $P1

    $P2 = pop $P0

    if null $P2 goto no_task
      $P3 = getattribute $P2, 'status'
      say $P3
      goto got_task

    no_task:
      say 'no task to retrieve'

    got_task:
    say 1

    push_eh bad_initializer
      $P0 = new 'Scheduler', id
    pop_eh

    say "No exception on invalid initializer?  Uh oh!"
    end

  bad_initializer:
    say "Caught exception on bad initializer"
    end
  .end
CODE
created
1
Caught exception on bad initializer
OUT

pir_output_is( <<'CODE', <<'OUT', "add event handler and corresponding event to scheduler",
    todo => 'hold events launch until after 0.5.1 release' );
.sub main :main
    .local pmc handler, handler_init, handler_sub
    .local pmc event, event_init
    handler_init = new 'Hash'
    handler_init['type'] = 'myevent'
    handler_sub = get_global 'my_event_handler'
    handler_init['code'] = handler_sub
    handler = new 'EventHandler', handler_init

    addhandler handler

    event_init = new 'Hash'
    event_init['type'] = 'event'
    event_init['subtype'] = 'myevent'
    event = new 'Task', event_init

    schedule event

.end

.sub my_event_handler
    .param pmc handler
    .param pmc handledtask
    print "called event handler\n"
.end
CODE
called event handler
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
