# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

mines.pir - a minesweeper clone for parrot (with parrot's SDL bindings)

=head1 SYNOPSIS

To run this game, be in the Parrot directory and run the following command:

        $ parrot examples/sdl/minesweeper/mines.pir
        $

=head1 DESCRIPTION

This is a PIR program of a minesweeper clone for Parrot.

=head1 FUNCTIONS

=over 4

=item _main

The main function.

=cut

.sub _main :main
    .param pmc args
    .local pmc field
    .local pmc screen
    .local int debug

    # the debug mode is activated if you pass in any argument
    debug = args
    dec debug

    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Event.pir"
    load_bytecode "SDL/EventHandler.pir"
    load_bytecode "SDL/Rect.pir"
    load_bytecode "SDL/Surface.pir"
    load_bytecode "SDL/Color.pir"
    load_bytecode "SDL/Image.pir"
    load_bytecode "examples/sdl/minesweeper/field.pir"

    # setup the screen properties
    $P0 = new 'Hash'
    $P0["height"] = 480
    $P0["width"]  = 640
    $P0["bpp"]    =  32
    $P0["flags"]  =   5

    # create the SDL object
    $P0 = new ['SDL'; 'App'], $P0
    screen = $P0."surface"()

    # choose a "random" field
    $I0 = time

    # setup field properties
    $P0 = new 'Hash'
    $P0['width']  = 40
    $P0['height'] = 28
    $P0['mines']  = 0.1075
#    $P0['mines']  = 0.0075
    $P0['level']  = $I0
    $P0['screen'] = screen
    $P0['debug']  = debug

    # create the field
    field = new "Mines::Field", $P0

    # draw the field
    field.'draw'()

    # runloop
    $P0 = new ['SDL'; 'Event']
    $P1 = new "Mines::EventHandler"
    $P0."process_events"( 0.1, $P1, field )

    end
.end

=back

=head1 CREDITS

The graphics were taken from KMines L<http://kmines.sf.net/> screenshots.

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
