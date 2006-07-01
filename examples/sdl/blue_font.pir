=head1 TITLE

blue_font.pir - draw a friendly message to the screen

=head1 SYNOPSIS

To run this file, run the following command from the Parrot directory:

	$ ./parrot examples/sdl/blue_font.pir
	$

Note that you need to have a font named C<times.ttf> in the current directory.
I recommend making a symlink.

Yes, getting this to work across platforms is tricky, as is distributing a
royalty-free font file.  Maybe soon.

=cut

.sub main :main

	# first load the necessary libraries
	load_bytecode "library/SDL/App.pir"
	load_bytecode "library/SDL/Rect.pir"
	load_bytecode "library/SDL/Color.pir"
	load_bytecode "library/SDL/Font.pir"

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
	rect.'init'( 'height' => 100, 'width' => 100, 'x' => 194, 'y' => 208 )

	# create SDL::Color objects
	.local pmc blue
	.local pmc white
	.local int color_type

	find_type color_type, 'SDL::Color'

	new blue, color_type
	blue.'init'( 'r' => 0, 'g' => 0, 'b' => 255 )

	new white, color_type
	white.'init'( 'r' => 255, 'g' => 255, 'b' => 255 )

	.local pmc file_pmc
	file_pmc    = new File

	.local int font_exists
	font_exists = file_pmc.'exists'( 'times.ttf' )

	if font_exists goto have_font
	print "No font found (expect times.ttf in this directory); exiting...\n"
	end

  have_font:
	.local pmc font
	.local int font_type
	find_type  font_type, 'SDL::Font'
	new font,  font_type
	font.'init'( 'font_file'  => 'times.ttf', 'point_size' => 48 )

	.local pmc full_rect
	full_rect = new rect_type
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

Copyright (C) 2004, The Perl Foundation.

=cut
