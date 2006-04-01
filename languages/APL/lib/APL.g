grammar APLGrammar;

rule prog    { ^<APLGrammar::lineseq>$ }

rule lineseq { \s* <APLGrammar::line>* \s* }

rule line    { [ <APLGrammar::expr> ] \s* }

rule word { \w[\w|\d]* }

rule expr    {
    <APLGrammar::gprint>
  | <APLGrammar::cexpr> 
}

rule gprint  { (print) \s+ <APLGrammar::expr> }

rule cexpr {
    <APLGrammar::oexpr> \s* [, \s* <APLGrammar::oexpr>]*
}

rule term {
      <APLGrammar::number>
    | <APLGrammar::stringdouble>
    | <APLGrammar::stringsingle>
}

rule variable {
  <[A..Z]>+
}

rule newterm {
    [ <APLGrammar::scalar> \s+ ] * <APLGrammar::scalar>   # scalar/vector
  | <APLGrammar::variable>
}

rule number  { 
  (⁻)?
  (
   \d+ \. \d+ |
   \d+ 
  )
  ( E (⁻)? (\d+) )?
}

rule stringdouble { " ([ "" | <-["]> ]*) " }
rule stringsingle { ' ([ '' | <-[']> ]*) ' }
