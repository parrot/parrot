
=head1 TITLE

Stream;Filter - filter and/or alter a stream

=head1 VERSION

version 0.1

=head1 SYNOPSIS

please see F<examples/streams/Filter.pir>

=head1 DESCRIPTION

TBD

=head1 METHODS

=over 4

=cut

.sub onload :tag('load') :anon
    .local int i
    .local pmc base
    .local pmc filter

    $P0 = get_class ['Stream'; 'Filter']
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

    get_class base, ['Stream'; 'Base']
    subclass filter, base, ['Stream'; 'Filter']

    addattribute filter, "filter"
END:
.end

.namespace ['Stream'; 'Filter']

=item source."filter"( filter )

Sets or returns the filter sub.

=cut

.sub filter :method
    .param pmc _filter :optional
    .param int has_filter :opt_flag
    .local pmc ret

    unless has_filter goto GET
    ret = _filter
    setattribute self, 'filter', _filter
    branch END
GET:
    getattribute ret, self, 'filter'
END:
    .return(ret)
.end

=item source."rawRead"() (B<internal>)

...

=cut

.sub rawRead :method
    .local pmc source
    .local pmc filter
    .local string str

    source = self."source"()
    filter = self."filter"()
REDO:
    str = source."read"()
    if_null str, END
    str = filter( str )
    if_null str, REDO
END:
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
