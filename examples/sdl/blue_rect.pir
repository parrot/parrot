# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

blue_rect.pir - draw a blue rectangle with the SDL Parrot bindings

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

    $ ./parrot examples/sdl/blue_rect.pir

=head1 DESCRIPTION

This is a PIR program which draws a blue rectangle with SDL Parrot bindings.

=cut

.sub _main :main
    # first load the necessary libraries
    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Rect.pir"
    load_bytecode "SDL/Color.pir"

    # create an SDL::App object
    .local pmc app
    app = new ['SDL'; 'App']
    app.'init'( 'height' => 480, 'width' => 640, 'bpp' => 32, 'flags' => 1 )

    # fetch the SDL::Surface representing the main window
    .local pmc main_screen
    main_screen = app.'surface'()

    # create an SDL::Rect object
    .local pmc rect
    new rect, ['SDL'; 'Rect']
    rect.'init'( 'height' => 100, 'width'  => 100, 'x' => 270, 'y' => 190 )

    # create an SDL::Color object
    .local pmc color
    new color, ['SDL'; 'Color']
    color.'init'( 'r' => 0, 'g' => 0, 'b' => 255 )

    # draw the rectangle to the surface and update it
    main_screen.'fill_rect'(   rect, color )
    main_screen.'update_rect'( rect )

    # pause for people to see it
    sleep 2

    # and that's it!
    app.'quit'()
    end
.end

=head1 AUTHOR

chromatic, E<lt>chromatic at wgz dot orgE<gt>.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
