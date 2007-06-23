=head1 NAME

PAST::Compiler - PAST Compiler

=head1 DESCRIPTION

PAST::Compiler implements a basic compiler for PAST nodes.
By default PAST::Compiler transforms a PAST tree into POST,
and then invokes POST::Compiler on the resulting POST tree.

=over

=cut

.namespace [ 'PAST::Compiler' ]

.sub '__onload' :load :init
    load_bytecode 'Parrot/HLLCompiler.pbc'

    $P99 = subclass 'HLLCompiler', 'PAST::Compiler'
    $P0 = new 'PAST::Compiler'
    $P0.'language'('PAST')
    .return ()
.end


=item compile(node, ['target'=>target, ...])

Compile the abstract syntax tree given by C<past> into the form
given by C<target>.  Current targets include "past", "post", "pir";
if no C<target> is supplied then the abstract syntax tree is compiled
to executable code (but not executed).

=cut

.sub 'compile' :method
    .param pmc past
    .param pmc adverbs         :slurpy :named

    .local pmc postgrammar, postbuilder, post
    postgrammar = new 'POST::Grammar'
    postbuilder = postgrammar.'apply'(past)
    post = postbuilder.'get'('root')
    .return (post)

.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.
2006-11-27  Significant refactor into separate modules.

=head1 COPYRIGHT

Copyright (C) 2006, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
