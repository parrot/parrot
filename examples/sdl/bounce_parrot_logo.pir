# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

bounce_parrot_logo.pir - bounce a Parrot logo with the SDL Parrot bindings

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

    $ parrot examples/sdl/bounce_parrot_logo.pir
    $

You'll see the happy Parrot logo in the middle of a new SDL window.  Use the
cursor keys to apply velocity in the appropriate directions.  Watch it bounce!
Use the Escape key or close the window when you've had enough.

=head1 DESCRIPTION

This is a PIR program which bounces a Parrot logo with the SDL Parrot
bindings.

=cut

.sub _main :main
    load_bytecode "SDL/App.pir"
    load_bytecode "SDL/Color.pir"
    load_bytecode "SDL/Rect.pir"
    load_bytecode "SDL/Image.pir"
    load_bytecode "SDL/Sprite.pir"
    load_bytecode "SDL/EventHandler.pir"
    load_bytecode "SDL/Event.pir"

    .local pmc app
    app = new ['SDL'; 'App']
    app.'init'( 'width' => 640, 'height' => 480, 'bpp' => 0, 'flags' => 0 )

    .local pmc main_screen
    main_screen = app.'surface'()

    .local pmc black
    black = new ['SDL'; 'Color']
    black.'init'( 'r' => 0, 'g' => 0, 'b' => 0 )

    .local pmc image
    image = new ['SDL'; 'Image']
    image.'init'( 'examples/sdl/parrot_small.png' )

    .local pmc sprite
    sprite = new ['SDL'; 'Sprite']
    sprite.'init'( 'surface' => image, 'source_x' => 0, 'source_y' => 0, 'dest_x' => 270, 'dest_y' => 212, 'bgcolor' => black )

    _main_loop( main_screen, sprite )
    end
.end

.sub _main_loop
    .param pmc main_screen
    .param pmc sprite

    .local pmc parent_class
    .local pmc class_type
    get_class parent_class, ['SDL'; 'EventHandler']
    subclass class_type, parent_class, 'MoveLogo::EventHandler'

    .local pmc event_handler
    event_handler = new 'MoveLogo::EventHandler'

    .local pmc event
    event = new ['SDL'; 'Event']
    event.'init'()

    .local pmc handler_args
    handler_args = new 'Hash'
    handler_args[ 'screen' ] = main_screen
    handler_args[ 'sprite' ] = sprite

    .local num last_time
    last_time = time

    .local num counter
    counter = 0

    .local num current_time
    current_time = 0

    .local int frame_count
    frame_count = 1

    .local int updated
    event_handler.'draw_screen'( main_screen, sprite )

loop:
    last_time = current_time
    updated   = event_handler.'update_position'( sprite, frame_count )

    if updated == 0 goto increase_count

    event_handler.'draw_screen'( main_screen, sprite )

increase_count:
    inc frame_count
    if  frame_count < 6 goto get_event
    frame_count = 0

get_event:
    event.'handle_event'( event_handler, handler_args )

    current_time = time
    counter      = current_time - last_time

    if counter < 0.016 goto get_event
    goto loop

.end

.namespace [ 'MoveLogo::EventHandler' ]

.sub update_position :method
    .param pmc sprite
    .param int frame_count

    .local int updated
    updated = 0

    .local int x_velocity
    .local int y_velocity

    x_velocity = sprite.'x_velocity'()
    y_velocity = sprite.'y_velocity'()

    .local int abs_velocity
    .local int delta

check_x_update:
    if x_velocity == 0 goto check_y_update

    abs abs_velocity, x_velocity
    set delta, frame_count
    sub delta, abs_velocity

    if delta        > 0 goto check_y_update

    updated = 1

    if x_velocity   < 0 goto neg_x_dir

    self.'move_sprite_x'( sprite,  1 )
    goto check_y_update

neg_x_dir:
    self.'move_sprite_x'( sprite, -1 )

check_y_update:
    if y_velocity == 0 goto return

    abs abs_velocity, y_velocity
    set delta, frame_count
    sub delta, abs_velocity

    if delta      > 0 goto return

    updated = 1

    if y_velocity < 0 goto neg_y_dir

    self.'move_sprite_y'( sprite,  1 )
    goto return

neg_y_dir:
    self.'move_sprite_y'( sprite, -1 )

return:
    .return( updated )
.end

.sub draw_screen :method
    .param pmc screen
    .param pmc sprite

    .local pmc prev_rect
    .local pmc rect
    .local pmc rect_array
    rect_array = new 'ResizablePMCArray'
    set rect_array, 2

    (prev_rect, rect) = sprite.'draw_undraw'( screen )
    set rect_array[ 0 ], prev_rect
    set rect_array[ 1 ], rect

    screen.'update_rects'( rect_array )
#    screen.'update_rect'( rect )

.end

.sub move_sprite_x :method
    .param pmc sprite
    .param int direction

    .local int x
    x = sprite.'x'()

    add x, direction

    if x >= 0 goto check_x_max
    x = 0
    goto x_bounce

check_x_max:
    if x < 540 goto x_update
    x = 540

x_bounce:
    .local int x_velocity
    x_velocity = sprite.'x_velocity'()
    x_velocity = -x_velocity
    sprite.'x_velocity'( x_velocity )

x_update:
    sprite.'x'( x )

.end

.sub move_sprite_y :method
    .param pmc sprite
    .param int direction

    .local int y
    y = sprite.'y'()

    add y, direction

    if y >= 0 goto check_y_max
    y = 0
    goto y_bounce

check_y_max:
    if y < 424 goto y_update
    y = 424

y_bounce:
    .local int y_velocity
    y_velocity = sprite.'y_velocity'()
    y_velocity = -y_velocity
    sprite.'y_velocity'( y_velocity )

y_update:
    sprite.'y'( y )

.end

.sub key_down_down :method
    .param pmc event_args

    .local pmc screen
    .local pmc sprite

    screen = event_args[ 'screen' ]
    sprite = event_args[ 'sprite' ]

    .local int y_vel
    y_vel = sprite.'y_velocity'()

    if  y_vel == 5 goto return
    inc y_vel

    sprite.'y_velocity'( y_vel )

return:

.end

.sub key_down_up :method
    .param pmc event_args

    .local pmc screen
    .local pmc sprite

    screen = event_args[ 'screen' ]
    sprite = event_args[ 'sprite' ]

    .local int y_vel
    y_vel = sprite.'y_velocity'()

    if  y_vel == -5 goto return
    dec y_vel

    sprite.'y_velocity'( y_vel )

return:

.end

.sub key_down_left :method
    .param pmc event_args

    .local pmc screen
    .local pmc sprite

    screen = event_args[ 'screen' ]
    sprite = event_args[ 'sprite' ]

    .local int x_vel
    x_vel = sprite.'x_velocity'()

    if  x_vel == -5 goto return
    dec x_vel

    sprite.'x_velocity'( x_vel )

return:

.end

.sub key_down_right :method
    .param pmc event_args

    .local pmc screen
    .local pmc sprite

    screen = event_args[ 'screen' ]
    sprite = event_args[ 'sprite' ]

    .local int x_vel
    x_vel = sprite.'x_velocity'()

    if  x_vel == 5 goto return
    inc x_vel

    sprite.'x_velocity'( x_vel )

return:

.end

.sub key_down_escape :method
    .param pmc event_args

    # XXX: a silly way to quit
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
