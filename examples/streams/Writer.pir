
=head1 DESCRIPTION

This example shows the usage of C<Stream::Write>.

=head1 FUNCTIONS

=over 4

=item _main

Creates a C<Stream::Writer> and writes to it.

=cut

.sub _main :main
    .local pmc stream

    load_bytecode 'Stream/Writer.pbc'

    stream = new ['Stream'; 'Writer']

    # set the stream's source sub
    .const 'Sub' temp = "_reader"
    assign stream, temp

    print "main start\n"
    stream."write"( "hello" )
    stream."write"( "world!" )
    stream."write"( "parrot" )
    stream."write"( "is cool" )
    stream."close"()
    print "main done\n"

    end
.end

=item _reader

This sub is used as the target for the stream.

It just reads from the stream.

=cut

.sub _reader :method
    print "reader start\n"
    self."dump"()
    print "reader done\n"
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
