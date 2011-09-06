#! perl
# Copyright (C) 2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/pmc/task.t - Concurrent Task

=head1 SYNOPSIS

    % prove t/pmc/task.t

=head1 DESCRIPTION

Tests the task PMC used by the concurrency scheduler.

=cut

pir_output_is( <<'CODE', <<'OUT', "create a task and set attributes" );
  .sub main :main
    $P0 = new ['Task']
    $P1 = getattribute $P0, 'status'
    print $P1
    print "\n"

    $P2 = new ['String']
    $P2 = "inprocess"
    setattribute $P0, 'status', $P2

    $P3 = getattribute $P0, 'status'
    print $P3
    print "\n"

    $P2 = new ['String']
    $P2 = "event"
    setattribute $P0, 'type', $P2

    $P3 = getattribute $P0, 'type'
    print $P3
    print "\n"

    $P2 = new ['String']
    $P2 = "sub event"
    setattribute $P0, 'subtype', $P2

    $P3 = getattribute $P0, 'subtype'
    print $P3
    print "\n"

    $P2 = new ['Integer']
    $P2 = 10
    setattribute $P0, 'priority', $P2

    $P3 = getattribute $P0, 'priority'
    print $P3
    print "\n"

    $P2 = new ['Integer']
    $P2 = 7405
    setattribute $P0, 'id', $P2

    $P3 = getattribute $P0, 'id'
    print $P3
    print "\n"

    $P2 = new ['Float']
    $P2 = 1.1
    setattribute $P0, 'birthtime', $P2

    $P3 = getattribute $P0, 'birthtime'
    print $P3
    print "\n"

    $P2 = new ['String']
    $P2 = "additional data"
    setattribute $P0, 'data', $P2

    $P2 = get_global 'code'
    setattribute $P0, 'code', $P2

    # Make sure the mark vtable is exercised
    sweep 1

    end
  .end

  .sub code
    say "sub"
  .end
CODE
created
inprocess
event
sub event
10
7405
1.1
OUT

pir_error_output_like( <<'CODE', <<'OUTPUT', "init with wrong initializer type" );
.sub main :main
    $P0 = new ['String']
    $P0 = 'foo'

    $P1 = new ['Task'], $P0
.end
CODE
/Task initializer must be a Hash/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "set_string_native set type of task" );
.sub main :main
    $P0 = new ['Task']

    $P1 = getattribute $P0, 'type'
    say $P1

    $P2 = new ['String']
    $P2 = "new_type"
    setattribute $P0, 'type', $P2

    $P1 = getattribute $P0, 'type'
    say $P1

    $P0 = "newer_type"

    $P1 = getattribute $P0, 'type'
    say $P1
.end
CODE

new_type
newer_type
OUTPUT

pir_output_is( <<'CODE', <<'OUT', 'create a task and set attributes in init' );
  .sub main :main
    .local pmc data
    data = new ['Hash']

    $P2 = new ['String']
    $P2 = 'inprocess'
    data['status'] = $P2

    $P2 = new ['String']
    $P2 = 'event'
    data['type'] = $P2

    $P2 = new ['Integer']
    $P2 = 10
    data['priority'] = $P2

    $P2 = new ['Integer']
    $P2 = 7405
    data['id'] = $P2

    $P2 = new ['Float']
    $P2 = 1.1
    data['birthtime'] = $P2

    $P0 = new ['Task'], data

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

pir_output_is( <<'CODE', <<'OUT', 'create a task and get invalid attribute' );
  .sub main :main
    $P0 = new ['Task']

    $P0 = getattribute $P0, 'foobar'
    isnull $I0, $P0

    if $I0, ok
    say 'fail'

  ok:
    say 'ok'
  .end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "freeze and thaw a task" );
  .sub main :main
    $P0 = new ['Task']

    $P2 = new ['String']
    $P2 = "inprocess"
    setattribute $P0, 'status', $P2

    $P2 = new ['String']
    $P2 = "event"
    setattribute $P0, 'type', $P2

    $P2 = new ['Integer']
    $P2 = 10
    setattribute $P0, 'priority', $P2

    $P2 = new ['Integer']
    $P2 = 7405
    setattribute $P0, 'id', $P2

    $P2 = new ['Float']
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
