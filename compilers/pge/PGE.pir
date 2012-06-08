# Copyright (C) 2005-2009, Parrot Foundation.

=head1 TITLE

PGE - the Parrot/Perl Grammar Engine

=head1 DESCRIPTION

This is the base file for the grammar engine.  It basically combines
(via .include) each of the separate PGE modules into a single compilation
unit, calling the subroutines marked with the C<:load> subpragma for each.

=cut

.namespace [ "PGE" ]

.include "compilers/pge/PGE/Match.pir"
.include "compilers/pge/PGE/OPTable.pir"
.include "compilers/pge/PGE/Regex.pir"
.include "compilers/pge/PGE/Exp.pir"
.include "compilers/pge/PGE/Perl6Regex.pir"
.include "compilers/pge/PGE/P5Regex.pir"
.include "compilers/pge/PGE/builtins_gen.pir"


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
