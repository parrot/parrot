# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

eventhandler.pir - a minesweeper event handler

=head1 SYNOPSIS

    $P0 = new ['SDL'; 'Event']

    $P1 = new "Mines::EventHandler"

    $P0."process_events"( 0.1, $P1, field )

=head1 DESCRIPTION

This is a simple SDL event handler class.

=cut

.namespace ["Mines::EventHandler"]

.sub __onload :load

    $P0 = get_class "Mines::EventHandler"
    unless null $P0 goto END

    newclass $P0, "Mines::EventHandler"

END:

.end

=head1 METHODS

=over 4

=item mouse_button_down( event, field )

Handles mouse click events.
Reveals a field or sets a flag.

=cut

.sub mouse_button_down :method
    .param pmc event
    .param pmc field

    event = event.'event'( 'MouseButton' )

    .local int state
    .local int x
    .local int y

    state = event["state"]

    # SDL_BUTTON_LEFT
    if state != 1 goto DONE
    x = event["x"]
    y = event["y"]
    $I0 = field."mark"( x, y )
    if $I0 goto DONE
    field."click"( x, y, 1 )
DONE:
.end

=item mouse_motion( event, field )

Handles mouse click events.
Reveals a field or sets a flag.

=cut

.sub mouse_motion :method
    .param pmc event
    .param pmc field

    event = event.'event'( 'MouseMotion' )

    .local int state
    .local int x
    .local int y

    state = event["state"]

    # SDL_BUTTON_LEFT
    if state != 1 goto DONE
    x = event["x"]
    y = event["y"]
    $I0 = field."mark"( x, y )
    field."click"( x, y, 1 )
    branch EXIT
DONE:
    field."click"( x, y, 0 )
EXIT:
.end

=item mouse_button_up( event, field )

Handles mouse click events.
Reveals a field or sets a flag.

=cut

.sub mouse_button_up :method
    .param pmc event
    .param pmc field

    event = event.'event'( 'MouseButton' )

    .local int state
    .local int x
    .local int y
    .local int ret

    state = event["state"]
    x = event["x"]
    y = event["y"]

    # SDL_BUTTON_LEFT
    if state == 1 goto REVEAL
    # SDL_BUTTON_RIGHT
    if state == 3 goto SETFLAG
    branch DONE

REVEAL:
    ret = field."reveal"( x, y )
    branch DONE

SETFLAG:
    ret = field."setFlag"( x, y )

DONE:
    if ret goto EXIT
    field."click"( x, y, 0 )

EXIT:
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
