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

	# arguments for the SDL::App constructor
	.local pmc args
	args             = new .Hash
	args[ 'height' ] = 480
	args[ 'width'  ] = 640
	args[ 'bpp'    ] =   0
	args[ 'flags'  ] =   1

	# create an SDL::App object
	.local pmc app
	.local int app_type

	find_type app_type, 'SDL::App'
	app = new app_type, args

	# fetch the SDL::Surface representing the main window
	.local pmc main_screen
	main_screen = app.'surface'()

	.local int bpp
	bpp = main_screen.'bpp'()
	print "BPP: "
	print bpp
	print "\n"

	# arguments for the SDL::Rect constructor
	args             = new .Hash
	args[ 'height' ] = 100
	args[ 'width'  ] = 100
	args[ 'x'      ] = 270
	args[ 'y'      ] = 190

	# create an SDL::Rect object
	.local pmc rect
	.local int rect_type

	find_type rect_type, 'SDL::Rect'
	new rect, rect_type, args

	# arguments for the SDL::Color constructor
	new args, .Hash
	set args[ 'r' ],   0
	set args[ 'g' ],   0
	set args[ 'b' ], 255

	# create an SDL::Color object
	.local pmc color
	.local int color_type

	find_type color_type, 'SDL::Color'
	new color, color_type, args

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

Copyright (C) 2004, The Perl Foundation.

=cut
