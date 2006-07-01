
# $Id$

=head1 NAME

SDL::Sprite - Parrot class representing sprites in Parrot SDL

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/SDL/Sprite.pir'

	# ... load a new SDL::Image into image

	# create a new SDL::Sprite object
	.local pmc sprite
	.local int sprite_type

	find_type sprite_type, 'SDL::Sprite'
	sprite = new sprite_type

	# set the sprite's arguments
	sprite.'init'( 'surface'  => image, 'source_x' =>     0, 'source_y' =>     0, 'dest_x'   =>   270, 'dest_y'   =>   212, 'bgcolor'  => black )


	# if the image has multiple tiles that represent animation frames, set the
	# width and height of each tile
	# 'width'    =>   100, 'height'   =>    56

	# ... draw the sprite to surfaces as you will

=head1 DESCRIPTION

A SDL::Sprite object represents an image and its position.  By changing the
coordinates of the sprite, you'll change its position when it draws itself to a
surface.

This is a class in progress; it has to represent several different drawing
styles.

=head1 METHODS

A SDL::Sprite object has the following methods:

=over 4

=cut

.namespace [ 'SDL::Sprite' ]

.sub _initialize :load

	.local   pmc sprite_class
	newclass     sprite_class, 'SDL::Sprite'

	addattribute sprite_class, 'surface'
	addattribute sprite_class, 'source_rect'
	addattribute sprite_class, 'prev_rect'
	addattribute sprite_class, 'rect'
	addattribute sprite_class, 'bgcolor'
	addattribute sprite_class, 'drawn_rect'
	addattribute sprite_class, 'undrawn_rect'
	addattribute sprite_class, 'x_velocity'
	addattribute sprite_class, 'y_velocity'

.end

=item init( 'arg' => pairs )

Given argument key-value pairs, sets the attributes of this object.  The useful
keys are as follows:

=over 4

=item surface

The SDL::Image from which to draw the sprite frames.

=item source_x

The x coordinate within the C<surface> from which to start drawing.

=item source_y

The y coordinate within the C<surface> from which to start drawing.

=item dest_x

The x coordinate within the destination surface to which to draw.

=item dest_y

The y coordinate within the destination surface to which to draw.

=item bgcolor

A SDL::Color object representing the background color of the main surface.
This will come in handy when drawing over the previous position of this sprite,
unless you redraw the entire surface on every frame.

=item width

The width of the image, in pixels, to draw.  If you have multiple frames of an
animation within the image provided, set the width here to the width of a
single frame.

If you don't set this value, this will use the current width of the image.

=item height

The height of the image, in pixels, to draw.  If you have multiple frames of an
animation within the image provided, set the height here to the height of a
single frame.

If you don't set this value, this will use the current height of the image.

=back

B<Note:>  I'm not completely thrilled with these arguments, so they may change
slightly.

=cut

.sub 'init' :method
	.param pmc surface  :named( 'surface'  )
	.param pmc source_x :named( 'source_x' )
	.param pmc source_y :named( 'source_y' )
	.param pmc dest_x   :named( 'dest_x'   )
	.param pmc dest_y   :named( 'dest_y'   )
	.param pmc bgcolor  :named( 'bgcolor'  )
	.param pmc width    :named( 'width'    ) :optional
	.param int has_width                     :opt_flag
	.param pmc height   :named( 'height'   ) :optional
	.param int has_height                    :opt_flag

	setattribute self, 'surface', surface

	# set all of the rect attributes
	.local int rect_type
	find_type rect_type, 'SDL::Rect'

	if has_width goto set_height
	width = surface.'width'()

set_height:
	if has_height goto done
	height = surface.'height'()

done:
	# first the source rectangle
	.local pmc source_rect

	source_rect = new rect_type
	source_rect.'init'( 'x' => source_x, 'y' => source_y, 'height' => height, 'width' => width )

	setattribute self, 'source_rect', source_rect

	# now the dest rectangle
	.local pmc rect
	rect = new rect_type
	rect.'init'( 'x' => dest_x, 'y' => dest_y )

	setattribute self, 'rect', rect
	rect = self.'rect'()

	# and now the previous rect
	.local pmc prev_rect
	prev_rect = new rect_type
	prev_rect.'init'( 'x' => source_x, 'y' => source_y, 'height' => height, 'width' => width )

	setattribute self, 'prev_rect', prev_rect

	# the background color
	.local pmc bgcolor_pmc
	bgcolor_pmc = bgcolor
	setattribute self, 'bgcolor', bgcolor_pmc

	# the drawn rect
	.local pmc drawn_rect
	drawn_rect = new rect_type
	drawn_rect.'init'( 'x' => source_x, 'y' => source_y, 'height' => height, 'width' => width )
	setattribute self, 'drawn_rect', drawn_rect

	# the undrawn rect
	.local pmc undrawn_rect
	undrawn_rect = new rect_type
	undrawn_rect.'init'( 'x' => source_x, 'y' => source_y, 'height' => height, 'width' => width )
	setattribute self, 'undrawn_rect', undrawn_rect

	# and finally the x and y velocities
	.local pmc x_velocity
	x_velocity = new .Integer
	x_velocity = 0
	setattribute self, 'x_velocity', x_velocity

	.local pmc y_velocity
	y_velocity = new .Integer
	y_velocity = 0
	setattribute self, 'y_velocity', y_velocity

	.return()
.end

=item draw_undraw( surface )

Draws the image this object represents to the given SDL::Surface.  This will
return two SDL::Rect objects, one representing the previous position of this
sprite and one representing the current position.  

Use this when dealing with a single-buffered main window.  You'll need to call
C<update_rect()> on the C<surface> to make things actually show up, if it's the
main surface.

Note that this will fill in the previous position with the background color set
in the constructor.

=cut

.sub draw_undraw :method
	.param pmc dest_surface

	.local pmc surface
	.local pmc source_rect
	.local pmc rect
	.local pmc prev_rect
	.local pmc bgcolor

	.local pmc drawn_rect
	.local pmc undrawn_rect

	surface      = self.'surface'()
	source_rect  = self.'source_rect'()
	rect         = self.'rect'()
	prev_rect    = self.'prev_rect'()
	bgcolor      = self.'bgcolor'()

	drawn_rect   = self.'drawn_rect'()
	undrawn_rect = self.'undrawn_rect'()

	dest_surface.'fill_rect'( prev_rect, bgcolor )
	dest_surface.'blit'( surface, source_rect, rect )

	.local int x
	.local int y

	x = prev_rect.'x'()
	y = prev_rect.'y'()

	undrawn_rect.'x'( x )
	undrawn_rect.'y'( y )

	x = rect.'x'()
	y = rect.'y'()

	drawn_rect.'x'( x )
	drawn_rect.'y'( y )
	prev_rect.'x'( x )
	prev_rect.'y'( y )

	.return( drawn_rect, undrawn_rect )
.end

=item draw( surface )

Draws the image represented by this object to the given surface.  This will
also fill the previous position of the image with the background color.
(Arguably, this is not always right, but I know about it and will figure
something out, unless you have a better idea and let me know first.)

Use this when dealing with a double-buffered main window.  In that case, you
will have to call C<flip()> on the C<surface> yourself to make your changes
appear.

=cut

.sub draw :method
	.param pmc dest_surface

	.local pmc surface
	.local pmc source_rect
	.local pmc rect
	.local pmc prev_rect
	.local pmc bgcolor

	surface      = self.'surface'()
	source_rect  = self.'source_rect'()
	rect         = self.'rect'()
	prev_rect    = self.'prev_rect'()
	bgcolor      = self.'bgcolor'()

	dest_surface.'fill_rect'( prev_rect, bgcolor )
	dest_surface.'blit'( surface, source_rect, rect )

	.local int x
	.local int y
	x = rect.'x'()
	y = rect.'y'()
	prev_rect.'x'( x )
	prev_rect.'y'( y )

.end

=item surface()

Returns the underlying surface of the image represented by this class.  You
should never need to call this directly, unless you're working with the raw SDL
functions.

=cut

.sub surface :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'

	.local pmc surface
	getattribute surface, self, offset

	.return( surface )
.end

=item source_rect()

Returns the SDL::Rect object representing the source from which to draw within
the underlying image.

You should never need to call this directly.

=cut

.sub source_rect :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 1

	.local pmc source_rect
	getattribute source_rect, self, offset

	.return( source_rect )
.end

=item prev_rect()

Returns the SDL::Rect representing the previous position of this sprite within
a destination surface.

You should never need to call this directly.

=cut

.sub prev_rect :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 2

	.local pmc prev_rect
	getattribute prev_rect, self, offset

	.return( prev_rect )
.end

=item rect()

Returns the SDL::Rect representing this sprite's current position within the
destination surface.

You should never need to call this directly.

=cut

.sub rect :method
	.local pmc rect
	getattribute rect, self, 'rect'

	.return( rect )
.end

=item bgcolor()

Returns the SDL::Color object representing the background color to draw to the
destination when undrawing the previous position of this sprite.

You should never need to call this directly.

=cut

.sub bgcolor :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 4

	.local pmc bgcolor
	getattribute bgcolor, self, offset

	.return( bgcolor )
.end

=item drawn_rect()

Returns the SDL::Rect representing the current position of the sprite within
the destination surface as of the current drawing operation.

You should I<never> need to call this directly.  I mean it.  This may go away
suddenly in a brilliant flash of insight.

=cut

.sub drawn_rect :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 5

	.local pmc drawn_rect
	getattribute drawn_rect, self, offset

	.return( drawn_rect )
.end

=item undrawn_rect()

Returns the SDL::Rect representing the previous position of the sprite within
the destination surface as of the current drawing operation.

You should I<never> need to call this directly.  I mean it.  This may go away
suddenly in a brilliant flash of insight.

=cut

.sub undrawn_rect :method
	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 6

	.local pmc undrawn_rect
	getattribute undrawn_rect, self, offset

	.return( undrawn_rect )
.end

=item x( [ new_x_coordinate ] )

Gets and sets the x coordinate of this sprite within the destination surface,
in pixels.  This is always an integer.

=cut

.sub x :method
	.param int new_x  :optional
	.param int have_x :opt_flag

	.local pmc rect
	rect = self.'rect'()

	if have_x == 0 goto getter
	rect.'x'( new_x )

getter:
	.local int result
	result = rect.'x'()

	.return( result )
.end

=item y( [ new_y_coordinate ] )

Gets and sets the y coordinate of this sprite within the destination surface,
in pixels.  This is always an integer.

=cut

.sub y :method
	.param int new_y  :optional
	.param int have_y :opt_flag

	.local pmc rect
	rect = self.'rect'()

	if have_y == 0 goto getter
	rect.'y'( new_y )

getter:
	.local int result
	result = rect.'y'()

	.return( result )
.end

=item x_velocity( [ new_x_velocity ] )

Gets and sets the x velocity of this sprite.  This is always an integer.

Maybe this method shouldn't be here; it may move.

=cut

.sub x_velocity :method
	.param int new_x_vel :optional
	.param int have_x    :opt_flag

	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 7

	.local pmc x_vel
	getattribute x_vel, self, 'x_velocity'

	.local pmc rect

	if have_x == 0 goto getter
	x_vel = new_x_vel
	.return( new_x_vel )

getter:
	.local int result
	result = x_vel

	.return( result )
.end

=item y_velocity( [ new_y_velocity ] )

Gets and sets the y velocity of this sprite.  This is always an integer.

Maybe this method shouldn't be here; it may move.

=cut

.sub y_velocity :method
	.param int new_y_vel

	.local int offset
	classoffset offset, self, 'SDL::Sprite'
	add offset, 8

	.local pmc y_vel
	getattribute y_vel, self, offset

	.local int param_count
	.local pmc rect

	param_count = I1

	if param_count == 0 goto getter
	y_vel = new_y_vel

getter:
	.local int result
	result = y_vel

	.return( result )
.end

=back

=head1 AUTHOR

Written and maintained by chromatic, E<lt>chromatic at wgz dot orgE<gt>, with
suggestions from Jens Rieks.  Please send patches, feedback, and suggestions to
the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2006, The Perl Foundation.

=cut
