
=head1 Combiner Example

This example shows the usage of C<Stream::Combiner>.

It uses two Stream::Sub, one sub generates an endless stream
of line numbers, the other writes just a few lines.

The Stream::Combiner combines both streams line by line.
We specify our own combiner sub that concatenates the strings
read from both streams together, separated by a space.

If you specify no combiner sub, a default one will be used that
just concatenates both strings. If the _counter sub would add
a space after the number, we could use the default combiner
(by not calling the C<combiner> method).

=head1 FUNCTIONS

=over 4

=item _main

Creates the 3 Stream objects and dumps the combined stream.

=cut

.sub _main :main
    .local pmc counter
    .local pmc text
    .local pmc combined

    load_bytecode 'Stream/Base.pbc'
    load_bytecode 'Stream/Combiner.pbc'
    load_bytecode 'Stream/Sub.pbc'

    # create the counter stream
    counter = new ['Stream'; 'Sub']
    .const 'Sub' temp = "_counter"
    assign counter, temp

    # create the text stream
    text = new ['Stream'; 'Sub']
    # set its source
    .const 'Sub' temp = "_text"
    assign text, temp

    # create a combiner stream
    combined = new ['Stream'; 'Combiner']
    # add the streams
    assign combined, counter
    assign combined, text

    # specify our own combiner sub
    .const 'Sub' temp = "_combiner"
    combined."combiner"( temp )

    # dump the combined stream
    combined."dump"()

    end
.end

=item _counter

The _counter sub is used as a source of the counter stream.
It writes a string (an increasing number) to the stream each
time someone reads the stream.

=cut

.sub _counter
    .param pmc stream
    .local int i
    .local string str

    i = 0
LOOP:
    inc i
    str = i
    stream."write"( str )
    branch LOOP
.end

=item _text

The _text sub is used as a source of the text stream.
It just writes some text to the stream.

The stream is automatically diconnected when the sub returns, which
will also terminate the combined stream.

=cut

.sub _text
    .param pmc stream

    stream."write"( "hello" )
    stream."write"( "world!" )
    stream."write"( "parrot" )
    stream."write"( "is cool" )
.end

=item _combiner

This sub is called to combine the two strings read from both streams.
The string returned by this sub is immediately returned by the C<read> method
of the Combiner stream.

=cut

.sub _combiner
    .param pmc strings
    .local string str
    .local string ret

    ret = strings[0]
    ret = concat ret, " "
    str = strings[1]
    ret = concat ret, str

    .return(ret)
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2010, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
