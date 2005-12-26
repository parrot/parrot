=head1 INFORMATION

This example shows the usage of C<Stream::Sub>.

=head1 FUNCTIONS

=over 4

=item _main

Creates a C<Stream::Sub> and dumps it.

=cut

.sub _main :main
    .local pmc stream

    load_bytecode "library/Stream/Sub.imc"

    find_type $I0, "Stream::Sub"
    new stream, $I0

    # set the stream's source sub
    .const .Sub temp = "_hello"
    assign stream, temp

    # dump the stream
    stream."dump"()

    end
.end

=item _hello

This sub is used as the source for the stream.

It just writes some text to the stream.

=cut

.sub _hello method
    self."write"( "hello" )
    self."write"( "world!" )
    self."write"( "parrot" )
    self."write"( "is cool" )
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (c) 2004, the Perl Foundation.

=cut
