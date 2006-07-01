=head1 TITLE

move_parrot_logo.pir - move a Parrot logo with the SDL Parrot bindings

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

	$ parrot examples/sdl/move_parrot_logo.pir
	$

=cut

.sub _main :main
	load_bytecode "library/SDL/App.pir"
	load_bytecode "library/SDL/Color.pir"
	load_bytecode "library/SDL/Rect.pir"
	load_bytecode "library/SDL/Image.pir"
	load_bytecode "library/SDL/Sprite.pir"
	load_bytecode "library/SDL/EventHandler.pir"
	load_bytecode "library/SDL/Event.pir"

	.local pmc app
	.local int app_type

	find_type app_type, 'SDL::App'
	app = new app_type

	app.'init'( 'width' => 640, 'height' => 480, 'bpp' => 0, 'flags' => 0 )

	.local pmc main_screen
	main_screen = app.'surface'()

	.local pmc black
	.local int color_type

	find_type color_type, 'SDL::Color'
	black = new color_type
	black.'init'( 'r' => 0, 'g' => 0, 'b' => 0 )

	.local pmc    image
	.local int    image_type
	.local string filename


	find_type image_type, 'SDL::Image'
	image    = new image_type

	filename = 'examples/sdl/parrot_small.png'
	image.'init'( 'file' => filename )

	.local pmc sprite_args

	.local pmc sprite
	.local int sprite_type

	find_type sprite_type, 'SDL::Sprite'
	sprite = new sprite_type
	sprite.'init'( 'surface'  => image, 'source_x' =>     0, 'source_y' =>     0, 'dest_x'   =>   270, 'dest_y'   =>   212, 'bgcolor'  => black )

	.local pmc parent_class
	.local pmc class_type
	getclass parent_class, 'SDL::EventHandler'
	subclass class_type, parent_class, 'MoveLogo::EventHandler'

	.local pmc event_handler
	.local int handler_type

	find_type handler_type, 'MoveLogo::EventHandler'
	event_handler = new handler_type

	.local pmc event
	.local int event_type

	find_type event_type, 'SDL::Event'
	event = new event_type
	event.'init'()

	.local pmc handler_args
	handler_args = new .Hash
	handler_args[ 'screen' ] = main_screen
	handler_args[ 'sprite' ] = sprite

	event_handler.'init'( handler_args )
	event_handler.'draw_screen'( main_screen, sprite )
	event.'process_events'( event_handler, handler_args )
.end

.namespace [ 'MoveLogo::EventHandler' ]

.sub draw_screen :method
	.param pmc screen
	.param pmc sprite

	.local pmc prev_rect
	.local pmc rect
	.local pmc rect_array
	rect_array = new Array
	set rect_array, 2

	(prev_rect, rect) = sprite.'draw_undraw'( screen )

	set rect_array[ 0 ], prev_rect
	set rect_array[ 1 ], rect

	screen.'update_rects'( rect_array )
	.return()
.end

.sub key_down_down :method
	.param pmc event_args

	.local pmc screen
	.local pmc sprite

	screen = event_args[ 'screen' ]
	sprite = event_args[ 'sprite' ]

	.local int y
	y = sprite.'y'()
	if y == 424 goto _draw
	inc y
	sprite.'y'( y )

_draw:
	self.'draw_screen'( screen, sprite )

.end

.sub key_down_up :method
	.param pmc event_args

	.local pmc screen
	.local pmc sprite

	screen = event_args[ 'screen' ]
	sprite = event_args[ 'sprite' ]

	.local int y
	y = sprite.'y'()
	if y == 0 goto _draw
	dec y
	sprite.'y'( y )

_draw:
	self.'draw_screen'( screen, sprite )

.end

.sub key_down_left :method
	.param pmc event_args

	.local pmc screen
	.local pmc sprite

	screen = event_args[ 'screen' ]
	sprite = event_args[ 'sprite' ]

	.local int x
	x = sprite.'x'()
	if x == 0 goto _draw
	dec x
	sprite.'x'( x )

_draw:
	self.'draw_screen'( screen, sprite )

.end

.sub key_down_right :method
	.param pmc event_args

	.local pmc screen
	.local pmc sprite

	screen = event_args[ 'screen' ]
	sprite = event_args[ 'sprite' ]

	.local int x
	x = sprite.'x'()
	if x == 540 goto _draw
	inc x
	sprite.'x'( x )

_draw:
	self.'draw_screen'( screen, sprite )

.end

.sub key_down_escape :method
	.param pmc event_args

	end
.end

=head1 AUTHOR

chromatic, E<lt>chromatic at wgz dot orgE<gt>.

=head1 COPYRIGHT

Copyright (C) 2004, The Perl Foundation.

=cut
