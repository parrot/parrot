
=head1 TITLE

Stream;Writer - a PIR sub as target for a Stream

=head1 VERSION

version 0.1

=head1 SYNOPSIS

    # create the stream
    new stream, ['Stream'; 'Writer']

    # set the source sub
    .const 'Sub' temp = "_reader"
    stream."source"( temp )

    stream."write"( "hello, world" )

    ...

    .sub _reader :method
        .local string str
        str = self."read"()
    .end

=head1 DESCRIPTION

=cut

.include "interpinfo.pasm"
.namespace ['Stream'; 'Writer']

.sub __onload :tag('load')
    $P0 = get_class ['Stream'; 'Writer']
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

    get_class $P0, ['Stream'; 'Base']
    subclass $P1, $P0, ['Stream'; 'Writer']

    addattribute $P1, "writer"
    addattribute $P1, "status"
  END:
.end

=head1 METHODS

=over 4

=cut

.sub _reader_stub :method
    .local pmc source
    .local pmc mysub
    #.local pmc myself

    interpinfo mysub, .INTERPINFO_CURRENT_SUB
    #interpinfo myself, .INTERPINFO_CURRENT_OBJECT
    getprop source, "CALL", mysub
    source()

    # close the source
    source = get_hll_global ['Stream'; 'Base'], 'close'
    self."setSource"()

    # mark it as closed
    .local pmc status
    interpinfo self, .INTERPINFO_CURRENT_OBJECT
    getattribute status, self, 'status'
    status = 0
.end

.sub init :vtable :method
    .local pmc status

    new status, 'Integer'
    set status, 0
    setattribute self, 'status', status
.end

.sub set_pmc :vtable :method
    .param pmc source
    .local pmc status

    .const 'Sub' stub = "_reader_stub"
    setprop stub, "CALL", source
    self."setSource"( stub )

    getattribute status, self, 'status'
    status = 1
.end

.sub close :method
    .local string str

    null str
LOOP:
    $I0 = self."connected"()
    unless $I0 goto END
    self."write"( str )
    branch LOOP
END:
.end

.sub connected :method
    .local pmc status
    .local int ret

    getattribute status, self, 'status'
    ret = status
    .return(ret)
.end

=item source."write"()

...

=cut

.sub write :method
    .param string str
    .local pmc source
    .local pmc status

    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_CONT
    setattribute self, 'writer', $P0
    getattribute status, self, 'status'

    if status == 0 goto END
    if status == 2 goto WRITE
    status = 2
    self."write"( "" )
WRITE:

    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_CONT
    setattribute self, 'writer', $P0

    source = self."source"()
    $I0 = defined source
    unless $I0 goto END

    source( str )
END:
    .return()
    goto WRITE	# XXX else self gets overwritten by source
.end

=item source."rawRead"() (B<internal>)

...

=cut

.sub rawRead :method
    .local string str
    .local pmc writer
    .local pmc cont

    cont = self."source"()
    if_null cont, END_OF_STREAM

    getattribute writer, self, 'writer'
    str = self."_call_writer"(writer)
    .return(str)
END_OF_STREAM:
    null writer
    setattribute self, 'writer', writer
    null str

    .return(str)
.end

.sub _call_writer :method
    .param pmc writer
    .local pmc cont
    .local string str

    cont = interpinfo .INTERPINFO_CURRENT_CONT
    self."setSource"( cont )
    str = writer()
    .return(str)
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
