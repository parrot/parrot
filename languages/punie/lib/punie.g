grammar PunieGrammar;

rule prog    { ^<PunieGrammar::lineseq>$ }

rule blue { \w* }

rule block { \s* \{ \s*<PunieGrammar::lineseq>\s* \} \s* }

rule lineseq { \s*<PunieGrammar::line>*\s* }

rule line    { <PunieGrammar::label> <PunieGrammar::expr>;\s* }

rule label { \s* [<PunieGrammar::word>\:]? \s* }

rule word { \w[\w|\d]* }

rule expr    { <PunieGrammar::gprint> | <PunieGrammar::cexpr> }

rule gprint  { (print) \s* <PunieGrammar::expr> }

rule cexpr {
    <PunieGrammar::term> \s* [, \s* <PunieGrammar::term>]*
}

rule term {
    <PunieGrammar::number>
    | <PunieGrammar::integer>
    | <PunieGrammar::stringdouble>
    | <PunieGrammar::stringsingle>
}
rule integer { \d+ }
rule number { \d+\.\d+ }
rule stringdouble { <PGE::Text::bracketed: "> }
rule stringsingle { <PGE::Text::bracketed: '> }


