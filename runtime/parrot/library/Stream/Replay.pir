
=head1 TITLE

Stream;Replay - replayable Stream

=head1 VERSION

version 0.1

=head1 SYNOPSIS

    load_bytecode 'Stream/Replay.pbc'

    $P0 = new ['Stream'; 'Replay']
    assign $P0, other_stream

    # .. read from $P0 ..

    $P1 = clone $P0

    # .. read further ..

    $P0 = $P1
    # now, if you read from $P0, you get the same data as after the clone

=head1 DESCRIPTION

By using C<clone>, you can read data from a stream as often as you want.

=head1 METHODS

=over 4

=cut

.namespace ['Stream'; 'Replay']

.sub onload :tag('load') :anon
    $P0 = get_class ['Stream'; 'Replay']
    unless null $P0 goto END

    $P0 = load_bytecode 'Stream/Base.pbc'
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'('load')
  done_initialization:

    # Stream;Replay
    get_class $P0, ['Stream'; 'Base']
    subclass $P0, $P0, ['Stream'; 'Replay']
    addattribute $P0, "replay_buffer"
    addattribute $P0, "pos"

    # Stream;Replay;Buffer
    newclass $P0, ['Stream'; 'Replay'; 'Buffer']
    addattribute $P0, "strings"
    addattribute $P0, "clones"
END:
.end

=item init

...

=cut

.sub init :vtable :method
    .local pmc temp

    temp = new 'Integer'
    setattribute self, 'pos', temp
.end

=item assign stream, source

...

=cut

.sub set_pmc :vtable :method
    .param pmc val
    .local pmc buffer

    isa $I0, val, ['Stream'; 'Replay']
    unless $I0 goto NOTA

    # get the buffer
    getattribute buffer, val, 'replay_buffer'

    # add us to the buffer
    buffer."add"( self )

    # store the buffer
    setattribute self, 'replay_buffer', buffer

    # get the position
    getattribute $P0, val, 'pos'

    $P0 = clone $P0

    # set the position
    setattribute val, 'pos', $P0

    # assign the source
    val = val."source"()
    goto ASSIGN
NOTA:
    buffer = new ['Stream'; 'Replay'; 'Buffer']
    setattribute self, 'replay_buffer', buffer
ASSIGN:
    self."setSource"( val )
.end

=item stream."rawRead"() (B<internal>)

...

=cut

.sub rawRead :method
    .local pmc source
    .local pmc buffer
    .local pmc pos
    .local string ret

    null ret
    source = self."source"()
    if_null source, END
    getattribute buffer, self, 'replay_buffer'
    if_null buffer, END
    getattribute pos, self, 'pos'

    ret = buffer."read"( pos, source )
END:
    .return(ret)
.end

=item stream2 = clone stream

...

=cut

.sub clone :vtable :method
    .local pmc ret
    .local pmc temp

    ret = new ['Stream'; 'Replay']

    assign ret, self

    $P0 = self."byte_buffer"()
    if_null $P0, END
    $P0 = clone $P0
    ret."byte_buffer"( $P0 )
END:
    .return(ret)
.end


.namespace ['Stream'; 'Replay'; 'Buffer']

.sub init :vtable :method
    .local pmc temp

    temp = new 'ResizableStringArray'
    setattribute self, 'strings', temp

    temp = new 'ResizablePMCArray'
    setattribute self, 'clones', temp
.end

.sub compact :method
    # XXX check the begin of the queue for stale entries
    noop
.end

.sub read :method
    .param pmc pos
    .param pmc source
    .local string ret
    .local pmc strings
    .local pmc clones

    null ret
    $I0 = defined source
    unless $I0 goto END

    getattribute strings, self, 'strings'
    getattribute clones, self, 'clones'

    $I0 = clones
    if $I0 <= 1 goto READ_SOURCE

    $I0 = pos
    $I1 = strings

    if $I0 >= $I1 goto READ_SOURCE

    ret = strings[$I0]
    inc pos
    branch END

READ_SOURCE:
    ret = source."read"()

    $I0 = clones
    if $I0 <= 1 goto END
    inc pos
    push strings, ret
END:

    .return(ret)
.end

.sub add :method
    .param pmc stream
    .local pmc clones

    getattribute clones, self, 'clones'
    push clones, stream
.end

.sub remove :method
    .param pmc stream
    .local pmc clones
    .local pmc entry
    .local int i
    .local int j

    getattribute clones, self, 'clones'

    i = 0
    j = clones
LOOP:
    if i >= j goto END
    entry = clones[i]
    null entry
    clones[i] = entry
    ne_addr entry, stream, NEXT
NEXT:
    inc i
    branch LOOP
END:
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
