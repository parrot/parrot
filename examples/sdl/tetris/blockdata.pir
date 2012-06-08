
=head1 DESCRIPTION

blockdata.pir - a tetris block data class

=head1 SYNOPSIS

    # create a new random block
    data = _BlockData::new( -1 )

    # rotate the data clockwise
    _BlockData::rotate( data, 1 )

=cut

.namespace ["Tetris::BlockData"]

.sub __onload :load
    $P0 = get_class "Tetris::BlockData"
    unless null $P0 goto END
    newclass $P0, "Tetris::BlockData"
    addattribute $P0, "data"
END:
.end

=head1 METHODS

=over 4

=item blockdata."rotate"( dir )

Changes the C<block data> in a way to make
the block look rotated.

=over 4

=item parameter C<dir>

+1 = rotate clockwise

-1 = rotate counterclockwise

=back

This method returns the old data representation.

=cut

.sub rotateData :method
    .param int val
    .local int size
    .local int x
    .local int y
    .local int i
    .local int j
    .local int v
    .local pmc olddata

    getattribute olddata, self, 'data'
    olddata = clone olddata

    size = self."size"()
    set y, size
    set i, size
    mul i, size
    dec i
yLOOP:
    set x, 0
    dec y
    if y < 0 goto END
xLOOP:

    if val != +1 goto WAY2
    set j, x
    mul j, size
    add j, y
    branch DONE
WAY2:
    set j, size
    sub j, x
    dec j
    mul j, size
    set v, size
    sub v, y
    dec v
    add j, v
DONE:

    v = olddata[i]
    self[j] = v

    dec i
    inc x
    if x >= size goto yLOOP
    branch xLOOP
END:
    .return (olddata)
.end

=item rows = blockdata."vfree"()

Checks how many free rows exist at the top edge
of block represented by this block data.

Returns the number of free rows.

=cut

.sub vfree :method
    .local int size
    .local int free
    .local int i
    .local int temp
    .local int size2

    i = 0
    size = self."size"()
    if size == 0 goto END
    set i, 0
    set size2, size
    mul size2, size
VFREE_LOOP:
    if i > size2 goto VFREE_END
    temp = self[i]
    if temp goto VFREE_END
    inc i
    branch VFREE_LOOP
VFREE_END:
    div i, size
END:
    .return (i)
.end

=item columns = blockdata."hfree"()

Checks how many free columns exist at the left
an right edges.
Positive return values means that this many free
colums were counted. If the returned value is negative,
the absolute value is the number of free colums found at
the right edge.

Returns the number of free columns.

=cut

.sub hfree :method
    .local int size
    .local int free
    .local int i
    .local int offset
    .local int free
    .local int temp

    size = self."size"()
    free = 0
HFREE_LOOPfree:
    inc free
    set i, 0
    set offset, free
    dec offset
HFREE_LOOPcheck:
    temp = self[offset]
    if temp goto HFREE_ERROR

    inc i
    add offset, size
    if i < size goto HFREE_LOOPcheck
    if free < size goto HFREE_LOOPfree

HFREE_ERROR:
    dec free
    if free goto HFREE_END

    free = 0
HFREE_LOOPfree2:
    dec free
    set i, size
    mul i, -1
    if free < i goto HFREE_ERROR2
    set i, 0
    if offset < 0 goto HFREE_ERROR2
HFREE_LOOPcheck2:
    set temp, size
    add temp, free
    set offset, i
    mul offset, size
    add offset, temp

    temp = self[offset]

    if temp goto HFREE_ERROR2

    inc i
    if i < size goto HFREE_LOOPcheck2
    if free < size goto HFREE_LOOPfree2
HFREE_ERROR2:
    inc free
HFREE_END:
    .return (free)
.end

=item size = blockdata."size"()

Returns the size of the block represented by this
block data. The square of the size is the number of
items in the blockdata array.

=cut

.sub size :method
    getattribute $P0, self, 'data'
    $I0 = 0
    if_null $P0, END
    $I0 = $P0
    $N0 = $I0
    sqrt $N0, $I0
    $I0 = $N0
END:
    .return ($I0)
.end

.sub __set_pmc :method
    .param pmc data

    setattribute self, 'data', data
.end

.sub __get_integer_keyed :method
    .param pmc key
    .local int index

    index = key

    getattribute $P0, self, 'data'
    if_null $P0, ERR
    $I0 = $P0
    if index >= $I0 goto ERR
    $I0 = $P0[index]
    .return ($I0)

ERR:
    print "index out of bounds ("
    print index
    print ">="
    print $I0
    print ")!\n"
    $P0 = new 'Exception'
    $P0 = "out of bounds!"
    throw $P0
.end

.sub __set_integer_keyed :method
    .param pmc key
    .param int val
    .local int index

    index = key

    getattribute $P0, self, 'data'
    if_null $P0, ERR
    $I0 = $P0
    if index >= $I0 goto ERR
    $P0[index] = val
    .return ($I0)

ERR:
    print "index out of bounds ("
    print index
    print ">="
    print $I0
    print ")!\n"
    $P0 = new 'Exception'
    $P0 = "out of bounds!"
    throw $P0
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
