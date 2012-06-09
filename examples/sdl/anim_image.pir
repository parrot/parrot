# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

anim_image.pir - animate an image in a Parrot SDL window

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

    $ ./parrot examples/sdl/anim_image.pir
    Drew 1080 frames in 0.948230 seconds (1138.964142 fps)
    $

=head1 DESCRIPTION

This program demonstrates how to animate an image in a Parrot SDL window.

=cut

.sub _main :main
    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Color.pir"
    load_bytecode "SDL/Rect.pir"
    load_bytecode "SDL/Image.pir"
    load_bytecode "SDL/Sprite.pir"


    .local pmc app
    app = new ['SDL'; 'App']
    app.'init'( 'height' => 480, 'width' => 640, 'bpp' => 0, 'flags' => 1 )

    .local pmc main_screen
    main_screen = app.'surface'()

    .local pmc dest_rect
    dest_rect   = new ['SDL'; 'Rect']
    dest_rect.'init'( 'height' => 100, 'width' => 100, 'x' => 0, 'y' => 190 )

    .local pmc prev_rect
    prev_rect   = new ['SDL'; 'Rect']
    prev_rect.'init'( 'height' => 100, 'width' => 101, 'x' => 0, 'y' => 190 )

    .local pmc source_rect
    source_rect = new ['SDL'; 'Rect']
    source_rect.'init'( 'height' => 56, 'width' => 100, 'x' => 0, 'y' => 0 )

    .local pmc black
    black = new ['SDL'; 'Color']
    black.'init'( 'r' => 0, 'g' => 0, 'b' => 0 )

    .local pmc image
    image    = new ['SDL'; 'Image']
    image.'init'( 'examples/sdl/parrot_small.png' )

    .local pmc sprite
    sprite = new ['SDL'; 'Sprite']
    sprite.'init'( 'surface' => image, 'source_x' => 0, 'source_y' => 0, 'dest_x' => 0, 'dest_y' => 190, 'bgcolor' => black )

    .local num start_time
    time start_time

    _animate_on_x_axis( main_screen, sprite,   0, 540,  1)
    sleep 1
    _animate_on_x_axis( main_screen, sprite, 540,   0, -1)

    .local num end_time
    time end_time

    .local num total_time
    total_time = end_time - start_time
    dec total_time

    .local num fps
    fps = 1080/total_time

    print "Drew 1080 frames in "
    print total_time
    print " seconds ("
    print fps
    print " fps)\n"

    sleep 1

    app.'quit'()
    end
.end

.sub _animate_on_x_axis
    .param pmc screen
    .param pmc sprite
    .param int start_pos
    .param int end_pos
    .param int step_size

    .local int x_pos
    x_pos = start_pos

    .local pmc prev_rect
    .local pmc rect

    .local pmc rect_array
    rect_array = new 'ResizablePMCArray'
    set rect_array, 2

_loop:
        add x_pos, step_size
        sprite.'x'( x_pos )
        (prev_rect, rect) = sprite.'draw_undraw'( screen )
        set rect_array[ 0 ], prev_rect
        set rect_array[ 1 ], rect

        screen.'update_rects'( rect_array )
        if x_pos != end_pos goto _loop
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
