
=head1 Lines Example

This example demonstrates what C<Stream::Lines> does.

=head1 FUNCTIONS

=over 4

=item _main

Creates a stream and pipes it through a Stream::Lines stream.

=cut

.sub _main :main
    .local pmc stream
    .local pmc lines

    load_bytecode 'Stream/Sub.pbc'
    load_bytecode 'Stream/Lines.pbc'

    # create a text stream
    stream = new ['Stream'; 'Sub']
    # set the source
    .const 'Sub' temp = "_text"
    assign stream, temp

    # create a lines stream
    lines = new ['Stream'; 'Lines']
    # set the source
    assign lines, stream

    # dump the stream
    lines."dump"()

    end
.end

=item _text

This sub is used as a source for a stream piped through C<Stream::Lines>.
Writes some text containing newlines to the stream.

C<Stream::Lines> will return it one line per read.

=cut

.sub _text :method
    self."write"( "this\nis a\n" )
    self."write"( "Stream::Lines\ntest" )
    self."write"( "case\nhello world" )
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
