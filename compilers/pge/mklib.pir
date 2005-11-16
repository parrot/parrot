=head1 TITLE

Library.src.pir

=head2 Description

This runs the grammar engine to create source code for built-in 
subrules such as <ident> and <name>.  Then can then be loaded 
(via include) pre-compiled directly into the PGE.pbc bytecode
file.

=cut

.sub "main" :main
    .local pmc load
    .local string keyword
    .local string name
    .local string rulex
    .local string grammar
    .local string code
    load = find_global "PGE::TokenHash", "__onload"
    load()
    load = find_global "PGE::Match", "__onload"
    load()
    load = find_global "PGE::OPTable", "__onload"
    load()
    load = find_global "PGE::Exp", "__onload"
    load()
    load = find_global "PGE::P6Rule", "__onload"
    load()
    load = find_global "PGE::Rule", "__onload"
    load()
    load_bytecode "PGE/Util.pir"

    $P0 = open "library.pge", "<"
    $S0 = read $P0, 65535
    close $P0
    $P1 = find_global "PGE", "compile_rules"
    code = $P1($S0)
    print code
.end

.include "compilers/pge/PGE/TokenHash.pir"
.include "compilers/pge/PGE/Match.pir"
.include "compilers/pge/PGE/OPTable.pir"
.include "compilers/pge/PGE/Exp.pir"
.include "compilers/pge/PGE/P6Rule.pir"
.include "compilers/pge/PGE/Rule.pir"
