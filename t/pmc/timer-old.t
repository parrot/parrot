#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/pmc/timer.t - Timer PMC tests

=head1 SYNOPSIS

    % prove t/pmc/timer.t

=head1 DESCRIPTION

Tests the Timer PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', "Timer start/repeat/stop");
.include "timer.pasm"
.sub tick
    get_global $P0, 'counter'
    inc $P0
.end
.sub main :main
    .local pmc timer
    .local int t1, t2, r
    .const 'Sub' tick = 'tick'
    $P0 = new 'Integer'
    set_global 'counter', $P0
    timer = new ['Timer']
    timer[.PARROT_TIMER_HANDLER] = tick
    timer[.PARROT_TIMER_INTERVAL] = 0.1
    timer[.PARROT_TIMER_REPEAT] = -1
    timer[.PARROT_TIMER_RUNNING] = 1
    # Allow at least two ticks
    sleep 0.2
    sleep 0.2
    timer[.PARROT_TIMER_RUNNING] = 0
    # Give a chance to run a possible pending tick
    sleep 0.2
    get_global $P0, 'counter'
    t1 = $P0
    r = isgt t1, 1
    say r
    # Give a chance to tick to verify that is stopped
    sleep 0.2
    sleep 0.2
    get_global $P0, 'counter'
    t2 = $P0
    r = iseq t1, t2
    say r
.end
CODE
1
1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
