=head1 INFORMATION

This example demonstrates what C<Stream::Lines> does.

=head1 FUNCTIONS

=over 4

=item _main

Creates a stream and pipes it through a Stream::Lines stream.

=cut

.sub _main
    .local pmc stream
    .local pmc lines

    load_bytecode "library/Stream/Sub.imc"
    load_bytecode "library/Stream/Lines.imc"
    
    # create a text stream
    find_type $I0, "Stream::Sub"
    new stream, $I0
    # set the source
    .const .Sub temp = "_text"
    assign stream, temp

    # create a lines stream
    find_type $I0, "Stream::Lines"
    new lines, $I0
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

.sub _text method
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

Copyright (c) 2004, the Perl Foundation.

=cut
