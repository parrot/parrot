=head1 NAME

PAST - Parrot abstract syntax tree

=head1 DESCRIPTION

This file implements the PAST-pm compiler toolchain, for
compiling programs into Parrot.

=cut

.include 'src/Grammar.pir'

.include 'src/HLLCompiler.pir'

.include 'src/PAST/Node.pir'

.include 'src/PAST/Compiler.pir'

.include 'src/POST/Node.pir'

.include 'src/POST/Grammar_gen.pir'

.include 'src/POST/Compiler.pir'

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.

=head1 COPYRIGHT

Copyright (C) 2006, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
