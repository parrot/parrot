=head1 TITLE

anim_image.pir - animate an image in a Parrot SDL window

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

	$ ./parrot examples/sdl/anim_image.pir
	Drew 1080 frames in 0.948230 seconds (1138.964142 fps)
	$ 

=cut

.sub _main :main
	load_bytecode "library/SDL/App.pir"
	load_bytecode "library/SDL/Color.pir"
	load_bytecode "library/SDL/Rect.pir"
	load_bytecode "library/SDL/Image.pir"
	load_bytecode "library/SDL/Sprite.pir"


	.local pmc app
	.local int app_type

	find_type app_type, 'SDL::App'
	app = new app_type
	app.'init'( 'height' => 480, 'width' => 640, 'bpp' => 0, 'flags' => 1 )

	.local pmc main_screen
	main_screen = app.'surface'()

	.local int rect_type
	find_type rect_type, 'SDL::Rect'

	.local pmc dest_rect
	dest_rect   = new rect_type
	dest_rect.'init'( 'height' => 100, 'width' => 100, 'x' => 0, 'y' => 190 )

	.local pmc prev_rect
	prev_rect   = new rect_type
	prev_rect.'init'( 'height' => 100, 'width' => 101, 'x' => 0, 'y' => 190 )

	.local pmc source_rect
	source_rect = new rect_type
	source_rect.'init'( 'height' => 56, 'width' => 100, 'x' => 0, 'y' => 0 )

	.local int color_type
	find_type  color_type, 'SDL::Color'

	.local pmc black
	black = new color_type
	black.'init'( 'r' => 0, 'g' => 0, 'b' => 0 )

	.local int sprite_type
	find_type  sprite_type, 'SDL::Sprite'

	.local pmc image
	.local int image_type

	find_type image_type, 'SDL::Image'
	image    = new image_type
	image.'init'( 'examples/sdl/parrot_small.png' )

	.local pmc sprite
	sprite = new sprite_type
	sprite.'init'( 'surface' => image, 'source_x' => 0, 'source_y' => 0, 'dest_x' => 0, 'dest_y' => 190, 'bgcolor' => black )

	.local float start_time
	time start_time

	_animate_on_x_axis( main_screen, sprite,   0, 540,  1)
	sleep 1
	_animate_on_x_axis( main_screen, sprite, 540,   0, -1)

	.local float end_time
	time end_time

	.local float total_time
	total_time = end_time - start_time
	dec total_time

	.local float fps
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
	rect_array = new Array
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

Copyright (C) 2004, The Perl Foundation.

=cut
