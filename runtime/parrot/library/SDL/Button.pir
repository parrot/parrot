
=head1 NAME

SDL::Button - A multi state SDL Button

=head1 SYNOPSIS

    # the image to use for the button
    $P0 = new 'String'
    $P0 = "filename/to/image.png"

    # create the button
    button = new ['SDL'; 'Button'], $P0

    # set the position
    button.'xpos'( 10 )
    button.'ypos'( 10 )

    # set the number of states
    button.'states'( 2 )

    # activate the second status (first is 0)
    button = 1

    # draw the button
    button."draw"( screen )

=head1 DESCRIPTION

A button uses an image containing several images representing different
states of a button. You can change the button status at any time, the
button will then be drawn differently.
Please have a look at F<examples/sdl/minesweeper/smiley.png> for an example.

=head1 METHODS

An SDL::Button object has the following methods:

=over 4

=cut

.namespace ['SDL'; 'Button']

.sub __onload :tag('load')
    .local pmc class
    class = get_class ['SDL'; 'Button']
    if_null class, define_class
    .return()

  define_class:
    newclass     class, ['SDL'; 'Button']
    addattribute class, 'image'
    addattribute class, 'status'
    addattribute class, 'states'
    addattribute class, 'rect'
    addattribute class, 'clicked'
    addattribute class, 'actions'
.end

=item button = new ID, name

=cut

.sub init_pmc :vtable :method
    .param pmc name

    $P0 = new ['SDL'; 'Image'], name
    setattribute self, 'image', $P0

    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'status', $P0

    $P0 = new 'Integer'
    $P0 = 1
    setattribute self, 'states', $P0

    $P0 = new ['SDL'; 'Rect']
    setattribute self, 'rect', $P0

    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'clicked', $P0

    $P0 = new 'ResizablePMCArray'
    setattribute self, 'actions', $P0
.end

=item set_integer_native

=cut

.sub set_integer_native :vtable :method
    .param int val

    $P0 = getattribute self, 'status'
    $P0 = val
.end

=item get_integer

=cut

.sub get_integer :vtable :method
    $P0 = getattribute self, 'status'
    $I0 = $P0

    .return( $I0 )
.end

=item states( count )

=cut

.sub states :method
    .param int count

    $P0 = getattribute self, 'states'
    $P0 = count
.end

=item pos( x, y )

=cut

.sub pos :method
    .param int x
    .param int y

    $P0 = getattribute self, 'rect'

    $P0.'x'( x )
    $P0.'y'( y )
.end

=item size( width, height )

=cut

.sub size :method
    .param int w
    .param int h

    $P0 = getattribute self, 'rect'

    $P0.'width'( w )
    $P0.'height'( h )
.end

=item draw( screen )

=cut

.sub draw :method
    .param pmc screen
    .local pmc image
    .local int status
    .local int states
    .local pmc drect
    .local pmc srect
    .local pmc clicked

    image   = getattribute self, 'image'

    $P0     = getattribute self, 'status'
    status  = $P0

    $P0     = getattribute self, 'states'
    states  = $P0

    drect   = getattribute self, 'rect'
    clicked = getattribute self, 'clicked'

    srect   = new ['SDL'; 'Rect']

    $I1 = drect.'height'()
    srect.'height'( $I1 )
    $I1 = drect.'width'()
    srect.'width'( $I1 )

    cmod $I0, status, states
    $I0 *= $I1
    srect.'x'( $I0 )

    $I1 = drect.'height'()
    $I0 = clicked
    $I0 *= $I1
    srect.'y'( $I0 )

    screen.'blit'( image, srect, drect )
    screen.'update_rect'( drect )
.end

=item click( x, y )

=cut

.sub click :method
    .param int x
    .param int y
    .param int b
    .param pmc arg
    .local pmc rect
    .local pmc clicked

    rect    = getattribute self, 'rect'
    clicked = getattribute self, 'clicked'

    $I0 = rect.'x'()
    if x < $I0 goto OUT
    $I1 = rect.'width'()
    $I0 += $I1
    if x >= $I0 goto OUT

    $I0 = rect.'y'()
    if y < $I0 goto OUT
    $I1 = rect.'height'()
    $I0 += $I1
    if y >= $I0 goto OUT

    $I0 = clicked
    if $I0 goto RAISE

    clicked = 1
    branch OK
RAISE:
    if b == 1 goto END
    self."raise"( arg )
    clicked = 0
    branch OK
OUT:
    $I0 = clicked
    unless $I0 goto END

    clicked = 0

OK:
    .return( 1 )

END:
    .return( 0 )
.end

=item raise( arg )

=cut

.sub raise :method
    .param pmc arg
    .local int status
    .local pmc action

    $P0    = getattribute self, 'status'
    status = $P0

    action = getattribute self, 'actions'

    $P0    = action[status]

    $P0( arg )
.end

=item setAction( status, callback )

=cut

.sub setAction :method
    .param int status
    .param pmc cb
    .local pmc action

    action         = getattribute self, 'actions'
    action[status] = cb
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
