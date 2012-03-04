
=head1 TITLE

boarddata.pir - a tetris board data class

=head1 SYNOPSIS

    # create the board data
    data = new "BoardData"
    data."new"( 10, 20 )

    # fill the board
    data."fill"( 0 )

=head1 CLASS INFORMATION

This is the base class of the Board class.

=cut

.namespace ["Tetris::BoardData"]

.sub __onload :tag('load')
    $P0 = get_class "Tetris::BoardData"
    unless null $P0 goto END
    newclass $P0, "Tetris::BoardData"
    addattribute $P0, "data"
    addattribute $P0, "width"
    addattribute $P0, "height"
END:
.end

=head1 FUNCTIONS

=over 4

=item data = data."init"( width, height )

Initializes the BoardData object.

=over 4

=item parameter C<width>

The width of the board to create.

=item parameter C<height>

The height of the board to create.

=back

Returns the created data object.

=cut

.sub init :method
    .param int w
    .param int h
    .local pmc data
    .local pmc temp
    .local int i

    # create the data array
    new data, 'ResizablePMCArray'
    setattribute self, 'data', data

    # calculate the array size
    set i, w
    mul i, h
    # resize the array
    set data, i

    # store the width
    new temp, 'Integer'
    set temp, w
    setattribute self, 'width', temp

    # store the height
    new temp, 'Integer'
    set temp, h
    setattribute self, 'height', temp
.end

=back

=head1 METHODS

=over 4

=item data."fill"( val )

Fill the data array with the specified value

=over 4

=item parameter C<val>

The value the board will be filled with.

=back

This method returns nothing.

=cut

.sub fill :method
    .param int val
    .local pmc data
    .local int i

    getattribute data, self, 'data'

    # get data size
    set i, data
    # fill the data
WHILE:
    dec i
    if i < 0 goto END
    set data[i], val
    branch WHILE
END:
.end

.sub __get_integer :method
    getattribute $P0, self, 'data'
    $I0 = $P0
    .return ($I0)
.end

.sub __get_integer_keyed :method
    .param pmc key

    getattribute $P0, self, 'data'
    $I0 = key
    $I1 = $P0
    if $I0 < $I1 goto OK
    print "error: out of bounds ("
    print $I0
    print "; "
    print $I1
    print ")!\n"
    sleep 0.1
OK:
    $I0 = $P0[$I0]

    .return ($I0)
.end

.sub __set_integer_keyed :method
    .param pmc key
    .param int val

    getattribute $P0, self, 'data'
    $P0[key] = val
.end

.sub __set_integer_native :method
    .param int val

    getattribute $P0, self, 'data'
    $P0 = val
.end

.sub __push_integer :method
    .param int val

    getattribute $P0, self, 'data'
    push $P0, val
.end

=item width = data."width"( self )

Returns the width (number of blocks in one row) of the board.

=cut

.sub width :method
    getattribute $P0, self, 'width'
    $I0 = $P0
    .return ($I0)
.end

=item height = data."height"()

Returns the height (number of blocks in one column) of the board.

=cut

.sub height :method
    getattribute $P0, self, 'height'
    $I0 = $P0
    .return ($I0)
.end

=item (width, height) = data."dimensions"()

Returns the width and height of the board.

=cut

.sub dimensions :method
    .local int w
    .local int h
    .local pmc temp

    getattribute $P0, self, 'width'
    w = $P0

    getattribute $P0, self, 'height'
    h = $P0

    .return (w, h)
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
