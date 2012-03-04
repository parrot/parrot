
=head1 NAME

PCT - Parrot compiler toolkit

=head1 DESCRIPTION

This file loads all of the modules typically used in the
standard Parrot Compiler Toolkit.

=cut

.namespace [ 'PCT' ]

.sub '__onload' :tag('load') :tag('init')
    load_bytecode 'PCT/Grammar.pbc'
    load_bytecode 'PCT/PAST.pbc'
    #  we don't need to explicitly load HLLCompiler, because
    #  it's already loaded by PAST.pbc
    .return ()
.end

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2007-11-29  Refactored PCT into separate modules for grammar, past, compiler
2006-11-20  Patrick Michaud added first draft of POD documentation.

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
