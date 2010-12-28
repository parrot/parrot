
=head1 TITLE

Stream;Lines - process a stream one line per read

=head1 VERSION

version 0.1

=head1 SYNOPSIS

please see F<examples/streams/Lines.pir> and F<examples/streams/FileLines.pir>

=head1 DESCRIPTION

TBD

=head1 METHODS

=over 4

=cut

.sub onload :load :anon
    .local int i
    .local pmc base
    .local pmc lines

    $P0 = get_class ['Stream'; 'Lines']
    unless null $P0 goto END

    load_bytecode 'Stream/Base.pbc'

    get_class base, ['Stream'; 'Base']
    subclass lines, base, ['Stream'; 'Lines']

    addattribute lines, "line_buffer"
END:
.end

.namespace ['Stream'; 'Lines']

.sub init :vtable :method
    .local pmc temp

    temp = new 'String'
    setattribute self, 'line_buffer', temp
.end

=item is = stream."connected"()

...

=cut

.sub connected :method
    # XXX: check if the buffer is empty if the source stream is not connected
    getattribute $P0, self, 'source'
    if_null $P0, NOT_CONNECTED
    $I0 = defined $P0
    unless $I0 goto NOT_CONNECTED
    $I0 = $P0."connected"()
    .return($I0)
NOT_CONNECTED:
    .return(0)
.end

=item is = stream."rawRead"() (B<internal>)

...

=cut

.sub rawRead :method
    .local pmc temp
    .local string buffer
    .local string ret
    .local int i

    buffer = self."buffer"()
    i = length buffer
    if i > 0 goto BUFFER_OK
BUFFER_FILL:
    (buffer, i) = self."fillBuffer"()
    ret = buffer
    if i == 0 goto BUFFER_END
#    if i != 0 goto BUFFER_OK
#    self."close"()
#    branch BUFFER_END
BUFFER_OK:

    index i, buffer, "\n"

    if i == -1 goto BUFFER_FILL

    substr ret, buffer, 0, i
    inc i
    substr buffer, buffer, i

    self."setBuffer"( buffer )

BUFFER_END:
    .return(ret)
.end

=item is = stream."buffer"() (B<internal>)

...

=cut

.sub buffer :method
    .local pmc temp
    .local string _buffer

    getattribute temp, self, 'line_buffer'
    _buffer = temp

    .return(temp,_buffer)
.end

=item is = stream."setBuffer"() (B<internal>)

...

=cut

.sub setBuffer :method
    .param string buffer
    .local pmc temp

    new temp, 'String'
    temp = buffer
    setattribute self, 'line_buffer', temp
.end

=item stream."fillBuffer"() (B<internal>)

...

=cut

.sub fillBuffer :method
    .local pmc temp
    .local string buffer
    .local string str
    .local int code

    # read
    temp = self."source"()
    str = temp."read"()

    getattribute temp, self, 'line_buffer'
    buffer = temp
    code = 0

    if_null str, END

    # concat to the buffer
    buffer = concat buffer, str
    temp = buffer
    setattribute self, 'line_buffer', temp
    code = 1

END:
    if code == 1 goto NO_CLOSE
    self = self."source"()
    self."close"()
    null buffer
    null code
NO_CLOSE:
    .return(buffer, code)
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
