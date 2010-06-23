#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.include 'timer.pasm'

.sub main :main
   say "1..1"

   $P0 = new 'FixedPMCArray', 8
   $P0[0] = .PARROT_TIMER_NSEC
   $P0[1] = 0.1
   $P0[2] = .PARROT_TIMER_HANDLER
   $P1 = get_global 'got_timer'
   $P0[3] = $P1
   $P0[4] = .PARROT_TIMER_REPEAT
   $P0[5] = 0
   $P0[6] = .PARROT_TIMER_RUNNING
   $P0[7] = 1

   $P2 = new 'Timer', $P0
   sleep 1
   say "not ok 3"
.end

.sub got_timer
   say "ok 1"
   exit 0
   say "not ok 2"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
