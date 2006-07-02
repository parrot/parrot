=head1 TITLE

raw_pixels.pir - paint the screen blue, pixel by pixel

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

	$ ./parrot examples/sdl/raw_pixels.pir
	$

=cut

.include 'datatypes.pasm'

.sub _main :main
	# first load the necessary libraries
	load_bytecode "library/SDL/App.pir"
	load_bytecode "library/SDL/Rect.pir"
	load_bytecode "library/SDL/Color.pir"


	# create an SDL::App object
	.local pmc app
	.local int app_type

	find_type app_type, 'SDL::App'
	app = new app_type
	app.'init'( 'height' => 480, 'width' => 640, 'bpp' => 0, 'flags' => 1 )

	# fetch the SDL::Surface representing the main window
	.local pmc main_screen
	main_screen = app.'surface'()


	# create an SDL::Rect representing the entire main screen
	.local pmc rect
	.local int rect_type
	find_type  rect_type, 'SDL::Rect'
	rect = new rect_type
	rect.'init'( 'height' => 480, 'width' => 640, 'x' => 0, 'y' => 0 )

	.local int color_type
	find_type  color_type, 'SDL::Color'

	# create a white color to paint the background; make new pixels show up
	.local pmc white
	white = new color_type
	white.'init'( 'r' => 255, 'g' => 255, 'b' => 255 )

	# create a blue color to paint the new pixels
	.local pmc blue
	blue = new color_type
	blue.'init'( 'r' => 0, 'g' => 0, 'b' => 255 )

	# draw the background
	main_screen.'fill_rect'( rect, white )
	main_screen.'update_rect'( rect )

	# lock the raw framebuffer
	main_screen.'lock'()

	# if you convert the color ahead of time, it's much faster!
	.local int converted_blue
	converted_blue = blue.'color_for_surface'( main_screen )

	# draw a vertical line of pixels from left to right on each iteration
	.local int x
	.local int y
	x = 0

loop_x:
	y = 0

loop_y:
	main_screen.'draw_pixel'( x, y, converted_blue )
	
	inc y
	if y < 480 goto loop_y
	inc x

	# update the screen on each iteration
	main_screen.'update_rect'( rect )
	if x < 640 goto loop_x

loop_end:

	# no more raw pixel access necessary
	main_screen.'unlock'()

	# show off for a bit then exit
	sleep 2
	app.'quit'()

	end
.end

=head1 AUTHOR

chromatic, E<lt>chromatic at wgz dot orgE<gt>.

=head1 COPYRIGHT

Copyright (c) 2004 - 2006, The Perl Foundation.

=cut
