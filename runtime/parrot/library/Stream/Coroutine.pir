
=head1 TITLE

Stream;Coroutine - Stream library coroutine class

=head1 VERSION

version 0.1

=head1 SYNOPSIS

please see F<examples/streams/Coroutine.pir>

=head1 DESCRIPTION

TBD

=head1 METHODS

=over 4

=cut

.sub onload :tag('load') :anon
    .local pmc base
    .local pmc coro
    .local int i

    $P0 = get_class ['Stream'; 'Coroutine']
    unless null $P0 goto END

    load_bytecode 'Stream/Base.pbc'

    get_class base, ['Stream'; 'Base']
    subclass coro, base, ['Stream'; 'Coroutine']
END:
.end

.namespace ['Stream'; 'Coroutine']

=item source."rawRead"() (B<internal>)

...

=cut

.sub rawRead :method
    .local pmc coro
    .local string str

    null str
    coro = self."source"()
    $I0 = defined coro
    unless $I0 goto END

    str = coro( self )
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
