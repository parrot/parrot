
=head1 NAME

PCT - Parrot compiler toolkit

=head1 DESCRIPTION

This file loads all of the modules typically used in the
standard Parrot Compiler Toolkit.

=cut

.namespace [ 'PCT' ]

.sub 'load_bytecode' :anon
    .param string libname
    $P0 = load_bytecode libname
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
.end

.sub '__onload' :tag('load') :tag('init')
    'load_bytecode'('PCT/Grammar.pbc')
    'load_bytecode'('PCT/PAST.pbc')
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
