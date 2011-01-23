=head1 Advanced Lines Example

This is an advanced example.

It uses a file stream (Stream::ParrotIO) that is processed linewise with
Stream::Lines. A counter stream creates line numbers, both are combined to
one stream and then dumped.

=head1 NOTE

When updating this file, be sure to verify L<t/examples/streams.t>, as its
tests rely on the content of this file.

=head1 FUNCTIONS

=over 4

=item _main

Opens this file (or the one specified at the command line) and creates a lines
stream for it. Then it combines the stream with a stream providing line numbers.

=cut

.sub _main :main
    .param pmc argv
    .local int argc
    .local pmc file
    .local pmc lines
    .local pmc counter
    .local pmc combiner
    .local string name

    # get the name of the file to open
    name = "examples/streams/FileLines.pir"
    argc = argv
    if argc < 2 goto NO_NAME
    name = argv[1]
NO_NAME:

    load_bytecode 'Stream/ParrotIO.pbc'
    load_bytecode 'Stream/Lines.pbc'
    load_bytecode 'Stream/Sub.pbc'
    load_bytecode 'Stream/Combiner.pbc'

    # create a file stream
    file = new ['Stream'; 'ParrotIO']
    file."open"( name, 'r' )

    # process it one line per read
    lines = new ['Stream'; 'Lines']
    assign lines, file

    # endless counter
    counter = new ['Stream'; 'Sub']
    .const 'Sub' temp = "_counter"
    assign counter, temp

    # combine the counter and the file's lines
    combiner = new ['Stream'; 'Combiner']
    assign combiner, counter
    assign combiner, lines

    # dump the stream
    combiner."dump"()

    end
.end

=item _counter

This sub is the source of the counter stream. It just endlessly writes
line numbers followed by a space to its stream.

=cut

.sub _counter
    .param pmc stream
    .local int i
    .local string str
    .local pmc array

    i = 0
    array = new 'ResizablePMCArray'

LOOP:
    inc i
    array[0] = i
    sprintf str, "%5d ", array
    stream."write"( str )
    branch LOOP
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
