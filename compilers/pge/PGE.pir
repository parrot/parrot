=head1 TITLE

PGE - the Parrot/Perl Grammar Engine

=head2 Description

This is the base file for the grammar engine.  It basically combines
(via .include) each of the separate PGE modules into a single compilation
unit, and then calls the "__onload" subroutines for each.  We do
this because as of this writing (2005-May-03) the semantics of
multiple @LOAD pragmas in a single compilation unit aren't well
defined.

=cut

.namespace [ "PGE" ]

.sub "__onload" @LOAD
    .local pmc load
    load_bytecode "Data/Escape.pbc"
    load = find_global "PGE::TokenHash", "__onload"
    load()
    load = find_global "PGE::Exp", "__onload"
    load()
    load = find_global "PGE::Match", "__onload"
    load()
    load = find_global "PGE::Rule", "__onload"
    load()
    load = find_global "PGE::P6Rule", "__onload"
    load()
.end

.include "compilers/pge/PGE/TokenHash.pir"
.include "compilers/pge/PGE/Exp.pir"
.include "compilers/pge/PGE/Match.pir"
.include "compilers/pge/PGE/Rule.pir"
.include "compilers/pge/PGE/P6Rule.pir"
