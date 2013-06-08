#!./parrot
# Copyright (C) 2012-2013, Parrot Foundation.

=head1 NAME

examples/threads/tasks.pir - Basic Task PMC examples

=head1 SYNOPSIS

    % ./parrot examples/threads/tasks.pir

=head1 DESCRIPTION

This is a basic example of using the Task PMC. At a high level, each Task PMC
can be assigned a bit of code to run as a "task", as well as its own copy of
data to operate on.

Calling the schedule opcode on a Task PMC object is what starts the chain of
execution.

The output of this program will be a non-deterministic string of a's and b's.
Their order will change on each execution.

=cut

.sub main :main
    .local pmc task, a, b
    task = get_global 'task'
    a = new ['String']
    a = "a"
    b = new ['String']
    b = "b"
    $P0 = new ['Task']
    setattribute $P0, 'code', task
    setattribute $P0, 'data', a
    $P1 = new ['Task']
    setattribute $P1, 'code', task
    setattribute $P1, 'data', b
    schedule $P0
    schedule $P1
    sleep 10
    exit 0
.end

.sub task
    .param pmc name
    .local int i
start:
    print name
    i = 0
loop:
    inc i
    if i >= 100000 goto start
    goto loop
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
