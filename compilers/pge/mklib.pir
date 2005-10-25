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
    .local pmc p6rule
    .local pmc gparse
    .local pmc stmt
    .local string keyword
    .local string name
    .local string rulex
    .local string grammar
    .local string code
    load_bytecode "Data/Escape.pbc"
    load = find_global "PGE::TokenHash", "__onload"
    load()
    load = find_global "PGE::Exp", "__onload"
    load()
    load = find_global "PGE::Match", "__onload"
    load()
    load = find_global "PGE::P6Rule", "__onload"
    load()
    load = find_global "PGE::Rule", "__onload"
    load()
    p6rule = find_global "PGE", "p6rule"
    $S0 = ':w ( (grammar) ([\w|\:]+) ; | (rule) (\w+) \{(<-[}]>+)\} | (\#)\N* )*'
    (gparse, code) = p6rule($S0)
    grammar = "PGE::Rule"

    $P0 = open "library.pge", "<"
    $S0 = read $P0, 65535
    close $P0
    $P0 = gparse($S0)
    $P1 = $P0[0]
    $I0 = elements $P1
    $I1 = 0
  loop_1:
    if $I1 >= $I0 goto end
    stmt = $P1[$I1]
    inc $I1
    $P0 = stmt[0]
    keyword = $P0
    if keyword == "#" goto loop_1
    if keyword == "grammar" goto grammar_stmt
    $P0 = stmt[1]
    name = $P0
    $P0 = stmt[2]
    code = $P0
    print "\n\n# "
    print grammar
    print "::"
    print name
    print "\n"
    ($P0, code) = p6rule(code, grammar, name)
    print code
    goto loop_1
  grammar_stmt:
    $P0 = stmt[1]
    grammar = $P0
    goto loop_1
  end:
.end

.include "compilers/pge/PGE/TokenHash.pir"
.include "compilers/pge/PGE/Exp.pir"
.include "compilers/pge/PGE/Match.pir"
.include "compilers/pge/PGE/Rule.pir"
.include "compilers/pge/PGE/P6Rule.pir"
