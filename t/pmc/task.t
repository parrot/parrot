#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/task.t - Concurrent Task

=head1 SYNOPSIS

    % prove t/pmc/task.t

=head1 DESCRIPTION

Tests the task PMC used by the concurrency scheduler.

=cut

pir_output_is( <<'CODE', <<'OUT', "create a task and set attributes" );
  .sub main :main
    $P0 = new "Task"
    $P1 = getattribute $P0, 'status'
    print $P1
    print "\n"

    $P2 = new "String"
    $P2 = "inprocess"
    setattribute $P0, 'status', $P2

    $P3 = getattribute $P0, 'status'
    print $P3
    print "\n"

    $P2 = new "String"
    $P2 = "event"
    setattribute $P0, 'type', $P2

    $P3 = getattribute $P0, 'type'
    print $P3
    print "\n"

    $P2 = new "Integer"
    $P2 = 10
    setattribute $P0, 'priority', $P2

    $P3 = getattribute $P0, 'priority'
    print $P3
    print "\n"

    $P2 = new "Integer"
    $P2 = 7405
    setattribute $P0, 'id', $P2

    $P3 = getattribute $P0, 'id'
    print $P3
    print "\n"

    $P2 = new "Float"
    $P2 = 1.1
    setattribute $P0, 'birthtime', $P2

    $P3 = getattribute $P0, 'birthtime'
    print $P3
    print "\n"
    end
  .end
CODE
created
inprocess
event
10
7405
1.1
OUT

pir_output_is( <<'CODE', <<'OUT', 'create a task and set attributes in init' );
  .sub main :main
    .local pmc data
    data = new 'Hash'

    $P2 = new 'String'
    $P2 = 'inprocess'
    data['status'] = $P2

    $P2 = new 'String'
    $P2 = 'event'
    data['type'] = $P2

    $P2 = new 'Integer'
    $P2 = 10
    data['priority'] = $P2

    $P2 = new 'Integer'
    $P2 = 7405
    data['id'] = $P2

    $P2 = new 'Float'
    $P2 = 1.1
    data['birthtime'] = $P2

    $P0 = new 'Task', data

    $P3 = getattribute $P0, 'status'
    say $P3

    $P3 = getattribute $P0, 'type'
    say $P3

    $P3 = getattribute $P0, 'priority'
    say $P3

    $P3 = getattribute $P0, 'id'
    say $P3

    $P3 = getattribute $P0, 'birthtime'
    say $P3
    end
  .end
CODE
inprocess
event
10
7405
1.1
OUT

pir_output_is( <<'CODE', <<'OUT', "freeze and thaw a task" );
  .sub main :main
    $P0 = new "Task"

    $P2 = new "String"
    $P2 = "inprocess"
    setattribute $P0, 'status', $P2

    $P2 = new "String"
    $P2 = "event"
    setattribute $P0, 'type', $P2

    $P2 = new "Integer"
    $P2 = 10
    setattribute $P0, 'priority', $P2

    $P2 = new "Integer"
    $P2 = 7405
    setattribute $P0, 'id', $P2

    $P2 = new "Float"
    $P2 = 1.1
    setattribute $P0, 'birthtime', $P2

    $S0  = freeze $P0
    $P10 = thaw $S0

    $P3 = getattribute $P10, 'status'
    print $P3
    print "\n"

    $P3 = getattribute $P10, 'type'
    print $P3
    print "\n"

    $P3 = getattribute $P10, 'priority'
    print $P3
    print "\n"

    $P3 = getattribute $P10, 'id'
    print $P3
    print "\n"

    $P3 = getattribute $P10, 'birthtime'
    print $P3
    print "\n"
    end
  .end
CODE
inprocess
event
10
7405
1.1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
