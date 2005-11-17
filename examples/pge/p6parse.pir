.namespace [ "Perl6" ]

.sub "__onload"
    .local pmc optable
    .local pmc term
    .local string op

    $I0 = find_type "PGE::OPTable"
    optable = new $I0
    store_global "Perl6", "$optable", optable

    $S0 = <<"P6_GRAMMAR"
grammar Perl6;

rule sigil { <[$@%&]> }
rule name { <?ident> [ \\:\\: <?ident> ]* }
rule integer { \\d+ }
rule term { <sigil><name> | <name> | <integer> }

P6_GRAMMAR

    $P0 = compreg "PGE::P6Grammar"
    $P0($S0)

    optable.addtok("infix:+")
    optable.addtok("infix:-", "infix:+")
    optable.addtok("infix:~", "infix:+")
    optable.addtok("infix:+|", "infix:+")
    optable.addtok("infix:+^", "infix:+")
    optable.addtok("infix:~|", "infix:+")
    optable.addtok("infix:~^", "infix:+")

    optable.addtok("infix:*", ">infix:+")
    optable.addtok("infix:/", "infix:*")
    optable.addtok("infix:%", "infix:*")
    optable.addtok("infix:x", "infix:*")
    optable.addtok("infix:xx", "infix:*")
    optable.addtok("infix:+<", "infix:*")
    optable.addtok("infix:+>", "infix:*")
    optable.addtok("infix:~&", "infix:*")
    optable.addtok("infix:~<", "infix:*")
    optable.addtok("infix:~>", "infix:*")

    optable.addtok("prefix:!", ">infix:*")
    optable.addtok("prefix:+", "prefix:!")
    optable.addtok("prefix:-", "prefix:!")
    optable.addtok("prefix:~", "prefix:!")
    optable.addtok("prefix:?", "prefix:!")
    optable.addtok("prefix:*", "prefix:!")
    optable.addtok("prefix:**", "prefix:!")
    optable.addtok("prefix:+^", "prefix:!")
    optable.addtok("prefix:~^", "prefix:!")
    optable.addtok("prefix:?^", "prefix:!")
    optable.addtok("prefix:\\", "prefix:!")

    optable.addtok("infix:**", ">prefix:!")

    optable.addtok("postfix:++", ">infix:**")
    optable.addtok("postfix:--", "postfix:++")
    optable.addtok("prefix:++", "postfix:++")
    optable.addtok("prefix:--", "postfix:++")

    optable.addtok("infix:.", ">postfix:++")
    optable.addtok("infix:.+", "infix:.")
    optable.addtok("infix:.?", "infix:.")
    optable.addtok("infix:.*", "infix:.")
    optable.addtok("postcircumfix:.( )", "infix:.", "nullterm")
    optable.addtok("postcircumfix:( )", "infix:.", "nows,nullterm")
    optable.addtok("postcircumfix:.[ ]", "infix:.", "nullterm")
    optable.addtok("postcircumfix:[ ]", "infix:.", "nows,nullterm")
    optable.addtok("postcircumfix:.{ }", "infix:.", "nullterm")
    optable.addtok("postcircumfix:{ }", "infix:.", "nows,nullterm")

    term = find_global "Perl6", "term"
    optable.addtok("term:", ">infix:.", "left", term)
    optable.addtok("circumfix:( )", "term:")

    optable.addtok("infix:&", "<infix:+")
    optable.addtok("infix:|", "<infix:&")
    optable.addtok("infix:^", "infix:|")

    optable.addtok("prefix:rand", "<infix:|", "nullterm")
    optable.addtok("prefix:abs", "prefix:rand", "nullterm")

    optable.addtok("infix:=>", "<prefix:rand")
    optable.addtok("infix:but", "infix:=>")
    optable.addtok("infix:does", "infix:=>")
    optable.addtok("infix:cmp", "infix:=>")
    optable.addtok("infix:<=>", "infix:=>")
    optable.addtok("infix:..", "infix:=>")
    optable.addtok("infix:^..", "infix:=>")
    optable.addtok("infix:..^", "infix:=>")
    optable.addtok("infix:^..^", "infix:=>")

    optable.addtok("infix:==", "<infix:=>")
    optable.addtok("infix:!=", "infix:==")
    optable.addtok("infix:<", "infix:==")
    optable.addtok("infix:>", "infix:==")
    optable.addtok("infix:<=", "infix:==")
    optable.addtok("infix:>=", "infix:==")
    optable.addtok("infix:~~", "infix:==")
    optable.addtok("infix:!~", "infix:==")
    optable.addtok("infix:eq", "infix:==")
    optable.addtok("infix:ne", "infix:==")
    optable.addtok("infix:lt", "infix:==")
    optable.addtok("infix:le", "infix:==")
    optable.addtok("infix:gt", "infix:==")
    optable.addtok("infix:ge", "infix:==")
    optable.addtok("infix:=:=", "infix:==")

    optable.addtok("infix:&&", "<infix:==")
    optable.addtok("infix:||", "<infix:&&")
    optable.addtok("infix:^^", "infix:||")
    optable.addtok("infix://", "infix:||")

    optable.addtok("ternary:?? !!", "<infix:||", "right")

    optable.addtok("infix:=", "<ternary:?? !!", "right")
    optable.addtok("infix::=", "infix:=", "right")
    optable.addtok("infix:::=", "infix:=", "right")

.end

.sub "expr"
    .param pmc mob
    .local pmc optable
    optable = find_global "Perl6", "$optable"
    $P0 = optable."parse"(mob)
    .return ($P0)
.end
