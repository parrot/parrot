=head1 DESCRIPTION

This small example shows the usage of C<Stream::ParrotIO>.

It reads this file with a default block size.

You can specify another block size with the C<blockSize> method.
C<blockSize> called without an integer parameter will return the
current block size.

Each time the C<read> method is called, the next block is read from
the underlying ParrotIO, until EOF, where the stream will be disconnected.

Instead of using the C<open> method, you can also assign your own ParrotIO
PMC to the stream with the C<assign> op.

=cut

.sub _main :main
    .local pmc stream

    load_bytecode 'Stream/ParrotIO.pbc'

    # create the ParrotIO stream
    stream = new ['Stream'; 'ParrotIO']

    # open this file
    stream."open"( "examples/streams/ParrotIO.pir", 'r' )

    # you can specify a custom block size with
    # stream."blockSize"( 10 )

    # dump the stream
    stream."dump"()

    end
.end

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
