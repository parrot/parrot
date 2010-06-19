#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/schedulermessage - test the SchedulerMessage PMC

=head1 SYNOPSIS

    % prove t/pmc/schedulermessage.t

=head1 DESCRIPTION

Tests the SchedulerMessage PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(7)

    init_check()
    type_and_id_tests()
    freeze_thaw_tests()
    hash_tests()
.end

.sub init_check
    new $P0, ['SchedulerMessage']
    ok(1, 'Instantiated SchedulerMessage PMC')
.end

.sub type_and_id_tests
    $P0 = new ['SchedulerMessage']
    $P0 = 2345
    $P0 = "some kinda message"

    $S0 = $P0
    is($S0 , "some kinda message", "scheduler message type stored/retrieved successfully")

    $I0 = $P0
    is($I0, 2345, "scheduler id type stored/retrieved successfully")

.end

.sub freeze_thaw_tests
    $P0 = new ['SchedulerMessage']
    $P0 = 86
    $P0 = "Smart message"

    $S0 = freeze $P0
    $P1 = thaw $S0

    $S0 = $P1
    is($S0, "Smart message", "frozen message has correct type")

    $I0 = $P1
    is($I0, 86, "frozen message has correct id")

.end


.sub hash_tests
    $P0 = new ['Hash']
    $P0['id'] = 9
    $P0['type'] = 'nine'

    $P1 = new ['SchedulerMessage'], $P0

    # Make sure the mark vtable function is exercised.
    null $P0
    sweep 1

    $S0 = $P1
    is($S0, "nine", "hash-initialized message has correct type")

    $I0 = $P1
    is($I0, 9, "hash-initialized message has correct id")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
