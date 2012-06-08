# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

blue_font.pir - draw a friendly message to the screen

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

    $ ./parrot examples/sdl/blue_font.pir
    $

Note that you need to have a font named C<times.ttf> in the current directory.
I recommend making a symlink.

Yes, getting this to work across platforms is tricky, as is distributing a
royalty-free font file.  Maybe soon.

=head1 DESCRIPTION

This is a PIR program which draws a message to the screen.

=cut

.sub main :main

    # first load the necessary libraries
    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Rect.pir"
    load_bytecode "SDL/Color.pir"
    load_bytecode "SDL/Font.pir"

    # create an SDL::App object
    .local pmc app
    app = new ['SDL'; 'App']
    app.'init'( 'height' => 480, 'width' => 640, 'bpp' => 0, 'flags' => 1 )

    # fetch the SDL::Surface representing the main window
    .local pmc main_screen
    main_screen = app.'surface'()

    # create an SDL::Rect object
    .local pmc rect
    new rect, ['SDL'; 'Rect']
    rect.'init'( 'height' => 100, 'width' => 100, 'x' => 194, 'y' => 208 )

    # create SDL::Color objects
    .local pmc blue
    new blue, ['SDL'; 'Color']
    blue.'init'( 'r' => 0, 'g' => 0, 'b' => 255 )

    .local pmc white
    new white, ['SDL'; 'Color']
    white.'init'( 'r' => 255, 'g' => 255, 'b' => 255 )

    .local pmc file_pmc
    file_pmc    = new 'File'

    .local int font_exists
    font_exists = file_pmc.'exists'( 'times.ttf' )

    if font_exists goto have_font
    print "No font found (expect times.ttf in this directory); exiting...\n"
    end

  have_font:
    .local pmc font
    new font, ['SDL'; 'Font']
    font.'init'( 'font_file'  => 'times.ttf', 'point_size' => 48 )

    .local pmc full_rect
    full_rect = new ['SDL'; 'Rect']
    full_rect.'init'( 'width'  => 640, 'height' => 480, 'x' => 0, 'y' => 0 )

    main_screen.'fill_rect'( full_rect, white )
    main_screen.'update_rect'( full_rect )

    # draw the rectangle to the surface and update it
    font.'draw'( 'Hello, world!', blue, main_screen, rect )
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
