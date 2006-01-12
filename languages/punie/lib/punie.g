grammar PunieGrammar;
rule term    { \d+ | <PGE::Text::bracketed: "> }
rule gprint  { (print) \s* <PunieGrammar::expr> }
rule expr    { <PunieGrammar::gprint> | <PunieGrammar::cexpr> }
rule line    { \s*<PunieGrammar::expr>;\s* }
rule lineseq { \s*<PunieGrammar::line>*\s* }
rule prog    { ^<PunieGrammar::lineseq>$ }

rule cexpr {
    <PunieGrammar::term> \s* [, \s* <PunieGrammar::term>]*
}

