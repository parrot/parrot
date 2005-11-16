.namespace [ "PGE" ]

=head1 TITLE

PGE::Util - utility PGE subroutines

=head1 DESCRIPTION

The subroutines in this module are provided to make working with
PGE a little easier.

=item C<compile_rules(STR src)>

Compiles and loads a sequence of rule statements from the string
given by C<src>.  This string has statements of the form

    grammar <name> ;
    rule <ident> { <pattern> } ;

Each of the patterns in rule statements are then compiled and
loaded under the name and identifier.  If no C<grammar> statement
is supplied, rules are loaded into the C<PGE::Rule> namespace.

=cut

.sub "compile_rules"
    .param string str
    .local pmc p6rule
    .local pmc parser
    .local pmc match, slist, stmt
    .local pmc namespace
    .local pmc code

    namespace = new String
    namespace = "PGE::Rule"
    code = new String
    p6rule = compreg "PGE::P6Rule"
    parser = p6rule(":w ( (grammar) (\\w+[\\:\\:\\w+]*) ;? | (rule) (\\w+) \\{(<-[}]>*)\\} ;?  | (\\#)\\N*\\n )*")

    match = parser(str)
    unless match goto end
    slist = match[0]
  loop:
    unless slist goto end
    stmt = shift slist
    $P1 = stmt[0]
    if $P1 == "#" goto loop
    if $P1 == "rule" goto compile_rule
    namespace = stmt[1]
    goto loop
  compile_rule:
    $P1 = stmt[1]
    $P2 = stmt[2]
    ($P3, $P4, $P5) = p6rule($P2, namespace, $P1)
    code .= "# <"
    code .= namespace
    code .= "::"
    code .= $P1
    code .= ">\n\n"
    code .= $P4
    code .= "\n"
    goto loop
  end:
    .return (code)
.end

