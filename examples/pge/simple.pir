.namespace [ "Simple" ]

.sub "__onload"
    .local pmc optable
    .local pmc term
    .local pmc p6rule
    .local string op

    optable = new ["PGE";"OPTable"]
    store_global "Simple", "$optable", optable

    p6rule = compreg "PGE::P6Rule"
    term = p6rule("\\d+ | <ident>", 'grammar' => "Simple", 'name' => "term")

    optable.'newtok'("infix:+", 'precedence' => '=')
    optable.'newtok'("infix:-", 'equiv' => 'infix:+')

    optable.'newtok'("infix:*", 'tighter' => 'infix:+')
    optable.'newtok'("infix:/", 'equiv' => 'infix:*')
    optable.'newtok'("infix:%", 'equiv' => 'infix:*')

    optable.'newtok'("prefix:+", 'tighter' => 'infix:*')
    optable.'newtok'("prefix:-", 'equiv' => 'prefix:+')
    optable.'newtok'("prefix:!", 'equiv' => 'prefix:+')

    optable.'newtok'("infix:**", 'tighter' => '>prefix:+')

    optable.'newtok'("postcircumfix:( )", 'tighter' => "infix:**", 'nullterm' => 1)

    optable.'newtok'("term:", 'tighter' => 'postcircumfix:( )', 'parsed' => term)
    optable.'newtok'("circumfix:( )", 'equiv' => 'term:')

    optable.'newtok'("infix:==", 'looser' => 'infix:+')
    optable.'newtok'("infix:!=", 'equiv' => 'infix:==')

    optable.'newtok'("ternary:? :", 'looser' => 'infix:==', 'assoc' => 'right')
    optable.'newtok'("infix:=", 'looser' => 'ternary:? :', 'assoc' => 'right')
.end

.sub "expr"
    .param pmc mob
    .local pmc optable
    optable = find_global "Simple", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
