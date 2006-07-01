=head1 TITLE

blue_rect.pir - draw a blue rectangle with the SDL Parrot bindings

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

	$ ./parrot examples/sdl/blue_rect.pir
	$

=cut

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

	# create an SDL::Rect object
	.local pmc rect
	.local int rect_type

	find_type rect_type, 'SDL::Rect'
	new rect, rect_type
	rect.'init'( 'height' => 100, 'width'  => 100, 'x' => 270, 'y' => 190 )

	# create an SDL::Color object
	.local pmc color
	.local int color_type

	find_type color_type, 'SDL::Color'
	new color, color_type
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

=head1 COPYRIGHt

Copyright (c) 2004 - 2006, The Perl Foundation.

=cut
