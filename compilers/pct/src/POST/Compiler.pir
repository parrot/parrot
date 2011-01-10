
=head1 NAME

POST::Compiler - Compiler for POST trees

=head1 DESCRIPTION

POST::Compiler defines a compiler that converts a POST tree into
PIR or an Eval PMC (bytecode).

=head1 METHODS

=over

=cut

.namespace [ 'POST';'Compiler' ]

.sub '__onload' :load :init
    .local pmc p6meta, cproto
    p6meta = new 'P6metaclass'
    cproto = p6meta.'new_class'('POST::Compiler', 'parent'=>'PCT::HLLCompiler')
    cproto.'language'('POST')
    $P1 = split ' ', 'pir evalpmc'
    cproto.'stages'($P1)

    $P0 = new 'String'
    set_global '$?HLL', $P0
    null $P0
    set_global '$?NAMESPACE', $P0
    .return ()
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2007-11-21  Significant refactor as part of Parrot Compiler Toolkit

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
