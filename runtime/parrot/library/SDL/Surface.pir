
# $Id$

=head1 NAME

SDL::Surface - Parrot class representing surfaces in Parrot SDL

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/SDL/Surface.pir'

	# create a new SDL::Surface object
	find_type surface_type, 'SDL::Surface'
	surface = new surface_type
	surface.'init'( 'height' => 480, 'width' => 640 )

	# ... blit to, fill, update, and flip this surface as necessary

=head1 DESCRIPTION

A SDL::Surface object represents a surface in SDL.  All drawing operations draw
to a surface (and most draw from a surface).  You'll likely not instantiate
this class directly, but all SDL::Image and SDL::Sprite objects operate on
objects of this class, and you'll receive an SDL::Surface from the SDL::App
constructor.

=head1 METHODS

All SDL::Surface objects have the following methods:

=over 4

=cut

.namespace [ 'SDL::Surface' ]

.sub _initialize :load
	.local pmc   surface_class

	$I0 = find_type 'SDL::Surface'
	if $I0 > 1 goto END

	newclass     surface_class, 'SDL::Surface'
	addattribute surface_class, 'surface'
END:

.end

=item init( surface_args )

Given a list of key-value pairs, the attributes of this surface.  The valid
keys are C<height> and C<width>, two integer values representing the height and
width of this surface in pixels.  Other keys are C<depth>, the screen depth,
C<flags>, the SDL flags, and C<r>, C<g>, C<b>, and C<a>, representing the bit
depth of each component.

=cut

.sub init :method
	.param int height :named( 'height' )
	.param int width  :named( 'width'  )
	.param int depth  :named( 'depth'  ) :optional
	.param int flags  :named( 'flags'  ) :optional
	.param int have_flags :opt_flag
	.param int red    :named( 'Rmask' )  :optional
	.param int have_red :opt_flag
	.param int green  :named( 'Gmask' )  :optional
	.param int have_green :opt_flag
	.param int blue   :named( 'Bmask' )  :optional
	.param int have_blue :opt_flag
	.param int alpha  :named( 'Amask' )  :optional
	.param int have_alpha :opt_flag

	.local pmc SDL_CreateRGBSurface

	if have_flags goto check_red
	flags = 0

  check_red:
	if have_red goto check_green
	red = 5

  check_green:
	if have_blue goto check_blue
	green = 6

  check_blue:
	if have_blue goto check_alpha
	blue = 5

  check_alpha:
	if have_alpha goto create_surface
	alpha = 0

  create_surface:
	SDL_CreateRGBSurface = find_global 'SDL::NCI', 'CreateRGBSurface'

	.local pmc surface
	surface = SDL_CreateRGBSurface( flags, width, height, depth, red, green, blue, alpha )
	self."wrap_surface"( surface )

	.return()
.end

=item new_from_surface( raw_surface )

Given a C<raw_surface> object, sometimes returned from raw SDL functions,
create and return a new SDL::Surface object.

I'm not sure I like the name of this method.  It may change.  That may be okay;
you have little reason to use it directly.

=cut

.sub wrap_surface :method
	.param pmc surface_struct

	.local pmc  fetch_layout
	find_global fetch_layout, 'SDL::NCI', 'fetch_layout'

	.local pmc layout
	layout = fetch_layout( 'Surface' )

	# assign it once to find out the height and width
	assign surface_struct, layout

	.local int offset
	classoffset offset, self, 'SDL::Surface'
	setattribute self, offset, surface_struct

	.local int bpp
	.local int height
	.local int width
	.local int num_pixels

	bpp          = self.'bpp'()
	height       = self.'height'()
	width        = self.'width'()
	num_pixels   = height * width

	.local pmc pixels_struct
	.local pmc pixels_layout
	.local pmc pixels_entry

	pixels_entry  = layout[ 'pixels' ]
	pixels_struct = getprop '_struct', pixels_entry
	pixels_layout = new OrderedHash

	if bpp ==  8 goto eight_bits
	if bpp == 16 goto sixteen_bits
	set  pixels_layout[ 'array' ], .DATATYPE_INT
	goto bits_set

eight_bits:
	set  pixels_layout[ 'array' ], .DATATYPE_UINT8
	goto bits_set

sixteen_bits:
	set  pixels_layout[ 'array' ], .DATATYPE_UINT16

bits_set:
	push pixels_layout, num_pixels
	push pixels_layout, 0

	assign pixels_struct, pixels_layout
.end

=item height()

Returns the height of this surface, in pixels.  This is always an integer
value.

=cut

.sub height :method
	.local pmc surface
	surface = self.'surface'()

	.local int height
	height = surface['h']

	.return( height )
.end

=item width()

Returns the width of this surface, in pixels.  This is always an integer value.

=cut

.sub width :method
	.local pmc surface
	surface = self.'surface'()

	.local int width
	width = surface['w']

	.return( width )
.end

=item fill_rect( rect, color )

Given an SDL::Rect representing a portion of this surface and an SDL::Color
representing a color, fills a portion of this surface with the given color.

=cut

.sub fill_rect :method
	.param pmc rect
	.param pmc color_object

	.local pmc SDL_FillRect
	SDL_FillRect = find_global 'SDL::NCI', 'FillRect'

	.local pmc surface
	.local int offset
	classoffset   offset, self, 'SDL::Surface'
	getattribute surface, self, offset

	.local int color
	color = color_object

	.local pmc dest_rect
	dest_rect = rect.'rect'()

	SDL_FillRect( surface, dest_rect, color )
.end

=item update_rect( rect )

If this is a single-buffered surface (unless you've explicitly requested double
buffering when intializing your SDL::App), updates the portion of this surface
represented by the SDL::Rect.

Do this on the main surface to see your changes.

=cut

.sub update_rect :method
	.param pmc rect

	.local pmc surface
	getattribute surface, self, 'surface'

	.local int x
	.local int y
	.local int width
	.local int height

	x      = rect.'x'()
	y      = rect.'y'()
	height = rect.'height'()
	width  = rect.'width'()

	.local pmc SDL_UpdateRect
	SDL_UpdateRect = find_global 'SDL::NCI', 'UpdateRect'

	SDL_UpdateRect( surface, x, y, width, height )
.end

=item update_rects( array_of_rects )

Updates multiple areas represented by SDL::Rect objects within this surface all
at once.  Pass in an C<Array> of rects to update.

=cut

.sub update_rects :method
	.param pmc rects

	.local int count
	set count, rects

	.local pmc  fetch_layout
	find_global fetch_layout, 'SDL::NCI', 'fetch_layout'

	.local pmc rect_array_layout

	# don't forget to update the number of elements in this array
	rect_array_layout    = fetch_layout( 'Rect_Array' )
	rect_array_layout[1] = count

	.local pmc rect_array
	rect_array = new ManagedStruct, rect_array_layout

	.local int iterator
	iterator = 0

loop:
	.local pmc rect
	.local pmc rect_struct
	rect        = rects[ iterator ]
	rect_struct = rect.'rect'()

	.local int x
	.local int y
	.local int w
	.local int h

	x = rect_struct[ 'x'      ]
	y = rect_struct[ 'y'      ]
	w = rect_struct[ 'width'  ]
	h = rect_struct[ 'height' ]

	set rect_array[ 'RectArray'; iterator; 'x'      ], x
	set rect_array[ 'RectArray'; iterator; 'y'      ], y
	set rect_array[ 'RectArray'; iterator; 'width'  ], w
	set rect_array[ 'RectArray'; iterator; 'height' ], h

	inc iterator
	if iterator < count goto loop

	.local int offset
	classoffset offset, self, 'SDL::Surface'

	.local pmc surface
	getattribute surface, self, offset

	.local pmc UpdateRects
	UpdateRects = find_global 'SDL::NCI', 'UpdateRects'

	UpdateRects( surface, count, rect_array )

.end

=item flip()

Given a double-buffered surface (if you've explicitly enabled double-buffering
when creating your SDL::App), flips the back buffer (to which you draw, in that
case) to the main buffer, so you can see it.

=cut

.sub flip :method
	.local int offset
	classoffset offset, self, 'SDL::Surface'

	.local pmc surface
	getattribute surface, self, offset

	.local pmc SDL_Flip
	SDL_Flip = find_global 'SDL::NCI', 'Flip'

	SDL_Flip( surface )

.end

=item blit( source_surface, source_rect, destination_rect )

Given a SDL::Surface to use as a source, a SDL::Rect representing the source
within the source surface, and a SDL::Rect representing the destination within
the current surface to which to draw, copies the appropriate region from the
source to this surface.

That's a terrible sentence, but after you try it once or twice, you'll
understand.

=cut

.sub blit :method
	.param pmc surface
	.param pmc source
	.param pmc dest

	.local pmc SDL_BlitSurface
	SDL_BlitSurface = find_global 'SDL::NCI', 'BlitSurface'

	.local pmc source_surface
	.local pmc dest_surface

	source_surface = surface.'surface'()
	dest_surface   = self.'surface'()

	.local pmc source_rect
	.local pmc dest_rect

	source_rect    = source.'rect'()
	dest_rect      = dest.'rect'()

	SDL_BlitSurface( source_surface, source_rect, dest_surface, dest_rect )
	.return()
.end

=item surface()

Returns the underlying surface this object represents.  You should never need
to use this directly.

=cut

.sub surface :method
	.local int offset
	classoffset offset, self, 'SDL::Surface'

	.local pmc surface
	getattribute surface, self, offset

	.return( surface )
.end

=item color_key( color )

Sets the transparent pixel value for the surface.  This signature may change,
if I add flag options.

=cut

.sub color_key :method
	.param pmc color

	.local int color_value
	color_value = color.'color'()

	.local int offset
	classoffset offset, self, 'SDL::Surface'

	.local pmc surface
	getattribute surface, self, offset

	.local pmc SetColorKey
	SetColorKey = find_global 'SDL::NCI', 'SetColorKey'

	SetColorKey( surface, 8, color_value )
.end

=item bpp()

Returns the bitdepth of the current surface.

=cut

.sub bpp :method
	.local pmc surface
	surface = self.'surface'()

	.local int bpp

	bpp    = surface[ 'format'; 'BitsPerPixel' ]

	.return( bpp )
.end

=item lock()

Locks the surface for raw pixel drawing.  Call this before calling
C<draw_pixel()> or any other pixel operation.  Be careful what else you do
while you hold the lock.

=cut

.sub lock :method
	.local pmc surface
	surface = self.'surface'()

	.local pmc  LockSurface
	find_global LockSurface, 'SDL::NCI', 'LockSurface'

	LockSurface( surface )

	.return()
.end

=item unlock()

Unlocks the surface after you've finished raw pixel operations.

=cut

.sub unlock :method
	.local pmc surface
	surface = self.'surface'()

	.local pmc  UnlockSurface
	find_global UnlockSurface, 'SDL::NCI', 'UnlockSurface'

	UnlockSurface( surface )

	.return()
.end

=item draw_pixel( x, y, color )

Draws a pixel at the position represented by integers C<x> and C<y> with the
given SDL::Color C<color>.

If you want as much speed as possible, call C<color_for_surface> on the
SDL::Color and pass in the value you receive instead.  This method will not
have to perform a time-consuming conversion.  This is a classic tradeoff
between memory and speed.  Happily, colors are (reasonably cheap) integers at
heart.

=cut

.sub draw_pixel :method
	.param int x
	.param int y
	.param int raw_color
	.param pmc color_pmc     :optional
	.param int has_color_pmc :opt_flag

	.local int color

	if has_color_pmc goto convert_color
	color = raw_color
	goto draw

convert_color:
	color = color_pmc.'color_for_surface'( self )
	
draw:
	.local pmc surface
	surface = self.'surface'()

	.local int offset
	offset  = surface[ 'w' ]

	mul offset, y
	add offset, x

	surface[ 'pixels'; 'array'; offset ] = color
.end

=item convert_red()

A helper method to convert the red component of any color to work with this
surface.

=cut

.sub convert_red :method
	.local pmc surface
	.local int rloss
	.local int rshift

	surface  = self.'surface'()
	rloss    = surface[ 'format'; 'Rloss'  ]
	rshift   = surface[ 'format'; 'Rshift' ]

	.return( rloss, rshift )
.end

=item convert_green()

A helper method to convert the green component of any color to work with this
surface.

=cut

.sub convert_green :method
	.local pmc surface
	.local int gloss
	.local int gshift

	surface  = self.'surface'()
	gloss    = surface[ 'format'; 'Gloss'  ]
	gshift   = surface[ 'format'; 'Gshift' ]

	.return( gloss, gshift )
.end

=item convert_blue()

A helper method to convert the blue component of any color to work with this
surface.

=cut

.sub convert_blue :method
	.local pmc surface
	.local int bloss
	.local int bshift

	surface  = self.'surface'()
	bloss    = surface[ 'format'; 'Bloss'  ]
	bshift   = surface[ 'format'; 'Bshift' ]

	.return( bloss, bshift )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, E<lt>chromatic at wgz dot orgE<gt>, with
suggestions from Jens Rieks.  Please send patches, feedback, and suggestions to
the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (c) 2004, 2006 The Perl Foundation.

=cut
