=head1 TITLE

PGE - the Parrot/Perl Grammar Engine

=head2 Description

This is the base file for the grammar engine.  It basically combines
(via .include) each of the separate PGE modules into a single compilation
unit, calling the subroutines marked with the C<:load> subpragma for each.

=cut

.namespace [ "PGE" ]

.include "compilers/pge/PGE/TokenHash.pir"
.include "compilers/pge/PGE/Match.pir"
.include "compilers/pge/PGE/OPTable.pir"
.include "compilers/pge/PGE/Exp.pir"
.include "compilers/pge/PGE/P6Rule.pir"
.include "compilers/pge/PGE/P5Regexp.pir"
.include "compilers/pge/PGE/Rule.pir"
.include "compilers/pge/PGE/Library.pir"
