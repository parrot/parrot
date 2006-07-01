
# $Id$

=head1 NAME

SDL::Font - Parrot class representing fonts in Parrot SDL

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/SDL/Font.pir'

	# create a new SDL::Font object
	.local pmc font
	.local int font_type

	find_type font_type, 'SDL::Font'
	font = new font_type
	font.'init'( 'font_file'  => 'myfont.ttf', 'point_size' => 48 )

	# draw text to the screen
	#	presuming you have an SDL::Surface, SDL::Color, and SDL::Rect here...
	font.'draw'( 'some text', font_color, destination_surface, dest_rect )

	# or render it to a surface to use later
	font.'render_text'( 'some text', font_color )

=head1 DESCRIPTION

A SDL::Font object represents a TrueType font in SDL.  You can use this to draw fonts to any L<SDL::Surface>.

=head1 METHODS

All SDL::Font objects have the following methods:

=over

=cut

.namespace [ 'SDL::Font' ]

.sub _sdl_init :load
	.local pmc init_ttf
	init_ttf = find_global 'SDL', '_init_ttf'
	init_ttf()

	.local pmc   font_class

	newclass     font_class, 'SDL::Font'
	addattribute font_class, 'font'
	addattribute font_class, 'size'

	.return()
.end

=item init( font_args )

Given a list of key-value pairs containing arguments, set the attributes of
this font.  The valid keys are C<font_file> and C<point_size>, two strings
containing the path to a TrueType font to load and the size of the font when
drawn, in pixels.

=cut

.sub 'init' :method
	.param string font_name :named( 'font_file'  )
	.param int    font_size :named( 'point_size' )

	.local pmc OpenFont
	OpenFont = find_global 'SDL::NCI::TTF', 'OpenFont'

	.local pmc font
	font = OpenFont( font_name, font_size )

	setattribute  self, 'font', font

	.local pmc size_value
	size_value = new Integer
	size_value = font_size
	setattribute self, 'size', size_value

	.return()
.end

=item draw( text_string, text_color, dest_surface, dest_rect )

Given a string of text to draw, an C<SDL::Color> object representing the color
of the text to draw, a C<SDL::Surface> to which to draw, and a C<SDL::Rect>
representing the placement of the text within the surface, draws some text.

Whew.

=cut

.sub draw :method
	.param string text
	.param pmc    color_pmc
	.param pmc    screen
	.param pmc    dest_rect

	.local pmc font_surface

	font_surface = self.'render_text'( text, color_pmc )

	.local int w
	.local int h
	w = font_surface.'width'()
	h = font_surface.'height'()

	.local int rect_type
	.local pmc rect

	find_type rect_type, 'SDL::Rect'
	rect = new rect_type
	rect.'init'( 'x' => 0, 'y' => 0, 'height' => h, 'width' => w )

	dest_rect.'height'( h )
	dest_rect.'width'( w )

	screen.'blit'( font_surface, rect, dest_rect )

	.return()
.end

=item render_text( text_string, text_color )

Renders a string of text of the given C<SDL::Color>.  This returns a new
C<SDL::Surface> containing the rendered font.

=cut

.sub render_text :method
	.param string text
	.param pmc    color_pmc

	.local pmc font
	font = self.'font'()

	.local int surface_type
	find_type surface_type, 'SDL::Surface'

	.local pmc font_surface
	font_surface = new surface_type
	font_surface.'init'( 'height' => 0, 'width' => 0 )

	.local pmc RenderText_Solid
	find_global RenderText_Solid, 'SDL::NCI::TTF', 'RenderText_Solid'

	.local pmc color
	color = color_pmc.'color'()

	.local pmc font_surface_struct
	font_surface_struct = RenderText_Solid( font, text, color )
	font_surface.'wrap_surface'( font_surface_struct )

	.return( font_surface )
.end

=item font()

Returns the underlying C<SDL_Font> structure this object wraps.  You should
never need to call this directly unless you're calling SDL functions directly,
in which case why not send me a patch?

=cut

.sub font :method
	.local pmc font
	getattribute font, self, 'font'

	.return( font )
.end

=item point_size( [ new_size ] )

Gets or sets the point size associated with this font object.  The single
argument is an integer and is optional.

=cut

.sub point_size :method
	.param int size      :optional
	.param int have_size :opt_flag

	.local pmc size_value

	if have_size == 0 goto getter

	size_value = new Integer
	size_value = size
	setattribute self, 'size', size_value

getter:
	getattribute size_value, self, 'size'
	size = size_value

	.return( size )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, E<lt>chromatic at wgz dot orgE<gt>.
Please send patches, feedback, and suggestions to the Perl 6 Internals mailing
list.

=head1 COPYRIGHT

Copyright (C) 2004-2006, The Perl Foundation.

=cut
