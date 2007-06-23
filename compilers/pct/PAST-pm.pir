=head1 NAME

PAST - Parrot abstract syntax tree

=head1 DESCRIPTION

This file implements the PAST-pm compiler toolchain, for
compiling programs into Parrot.

=cut

.include 'PAST/Node.pir'

.include 'PAST/Compiler.pir'

.include 'POST/Node.pir'

.include 'POST/Grammar_gen.pir'

.include 'POST/Compiler.pir'

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
