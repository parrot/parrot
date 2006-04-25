grammar Pheme::Grammar;

rule prog { [ <list> <ws>* ]+ }

rule list { \( <list_items>+ <ws>* \) }

# quoted_string has to come first
rule list_items { [ <quoted_string> | <atom> | <list> | <empty_list> ] <ws>* }

rule empty_list { \(\) }

rule atom { [ <symbol_tag> | <quote> ]? [ <-[ \n\r\(\)]> ]+ }

rule quoted_string { <PGE::Text::bracketed: '"> }

rule quote { ' }

rule symbol_tag { \# }

rule ws { [ ; \N+ | \s ]+ }

