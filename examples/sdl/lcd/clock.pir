# $Id$

=head1 NAME

clock.pir - LCD clock

=head1 SYNOPSIS

    ./parrot examples/sdl/lcd/clock.pir

=head1 DESCRIPTION

This example demonstrates the SDL::LCD object. It shows a simple clock.

=head1 FUNCTIONS

=over 4

=cut

.include "tm.pasm"
.include "timer.pasm"
.loadlib 'sys_ops'
.loadlib 'math_ops'

=item _main

The main function.

=cut

.sub _main :main
    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Event.pir"
    load_bytecode "SDL/EventHandler.pir"
    load_bytecode "SDL/LCD.pir"

    # create the SDL application object
    .local pmc app
    app = new ['SDL'; 'App']
    app.'init'( 'height' => 21, 'width' => 94, 'bpp' => 16, 'flags' => 5 )

    .local pmc screen
    screen = app.'surface'()
    set_global 'screen', screen

    # create the LCD
    .local pmc lcd
    lcd = new ['SDL'; 'LCD']
    set_global 'LCD', lcd

    # draw the watch
    drawWatch()

    # create the timer
    $P1 = get_global "drawWatch"
    $P0 = new 'Timer'
    $P0[.PARROT_TIMER_NSEC] = 0.5
    $P0[.PARROT_TIMER_HANDLER] = $P1
    $P0[.PARROT_TIMER_REPEAT] = -1
    $P0[.PARROT_TIMER_RUNNING] = 1
    # store the timer somewhere, it will be
    # collected and destroyed otherwise
    set_global "timer", $P0

    #
    # event loop
    #
    .local pmc eh
    .local pmc loop

    eh   = new ['SDL'; 'EventHandler']
    loop = new ['SDL'; 'Event']
    loop.'init'()
    loop.'process_events'( 0.1, eh )
.end

=item drawWatch

Creates, sets and redraws the LCD display content.

=cut

.sub drawWatch
    # decode the current time
    $I0 = time
    $P0 = decodelocaltime $I0

    # use a dot or a space?
    $N0 -= $I0
    $S2 = ":"
    if $N0 < 0.5 goto USE_DOTS
    $S2 = " "
USE_DOTS:

    # hours
    $I0 = $P0[.TM_HOUR]
    $I0 /= 10
    if $I0 > 0 goto NO_SPACE
    $S0 = ' '
    branch HOUR
NO_SPACE:
    $S0 = $I0
HOUR:
    $I0 = $P0[.TM_HOUR]
    cmod $I0, $I0, 10
    $S1 = $I0
    concat $S0, $S1

    # minutes
    concat $S0, $S2
    $I0 = $P0[.TM_MIN]
    $I0 /= 10
    $S1 = $I0
    concat $S0, $S1
    $I0 = $P0[.TM_MIN]
    cmod $I0, $I0, 10
    $S1 = $I0
    concat $S0, $S1

    # seconds
    concat $S0, $S2
    $I0 = $P0[.TM_SEC]
    $I0 /= 10
    $S1 = $I0
    concat $S0, $S1
    $I0 = $P0[.TM_SEC]
    cmod $I0, $I0, 10
    $S1 = $I0
    concat $S0, $S1

    # set the time
    $P0 = get_global "LCD"
    $P0 = $S0

    # redraw the LCD
    $P1 = get_global "screen"
    $P0.'draw'( $P1 )
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
