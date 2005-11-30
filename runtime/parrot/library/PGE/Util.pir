
=head1 TITLE

PGE::Util - utility PGE subroutines

=head1 DESCRIPTION

The subroutines and items in this module are provided to make
working with PGE a little easier.

This module defines the "PGE::P6Grammar" compiler, which can be
used to compile complete sets of rules (grammars).  Input to the 
grammar compiler is a string containing statements of the form

    grammar <name> ;
    rule <ident> { <p6rule> } ;
    # comment

A C<grammar> statement indicates where to load any subsequent rules.
Unlike Perl 6, there can be multiple C<grammar> statements in the
string.  

Here's a code snippet to load a set of rules using the grammar compiler:

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Util.pir"

    $S0 = <<'END'
        grammar PGE::Rule;
        rule ident { [ _ | <?alpha> ] \w* }
        rule name { <ident> [ \:\: <ident> ]* }
    END
    $P0 = compreg "PGE::P6Grammar"
    $P1 = $P0($S0)
    # rules <PGE::Rule::ident> and <PGE::Rule::name> have now been loaded

The return value from the compiler is a string containing the
PIR generated from the rules in the grammar, which can be saved
and used to generate precompiled .pbc files for other packages.

=head2 Functions

=item C<__onload()>

Generates the grammar parse rule needed to parse grammar strings.

=cut

.namespace [ "PGE" ]

.sub "__onload" :load
    $S0 = ':w ( (grammar) (\w+[\:\:\w+]*) ;? | (rule) (\w+) \{<p6rule>\} )*'
    $P0 = compreg "PGE::P6Rule"
    $P0($S0, "PGE", "_grammar_rule")
    $P0 = find_global "PGE", "compile_rules"
    compreg "PGE::P6Grammar", $P0
    .return ()
.end

=item C<compile_rules(STR src)>

Compiles and loads a sequence of rule statements from the string
given by C<src>.  

=cut


.sub "compile_rules"
    .param string str
    .local pmc p6rule
    .local pmc parser
    .local pmc match, slist, stmt
    .local string namespace
    .local string code

    namespace = "PGE::Rule"
    code = new .String
    p6rule = compreg "PGE::P6Rule"
    parser = find_global "PGE", "_grammar_rule"

    match = parser(str)
    unless match goto end
    slist = match[0]
  loop:
    unless slist goto end
    stmt = shift slist
    $S1 = stmt[0]
    if $S1 == "#" goto loop
    if $S1 == "rule" goto compile_rule
    namespace = stmt[1]
    goto loop
  compile_rule:
    $S1 = stmt[1]
    $S2 = stmt['p6rule']
    ($P3, $S4, $P5) = p6rule($S2, namespace, $S1)
    code .= "\n# <"
    code .= namespace
    code .= "::"
    code .= $S1
    code .= ">\n"
    code .= $S4
    code .= "\n"
    goto loop
  end:
    .return (code)
.end

