grammar Pheme::Grammar;

rule prog { <list>+ }

rule list { \( <list_item>+ \) }

# quoted_string has to come first
rule list_item { <quoted_string> | <atom> | <list> | <empty_list> }

token empty_list { \(\) }

token atom { [ <symbol_tag> | <quote> ]? <-[ \n\r\(\)]>+ }

token quoted_string { <PGE::Text::bracketed: "> }

token quote { ' }

token symbol_tag { \# }

token ws { [ [ ; \N+ ]? \s+ ]* }
