
=head1 TITLE

Stream;Base - Stream library base class

=head1 VERSION

version 0.1

=head1 SYNOPSIS

This is an abstract baseclass that is not supposed to be used directly.

=head1 DESCRIPTION

TBD

=head1 METHODS

=over 4

=cut

.namespace ['Stream'; 'Base']

.sub onload :tag('load') :anon
    $P0 = get_class ['Stream'; 'Base']
    unless null $P0 goto END

    newclass $P0, ['Stream'; 'Base']
    addattribute $P0, 'source'
    addattribute $P0, 'includes'
    addattribute $P0, 'buffer'
END:
.end

.sub init :vtable :method
    .local pmc close

    # call our own close
    close = get_hll_global ['Stream'; 'Base'], 'close'
    close(self)
.end

=item assign stream, source

=cut

.sub set_pmc :vtable :method
    .param pmc source

    setattribute self, 'source', source
    null source
.end

.sub setSource :method
    .param pmc source

    setattribute self, 'source', source
    null source
.end

=item close

=cut

.sub close :method :nsentry
    .local pmc temp

    # reset source
    new temp, 'Undef'
    setattribute self, 'source', temp

    # reset includes
    new temp, 'ResizablePMCArray'
    setattribute self, 'includes', temp
.end

=item stream."dump"() (debug aid)

Dumps the content of the stream.

Returns nothing.

=cut

.sub dump :method
    .local string str
    .local int i

LOOP:
    i = self."connected"()
    unless i goto END
    str = self."read"()
    if_null str, END
    print "read:["
    str = escape str
    print str
    print "]\n"
    branch LOOP
END:
.end

=item copyTo

=cut

.sub copyTo :method
    .param pmc to
    .local string str
    .local int i

LOOP:
    i = self."connected"()
    unless i goto END
    str = self."read"()
    if_null str, END
    print to, str
    branch LOOP
END:
.end

=item source = stream."source"()

Returns the currently set source.

=cut

.sub source :method
    .local pmc ret

    getattribute ret, self, 'source'

    .return(ret)
ERROR:
    print "Stream;Base.source(): parameters passed\n"
    end
.end

=item is = stream."connected"()

Returns 1 if the stream is connected, 0 otherwise.

It is connected until the source sub returns.

=cut

.sub connected :method
    .local pmc stream

    getattribute $P0, self, 'source'
    typeof $S0, $P0
    if $S0 == 'Undef' goto NOT

    can $I0, $P0, "connected"
    unless $I0 goto SKIP
    $I0 = $P0."connected"()
    unless $I0 goto NOT
SKIP:
    .return(1)
NOT:
    .return(0)
.end

=item str = stream."read"()

Returns the read string, or a null string if the stream end has been reached.

=cut

.sub read :method
    .local string ret
    .local pmc includes

    getattribute $P0, self, 'buffer'
    if_null $P0, NO_BUFFER
    ret = $P0
    null $P0
    setattribute self, 'buffer', $P0
    branch DONE
NO_BUFFER:

    getattribute includes, self, 'includes'
    if_null includes, SELF

    $I0 = includes
    if $I0 > 0 goto INCLUDE

SELF:
    ret = self."rawRead"()

    if_null includes, DONE
    if_null ret, INCLUDE_CHECK

DONE:
    .return(ret)

INCLUDE_CHECK:
    $I0 = includes
    if $I0 == 0 goto DONE

INCLUDE:
    .local pmc stream

    stream = includes[0]

    ret = stream."read"()

    if_null ret, INCLUDE_DEL
    branch DONE

INCLUDE_DEL:
    shift $P0, includes
    $I0 = includes
    if $I0 > 0 goto INCLUDE
    branch SELF
.end

=item stream."include"( stream2 )

Include stream2 in this stream. The next read on this stream will
act on the included stream.

Please have a look at F<examples/streams/Include.pir> to see how it works.

=cut

.sub include :method
    .param pmc stream
    .local pmc includes

    getattribute includes, self, 'includes'
    push includes, stream

    self."flush"()
.end

=item stream."flush"() (B<internal>)

Used to flush the stream when including another stream.

=cut

.sub flush :method
    .local int i
    .local string str
    .local pmc includes

    can i, self, "write"
    unless i goto CANT

    getattribute includes, self, 'includes'

    i = includes
    if i == 0 goto CANT

    null str
    i = self."write"( str )

CANT:
    .return(i)
.end

=item stream."read_bytes"( number )

Reads the specified number of bytes from the stream.

=cut

.sub read_bytes :method
    .param int requested
    .local string ret
    .local pmc buffer

    # get buffer
    getattribute buffer, self, 'buffer'

    # no buffer set?
    if_null buffer, CREATE

    # unset buffer
    null $P0
    setattribute self, 'buffer', $P0
    goto OK

CREATE:
    buffer = new 'String'

OK:
    ret = buffer

LOOP:
    $I0 = length ret
    if $I0 >= requested goto DONE
    $S0 = self."read"()
    if_null $S0, DONE
    ret = concat ret, $S0
    goto LOOP
DONE:

    $I0 = length ret
    if $I0 <= requested goto END

    $S0 = ret
    substr ret, $S0, 0, requested
    substr $S0, $S0, requested
    ret = clone ret
    $I0 = length $S0
    unless $I0 goto END

    assign buffer, $S0
    setattribute self, 'buffer', buffer

END:
    .return(ret)
.end

=item stream."byte_buffer"() (B<internal>)

Returns or sets the byte buffer.

=cut

.sub byte_buffer :method
    .param pmc buf :optional
    .param int has_buf :opt_flag

    if has_buf goto SET

    getattribute $P0, self, 'buffer'

    if_null $P0, END
    branch END
SET:
    setattribute self, 'buffer', buf
END:
    .return($P0)
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
