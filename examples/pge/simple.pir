.namespace [ "Simple" ]

.sub "__onload"
    .local pmc optable
    .local pmc term
    .local pmc p6rule
    .local string op

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "Simple", "$optable", optable

    p6rule = find_global "PGE", "p6rule"
    term = p6rule("\\d+ | <ident>", "Simple", "term")

    optable.addtok("infix:+")
    optable.addtok("infix:-", "infix:+")

    optable.addtok("infix:*", ">infix:+")
    optable.addtok("infix:/", "infix:*")
    optable.addtok("infix:%", "infix:*")

    optable.addtok("prefix:+", ">infix:*")
    optable.addtok("prefix:-", "prefix:+")
    optable.addtok("prefix:!", "prefix:+")

    optable.addtok("infix:**", ">prefix:+")

    optable.addtok("postcircumfix:( )", ">infix:**", "nullterm")

    optable.addtok("term:", ">postcircumfix:( )", "left", term)
    optable.addtok("circumfix:( )", "term:")

    optable.addtok("infix:==", "<infix:+")
    optable.addtok("infix:!=", "infix:==")

    optable.addtok("ternary:? :", "<infix:==", "right")
    optable.addtok("infix:=", "<ternary:? :", "right")
.end

.sub "expr"
    .param pmc mob
    .local pmc optable
    optable = find_global "Simple", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end
