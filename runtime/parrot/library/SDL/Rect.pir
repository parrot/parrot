
# $Id$

=head1 NAME

SDL::Rect - Parrot class representing rectangles in Parrot SDL

=head1 SYNOPSIS

	# load this library
	load_bytecode 'library/SDL/Rect.pir'

	# create a new SDL::Rect object
	.local pmc rect
	.local int rect_type

	find_type rect_type, 'SDL::Rect'
	rect = new rect_type

	# now set the arguments on the object
	rect.'init'( 'x' => 270, 'y' => 190, 'height' => 100, 'width'=> 100 )

	# ... and blit to or fill surfaces with this object!

=head1 DESCRIPTION

The SDL::Rect class represents rects in SDL.  SDL::Rect objects represent
sources and destinations for filling and blitting to and from SDL::Surface
objects. 

=head1 METHODS

An SDL::Rect object has the following methods:

=over 4

=cut

.namespace [ 'SDL::Rect' ]

.sub _initialize :load

	$I0 = find_type 'SDL::Rect'
	if $I0 > 1 goto END
	
	.local   pmc rect_class
	newclass     rect_class, 'SDL::Rect'
	addattribute rect_class, '_rect'

END:
	.return ()
.end

=item init( arg => value )

Given a list of key-value pairs, sets the attributes of this object.  The keys
are:

=over 4

=item x

The x coordinate of this object, in pixels.  This represents a position within
a SDL::Surface object, but it's an attribute of the rect, not the surface.

=item y

The y coordinate of this object, in pixels.  This represents a position within
a SDL::Surface object, but it's an attribute of the rect, not the surface.

=item height

The height, in pixels, of this object.

=item width

The width, in pixels, of this object.

=back

The name of this method may change, as per discussion on p6i.

=cut

.sub 'init' :method
	.param int x      :named( 'x' ) :optional
	.param int y      :named( 'y' ) :optional
	.param int width  :named( 'width' ) :optional
	.param int height :named( 'height' ) :optional
	.param int have_x      :opt_flag
	.param int have_y      :opt_flag
	.param int have_width  :opt_flag
	.param int have_height :opt_flag

	if have_x goto check_y
	x = 0

  check_y:
	if have_y goto check_width
	y = 0

  check_width:
	if have_width goto check_height
	width = 0

  check_height:
	if have_height goto check_done
	height = 0

  check_done:
	.local pmc  fetch_layout
	find_global fetch_layout, 'SDL::NCI', 'fetch_layout'

	.local pmc layout
	layout = fetch_layout( 'Rect' )

	.local pmc rect
	new rect, .ManagedStruct, layout

	set rect['height'], height
	set rect['width'], width
	set rect['x'], x
	set rect['y'], y

	.local int offset
	classoffset  offset,   self, 'SDL::Rect'
	setattribute   self, offset, rect

	.return()
.end

=item rect()

This method returns the underlying C<SDL_Rect>.  You'll probably never need to
call this directly, unless you're using raw SDL functions.

=cut

.sub rect :method
	.local pmc rect 
	.local int offset

	classoffset  offset, self, 'SDL::Rect'
	getattribute   rect, self, offset

	.return( rect )
.end

=item height()

Returns the height of this object in pixels.  Arguably, this should also set
the value.

=cut

.sub height :method
	.param int new_height     :optional
	.param int has_new_height :opt_flag

	.local pmc rect 
	.local int result

	rect             = self.'rect'()

	unless has_new_height goto getter
	rect[ 'height' ] = new_height

getter:
	result           = rect[ 'height' ]

	.return( result )
.end

=item width()

Returns the width of this object in pixels.  Arguably, this should also set the
value.

=cut

.sub width :method
	.param int new_width     :optional
	.param int has_new_width :optional

	.local pmc rect 
	.local int result

	rect            = self.'rect'()

	unless has_new_width goto getter
	rect[ 'width' ] = new_width

getter:
	result          = rect[ 'width' ]

	.return( result )
.end

=item x( [ new_x_coordinate ] )

Gets and sets the x coordinate of this rect.  Note that this value is always an
integer.

=cut

.sub x :method
	.param int new_x     :optional
	.param int has_new_x :opt_flag

	.local pmc rect 

	rect           = self.'rect'()

	unless has_new_x goto getter
	rect[ 'x' ]    = new_x

getter:
	.local int result
	result         = rect[ 'x' ]

	.return( result )
.end

=item y( [ new_y_coordinate ] )

Gets and sets the y coordinate of this rect.  Note that this value is always an
integer.

=cut

.sub y :method
	.param int new_y     :optional
	.param int has_new_y :opt_flag

	.local pmc rect 

	rect           = self.'rect'()

	unless has_new_y goto _getter
	rect[ 'y' ]    = new_y

_getter:
	.local int result
	result         = rect[ 'y' ]

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
