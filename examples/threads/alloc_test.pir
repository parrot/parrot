#!./parrot
# Copyright (C) 2012-2013, Parrot Foundation.

=head1 NAME

examples/threads/alloc_test.pir - Thread allocation examples

=head1 SYNOPSIS

    % ./parrot examples/threads/alloc_test.pir

=head1 DESCRIPTION

If you can explain what this example does in plain English, be my
guest.

=cut

.sub main :main
    .local pmc task, sayer, dummy
    sayer = get_global 'sayer'
    dummy = new ['Integer']
    task = new ['Task']
    setattribute task, 'code', sayer
    setattribute task, 'data', dummy
    schedule task
    wait task
.end

.sub sayer
    .param pmc proxy
    .local pmc interp, task, result_sub, result_task, dummy

    interp = getinterp
    dummy = new ['Integer']
    result_sub = get_global 'result_sub'

again:
    result_task = new ['Task']
    setattribute result_task, 'code', result_sub
    setattribute result_task, 'data', dummy
    interp.'schedule_proxied'(result_task, proxy)

    result_task = new ['Task']
    setattribute result_task, 'code', result_sub
    interp.'schedule_proxied'(result_task, proxy)

    goto again
.end

.sub result_sub
    .param pmc dummy
    .local pmc dummy2
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
