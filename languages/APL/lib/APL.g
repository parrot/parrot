grammar APLGrammar;

rule prog    { ^<APLGrammar::lineseq>$ }

rule block { \s* \{ <APLGrammar::lineseq> \} \s* }

rule lineseq { \s*<APLGrammar::line>*\s* }

rule line    { 
    [ <APLGrammar::label> <APLGrammar::cond> 
    | <APLGrammar::label> <APLGrammar::expr>;
    ] \s* 
}

rule label { \s* [<APLGrammar::word>\:]? \s* }

rule word { \w[\w|\d]* }

rule cond {
    (if|unless) \s* \( \s* <APLGrammar::expr> \s* \) <APLGrammar::block>
} 

rule expr    { <APLGrammar::gprint> | <APLGrammar::cexpr> }

rule gprint  { (print) \s* <APLGrammar::expr> }

rule cexpr {
    <APLGrammar::oexpr> \s* [, \s* <APLGrammar::oexpr>]*
}

rule term {
    <APLGrammar::number>
    | <APLGrammar::integer>
    | <APLGrammar::stringdouble>
    | <APLGrammar::stringsingle>
    | do <APLGrammar::block>
}
rule integer { \d+ }
rule number { \d+\.\d+ }
rule stringdouble { <PGE::Text::bracketed: "> }
rule stringsingle { <PGE::Text::bracketed: '> }


