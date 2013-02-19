
=head1 DESCRIPTION

This example demonstrates how to include another stream inside a stream.

=head1 FUNCTIONS

=over 4

=item _main

Creates a counter stream and dumps it.

=cut

.sub _main :main
    .local pmc stream

    load_bytecode 'Stream/Sub.pbc'

    stream = new ['Stream'; 'Sub']

    # set the stream's source sub
    .const 'Sub' temp = "_counter"
    assign stream, temp

    # dump the stream
    stream."dump"()

.end

=item _counter

This sub is used as the source for the counter stream.

It writes the numbers 0 to 9 as strings to the stream.

After writing "4", it will create another stream (with the sub C<_included> as source)
and then includes it in its own stream.

=cut

.sub _counter :method
    .local string str
    .local int i

    i = 0

LOOP:
    str = i

    self."write"( str )

    # include another stream after '4'
    if i != 4 goto SKIP
    .local pmc temp

    temp = new ['Stream'; 'Sub']

    .const 'Sub' func = "_included"
    assign temp, func

    # include it
    self."include"( temp )
SKIP:

    inc i
    if i < 10 goto LOOP
.end

=item _included

This sub is the source of the stream included into the counter stream.

It writes "hello", then includes another stream (C<_counter2>) and then
writes "world".

=cut

.sub _included :method
    .local pmc temp
    .local pmc func

    self."write"( "hello" )

    # create another stream
    temp = new ['Stream'; 'Sub']
    .const 'Sub' func = "_counter2"
    assign temp, func

    # include it
    self."include"( temp )

    self."write"( "world" )
.end

=item _counter2

This sub is the source of the stream included between the "hello" and the "world".

Writes the letters "A" till "F" into the stream.

=cut

.sub _counter2 :method
    .local string str

    str = 'A'
LOOP:
    self."write"( str )

    ord $I0, str
    inc $I0
    chr str, $I0

    if str != "G" goto LOOP
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
