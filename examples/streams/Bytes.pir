
=head1 DESCRIPTION

This example shows the usage of C<Stream::read_bytes>.

=head1 FUNCTIONS

=over 4

=item _main


=cut

.sub _main :main
    .local pmc stream

    load_bytecode 'Stream/Sub.pbc'
    load_bytecode 'Stream/Replay.pbc'

    $P0 = new ['Stream'; 'Sub']
    # set the stream's source sub
    .const 'Sub' temp = "_hello"
    assign $P0, temp

    stream = new ['Stream'; 'Replay']
    assign stream, $P0

    $S0 = stream."read_bytes"( 3 )
    print "'hel': ["
    print $S0
    print "]\n"

    stream = clone stream
    $P0 = clone stream

    $S0 = stream."read_bytes"( 4 )
    print "'lowo': ["
    print $S0
    print "] = "

    $S0 = $P0."read_bytes"( 4 )
    print "["
    print $S0
    print "]\n"

    $S0 = stream."read"()
    print "'rld!': ["
    print $S0
    print "]\n"

    $S0 = stream."read_bytes"( 100 )
    print "'parrotis cool': ["
    print $S0
    print "]\n"

    end
.end

=item _hello

This sub is used as the source for the stream.

It just writes some text to the stream.

=cut

.sub _hello :method
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

Copyright (C) 2004-2009, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
